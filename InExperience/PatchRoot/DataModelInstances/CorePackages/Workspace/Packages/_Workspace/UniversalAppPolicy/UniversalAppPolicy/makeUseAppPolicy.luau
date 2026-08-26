local parent = script.Parent.Parent
local policyProviderModule = require(parent.PolicyProvider)
local logger = policyProviderModule.Logger
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(script.Parent.PolicyTypes)

local function mergePolicies(p1, p2)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in ipairs(p2) do
		t = cryoModule.Dictionary.join(t, v(p1))
	end
	return t
end

return function(p3)
	-- upvalues: reactModule (ref), policyProviderModule (ref), mergePolicies (ref), logger (ref)
	assert(p3, "expected getPolicyImpl")
	
	return function(p4)
		-- upvalues: reactModule (copy), policyProviderModule (copy), mergePolicies (copy), p3 (ref), logger (copy)
		local var1 = reactModule.useContext(policyProviderModule.AppPolicyContext)
		assert(var1, "Not a descendent of PolicyProvider")
		local var2, var3 = reactModule.useState(function()
			-- upvalues: var1 (ref), mergePolicies (copy), p3 (copy), logger (copy)
			if var1.staticExternalPolicy then
				return mergePolicies(var1.staticExternalPolicy, var1.presentationPolicy)
			end
			local var4 = p3.read()
			
			if var4 then
				return mergePolicies(var4, var1.presentationPolicy)
			end
			logger:trace("No app policy data available")
			
			return mergePolicies({}, var1.presentationPolicy)
		end)
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), p3 (copy), logger (copy), var3 (ref), mergePolicies (copy)
			local var4 = if not var1.staticExternalPolicy then p3.onPolicyChanged(function(p5)
				-- upvalues: logger (copy), var3 (copy), mergePolicies (copy), var1 (copy)
				logger:trace("Received policy update")
				var3(mergePolicies(p5, var1.presentationPolicy))
			end) else nil
			
			return function()
				-- upvalues: var4 (write)
				if var4 then
					var4:Disconnect()
				end
			end
		end, { var1 })
		
		return p4(var2)
	end
end
local parent = script.Parent.Parent
local policyProviderModule = require(parent.PolicyProvider)
local logger = policyProviderModule.Logger
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(script.Parent.PolicyTypes)

local function mergePolicies(p0, p1) --[[ line: 15 ]]
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		t = cryoModule.Dictionary.join(t, v(p0))
	end
	return t
end

return function(p2) --[[ line: 25 ]]
	-- upvalues: reactModule (ref), policyProviderModule (ref), mergePolicies (ref), logger (ref)
	assert(p2, "expected getPolicyImpl")
	
	return function(p3) --[[ line: 28 | named "useAppPolicy" ]]
		-- upvalues: reactModule (copy), policyProviderModule (copy), mergePolicies (copy), p2 (ref), logger (copy)
		local var5 = reactModule.useContext(policyProviderModule.AppPolicyContext)
		assert(var5, "Not a descendent of PolicyProvider")
		local var6, var7 = reactModule.useState(function() --[[ line: 32 | named "getInitialPolicy" ]]
			-- upvalues: var5 (ref), mergePolicies (copy), p2 (copy), logger (copy)
			if var5.staticExternalPolicy then
				return mergePolicies(var5.staticExternalPolicy, var5.presentationPolicy)
			end
			local var8 = p2.read()
			
			if var8 then
				return mergePolicies(var8, var5.presentationPolicy)
			end
			logger:trace("No app policy data available")
			
			return mergePolicies({}, var5.presentationPolicy)
		end)
		reactModule.useEffect(function() --[[ line: 50 ]]
			-- upvalues: var5 (ref), p2 (copy), logger (copy), var7 (ref), mergePolicies (copy)
			local var9 = if not var5.staticExternalPolicy then p2.onPolicyChanged(function(p4) --[[ line: 53 ]]
				-- upvalues: logger (copy), var7 (copy), mergePolicies (copy), var5 (copy)
				logger:trace("Received policy update")
				var7(mergePolicies(p4, var5.presentationPolicy))
			end) else nil
			
			return function() --[[ line: 59 ]]
				-- upvalues: var9 (write)
				if var9 then
					var9:Disconnect()
				end
			end
		end, { var5 })
		
		return p3(var6)
	end
end
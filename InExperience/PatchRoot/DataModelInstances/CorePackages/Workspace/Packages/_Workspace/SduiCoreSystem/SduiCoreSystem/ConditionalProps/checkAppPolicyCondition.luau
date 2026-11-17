local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.UniversalAppPolicy)
local ResolveSduiPolicyFieldModule = require(SduiCoreSystem.ClientBinding.resolveSduiPolicyField)

local function _(p1, p2): boolean
	-- upvalues: ResolveSduiPolicyFieldModule (copy)
	if type(p2) ~= "string" then
		return false
	end
	local ResolveSduiPolicyFieldModuleResult, ResolveSduiPolicyFieldModuleResult2 = ResolveSduiPolicyFieldModule(p1, p2)
	
	if ResolveSduiPolicyFieldModuleResult then
		return not not ResolveSduiPolicyFieldModuleResult2
	else
		local RawPolicy = p1.getRawPolicy()
		
		return RawPolicy ~= nil and not not RawPolicy[p2]
	end
end

return function(p1, List): boolean
	-- upvalues: ResolveSduiPolicyFieldModule (copy)
	if p1 == nil or type(List) ~= "table" then
		return false
	end
	if #List == 0 then
		return false
	end
	for _, value in List do
		local Inverted = nil
		if type(value) == "string" then
			local ResolveSduiPolicyFieldModuleResult, ResolveSduiPolicyFieldModuleResult2 = ResolveSduiPolicyFieldModule(p1, value)
			
			if ResolveSduiPolicyFieldModuleResult then
				Inverted = not not ResolveSduiPolicyFieldModuleResult2
			else
				local RawPolicy = p1.getRawPolicy()
				Inverted = RawPolicy ~= nil and not not RawPolicy[value]
			end
		else
			Inverted = false
		end
		if not Inverted then
			return false
		end
	end
	return true
end
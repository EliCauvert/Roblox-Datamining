local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local FindAnalyticsFieldInAncestorsModule = require(SduiCoreSystem.findAnalyticsFieldInAncestors)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)

return function(p1, p2, p3, p4)
	-- upvalues: FindAnalyticsFieldInAncestorsModule (copy)
	local AnalyticsFieldInAncestorsModule = FindAnalyticsFieldInAncestorsModule(p3, p2)
	
	if AnalyticsFieldInAncestorsModule ~= nil then
		return AnalyticsFieldInAncestorsModule
	end
	if p1 then
		local ActionParams = p1.actionParams
		
		if ActionParams and ActionParams[p3] ~= nil then
			return ActionParams[p3]
		end
	end
	return p4
end
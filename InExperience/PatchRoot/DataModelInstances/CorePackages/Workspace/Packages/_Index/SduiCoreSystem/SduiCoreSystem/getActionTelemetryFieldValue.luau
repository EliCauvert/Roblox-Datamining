local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local findAnalyticsFieldInAncestorsModule = require(sduiCoreSystem.findAnalyticsFieldInAncestors)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)

return function(p1, p2, p3, p4)
	-- upvalues: findAnalyticsFieldInAncestorsModule (ref)
	local var1 = findAnalyticsFieldInAncestorsModule(p3, p2)
	
	if var1 ~= nil then
		return var1
	elseif p1 then
		local actionParams = p1.actionParams
		
		return if actionParams and actionParams[p3] ~= nil then actionParams[p3] else p4
	end
end
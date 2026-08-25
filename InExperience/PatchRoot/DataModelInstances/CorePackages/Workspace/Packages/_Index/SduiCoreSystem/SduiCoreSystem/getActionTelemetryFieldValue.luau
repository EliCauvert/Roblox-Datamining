local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local findAnalyticsFieldInAncestorsModule = require(sduiCoreSystem.findAnalyticsFieldInAncestors)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)

return function(p0, p1, p2, p3)
	-- upvalues: findAnalyticsFieldInAncestorsModule (ref)
	local var2 = findAnalyticsFieldInAncestorsModule(p2, p1)
	
	if var2 ~= nil then
		return var2
	elseif p0 then
		local actionParams = p0.actionParams
		
		return if actionParams and actionParams[p2] ~= nil then actionParams[p2] else p3
	end
end
local AnalyticsUnitModule = require(script:FindFirstAncestor("BuildExperience").Analytics.AnalyticsUnit)

return function(p1: number, Temporal): number
	-- upvalues: AnalyticsUnitModule (copy)
	return if Temporal == AnalyticsUnitModule.Temporal then p1 * 60 else p1
end
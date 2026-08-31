local analyticsUnitModule = require(script:FindFirstAncestor("BuildExperience").Analytics.AnalyticsUnit)

return function(p1, p2)
	-- upvalues: analyticsUnitModule (ref)
	return if p2 == analyticsUnitModule.Temporal then p1 * 60 else p1
end
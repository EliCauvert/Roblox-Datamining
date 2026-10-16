local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
math.randomseed(tick())

return function(FeatureName, MeasureName, Seconds, p1) --[[ Line: 5 ]]
	-- upvalues: RbxAnalyticsService (copy)
	if p1 >= 100 * math.random() then
		RbxAnalyticsService:ReportToDiagByCountryCode(FeatureName, MeasureName, Seconds)
		
		return
	end
end
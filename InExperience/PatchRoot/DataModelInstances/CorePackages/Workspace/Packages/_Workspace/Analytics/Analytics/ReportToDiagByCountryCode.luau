local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
math.randomseed(tick())

return function(p0, p1, p2, p3)
	-- upvalues: rbxAnalyticsService (ref)
	if p3 < 100 * math.random() then
		return
	end
	rbxAnalyticsService:ReportToDiagByCountryCode(p0, p1, p2)
end
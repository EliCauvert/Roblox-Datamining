local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
math.randomseed(tick())

return function(p1, p2, p3, p4)
	-- upvalues: rbxAnalyticsService (ref)
	if p4 < 100 * math.random() then
		return
	end
	rbxAnalyticsService:ReportToDiagByCountryCode(p1, p2, p3)
end
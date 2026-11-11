local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("SocialBlockingModal").Parent.SocialLuaAnalytics)

return SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = { Telemetry = require(script.Parent.TelemetryActionList) },
	analyticsImpl = {
		Telemetry = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.Telemetry
	}
})
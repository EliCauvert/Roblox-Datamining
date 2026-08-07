local socialLuaAnalyticsModule = require(script:FindFirstAncestor("UserRelationshipModals").Parent.SocialLuaAnalytics)

return socialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = { Telemetry = require(script.Parent.TelemetryActionList) },
	analyticsImpl = {
		Telemetry = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.Telemetry
	}
})
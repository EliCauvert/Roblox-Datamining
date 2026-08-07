local socialLuaAnalyticsModule = require(script:FindFirstAncestor("ProfilePlatform").Parent.SocialLuaAnalytics)
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService

return socialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = {
		EventStream = require(script.Parent.EventStreamActionList),
		Telemetry = require(script.Parent.TelemetryActionList)
	},
	analyticsImpl = {
		EventStream = defaultAnalyticsService.EventStream,
		Telemetry = defaultAnalyticsService.Telemetry
	}
})
local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("AddFriends").Parent.SocialLuaAnalytics)
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService

return SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
	eventLists = {
		EventStream = require(script.Parent.EventStreamActionList),
		Telemetry = require(script.Parent.TelemetryActionList)
	},
	analyticsImpl = {
		EventStream = DefaultAnalyticsService.EventStream,
		Telemetry = DefaultAnalyticsService.Telemetry
	}
})
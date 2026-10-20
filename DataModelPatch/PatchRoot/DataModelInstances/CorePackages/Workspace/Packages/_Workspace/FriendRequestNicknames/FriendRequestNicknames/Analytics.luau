local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("FriendRequestNicknames").Parent.SocialLuaAnalytics)
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService

return {
	EventNames = require(script.EventNames),
	Analytics = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			EventStream = require(script.EventStreamActionList),
			Telemetry = require(script.TelemetryActionList)
		},
		analyticsImpl = {
			EventStream = DefaultAnalyticsService.EventStream,
			Telemetry = DefaultAnalyticsService.Telemetry
		}
	})
}
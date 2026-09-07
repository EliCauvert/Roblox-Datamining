local socialLuaAnalyticsModule = require(script:FindFirstAncestor("FriendRequestNicknames").Parent.SocialLuaAnalytics)
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService

return {
	EventNames = require(script.EventNames),
	Analytics = socialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			EventStream = require(script.EventStreamActionList),
			Telemetry = require(script.TelemetryActionList)
		},
		analyticsImpl = {
			EventStream = defaultAnalyticsService.EventStream,
			Telemetry = defaultAnalyticsService.Telemetry
		}
	})
}
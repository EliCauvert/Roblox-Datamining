local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("CrossExperienceVoice").Parent.SocialLuaAnalytics)
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local PlaySessionId = game:GetService("RbxAnalyticsService"):GetPlaySessionId()

return {
	Analytics = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			EventStream = require(script.EventStreamActionList),
			Diag = require(script.DiagActionList),
			Telemetry = require(script.TelemetryActionList)
		},
		analyticsImpl = {
			EventStream = DefaultAnalyticsService.EventStream,
			Diag = DefaultAnalyticsService.Diag,
			Telemetry = DefaultAnalyticsService.Telemetry
		},
		staticInfoForAllEvents = {
			playSessionId = if PlaySessionId == "" then nil else PlaySessionId,
			placeId = if game.PlaceId > 0 then tostring(game.PlaceId) else nil,
			universeId = if game.GameId > 0 then tostring(game.GameId) else nil
		}
	}),
	EventNames = require(script.EventNames)
}
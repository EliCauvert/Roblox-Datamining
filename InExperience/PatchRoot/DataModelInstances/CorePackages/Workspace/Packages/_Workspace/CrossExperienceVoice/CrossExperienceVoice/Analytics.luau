local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local socialLuaAnalyticsModule = require(script:FindFirstAncestor("CrossExperienceVoice").Parent.SocialLuaAnalytics)
local analyticsFactory = socialLuaAnalyticsModule.Analytics.AnalyticsFactory
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local playSessionId = rbxAnalyticsService:GetPlaySessionId()

return {
	Analytics = analyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			EventStream = require(script.EventStreamActionList),
			Diag = require(script.DiagActionList),
			Telemetry = require(script.TelemetryActionList)
		},
		analyticsImpl = {
			EventStream = defaultAnalyticsService.EventStream,
			Diag = defaultAnalyticsService.Diag,
			Telemetry = defaultAnalyticsService.Telemetry
		},
		staticInfoForAllEvents = {
			playSessionId = if playSessionId ~= "" then nil else playSessionId,
			placeId = if game.PlaceId > 0 then tostring(game.PlaceId) else nil,
			universeId = if game.GameId > 0 then tostring(game.GameId) else nil
		}
	}),
	EventNames = require(script.EventNames)
}
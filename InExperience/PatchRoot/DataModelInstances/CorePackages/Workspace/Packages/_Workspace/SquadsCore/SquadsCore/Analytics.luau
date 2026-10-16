local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("SquadsCore").Parent.SocialLuaAnalytics)
local PlaySessionId = game:GetService("RbxAnalyticsService"):GetPlaySessionId()

return {
	Analytics = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			Diag = nil,
			EventStream = require(script.EventStreamActionList)
		},
		analyticsImpl = {
			Diag = nil,
			EventStream = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.EventStream
		},
		staticInfoForAllEvents = {
			playSessionId = if PlaySessionId == "" then nil else PlaySessionId,
			placeId = if game.PlaceId > 0 then tostring(game.PlaceId) else nil,
			universeId = if game.GameId > 0 then tostring(game.GameId) else nil,
			placeInstanceId = if game.JobId == "" then nil else tostring(game.JobId)
		}
	}),
	EventNames = require(script.EventNames),
	logInExpCoplayTelemetry = require(script.logInExpCoplayTelemetry)
}
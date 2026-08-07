local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = script:FindFirstAncestor("SquadsCore").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local playSessionId = rbxAnalyticsService:GetPlaySessionId()

return {
	Analytics = socialLuaAnalyticsModule.Analytics.AnalyticsFactory.setUpAnalyticsFactory({
		eventLists = {
			Diag = nil,
			EventStream = require(script.EventStreamActionList)
		},
		analyticsImpl = {
			Diag = nil,
			EventStream = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService.EventStream
		},
		staticInfoForAllEvents = {
			playSessionId = if playSessionId ~= "" then nil else playSessionId,
			placeId = if game.PlaceId > 0 then tostring(game.PlaceId) else nil,
			universeId = if game.GameId > 0 then tostring(game.GameId) else nil,
			placeInstanceId = if game.JobId ~= "" then nil else tostring(game.JobId)
		}
	}),
	EventNames = require(script.EventNames),
	logInExpCoplayTelemetry = if sharedFlagsModule.FFlagEnableSquadCoplayAnalytic then require(script.logInExpCoplayTelemetry) else nil
}
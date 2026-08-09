local constantsModule = require(script:FindFirstAncestor("Moments").Constants)
local t = {
	eventName = "RecommendationActionEvent",
	throttlingPercentage = 10000,
	description = "Fires on user actions in the moments platform feed",
	backends = { "EventIngest" },
	lastUpdated = { 26, 6, 2 }
}

return function(p0) --[[ line: 28 | named "emitRecommendationAction" ]]
	-- upvalues: constantsModule (ref), t (ref)
	local var2 = if p0.actionType == constantsModule.RecommendationActionType.Play then game:GetService("HttpService"):GenerateGUID(false) else nil
	game:GetService("TelemetryService"):LogEvent(t, {
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			playsessionid = "",
			universeid = constantsModule.MOMENTS_UNIVERSE_ID,
			placeid = constantsModule.MOMENTS_PLACE_ID,
			item_id = p0.itemId,
			tracing_id = p0.tracingId,
			action_type = tostring(p0.actionType),
			moments_session_id = p0.momentsSessionId,
			source_surface = constantsModule.SOURCE_SURFACE,
			reaction_type = p0.reactionType,
			destination_placeid = if p0.destinationPlaceId then tostring(p0.destinationPlaceId) else nil,
			comment_text = p0.commentText,
			action_weight = if p0.actionWeight then tostring(p0.actionWeight) else nil,
			moments_play_intent_id = var2
		}
	})
	
	return var2
end
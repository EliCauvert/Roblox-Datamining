local moments = script:FindFirstAncestor("Moments")
local constantsModule = require(moments.Constants)
local fFlagMomentsRecommendationClientEventTimestampModule = require(moments.Flags.FFlagMomentsRecommendationClientEventTimestamp)
local t = {
	eventName = "RecommendationActionEvent",
	throttlingPercentage = 10000,
	description = "Fires on user actions in the moments platform feed",
	backends = { "EventIngest" },
	lastUpdated = { 26, 6, 2 }
}

return function(p1)
	-- upvalues: constantsModule (ref), t (ref), fFlagMomentsRecommendationClientEventTimestampModule (ref)
	local var1 = if p1.actionType == constantsModule.RecommendationActionType.Play then game:GetService("HttpService"):GenerateGUID(false) else nil
	game:GetService("TelemetryService"):LogEvent(t, {
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			playsessionid = "",
			universeid = constantsModule.MOMENTS_UNIVERSE_ID,
			placeid = constantsModule.MOMENTS_PLACE_ID,
			client_event_timestamp_ms = if fFlagMomentsRecommendationClientEventTimestampModule then DateTime.now().UnixTimestampMillis else nil,
			item_id = p1.itemId,
			tracing_id = p1.tracingId,
			action_type = tostring(p1.actionType),
			moments_session_id = p1.momentsSessionId,
			source_surface = constantsModule.SOURCE_SURFACE,
			reaction_type = p1.reactionType,
			destination_placeid = if p1.destinationPlaceId then tostring(p1.destinationPlaceId) else nil,
			comment_text = p1.commentText,
			action_weight = if p1.actionWeight then tostring(p1.actionWeight) else nil,
			moments_play_intent_id = var1
		}
	})
	
	return var1
end
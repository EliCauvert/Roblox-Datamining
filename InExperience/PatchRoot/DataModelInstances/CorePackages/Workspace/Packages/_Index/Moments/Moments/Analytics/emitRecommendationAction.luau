local Moments = script:FindFirstAncestor("Moments")
local ConstantsModule = require(Moments.Constants)
local FFlagMomentsComments = require(Moments.Parent.SharedFlags).FFlagMomentsComments
local config = {
	eventName = "RecommendationActionEvent",
	throttlingPercentage = 10000,
	description = "Fires on user actions in the moments platform feed",
	backends = { "EventIngest" },
	lastUpdated = { 26, 6, 2 }
}

return function(p1)
	-- upvalues: ConstantsModule (copy), config (copy), FFlagMomentsComments (copy)
	local HttpService = game:GetService("HttpService")
	local Guid = if p1.actionType == ConstantsModule.RecommendationActionType.Play then HttpService:GenerateGUID(false) else nil
	game:GetService("TelemetryService"):LogEvent(config, {
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			playsessionid = "",
			universeid = ConstantsModule.MOMENTS_UNIVERSE_ID,
			placeid = ConstantsModule.MOMENTS_PLACE_ID,
			client_event_timestamp_ms = DateTime.now().UnixTimestampMillis,
			item_id = p1.itemId,
			tracing_id = p1.tracingId,
			action_type = tostring(p1.actionType),
			moments_session_id = p1.momentsSessionId,
			source_surface = ConstantsModule.SOURCE_SURFACE,
			reaction_type = p1.reactionType,
			destination_placeid = if p1.destinationPlaceId then tostring(p1.destinationPlaceId) else nil,
			comment_text = p1.commentText,
			comment_section_open_duration_seconds = if FFlagMomentsComments and p1.commentSectionOpenDurationSeconds ~= nil then tostring(p1.commentSectionOpenDurationSeconds) else nil,
			action_weight = if p1.actionWeight then tostring(p1.actionWeight) else nil,
			moments_play_intent_id = Guid
		}
	})
	
	return Guid
end
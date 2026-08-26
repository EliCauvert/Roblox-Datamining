local moments = script:FindFirstAncestor("Moments")
local constantsModule = require(moments.Constants)
local fFlagMomentsRecommendationClientEventTimestampModule = require(moments.Flags.FFlagMomentsRecommendationClientEventTimestamp)
local t = {
	eventName = "RecommendationImpressionEvent",
	throttlingPercentage = 10000,
	description = "Fires when a moment becomes visible in the platform feed",
	backends = { "EventIngest" },
	lastUpdated = { 26, 6, 2 }
}

return function(p1)
	-- upvalues: t (ref), constantsModule (ref), fFlagMomentsRecommendationClientEventTimestampModule (ref)
	game:GetService("TelemetryService"):LogEvent(t, {
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			playsessionid = "",
			universeid = constantsModule.MOMENTS_UNIVERSE_ID,
			placeid = constantsModule.MOMENTS_PLACE_ID,
			client_event_timestamp_ms = if fFlagMomentsRecommendationClientEventTimestampModule then DateTime.now().UnixTimestampMillis else nil,
			item_id = p1.itemId,
			tracing_id = p1.tracingId,
			item_position = tostring(p1.position),
			duration_seconds = tostring(p1.durationSeconds or 0),
			impression_type = tostring(p1.impressionType or 1),
			weight = tostring(p1.weight or 1),
			departure_intent = p1.departureIntent,
			moments_session_id = p1.momentsSessionId,
			source_surface = constantsModule.SOURCE_SURFACE
		}
	})
end
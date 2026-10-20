local ConstantsModule = require(script:FindFirstAncestor("Moments").Constants)
local config = {
	eventName = "RecommendationImpressionEvent",
	throttlingPercentage = 10000,
	description = "Fires when a moment becomes visible in the platform feed",
	backends = { "EventIngest" },
	lastUpdated = { 26, 6, 2 }
}

return function(p1)
	-- upvalues: config (copy), ConstantsModule (copy)
	game:GetService("TelemetryService"):LogEvent(config, {
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			playsessionid = "",
			universeid = ConstantsModule.MOMENTS_UNIVERSE_ID,
			placeid = ConstantsModule.MOMENTS_PLACE_ID,
			item_id = p1.itemId,
			tracing_id = p1.tracingId,
			item_position = tostring(p1.position),
			duration_seconds = tostring(p1.durationSeconds or 0),
			impression_type = tostring(p1.impressionType or 1),
			weight = tostring(p1.weight or 1),
			departure_intent = p1.departureIntent,
			moments_session_id = p1.momentsSessionId,
			source_surface = ConstantsModule.SOURCE_SURFACE
		}
	})
end
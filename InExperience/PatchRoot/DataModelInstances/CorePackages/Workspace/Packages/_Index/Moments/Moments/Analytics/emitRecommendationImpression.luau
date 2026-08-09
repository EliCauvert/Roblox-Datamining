local constantsModule = require(script:FindFirstAncestor("Moments").Constants)
local t = {
	eventName = "RecommendationImpressionEvent",
	throttlingPercentage = 10000,
	description = "Fires when a moment becomes visible in the platform feed",
	backends = { "EventIngest" },
	lastUpdated = { 26, 6, 2 }
}

return function(p0) --[[ line: 25 | named "emitRecommendationImpression" ]]
	-- upvalues: t (ref), constantsModule (ref)
	game:GetService("TelemetryService"):LogEvent(t, {
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			playsessionid = "",
			universeid = constantsModule.MOMENTS_UNIVERSE_ID,
			placeid = constantsModule.MOMENTS_PLACE_ID,
			item_id = p0.itemId,
			tracing_id = p0.tracingId,
			item_position = tostring(p0.position),
			duration_seconds = tostring(p0.durationSeconds or 0),
			impression_type = tostring(p0.impressionType or 1),
			weight = tostring(p0.weight or 1),
			departure_intent = p0.departureIntent,
			moments_session_id = p0.momentsSessionId,
			source_surface = constantsModule.SOURCE_SURFACE
		}
	})
end
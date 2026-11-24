local ConstantsModule = require(script:FindFirstAncestor("Moments").Constants)
local config = {
	eventName = "RecommendationPreferenceEvent",
	throttlingPercentage = 10000,
	description = "Fires when a user updates a recommendation relationship preference",
	backends = { "EventIngest" },
	lastUpdated = { 26, 11, 23 }
}

return function(p1)
	-- upvalues: config (copy), ConstantsModule (copy)
	game:GetService("TelemetryService"):LogEvent(config, {
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			playsessionid = "",
			universeid = ConstantsModule.MOMENTS_UNIVERSE_ID,
			placeid = ConstantsModule.MOMENTS_PLACE_ID,
			client_event_timestamp_ms = DateTime.now().UnixTimestampMillis,
			target_type = tostring(p1.targetType),
			target_id = p1.targetId,
			preference_type = tostring(p1.preferenceType),
			tracing_id = p1.tracingId,
			item_id = p1.itemId
		}
	})
end
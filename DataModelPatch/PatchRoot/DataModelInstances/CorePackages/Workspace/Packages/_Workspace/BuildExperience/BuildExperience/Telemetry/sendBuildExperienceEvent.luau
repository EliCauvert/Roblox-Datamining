local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local config = {
	eventName = "buildExperienceEvent",
	description = "Client events for Build tab interactions (impression, clicks, playtest).",
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("BuildExperienceEventThrottleHundredthsPercent", 0),
	lastUpdated = { 2026, 6, 24 }
}

return function(EventType, p1, Input)
	-- upvalues: HttpService (copy), TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addUserId", "addSessionId" },
		customFields = {
			eventType = EventType,
			universeId = p1.universeId,
			placeId = p1.placeId,
			conversationId = p1.conversationId,
			messageId = p1.messageId,
			parameters = if Input then HttpService:JSONEncode(Input) else nil
		}
	})
end
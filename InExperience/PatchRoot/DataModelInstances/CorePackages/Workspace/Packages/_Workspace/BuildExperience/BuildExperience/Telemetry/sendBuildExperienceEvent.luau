local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local config = {
	eventName = "buildExperienceEvent",
	description = "Client events for Build tab interactions, prompt chips, Library browsing and contextual prompt submissions, prompt send lifecycle (start, stall, stop, failure), playtesting, private invites, private playtest preview taps, monetization, ad-upsell impressions and clicks, and Analytics page goal card and locked-action impressions and clicks.",
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("BuildExperienceEventThrottleHundredthsPercent", 0),
	lastUpdated = { 2026, 10, 26 }
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
			turnId = p1.turnId,
			parameters = if Input then HttpService:JSONEncode(Input) else nil
		}
	})
end
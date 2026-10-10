local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local t = {
	eventName = "buildExperienceEvent",
	description = "Client events for Build tab interactions, Library browsing and contextual prompt submissions, prompt send lifecycle (start, stall, stop, failure), playtesting, private invites, monetization, and ad-upsell impressions and clicks.",
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("BuildExperienceEventThrottleHundredthsPercent", 0),
	lastUpdated = { 2026, 10, 2 }
}

return function(p1, p2, p3)
	-- upvalues: httpService (ref), telemetryService (ref), t (ref)
	telemetryService:LogEvent(t, {
		standardizedFields = { "addUserId", "addSessionId" },
		customFields = {
			eventType = p1,
			universeId = p2.universeId,
			placeId = p2.placeId,
			conversationId = p2.conversationId,
			messageId = p2.messageId,
			turnId = p2.turnId,
			parameters = if p3 then httpService:JSONEncode(p3) else nil
		}
	})
end
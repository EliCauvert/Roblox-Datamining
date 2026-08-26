local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local t = {
	eventName = "buildExperienceEvent",
	description = "Client events for Build tab interactions (impression, clicks, playtest) and the private playtest invite flow (add-to-playtest, picker/management impressions, playtester add/remove, share).",
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("BuildExperienceEventThrottleHundredthsPercent", 0),
	lastUpdated = { 2026, 7, 23 }
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
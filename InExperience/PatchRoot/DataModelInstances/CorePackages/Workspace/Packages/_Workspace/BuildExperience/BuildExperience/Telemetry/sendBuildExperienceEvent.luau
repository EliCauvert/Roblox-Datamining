local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local t = {
	eventName = "buildExperienceEvent",
	description = "Client events for Build tab interactions (impression, clicks, playtest) and the private playtest invite flow (add-to-playtest, picker/management impressions, playtester add/remove, share).",
	backends = { "Points", "EventIngest" },
	throttlingPercentage = game:DefineFastInt("BuildExperienceEventThrottleHundredthsPercent", 0),
	lastUpdated = { 2026, 7, 23 }
}

return function(p0, p1, p2) --[[ line: 44 | named "sendBuildExperienceEvent" ]]
	-- upvalues: httpService (ref), telemetryService (ref), t (ref)
	telemetryService:LogEvent(t, {
		standardizedFields = { "addUserId", "addSessionId" },
		customFields = {
			eventType = p0,
			universeId = p1.universeId,
			placeId = p1.placeId,
			conversationId = p1.conversationId,
			messageId = p1.messageId,
			turnId = p1.turnId,
			parameters = if p2 then httpService:JSONEncode(p2) else nil
		}
	})
end
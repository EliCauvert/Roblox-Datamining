local telemetryService = game:GetService("TelemetryService")
local t = {
	eventName = "coachmarkImpression",
	description = "Sent when a coachmark is shown",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("CoachmarkImpressionThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 6, 16 }
}
local list = { "addOSInfo", "addSessionInfo" }

return function(p0, p1) --[[ line: 18 | named "sendCoachmarkImpression" ]]
	-- upvalues: telemetryService (ref), t (ref), list (ref)
	telemetryService:LogEvent(t, {
		standardizedFields = list,
		customFields = { collectionServiceAnchorTag = p0, hasMedia = p1 }
	})
end
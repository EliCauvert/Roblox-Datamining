local telemetryService = game:GetService("TelemetryService")
local t = {
	eventName = "backToTopClick",
	description = "User clicked the back to top button at the end of a scrollable surface",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppBackToTopClickEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 7, 22 }
}

return function(p1)
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" }
	})
end
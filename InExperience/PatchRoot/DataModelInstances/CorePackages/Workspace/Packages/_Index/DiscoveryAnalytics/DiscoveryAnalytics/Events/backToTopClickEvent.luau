local TelemetryService = game:GetService("TelemetryService")
local config = {
	eventName = "backToTopClick",
	description = "User clicked the back to top button at the end of a scrollable surface",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppBackToTopClickEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 7, 22 }
}

return function(EventContext) --[[ Line: 14 ]]
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" }
	})
end
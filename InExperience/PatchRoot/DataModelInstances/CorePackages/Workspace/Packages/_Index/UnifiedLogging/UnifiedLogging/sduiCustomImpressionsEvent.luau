local telemetryService = game:GetService("TelemetryService")
local luaAppItemImpressionsEventThrottlingHundredthsPercent = game:DefineFastInt("LuaAppItemImpressionsEventThrottlingHundredthsPercent", 10000)

return function(p1, p2, p3)
	-- upvalues: telemetryService (ref), luaAppItemImpressionsEventThrottlingHundredthsPercent (ref)
	telemetryService:LogEvent({
		eventName = p1,
		backends = { "EventIngest", "Points" },
		throttlingPercentage = luaAppItemImpressionsEventThrottlingHundredthsPercent,
		lastUpdated = { 26, 3, 17 },
		description = `SDUI custom impression event: {p1}`
	}, {
		eventContext = p2,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p3
	})
end
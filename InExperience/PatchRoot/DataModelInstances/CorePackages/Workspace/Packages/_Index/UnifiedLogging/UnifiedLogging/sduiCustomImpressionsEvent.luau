local telemetryService = game:GetService("TelemetryService")
local luaAppItemImpressionsEventThrottlingHundredthsPercent = game:DefineFastInt("LuaAppItemImpressionsEventThrottlingHundredthsPercent", 10000)

return function(p0, p1, p2)
	-- upvalues: telemetryService (ref), luaAppItemImpressionsEventThrottlingHundredthsPercent (ref)
	telemetryService:LogEvent({
		eventName = p0,
		backends = { "EventIngest", "Points" },
		throttlingPercentage = luaAppItemImpressionsEventThrottlingHundredthsPercent,
		lastUpdated = { 26, 3, 17 },
		description = `SDUI custom impression event: {p0}`
	}, {
		eventContext = p1,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = p2
	})
end
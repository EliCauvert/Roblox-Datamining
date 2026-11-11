local TelemetryService = game:GetService("TelemetryService")
local LuaAppItemImpressionsEventThrottlingHundredthsPercent = game:DefineFastInt("LuaAppItemImpressionsEventThrottlingHundredthsPercent", 10000)

return function(EventName, EventContext, CustomFields)
	-- upvalues: TelemetryService (copy), LuaAppItemImpressionsEventThrottlingHundredthsPercent (copy)
	TelemetryService:LogEvent({
		eventName = EventName,
		backends = { "EventIngest", "Points" },
		throttlingPercentage = LuaAppItemImpressionsEventThrottlingHundredthsPercent,
		lastUpdated = { 26, 3, 17 },
		description = `SDUI custom impression event: {EventName}`
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = CustomFields
	})
end
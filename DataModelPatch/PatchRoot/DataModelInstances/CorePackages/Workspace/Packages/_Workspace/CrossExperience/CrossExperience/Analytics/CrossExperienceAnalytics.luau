local TelemetryService = game:GetService("TelemetryService")
local FIntCrossExperienceEventThrottleHunderedthsPercent = game:DefineFastInt("FIntCrossExperienceEventThrottleHunderedthsPercent", 10000)

function logEvent(EventName, CustomFields)
	-- upvalues: FIntCrossExperienceEventThrottleHunderedthsPercent (copy), TelemetryService (copy)
	TelemetryService:LogEvent({
		description = "Cross Experience Analytics Events",
		eventName = EventName,
		backends = { "EventIngest" },
		throttlingPercentage = FIntCrossExperienceEventThrottleHunderedthsPercent,
		lastUpdated = { 2025, 6, 30 }
	}, { customFields = CustomFields })
end

return { logEvent = logEvent }
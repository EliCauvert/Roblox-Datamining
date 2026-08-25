local telemetryService = game:GetService("TelemetryService")
local fIntCrossExperienceEventThrottleHunderedthsPercent = game:DefineFastInt("FIntCrossExperienceEventThrottleHunderedthsPercent", 10000)

function logEvent(p0, p1)
	-- upvalues: fIntCrossExperienceEventThrottleHunderedthsPercent (ref), telemetryService (ref)
	telemetryService:LogEvent({
		description = "Cross Experience Analytics Events",
		eventName = p0,
		backends = { "EventIngest" },
		throttlingPercentage = fIntCrossExperienceEventThrottleHunderedthsPercent,
		lastUpdated = { 2025, 6, 30 }
	}, { customFields = p1 })
end

return { logEvent = logEvent }
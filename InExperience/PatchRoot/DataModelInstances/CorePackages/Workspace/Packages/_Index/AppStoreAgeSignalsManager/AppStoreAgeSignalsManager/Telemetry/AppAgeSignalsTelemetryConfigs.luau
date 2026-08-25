local telemetryService = game:GetService("TelemetryService")
local enableAppAgeSignalsErrorTelemetry = game:DefineFastFlag("EnableAppAgeSignalsErrorTelemetry", false)
local t = {
	ErrorCounter = {
		eventName = "AppAgeSignalsErrorCounter",
		description = "Error counter for app age signals collection flow",
		backends = { "RobloxTelemetryCounter" },
		lastUpdated = { 2026, 3, 4 }
	},
	ErrorEvent = {
		eventName = "AppAgeSignalsError",
		throttlingPercentage = 10000,
		description = "Error event for app age signals collection flow",
		backends = { "EventIngest" },
		lastUpdated = { 2026, 3, 4 }
	}
}

return {
	reportError = function(p0)
		-- upvalues: enableAppAgeSignalsErrorTelemetry (ref), telemetryService (ref), t (ref)
		if enableAppAgeSignalsErrorTelemetry then
			telemetryService:LogCounter(t.ErrorCounter, {
				customFields = { error = p0.error, signalSource = p0.signalSource }
			}, 1)
			telemetryService:LogEvent(t.ErrorEvent, {
				standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
				customFields = { error = p0.error, signalSource = p0.signalSource }
			})
			
			return
		end
	end
}
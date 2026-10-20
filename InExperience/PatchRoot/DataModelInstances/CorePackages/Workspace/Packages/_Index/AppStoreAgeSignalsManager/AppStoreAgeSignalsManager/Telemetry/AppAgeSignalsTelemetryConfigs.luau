local TelemetryService = game:GetService("TelemetryService")
local EnableAppAgeSignalsErrorTelemetry = game:DefineFastFlag("EnableAppAgeSignalsErrorTelemetry", false)
local config = {
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
	reportError = function(p1)
		-- upvalues: EnableAppAgeSignalsErrorTelemetry (copy), TelemetryService (copy), config (copy)
		if EnableAppAgeSignalsErrorTelemetry then
			TelemetryService:LogCounter(config.ErrorCounter, {
				customFields = { error = p1.error, signalSource = p1.signalSource }
			}, 1)
			TelemetryService:LogEvent(config.ErrorEvent, {
				standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
				customFields = { error = p1.error, signalSource = p1.signalSource }
			})
			
			return
		end
	end
}
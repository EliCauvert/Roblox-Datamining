return function(p0)
	return {
		Diag = { reportCounter = p0.fn(), reportStats = p0.fn() },
		EventStream = { setRBXEventStream = p0.fn(), sendEventDeferred = p0.fn() },
		Telemetry = {
			logRobloxTelemetryCounter = p0.fn(),
			logRobloxTelemetryEvent = p0.fn(),
			logRobloxTelemetryStat = p0.fn(),
			TelemetryBackends = {
				Points = "Points",
				Stats = "RobloxTelemetryStat",
				Counters = "RobloxTelemetryCounter",
				EventIngest = "EventIngest"
			}
		}
	}
end
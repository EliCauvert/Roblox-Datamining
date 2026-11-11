return function(p1)
	return {
		Diag = { reportCounter = p1.fn(), reportStats = p1.fn() },
		EventStream = { setRBXEventStream = p1.fn(), sendEventDeferred = p1.fn() },
		Telemetry = {
			logRobloxTelemetryCounter = p1.fn(),
			logRobloxTelemetryEvent = p1.fn(),
			logRobloxTelemetryStat = p1.fn(),
			TelemetryBackends = {
				Points = "Points",
				Stats = "RobloxTelemetryStat",
				Counters = "RobloxTelemetryCounter",
				EventIngest = "EventIngest"
			}
		}
	}
end
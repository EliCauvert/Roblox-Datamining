return {
	RobuxTransferFlowEvent = {
		eventName = "RobuxTransferFlow",
		description = "Robux transfer funnel; correlate via transfer_request_id and transfer_client_session_id.",
		backends = {
			require(script:FindFirstAncestor("CurrencyTransfers").Parent.LoggingProtocol).TelemetryBackends.EventIngest
		},
		throttlingPercentage = game:DefineFastInt("RobuxTransferFlowEventIngestThrottleHundredthsPercent", 0),
		lastUpdated = { 2026, 4, 2 }
	}
}
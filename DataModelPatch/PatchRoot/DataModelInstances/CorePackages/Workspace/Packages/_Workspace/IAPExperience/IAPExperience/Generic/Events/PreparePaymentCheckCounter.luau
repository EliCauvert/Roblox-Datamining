return {
	eventName = "PreparePaymentCheckCounter",
	throttlingPercentage = 100,
	description = "Counter on all preparePayment check",
	links = "",
	backends = {
		require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 2024, 9, 27 }
}
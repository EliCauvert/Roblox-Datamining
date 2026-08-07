return {
	LegacyUpsellShownCounter = {
		eventName = "LegacyUpsellShownCounter",
		throttlingPercentage = 100,
		description = "Counter on all legacy upsell shown",
		links = "",
		backends = {
			require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol).TelemetryBackends.Counter
		},
		lastUpdated = { 2025, 7, 15 }
	}
}
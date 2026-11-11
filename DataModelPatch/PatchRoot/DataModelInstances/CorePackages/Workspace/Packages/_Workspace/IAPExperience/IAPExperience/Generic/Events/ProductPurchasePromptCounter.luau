return {
	ProductPurchasePromptCounter = {
		eventName = "ProductPurchaseErrorPromptShownCounter",
		throttlingPercentage = 100,
		description = "Counter on all product purchase error prompt shown",
		links = "",
		backends = {
			require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol).TelemetryBackends.Counter
		},
		lastUpdated = { 2025, 8, 26 }
	}
}
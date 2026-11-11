return {
	UnifiedProductPurchaseCompletionModalShownCounter = {
		eventName = "UnifiedProductPurchaseCompletionModalShownCounter",
		throttlingPercentage = 100,
		description = "Counter fired when Unified Purchase Completion Modal is shown.",
		backends = {
			require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol).TelemetryBackends.Counter
		},
		lastUpdated = { 2025, 10, 8 }
	}
}
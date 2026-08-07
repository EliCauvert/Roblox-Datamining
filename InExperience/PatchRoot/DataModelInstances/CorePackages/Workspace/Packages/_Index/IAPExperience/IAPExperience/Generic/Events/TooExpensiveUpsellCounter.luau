local loggingProtocolModule = require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol)

return {
	TooExpensiveUpsellShownCounter = {
		eventName = "TooExpensiveUpsellShownCounter",
		throttlingPercentage = 100,
		description = "Counter fired when Robux too expensive upsell modal shown",
		links = "",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 7, 29 }
	},
	TooExpensiveUpsellFallbackShownCounter = {
		eventName = "TooExpensiveUpsellFallbackShownCounter",
		throttlingPercentage = 100,
		description = "Counter fired when Robux too expensive fallback modal shown",
		links = "",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 7, 29 }
	},
	TooExpensiveUnifiedUpsellShownCounter = {
		eventName = "TooExpensiveUnifiedUpsellShownCounter",
		throttlingPercentage = 100,
		description = "Counter fired when Robux too expensive unified upsell modal shown",
		links = "",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 29 }
	}
}
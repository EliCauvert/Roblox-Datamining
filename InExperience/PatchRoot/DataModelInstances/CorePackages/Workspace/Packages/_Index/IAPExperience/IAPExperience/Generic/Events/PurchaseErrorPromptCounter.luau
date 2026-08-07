local loggingProtocolModule = require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol)

return {
	PurchaseErrorPromptShownCounter = {
		eventName = "PurchaseErrorPromptShownCounter",
		throttlingPercentage = 100,
		description = "Counter on all purchase error prompt shown",
		links = "",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 5, 20 }
	},
	EconomicRestrictionsPromptShownCounter = {
		eventName = "EconomicRestrictionsPromptShownCounter",
		throttlingPercentage = 100,
		description = "Counter on all economic restrictions prompt shown",
		links = "",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 5, 20 }
	}
}
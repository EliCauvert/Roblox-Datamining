local LoggingProtocolModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.LoggingProtocol)

return {
	ProductPurchaseContainerMigrationCounter = {
		eventName = "ProductPurchaseContainerPurchaseFlowUUID",
		throttlingPercentage = 100,
		description = "Counter for PurchaseFlowUUID generation in ProductPurchaseContainer init method",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 1, 21 }
	},
	InitiatePurchaseCounter = {
		eventName = "InitiatePurchasePurchaseFlowUUID",
		throttlingPercentage = 100,
		description = "Counter for PurchaseFlowUUID generation in initiatePurchase thunk",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 1, 21 }
	}
}
local loggingProtocolModule = require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol)

return {
	SinglePackageUpsellShownCounter = {
		eventName = "SinglePackageUpsellShownCounter",
		throttlingPercentage = 100,
		description = "Counter on all multiple package upsell shown",
		links = "",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 5, 1 }
	},
	SinglePackageUpsellModalClosedCounter = {
		eventName = "SinglePackageUpsellModalClosedCounter",
		throttlingPercentage = 100,
		description = "Counter on all single package upsell modal closed",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 5, 1 }
	},
	SinglePackageUpsellModalBuyClickedCounter = {
		eventName = "SinglePackageUpsellModalBuyClickedCounter",
		throttlingPercentage = 100,
		description = "Counter on all single package upsell modal buy clicked",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 5, 1 }
	}
}
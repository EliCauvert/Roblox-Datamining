local LoggingProtocolModule = require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol)

return {
	MultiplePackageUpsellShownCounter = {
		eventName = "MultiplePackageUpsellShownCounter",
		throttlingPercentage = 100,
		description = "Counter on all multiple package upsell shown",
		links = "",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 5, 1 }
	},
	MultiplePackageUpsellSelectedCounter = {
		eventName = "MultiplePackageUpsellSelectedCounter",
		throttlingPercentage = 100,
		description = "Counter on all multiple package upsell selections",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 5, 1 }
	},
	MultiplePackageUpsellModalClosedCounter = {
		eventName = "MultiplePackageUpsellModalClosedCounter",
		throttlingPercentage = 100,
		description = "Counter on all multiple package upsell modal closed",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 5, 1 }
	},
	MultiplePackageUpsellModalBuyClickedCounter = {
		eventName = "MultiplePackageUpsellModalBuyClickedCounter",
		throttlingPercentage = 100,
		description = "Counter on all multiple package upsell modal buy clicked",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 5, 1 }
	}
}
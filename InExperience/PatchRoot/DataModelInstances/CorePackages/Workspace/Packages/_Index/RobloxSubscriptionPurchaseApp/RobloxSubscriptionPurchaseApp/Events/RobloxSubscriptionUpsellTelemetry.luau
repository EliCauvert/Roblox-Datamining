local loggingProtocolModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.LoggingProtocol)
local robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent = game:DefineFastInt("RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent", 0)

return {
	RobloxSubscriptionUpsellModalInitiatedCounter = {
		eventName = "RobloxSubscriptionUpsellModalInitiatedCounter",
		description = "Counter fired when Roblox Subscription Upsell Modal is initiated.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellModalShownCounter = {
		eventName = "RobloxSubscriptionUpsellModalShownCounter",
		description = "Counter fired when Roblox Subscription Upsell Modal is shown.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellModalBuyButtonClickedCounter = {
		eventName = "RobloxSubscriptionUpsellModalBuyButtonClickedCounter",
		description = "Counter fired when Roblox Subscription Upsell Modal buy button is clicked.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellFlowCompletedCounter = {
		eventName = "RobloxSubscriptionUpsellFlowCompletedCounter",
		description = "Counter fired when purchase was succesful.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellNativePurchaseCompletedCounter = {
		eventName = "RobloxSubscriptionUpsellNativePurchaseCompletedCounter",
		description = "Counter fired when purchase was succesful.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellDismissedCounter = {
		eventName = "RobloxSubscriptionUpsellDismissedCounter",
		description = "Counter fired when modal is dismissed.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellPurchaseFailedCounter = {
		eventName = "RobloxSubscriptionUpsellPurchaseFailedCounter",
		description = "Counter fired when purchase failed.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellPurchaseSucceededCounter = {
		eventName = "RobloxSubscriptionUpsellPurchaseSucceededCounter",
		description = "Counter fired when purchase succeeded.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 9 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellNativePurchasePollingTimeoutCounter = {
		eventName = "RobloxSubscriptionUpsellNativePurchasePollingTimeoutCounter",
		description = "Counter fired when native purchase polling timeout occurs after native purchase attempt.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 9 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionPurchaseAttemptedCounter = {
		eventName = "RobloxSubscriptionPurchaseAttemptedCounter",
		description = "Counter fired when purchase attempt is made.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 9 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionPurchaseErrorShownCounter = {
		eventName = "RobloxSubscriptionPurchaseErrorShownCounter",
		description = "Counter fired when purchase error is shown.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 24 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionCreatePaymentSessionFailedCounter = {
		eventName = "RobloxSubscriptionCreatePaymentSessionFailedCounter",
		description = "Counter fired when create payment session fails.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 25 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionCreatePaymentSessionFailedEvent = {
		eventName = "RobloxSubscriptionCreatePaymentSessionFailed",
		description = "Point event logged when create payment session fails, includes error details for Kibana.",
		backends = { loggingProtocolModule.TelemetryBackends.Points },
		lastUpdated = { 2026, 5, 1 },
		throttlingPercentage = robloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	}
}
local LoggingProtocolModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.LoggingProtocol)
local RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent = game:DefineFastInt("RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent", 0)

return {
	RobloxSubscriptionUpsellModalInitiatedCounter = {
		eventName = "RobloxSubscriptionUpsellModalInitiatedCounter",
		description = "Counter fired when Roblox Subscription Upsell Modal is initiated.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellModalShownCounter = {
		eventName = "RobloxSubscriptionUpsellModalShownCounter",
		description = "Counter fired when Roblox Subscription Upsell Modal is shown.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellModalBuyButtonClickedCounter = {
		eventName = "RobloxSubscriptionUpsellModalBuyButtonClickedCounter",
		description = "Counter fired when Roblox Subscription Upsell Modal buy button is clicked.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellFlowCompletedCounter = {
		eventName = "RobloxSubscriptionUpsellFlowCompletedCounter",
		description = "Counter fired when purchase was succesful.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellNativePurchaseCompletedCounter = {
		eventName = "RobloxSubscriptionUpsellNativePurchaseCompletedCounter",
		description = "Counter fired when purchase was succesful.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellDismissedCounter = {
		eventName = "RobloxSubscriptionUpsellDismissedCounter",
		description = "Counter fired when modal is dismissed.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellPurchaseFailedCounter = {
		eventName = "RobloxSubscriptionUpsellPurchaseFailedCounter",
		description = "Counter fired when purchase failed.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 3 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellPurchaseSucceededCounter = {
		eventName = "RobloxSubscriptionUpsellPurchaseSucceededCounter",
		description = "Counter fired when purchase succeeded.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 9 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionUpsellNativePurchasePollingTimeoutCounter = {
		eventName = "RobloxSubscriptionUpsellNativePurchasePollingTimeoutCounter",
		description = "Counter fired when native purchase polling timeout occurs after native purchase attempt.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 9 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionPurchaseAttemptedCounter = {
		eventName = "RobloxSubscriptionPurchaseAttemptedCounter",
		description = "Counter fired when purchase attempt is made.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 9 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionPurchaseErrorShownCounter = {
		eventName = "RobloxSubscriptionPurchaseErrorShownCounter",
		description = "Counter fired when purchase error is shown.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 24 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionCreatePaymentSessionFailedCounter = {
		eventName = "RobloxSubscriptionCreatePaymentSessionFailedCounter",
		description = "Counter fired when create payment session fails.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 3, 25 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	},
	RobloxSubscriptionCreatePaymentSessionFailedEvent = {
		eventName = "RobloxSubscriptionCreatePaymentSessionFailed",
		description = "Point event logged when create payment session fails, includes error details for Kibana.",
		backends = { LoggingProtocolModule.TelemetryBackends.Points },
		lastUpdated = { 2026, 5, 1 },
		throttlingPercentage = RobloxSubscriptionUpsellTelemetryEventIngestThrottleHundredthsPercent
	}
}
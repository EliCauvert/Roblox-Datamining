local LoggingProtocolModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.LoggingProtocol)
local UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent = game:DefineFastInt("UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent", 100)

return {
	UnifiedProductPurchaseModalShownCounter = {
		eventName = "UnifiedProductPurchaseModalShownCounter",
		description = "Counter fired when Unified Purchase Modal is shown.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseModalBuyItemButtonClickedCounter = {
		eventName = "UnifiedProductPurchaseModalBuyItemButtonClickedCounter",
		description = "Counter fired when Unified Purchase Modal buy item button is clicked.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseModalCancelButtonClickedCounter = {
		eventName = "UnifiedProductPurchaseModalCancelButtonClickedCounter",
		description = "Counter fired when Unified Purchase Modal cancel button is clicked.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseModalPurchaseAttemptedCounter = {
		eventName = "UnifiedProductPurchaseModalPurchaseAttemptedCounter",
		description = "Counter fired when Unified Purchase Modal purchase attempt is made.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseModalPurchaseSuccessCounter = {
		eventName = "UnifiedProductPurchaseModalPurchaseSuccessCounter",
		description = "Counter fired when Unified Purchase Modal purchase success occurs.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseCompletionModalShownCounter = {
		eventName = "UnifiedProductPurchaseCompletionModalShownCounter",
		description = "Counter fired when Unified Purchase Modal purchase success occurs.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedRobuxUpsellModalShownCounter = {
		eventName = "UnifiedRobuxUpsellModalShownCounter",
		description = "Counter fired when Unified Robux Upsell Modal is shown.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 10, 4 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedRobuxUpsellModalBuyButtonClickedCounter = {
		eventName = "UnifiedRobuxUpsellModalBuyButtonClickedCounter",
		description = "Counter fired when Unified Robux Upsell Modal buy button is clicked.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 10, 4 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedRobuxUpsellRobuxPurchaseCompletedCounter = {
		eventName = "UnifiedRobuxUpsellRobuxPurchaseCompletedCounter",
		description = "Counter fired when Robux was successfully purchased during the Unified Robux Upsell Flow.  Doesn't include successful item purchase after upsell.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 2, 9 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedRobuxUpsellRobuxPurchaseFailedCounter = {
		eventName = "UnifiedRobuxUpsellRobuxPurchaseFailedCounter",
		description = "Counter fired when Robux upsell flow failed during balance polling retries in the Unified Robux Upsell Flow.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 2, 9 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedCartPricingFetchSucceededCounter = {
		eventName = "UnifiedCartPricingFetchSucceededCounter",
		description = "Counter fired when the cart-pricing fetch resolves.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 6, 2 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedCartPricingFetchFailedCounter = {
		eventName = "UnifiedCartPricingFetchFailedCounter",
		description = "Counter fired when the cart-pricing fetch rejects.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 6, 2 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedCartPricingHandlerErrorCounter = {
		eventName = "UnifiedCartPricingHandlerErrorCounter",
		description = "Counter fired when the container's cart-pricing success handler throws.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 6, 2 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedCartPricingBuyBlockedWhileFetchingCounter = {
		eventName = "UnifiedCartPricingBuyBlockedWhileFetchingCounter",
		description = "Counter fired when a purchase is blocked because a cart-pricing fetch is in flight.",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 6, 11 },
		throttlingPercentage = UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseFlowEvent = {
		eventName = "UnifiedProductPurchaseFlow",
		description = "Data points on all Unified Product Purchase Flow events.",
		backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
		throttlingPercentage = game:DefineFastInt("EnableUnifiedProductPurchaseFlowThrottleHundredthsPercent", 0),
		lastUpdated = { 2025, 10, 4 }
	}
}
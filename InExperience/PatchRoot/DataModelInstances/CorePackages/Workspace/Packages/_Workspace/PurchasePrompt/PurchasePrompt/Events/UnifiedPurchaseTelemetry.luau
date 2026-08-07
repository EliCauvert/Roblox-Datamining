local loggingProtocolModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.LoggingProtocol)
local unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent = game:DefineFastInt("UnifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent", 100)

return {
	UnifiedProductPurchaseModalShownCounter = {
		eventName = "UnifiedProductPurchaseModalShownCounter",
		description = "Counter fired when Unified Purchase Modal is shown.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseModalBuyItemButtonClickedCounter = {
		eventName = "UnifiedProductPurchaseModalBuyItemButtonClickedCounter",
		description = "Counter fired when Unified Purchase Modal buy item button is clicked.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseModalCancelButtonClickedCounter = {
		eventName = "UnifiedProductPurchaseModalCancelButtonClickedCounter",
		description = "Counter fired when Unified Purchase Modal cancel button is clicked.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseModalPurchaseAttemptedCounter = {
		eventName = "UnifiedProductPurchaseModalPurchaseAttemptedCounter",
		description = "Counter fired when Unified Purchase Modal purchase attempt is made.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseModalPurchaseSuccessCounter = {
		eventName = "UnifiedProductPurchaseModalPurchaseSuccessCounter",
		description = "Counter fired when Unified Purchase Modal purchase success occurs.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseCompletionModalShownCounter = {
		eventName = "UnifiedProductPurchaseCompletionModalShownCounter",
		description = "Counter fired when Unified Purchase Modal purchase success occurs.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 9, 22 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedRobuxUpsellModalShownCounter = {
		eventName = "UnifiedRobuxUpsellModalShownCounter",
		description = "Counter fired when Unified Robux Upsell Modal is shown.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 10, 4 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedRobuxUpsellModalBuyButtonClickedCounter = {
		eventName = "UnifiedRobuxUpsellModalBuyButtonClickedCounter",
		description = "Counter fired when Unified Robux Upsell Modal buy button is clicked.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2025, 10, 4 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedRobuxUpsellRobuxPurchaseCompletedCounter = {
		eventName = "UnifiedRobuxUpsellRobuxPurchaseCompletedCounter",
		description = "Counter fired when Robux was successfully purchased during the Unified Robux Upsell Flow.  Doesn't include successful item purchase after upsell.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 2, 9 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedRobuxUpsellRobuxPurchaseFailedCounter = {
		eventName = "UnifiedRobuxUpsellRobuxPurchaseFailedCounter",
		description = "Counter fired when Robux upsell flow failed during balance polling retries in the Unified Robux Upsell Flow.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 2, 9 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedCartPricingFetchSucceededCounter = {
		eventName = "UnifiedCartPricingFetchSucceededCounter",
		description = "Counter fired when the cart-pricing fetch resolves.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 6, 2 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedCartPricingFetchFailedCounter = {
		eventName = "UnifiedCartPricingFetchFailedCounter",
		description = "Counter fired when the cart-pricing fetch rejects.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 6, 2 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedCartPricingHandlerErrorCounter = {
		eventName = "UnifiedCartPricingHandlerErrorCounter",
		description = "Counter fired when the container's cart-pricing success handler throws.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 6, 2 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedCartPricingBuyBlockedWhileFetchingCounter = {
		eventName = "UnifiedCartPricingBuyBlockedWhileFetchingCounter",
		description = "Counter fired when a purchase is blocked because a cart-pricing fetch is in flight.",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 6, 11 },
		throttlingPercentage = unifiedPurchaseTelemetryEventIngestThrottleHundredthsPercent
	},
	UnifiedProductPurchaseFlowEvent = {
		eventName = "UnifiedProductPurchaseFlow",
		description = "Data points on all Unified Product Purchase Flow events.",
		backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
		throttlingPercentage = game:DefineFastInt("EnableUnifiedProductPurchaseFlowThrottleHundredthsPercent", 0),
		lastUpdated = { 2025, 10, 4 }
	}
}
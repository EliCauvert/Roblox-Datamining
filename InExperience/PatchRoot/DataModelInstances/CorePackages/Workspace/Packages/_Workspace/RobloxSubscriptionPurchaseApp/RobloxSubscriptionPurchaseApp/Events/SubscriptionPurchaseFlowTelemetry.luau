return {
	SubscriptionPurchaseFlowEvent = {
		eventName = "SubscriptionPurchaseFlow",
		description = "Subscription purchase funnel (upsell, modal, purchase outcomes); correlates via client_session_id_type + client_session_id.",
		backends = {
			require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.LoggingProtocol).TelemetryBackends.EventIngest
		},
		throttlingPercentage = game:DefineFastInt("SubscriptionPurchaseFlowEventIngestThrottleHundredthsPercent", 0),
		lastUpdated = { 2026, 4, 2 }
	}
}
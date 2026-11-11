return {
	VirtualItemBadgeShownCounter = {
		eventName = "VirtualItemBadgeShownCounter",
		throttlingPercentage = 100,
		description = "Counter on all virtual item badge shown",
		links = "",
		backends = {
			require(script:FindFirstAncestor("IAPExperience").Parent.LoggingProtocol).TelemetryBackends.Counter
		},
		lastUpdated = { 2025, 5, 15 }
	}
}
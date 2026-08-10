local loggingProtocolModule = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.LoggingProtocol)
game:DefineFastInt("SortDeeplinkFailureEventThrottleHundrethsPercent", 10000)

return {
	eventName = "SortDeeplinkFailedCounter",
	description = "Tracks failures to resolve sort deeplinks",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = game:GetFastInt("SortDeeplinkFailureEventThrottleHundrethsPercent"),
	lastUpdated = { 24, 10, 18 }
}
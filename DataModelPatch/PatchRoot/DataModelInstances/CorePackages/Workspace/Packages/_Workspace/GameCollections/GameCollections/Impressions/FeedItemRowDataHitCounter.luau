return {
	eventName = "feedItemRowDataHitCounter",
	description = "Count the number of times feed item row data is accessible when game impression is sent",
	backends = {
		require(script:FindFirstAncestor("GameCollections").Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	throttlingPercentage = require(script.Parent.FIntFeedItemRowDataCounterThrottle),
	lastUpdated = { 24, 5, 29 }
}
return {
	eventName = "accountSecurityChallengeDeniedEvent",
	throttlingPercentage = 10000,
	description = "Tracks lifecycle events for the native Denied GCS challenge",
	backends = {
		require(script:FindFirstAncestor("GenericChallenges").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	lastUpdated = { 26, 11, 4 }
}
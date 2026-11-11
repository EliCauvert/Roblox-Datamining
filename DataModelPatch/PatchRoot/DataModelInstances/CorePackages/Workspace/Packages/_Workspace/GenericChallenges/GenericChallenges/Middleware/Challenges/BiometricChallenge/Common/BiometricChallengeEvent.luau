return {
	eventName = "accountSecurityChallengeBiometricEvent",
	throttlingPercentage = 10000,
	description = "Tracks lifecycle events for the Biometric GCS challenge",
	links = "https://roblox.atlassian.net/wiki/x/rQR02",
	backends = {
		require(script:FindFirstAncestor("GenericChallenges").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	lastUpdated = { 25, 9, 11 }
}
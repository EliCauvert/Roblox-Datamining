return {
	eventName = "accountSecurityChallengeBiometricEvent",
	throttlingPercentage = 10000,
	description = "Tracks lifecycle events for the Biometric GCS challenge",
	links = "https://roblox.atlassian.net/wiki/x/rQR02",
	backends = {
		require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).TelemetryBackends.EventIngest
	},
	lastUpdated = { 25, 9, 11 }
}
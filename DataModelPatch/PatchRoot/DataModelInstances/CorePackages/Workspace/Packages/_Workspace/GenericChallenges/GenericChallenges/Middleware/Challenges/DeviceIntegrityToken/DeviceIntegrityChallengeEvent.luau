return {
	eventName = "accountSecurityChallengeDeviceIntegrityEvent",
	throttlingPercentage = 10000,
	description = "Tracks lifecycle events for the Device Integrity GCS challenge",
	links = "https://roblox.atlassian.net/wiki/spaces/BaS/pages/2184872709/Bypassing+Challenges+for+Xbox+PS+Quest+etc+Requests#Event-Tracking",
	backends = {
		require(script:FindFirstAncestor("GenericChallenges").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	lastUpdated = { 24, 1, 22 }
}
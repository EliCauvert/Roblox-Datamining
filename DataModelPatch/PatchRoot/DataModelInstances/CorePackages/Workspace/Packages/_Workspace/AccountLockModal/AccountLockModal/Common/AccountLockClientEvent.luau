return {
	eventName = "accountLockClientEvent",
	throttlingPercentage = 10000,
	description = "Tracks lifecycle events for account lock",
	links = "https://roblox.atlassian.net/wiki/spaces/BaS/pages/3666281428/Tech+Spec+Account+Locking+System",
	backends = {
		require(script:FindFirstAncestor("AccountLockModal").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	lastUpdated = { 25, 9, 17 }
}
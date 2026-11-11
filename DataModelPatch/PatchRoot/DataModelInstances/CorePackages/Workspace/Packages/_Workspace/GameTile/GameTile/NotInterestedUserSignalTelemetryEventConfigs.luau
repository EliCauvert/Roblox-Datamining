local LoggingProtocolModule = require(script:FindFirstAncestor("GameTile").Parent.LoggingProtocol)

return {
	NotInterestedMissingAppPage = {
		eventName = "Discovery_NotInterestedMissingAppPage",
		description = "Counter for Not Interested Missing App Page",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 25, 8, 14 }
	},
	NotInterestedUserSignalFailed = {
		eventName = "Discovery_NotInterestedUserSignalFailed",
		description = "Counter for Not Interested User Signal Failed",
		backends = { LoggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 25, 8, 14 }
	}
}
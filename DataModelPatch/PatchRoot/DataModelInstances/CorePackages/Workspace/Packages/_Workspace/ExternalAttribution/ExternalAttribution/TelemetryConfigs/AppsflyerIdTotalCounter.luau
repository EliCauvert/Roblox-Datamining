local ExternalAttribution = script:FindFirstAncestor("ExternalAttribution")

return {
	eventName = "luaAppsAppsflyerIdTotal",
	description = "Counter to track total Appsflyer ID generation on Lua Apps.",
	backends = {
		require(ExternalAttribution.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	throttlingPercentage = require(ExternalAttribution.Flags).GetFIntLuaAppsAppsflyerIdCounterThrottle(),
	lastUpdated = { 24, 7, 30 }
}
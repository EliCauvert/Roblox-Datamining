local ExternalAttribution = script:FindFirstAncestor("ExternalAttribution")

return {
	eventName = "luaAppsAppsflyerIdFailure",
	description = "Counter to track failed Appsflyer ID generation on Lua Apps.",
	backends = {
		require(ExternalAttribution.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	throttlingPercentage = require(ExternalAttribution.Flags).GetFIntLuaAppsAppsflyerIdCounterThrottle(),
	lastUpdated = { 24, 7, 30 }
}
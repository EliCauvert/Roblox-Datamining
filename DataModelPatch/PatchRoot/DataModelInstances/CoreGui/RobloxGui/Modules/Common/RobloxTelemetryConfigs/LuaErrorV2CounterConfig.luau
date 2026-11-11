return {
	eventName = "LuaAppsError",
	description = "V2 Counter to for Lua App Error.",
	backends = {
		require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).TelemetryBackends.Counter
	},
	throttlingPercentage = game:DefineFastInt("LuaErrorV2ThrottleHundredthPercentage", 0),
	lastUpdated = { 24, 11, 2 }
}
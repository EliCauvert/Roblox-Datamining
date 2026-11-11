return {
	eventName = "LuaCoreScriptsError",
	description = "V2 Counter to for Lua CoreScripts Error.",
	backends = {
		require(game:GetService("CorePackages").Workspace.Packages.LoggingProtocol).TelemetryBackends.Counter
	},
	throttlingPercentage = game:DefineFastInt("LuaCoreScriptsErrorV2ThrottleHundredthPercentage", 0),
	lastUpdated = { 25, 1, 29 }
}
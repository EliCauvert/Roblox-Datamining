return {
	eventName = "LuaCoreScriptsReactTreeCrashed",
	description = "Report a CoreScripts React tree being torn down by an uncaught error, tagged by surface",
	backends = {
		require(script.Parent.Parent.LoggingProtocol).TelemetryBackends.Counter
	},
	lastUpdated = { 26, 10, 8 }
}
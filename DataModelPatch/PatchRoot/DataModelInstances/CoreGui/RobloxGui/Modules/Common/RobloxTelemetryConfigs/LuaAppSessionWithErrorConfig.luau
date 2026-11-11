return {
	eventName = "LuaAppSessionWithError",
	description = "Counting Lua App Session with Error.",
	backends = { "RobloxTelemetryCounter" },
	throttlingPercentage = game:DefineFastInt("LuaAppSessionWithErrorThrottlePercentage", 100),
	lastUpdated = { 26, 2, 23 }
}
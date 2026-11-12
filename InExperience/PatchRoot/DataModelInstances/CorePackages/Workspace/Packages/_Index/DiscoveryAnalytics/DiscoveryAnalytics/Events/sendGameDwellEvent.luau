local TelemetryService = game:GetService("TelemetryService")
local GetPlatformTargetFunction = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.Analytics).getPlatformTarget
local LuaAppSduiGameDwellThrottlingPercentage = game:DefineFastInt("LuaAppSduiGameDwellThrottlingPercentage", 10000)
local config = {
	gameDwellStart = {
		eventName = "gameDwellStart",
		description = "Starts observed game tile dwell on opted-in SDUI collections",
		backends = { "EventIngest" },
		throttlingPercentage = LuaAppSduiGameDwellThrottlingPercentage,
		lastUpdated = { 26, 11, 3 }
	},
	gameDwellEnd = {
		eventName = "gameDwellEnd",
		description = "Ends observed game tile dwell on opted-in SDUI collections",
		backends = { "EventIngest" },
		throttlingPercentage = LuaAppSduiGameDwellThrottlingPercentage,
		lastUpdated = { 26, 11, 3 }
	}
}

return function(p1, CustomFields, EventContext)
	-- upvalues: TelemetryService (copy), config (copy), GetPlatformTargetFunction (copy)
	TelemetryService:LogEvent(config[p1], {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = CustomFields,
		legacyOverrideTargetForEventIngest = GetPlatformTargetFunction()
	})
end
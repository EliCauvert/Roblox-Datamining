local telemetryService = game:GetService("TelemetryService")
local fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad = require(script:FindFirstAncestor("SponsoredTiles").Parent.SharedFlags).FFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad
local t = { GameJoin = "GameJoin", Clickout = "Clickout" }
local t_1 = {
	eventName = "OneByTwoTileActivated",
	description = "Counter for OneByTwoTileActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 5 }
}
local t_2 = {
	eventName = "OneByTwoTileCtaActivated",
	description = "Counter for OneByTwoTileCtaActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 5 }
}
local t_3 = {
	eventName = "OneByTwoTileGameJoinInitiated",
	description = "Counter for OneByTwoTileGameJoinInitiated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 5 }
}
local var1 = if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then {
	eventName = "OneByTwoTileVideoLoaded",
	description = "Fired when OneByTwoTile VideoDisplay LoadAsync succeeds.",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppOneByTwoTileVideoLoadedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 8, 26 }
} else nil

return {
	CtaType = t,
	logOneByTwoTileActivated = function()
		-- upvalues: telemetryService (ref), t_1 (ref)
		telemetryService:LogCounter(t_1, {}, 1)
	end,
	logOneByTwoTileCtaActivated = function(p1)
		-- upvalues: telemetryService (ref), t_2 (ref)
		telemetryService:LogCounter(t_2, { customFields = { CtaType = p1 } }, 1)
	end,
	logOneByTwoTileGameJoinInitiated = function()
		-- upvalues: telemetryService (ref), t_3 (ref)
		telemetryService:LogCounter(t_3, {}, 1)
	end,
	logOneByTwoTileVideoLoaded = function(p1, p2, p3)
		-- upvalues: fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad (ref), telemetryService (ref), var1 (ref)
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
			telemetryService:LogEvent(var1, {
				standardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" },
				customFields = {
					videoLengthSec = p1,
					loadDurationSec = p2,
					nativeAdData = p3
				}
			})
			
			return
		end
	end
}
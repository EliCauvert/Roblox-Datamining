local telemetryService = game:GetService("TelemetryService")
local sharedFlagsModule = require(script:FindFirstAncestor("SponsoredTilesTelemetry").Parent.SharedFlags)
local fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad = sharedFlagsModule.FFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad
local fFlagLuaAppEnableOneByTwoTileFunnelTelemetry = sharedFlagsModule.FFlagLuaAppEnableOneByTwoTileFunnelTelemetry
local t = { GameJoin = "GameJoin", Clickout = "Clickout" }
local var1 = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then { "addOSInfo", "addSessionInfo", "addSessionId" } else nil
local var2 = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then {} else nil
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
local var3 = if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then {
	eventName = "OneByTwoTileVideoLoaded",
	description = "Fired when OneByTwoTile VideoDisplay LoadAsync succeeds.",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppOneByTwoTileVideoLoadedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 8, 26 }
} else nil

local function makeFunnelConfig(p1, p2)
	return {
		throttlingPercentage = 10000,
		links = "https://roblox.atlassian.net/browse/ADS-11511",
		eventName = p1,
		backends = { "EventIngest", "Points" },
		lastUpdated = { 26, 9, 21 },
		description = p2
	}
end

local var4 = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then makeFunnelConfig("OneByTwoTileResponseReceived", "Fired when an omni-recommendations response contains a OneByTwoTile.") else nil
local var5 = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then makeFunnelConfig("OneByTwoTilePlaced", "Fired when a OneByTwoTile is placed into a grid.") else nil
local var6 = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then makeFunnelConfig("OneByTwoTileSkipped", "Fired when a OneByTwoTile cannot be placed into any grid.") else nil
local var7 = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then makeFunnelConfig("OneByTwoTileRendered", "Fired when a OneByTwoTile component mounts.") else nil

local function _(p1, p2)
	-- upvalues: var2 (ref), telemetryService (ref), var1 (ref)
	local eventName = `{p1.eventName}:{p2.oneByTwoTileFlowId}`
	
	if var2[eventName] then
		return
	end
	var2[eventName] = true
	telemetryService:LogEvent(p1, { standardizedFields = var1, customFields = p2 })
end

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
		-- upvalues: fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad (ref), telemetryService (ref), var3 (ref)
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
			telemetryService:LogEvent(var3, {
				standardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" },
				customFields = {
					videoLengthSec = p1,
					loadDurationSec = p2,
					nativeAdData = p3
				}
			})
			
			return
		end
	end,
	logOneByTwoTileResponseReceived = function(p1)
		-- upvalues: var4 (ref), var2 (ref), telemetryService (ref), var1 (ref)
		local eventName = `{var4.eventName}:{p1.oneByTwoTileFlowId}`
		
		if var2[eventName] then
			return
		end
		var2[eventName] = true
		telemetryService:LogEvent(var4, { standardizedFields = var1, customFields = p1 })
	end,
	logOneByTwoTilePlaced = function(p1)
		-- upvalues: var5 (ref), var2 (ref), telemetryService (ref), var1 (ref)
		local eventName = `{var5.eventName}:{p1.oneByTwoTileFlowId}`
		
		if var2[eventName] then
			return
		end
		var2[eventName] = true
		telemetryService:LogEvent(var5, { standardizedFields = var1, customFields = p1 })
	end,
	logOneByTwoTileSkipped = function(p1)
		-- upvalues: var6 (ref), var2 (ref), telemetryService (ref), var1 (ref)
		local eventName = `{var6.eventName}:{p1.oneByTwoTileFlowId}`
		
		if var2[eventName] then
			return
		end
		var2[eventName] = true
		telemetryService:LogEvent(var6, { standardizedFields = var1, customFields = p1 })
	end,
	logOneByTwoTileRendered = function(p1)
		-- upvalues: var7 (ref), var2 (ref), telemetryService (ref), var1 (ref)
		local eventName = `{var7.eventName}:{p1.oneByTwoTileFlowId}`
		
		if var2[eventName] then
			return
		end
		var2[eventName] = true
		telemetryService:LogEvent(var7, { standardizedFields = var1, customFields = p1 })
	end
}
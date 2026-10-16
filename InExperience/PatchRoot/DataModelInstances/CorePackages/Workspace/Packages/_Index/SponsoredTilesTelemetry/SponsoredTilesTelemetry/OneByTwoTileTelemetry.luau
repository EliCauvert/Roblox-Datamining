local TelemetryService = game:GetService("TelemetryService")
local FFlagLuaAppEnableOneByTwoTileFunnelTelemetry = require(script:FindFirstAncestor("SponsoredTilesTelemetry").Parent.SharedFlags).FFlagLuaAppEnableOneByTwoTileFunnelTelemetry
local List = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetry then { "addOSInfo", "addSessionInfo", "addSessionId" } else nil
local T = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetry then {} else nil
local config = {
	eventName = "OneByTwoTileActivated",
	description = "Counter for OneByTwoTileActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 5 }
}
local config1 = {
	eventName = "OneByTwoTileCtaActivated",
	description = "Counter for OneByTwoTileCtaActivated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 5 }
}
local config2 = {
	eventName = "OneByTwoTileGameJoinInitiated",
	description = "Counter for OneByTwoTileGameJoinInitiated events.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 8, 5 }
}
local config3 = {
	eventName = "OneByTwoTileVideoLoaded",
	description = "Fired when OneByTwoTile VideoDisplay LoadAsync succeeds.",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppOneByTwoTileVideoLoadedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 8, 26 }
}

local function makeFunnelConfig(EventName, Description) --[[ Line: 73 ]]
	return {
		throttlingPercentage = 10000,
		links = "https://roblox.atlassian.net/browse/ADS-11511",
		eventName = EventName,
		backends = { "EventIngest", "Points" },
		lastUpdated = { 26, 9, 21 },
		description = Description
	}
end

local OneByTwoTileResponseReceived = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetry then makeFunnelConfig("OneByTwoTileResponseReceived", "Fired when an omni-recommendations response contains a OneByTwoTile.") else nil
local OneByTwoTilePlaced = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetry then makeFunnelConfig("OneByTwoTilePlaced", "Fired when a OneByTwoTile is placed into a grid.") else nil
local OneByTwoTileSkipped = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetry then makeFunnelConfig("OneByTwoTileSkipped", "Fired when a OneByTwoTile cannot be placed into any grid.") else nil
local OneByTwoTileRendered = if FFlagLuaAppEnableOneByTwoTileFunnelTelemetry then makeFunnelConfig("OneByTwoTileRendered", "Fired when a OneByTwoTile component mounts.") else nil

local function _(Config, CustomFields) --[[ Line: 103 | Named "logFunnelEvent" ]]
	-- upvalues: T (copy), TelemetryService (copy), List (copy)
	local Text: string = `{Config.eventName}:{CustomFields.oneByTwoTileFlowId}`
	
	if not T[Text] then
		T[Text] = true
		TelemetryService:LogEvent(Config, { standardizedFields = List, customFields = CustomFields })
		
		return
	end
end

return {
	CtaType = { GameJoin = "GameJoin", Clickout = "Clickout" },
	logOneByTwoTileActivated = function() --[[ Line: 119 ]]
		-- upvalues: TelemetryService (copy), config (copy)
		TelemetryService:LogCounter(config, {}, 1)
	end,
	logOneByTwoTileCtaActivated = function(CtaType) --[[ Line: 123 ]]
		-- upvalues: TelemetryService (copy), config1 (copy)
		TelemetryService:LogCounter(config1, { customFields = { CtaType = CtaType } }, 1)
	end,
	logOneByTwoTileGameJoinInitiated = function() --[[ Line: 127 ]]
		-- upvalues: TelemetryService (copy), config2 (copy)
		TelemetryService:LogCounter(config2, {}, 1)
	end,
	logOneByTwoTileVideoLoaded = function(VideoLengthSec, LoadDurationSec, NativeAdData) --[[ Line: 131 ]]
		-- upvalues: TelemetryService (copy), config3 (copy)
		TelemetryService:LogEvent(config3, {
			standardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" },
			customFields = {
				videoLengthSec = VideoLengthSec,
				loadDurationSec = LoadDurationSec,
				nativeAdData = NativeAdData
			}
		})
	end,
	logOneByTwoTileResponseReceived = function(CustomFields) --[[ Line: 146 ]]
		-- upvalues: OneByTwoTileResponseReceived (copy), T (copy), TelemetryService (copy), List (copy)
		local Text: string = `{OneByTwoTileResponseReceived.eventName}:{CustomFields.oneByTwoTileFlowId}`
		
		if not T[Text] then
			T[Text] = true
			TelemetryService:LogEvent(OneByTwoTileResponseReceived, { standardizedFields = List, customFields = CustomFields })
			
			return
		end
	end,
	logOneByTwoTilePlaced = function(CustomFields) --[[ Line: 150 ]]
		-- upvalues: OneByTwoTilePlaced (copy), T (copy), TelemetryService (copy), List (copy)
		local Text: string = `{OneByTwoTilePlaced.eventName}:{CustomFields.oneByTwoTileFlowId}`
		
		if not T[Text] then
			T[Text] = true
			TelemetryService:LogEvent(OneByTwoTilePlaced, { standardizedFields = List, customFields = CustomFields })
			
			return
		end
	end,
	logOneByTwoTileSkipped = function(CustomFields) --[[ Line: 154 ]]
		-- upvalues: OneByTwoTileSkipped (copy), T (copy), TelemetryService (copy), List (copy)
		local Text: string = `{OneByTwoTileSkipped.eventName}:{CustomFields.oneByTwoTileFlowId}`
		
		if not T[Text] then
			T[Text] = true
			TelemetryService:LogEvent(OneByTwoTileSkipped, { standardizedFields = List, customFields = CustomFields })
			
			return
		end
	end,
	logOneByTwoTileRendered = function(CustomFields) --[[ Line: 158 ]]
		-- upvalues: OneByTwoTileRendered (copy), T (copy), TelemetryService (copy), List (copy)
		local Text: string = `{OneByTwoTileRendered.eventName}:{CustomFields.oneByTwoTileFlowId}`
		
		if not T[Text] then
			T[Text] = true
			TelemetryService:LogEvent(OneByTwoTileRendered, { standardizedFields = List, customFields = CustomFields })
			
			return
		end
	end
}
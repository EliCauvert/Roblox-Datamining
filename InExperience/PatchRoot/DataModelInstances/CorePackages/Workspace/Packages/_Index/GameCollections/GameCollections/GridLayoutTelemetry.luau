local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("GameCollections").Parent
local _ = require(parent.DiscoveryTypes)
local luaAppNullableGridLayoutTelemetryFields = game:DefineFastFlag("LuaAppNullableGridLayoutTelemetryFields", false)
local fFlagLuaAppFixTotalColsBound = require(parent.SharedFlags).FFlagLuaAppFixTotalColsBound
local list = { "addOSInfo", "addSessionInfo", "addSessionId" }
local t = {
	eventName = "TileSkipped",
	description = "This is fired when a tile render gets skipped.",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("TileSkippedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 1, 16 }
}
local t_1 = {
	eventName = "TilePlaced",
	description = "This is fired when a tile position has been determined.",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("TilePlacedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 1, 16 }
}

return {
	logTileSkipped = function(p0, p1, p2, p3, p4, p5, p6, p7, p8) --[[ line: 40 ]]
		-- upvalues: luaAppNullableGridLayoutTelemetryFields (ref), telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t, {
			standardizedFields = list,
			customFields = {
				adId = if luaAppNullableGridLayoutTelemetryFields then p0 else p0 or "",
				universeId = if luaAppNullableGridLayoutTelemetryFields then p1 else p1 or "",
				tileType = p2,
				pageContext = p3,
				numColumns = p4,
				numRows = p5,
				originalFeedIndex = p6,
				sortIndex = if luaAppNullableGridLayoutTelemetryFields then p7 else p7 or -1,
				topicId = if luaAppNullableGridLayoutTelemetryFields then p8 else p8 or ""
			}
		})
	end,
	logTilePlaced = function(p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19) --[[ line: 69 ]]
		-- upvalues: luaAppNullableGridLayoutTelemetryFields (ref), fFlagLuaAppFixTotalColsBound (ref), telemetryService (ref), t_1 (ref), list (ref)
		telemetryService:LogEvent(t_1, {
			standardizedFields = list,
			customFields = {
				adId = if luaAppNullableGridLayoutTelemetryFields then p9 else p9 or "",
				universeId = if luaAppNullableGridLayoutTelemetryFields then p10 else p10 or "",
				tileType = p11,
				pageContext = p12,
				numColumns = p13,
				numRows = p14,
				originalFeedIndex = p15,
				finalFeedIndex = p16,
				sortIndex = p17,
				topicId = p18,
				totalFilledColumns = if fFlagLuaAppFixTotalColsBound then p19 else nil
			}
		})
	end
}
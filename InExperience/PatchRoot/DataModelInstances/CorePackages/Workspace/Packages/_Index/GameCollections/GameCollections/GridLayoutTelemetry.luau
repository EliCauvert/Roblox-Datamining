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
	logTileSkipped = function(p1, p2, p3, p4, p5, p6, p7, p8, p9)
		-- upvalues: luaAppNullableGridLayoutTelemetryFields (ref), telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t, {
			standardizedFields = list,
			customFields = {
				adId = if luaAppNullableGridLayoutTelemetryFields then p1 else p1 or "",
				universeId = if luaAppNullableGridLayoutTelemetryFields then p2 else p2 or "",
				tileType = p3,
				pageContext = p4,
				numColumns = p5,
				numRows = p6,
				originalFeedIndex = p7,
				sortIndex = if luaAppNullableGridLayoutTelemetryFields then p8 else p8 or -1,
				topicId = if luaAppNullableGridLayoutTelemetryFields then p9 else p9 or ""
			}
		})
	end,
	logTilePlaced = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
		-- upvalues: luaAppNullableGridLayoutTelemetryFields (ref), fFlagLuaAppFixTotalColsBound (ref), telemetryService (ref), t_1 (ref), list (ref)
		telemetryService:LogEvent(t_1, {
			standardizedFields = list,
			customFields = {
				adId = if luaAppNullableGridLayoutTelemetryFields then p1 else p1 or "",
				universeId = if luaAppNullableGridLayoutTelemetryFields then p2 else p2 or "",
				tileType = p3,
				pageContext = p4,
				numColumns = p5,
				numRows = p6,
				originalFeedIndex = p7,
				finalFeedIndex = p8,
				sortIndex = p9,
				topicId = p10,
				totalFilledColumns = if fFlagLuaAppFixTotalColsBound then p11 else nil
			}
		})
	end
}
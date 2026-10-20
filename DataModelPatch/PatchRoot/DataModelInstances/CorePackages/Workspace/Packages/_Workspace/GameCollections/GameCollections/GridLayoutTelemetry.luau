local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("GameCollections").Parent
local _ = require(Parent.DiscoveryTypes)
local LuaAppNullableGridLayoutTelemetryFields = game:DefineFastFlag("LuaAppNullableGridLayoutTelemetryFields", false)
local FFlagLuaAppFixTotalColsBound = require(Parent.SharedFlags).FFlagLuaAppFixTotalColsBound
local StandardizedFields = { "addOSInfo", "addSessionInfo", "addSessionId" }
local config = {
	eventName = "TileSkipped",
	description = "This is fired when a tile render gets skipped.",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("TileSkippedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 1, 16 }
}
local config1 = {
	eventName = "TilePlaced",
	description = "This is fired when a tile position has been determined.",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("TilePlacedTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 1, 16 }
}

return {
	logTileSkipped = function(p1, p2, TileType, PageContext, NumColumns, NumRows, OriginalFeedIndex, p3, p4)
		-- upvalues: LuaAppNullableGridLayoutTelemetryFields (copy), TelemetryService (copy), config (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config, {
			standardizedFields = StandardizedFields,
			customFields = {
				adId = if LuaAppNullableGridLayoutTelemetryFields then p1 else p1 or "",
				universeId = if LuaAppNullableGridLayoutTelemetryFields then p2 else p2 or "",
				tileType = TileType,
				pageContext = PageContext,
				numColumns = NumColumns,
				numRows = NumRows,
				originalFeedIndex = OriginalFeedIndex,
				sortIndex = if LuaAppNullableGridLayoutTelemetryFields then p3 else p3 or -1,
				topicId = if LuaAppNullableGridLayoutTelemetryFields then p4 else p4 or ""
			}
		})
	end,
	logTilePlaced = function(p1, p2, TileType, PageContext, NumColumns, NumRows, OriginalFeedIndex, FinalFeedIndex, SortIndex, TopicId, p3)
		-- upvalues: LuaAppNullableGridLayoutTelemetryFields (copy), FFlagLuaAppFixTotalColsBound (copy), TelemetryService (copy), config1 (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config1, {
			standardizedFields = StandardizedFields,
			customFields = {
				adId = if LuaAppNullableGridLayoutTelemetryFields then p1 else p1 or "",
				universeId = if LuaAppNullableGridLayoutTelemetryFields then p2 else p2 or "",
				tileType = TileType,
				pageContext = PageContext,
				numColumns = NumColumns,
				numRows = NumRows,
				originalFeedIndex = OriginalFeedIndex,
				finalFeedIndex = FinalFeedIndex,
				sortIndex = SortIndex,
				topicId = TopicId,
				totalFilledColumns = if FFlagLuaAppFixTotalColsBound then p3 else nil
			}
		})
	end
}
local TelemetryService = game:GetService("TelemetryService")
local _ = require(script:FindFirstAncestor("GameCollections").Parent.DiscoveryTypes)
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
	logTileSkipped = function(AdId, UniverseId, TileType, PageContext, NumColumns, NumRows, OriginalFeedIndex, SortIndex, TopicId)
		-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config, {
			standardizedFields = StandardizedFields,
			customFields = {
				adId = AdId,
				universeId = UniverseId,
				tileType = TileType,
				pageContext = PageContext,
				numColumns = NumColumns,
				numRows = NumRows,
				originalFeedIndex = OriginalFeedIndex,
				sortIndex = SortIndex,
				topicId = TopicId
			}
		})
	end,
	logTilePlaced = function(AdId, UniverseId, TileType, PageContext, NumColumns, NumRows, OriginalFeedIndex, FinalFeedIndex, SortIndex, TopicId, TotalFilledColumns)
		-- upvalues: TelemetryService (copy), config1 (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config1, {
			standardizedFields = StandardizedFields,
			customFields = {
				adId = AdId,
				universeId = UniverseId,
				tileType = TileType,
				pageContext = PageContext,
				numColumns = NumColumns,
				numRows = NumRows,
				originalFeedIndex = OriginalFeedIndex,
				finalFeedIndex = FinalFeedIndex,
				sortIndex = SortIndex,
				topicId = TopicId,
				totalFilledColumns = TotalFilledColumns
			}
		})
	end
}
local GameCollections = script:FindFirstAncestor("GameCollections")
local Parent = GameCollections.Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local CalculateGridLayoutModule = require(GameCollections.calculateGridLayout)
local SponsoredTilesModule = require(Parent.SponsoredTiles)
local RenderOneByTwoTile = SponsoredTilesModule.renderOneByTwoTile
local RenderBlankTileModule = require(GameCollections.renderBlankTile)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.React)
local GridLayoutTelemetryModule = require(GameCollections.GridLayoutTelemetry)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local ApportioningDiagnosticTelemetry = require(Parent.DiscoveryUtils).ApportioningDiagnosticTelemetry
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppFixTotalColsBound = SharedFlagsModule.FFlagLuaAppFixTotalColsBound
local FFlagLuaAppEnableNxMRoduxApportioning = SharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning
local FFlagLuaAppEnableNxMApportioningExtraLogging = SharedFlagsModule.FFlagLuaAppEnableNxMApportioningExtraLogging
local config = {
	[GameCollectionItemTypes.GameCollectionItemType.EmphasisTile] = require(GameCollections.renderEmphasisTile),
	[GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile] = SponsoredTilesModule.renderTwoByOneTile,
	[GameCollectionItemTypes.GameCollectionItemType.Blank] = RenderBlankTileModule
}

if SharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile then
	config[GameCollectionItemTypes.GameCollectionItemType.OneByTwoTile] = RenderOneByTwoTile
end
local SpanForItemType = if FFlagLuaAppEnableNxMRoduxApportioning then GameCollectionItemTypes.SpanForItemType else nil

return {
	BuildCollectionEntries = function(List, ItemsPerRow, p1, p2, p3, PageContext, SortIndex, TopicId, Layout)
		-- upvalues: FFlagLuaAppEnableNxMRoduxApportioning (copy), config (copy), SpanForItemType (copy), FFlagLuaAppEnableNxMApportioningExtraLogging (copy), ApportioningDiagnosticTelemetry (copy), CalculateGridLayoutModule (copy), FFlagLuaAppFixTotalColsBound (copy), GridLayoutTelemetryModule (copy), DiscoveryEventErrorLogger (copy), GameCollectionItemTypes (copy), RenderBlankTileModule (copy), CryoModule (copy)
		local List1 = {}
		local v1 = nil
		local v2 = nil
		
		if FFlagLuaAppEnableNxMRoduxApportioning then
			local ComponentTypes = {}
			local t = {}
			
			for i, value in List do
				if value and value.componentType then
					if config[value.componentType] then
						ComponentTypes[i] = value.componentType
					end
					local SpanForItemTypeEntry = SpanForItemType[value.componentType]
					
					if SpanForItemTypeEntry then
						t[i] = {
							colSpan = SpanForItemTypeEntry.colSpan,
							rowSpan = SpanForItemTypeEntry.rowSpan,
							alignmentType = value.alignmentType,
							minRowPadding = tonumber(value.minRowPadding) or 0
						}
					end
				end
			end
			v1 = ComponentTypes
			v2 = t
		else
			v1 = p2
			v2 = p1
		end
		local TotalCols = nil
		local Layout1 = nil
		local CountLayout = nil
		
		if FFlagLuaAppEnableNxMRoduxApportioning and Layout then
			Layout1 = Layout
			CountLayout = #Layout
		else
			if FFlagLuaAppEnableNxMApportioningExtraLogging and v2 then
				local SpanOverrideCount = 0
				local SpanOverrideOutOfRangeCount = 0
				local SpanOverrideMaxKey = 0
				
				for i1, _ in v2 do
					SpanOverrideCount += 1
					
					if SpanOverrideMaxKey < i1 then
						SpanOverrideMaxKey = i1
					end
					if #List < i1 then
						SpanOverrideOutOfRangeCount += 1
					end
				end
				if SpanOverrideOutOfRangeCount > 0 then
					ApportioningDiagnosticTelemetry.log("LegacySpanOverridesMismatch", {
						entriesCount = #List,
						itemsPerRow = ItemsPerRow,
						spanOverrideCount = SpanOverrideCount,
						spanOverrideOutOfRangeCount = SpanOverrideOutOfRangeCount,
						spanOverrideMaxKey = SpanOverrideMaxKey,
						pageContext = PageContext,
						sortIndex = SortIndex,
						topicId = TopicId,
						nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
					})
				end
			end
			local GridLayoutModule = CalculateGridLayoutModule(#List, ItemsPerRow, v2)
			Layout1 = GridLayoutModule.layout
			CountLayout = GridLayoutModule.totalRows
			TotalCols = GridLayoutModule.totalCols
		end
		local t = {}
		local Config = if FFlagLuaAppEnableNxMApportioningExtraLogging then {
			realTileCount = 0,
			blankStaleCount = 0,
			blankShadowOrEmptyCount = 0
		} else nil
		for i2 = 1, CountLayout do
			local v3 = 1
			local ItemsPerRow1 = if FFlagLuaAppEnableNxMRoduxApportioning or FFlagLuaAppFixTotalColsBound then ItemsPerRow else TotalCols
			for i3 = v3, ItemsPerRow1 do
				local LayoutEntry = Layout1[i2] and Layout1[i2][i3]
				
				if LayoutEntry and LayoutEntry > 0 then
					local GameCollectionItemTypeOverride = v1 and v1[LayoutEntry] or nil
					local Entry = if FFlagLuaAppEnableNxMRoduxApportioning then List[LayoutEntry] else nil
					
					if GameCollectionItemTypeOverride then
						t[LayoutEntry] = true
						
						if FFlagLuaAppEnableNxMRoduxApportioning then
							GridLayoutTelemetryModule.logTilePlaced(Entry and Entry.adId, Entry and Entry.universeId, GameCollectionItemTypeOverride, PageContext, ItemsPerRow, CountLayout, LayoutEntry, #List1 + 1, SortIndex, TopicId, nil)
						else
							local Entry1 = List[LayoutEntry]
							GridLayoutTelemetryModule.logTilePlaced(Entry1 and Entry1.adId, Entry1 and Entry1.universeId, GameCollectionItemTypeOverride, PageContext, ItemsPerRow, CountLayout, LayoutEntry, #List1 + 1, SortIndex, TopicId, if FFlagLuaAppFixTotalColsBound then TotalCols else nil)
						end
					end
					if FFlagLuaAppEnableNxMRoduxApportioning and not Entry then
						DiscoveryEventErrorLogger.reportError("GameCollectionItemBuilder_StaleLayoutEntry", "layout entryIndex points past end of entries", {
							entryIndex = LayoutEntry,
							entriesCount = #List,
							pageContext = PageContext,
							sortIndex = SortIndex,
							topicId = TopicId
						})
						table.insert(List1, {
							gameCollectionItemTypeOverride = GameCollectionItemTypes.GameCollectionItemType.Blank,
							customRenderFunction = RenderBlankTileModule
						})
						
						if FFlagLuaAppEnableNxMApportioningExtraLogging and Config then
							Config.blankStaleCount += 1
						end
					else
						table.insert(List1, CryoModule.Dictionary.join(if FFlagLuaAppEnableNxMRoduxApportioning then Entry else List[LayoutEntry], {
							spanOverride = v2 and v2[LayoutEntry] or nil,
							gameCollectionItemTypeOverride = GameCollectionItemTypeOverride,
							tileType = GameCollectionItemTypeOverride or GameCollectionItemTypes.GameCollectionItemType.GameTile,
							showDescription = GameCollectionItemTypeOverride == GameCollectionItemTypes.GameCollectionItemType.EmphasisTile and p3 or nil,
							customRenderFunction = GameCollectionItemTypeOverride and config[GameCollectionItemTypeOverride] or nil
						}))
						
						if FFlagLuaAppEnableNxMApportioningExtraLogging and Config then
							Config.realTileCount += 1
						end
					end
				else
					table.insert(List1, {
						gameCollectionItemTypeOverride = GameCollectionItemTypes.GameCollectionItemType.Blank,
						customRenderFunction = RenderBlankTileModule
					})
					
					if FFlagLuaAppEnableNxMApportioningExtraLogging and Config then
						Config.blankShadowOrEmptyCount += 1
					end
				end
			end
		end
		if FFlagLuaAppEnableNxMApportioningExtraLogging and Config then
			ApportioningDiagnosticTelemetry.log("DerivedEntriesComposed", {
				realTileCount = Config.realTileCount,
				blankStaleCount = Config.blankStaleCount,
				blankShadowOrEmptyCount = Config.blankShadowOrEmptyCount,
				entriesCount = #List,
				totalRows = CountLayout,
				totalCols = TotalCols,
				itemsPerRow = ItemsPerRow,
				pageContext = PageContext,
				sortIndex = SortIndex,
				topicId = TopicId,
				nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
			})
		end
		if v1 then
			for i4, value1 in v1 do
				if not t[i4] then
					local Entry = List[i4]
					GridLayoutTelemetryModule.logTileSkipped(Entry and Entry.adId, Entry and Entry.universeId, value1, PageContext, ItemsPerRow, CountLayout, i4, SortIndex, TopicId)
				end
			end
		end
		return List1
	end
}
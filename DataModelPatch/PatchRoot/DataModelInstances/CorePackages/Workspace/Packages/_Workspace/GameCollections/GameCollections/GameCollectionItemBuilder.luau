local GameCollections = script:FindFirstAncestor("GameCollections")
local Parent = GameCollections.Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local CalculateGridLayoutModule = require(GameCollections.calculateGridLayout)
local RenderOneByTwoTileModule = require(GameCollections.renderOneByTwoTile)
local RenderBlankTileModule = require(GameCollections.renderBlankTile)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.React)
local GridLayoutTelemetryModule = require(GameCollections.GridLayoutTelemetry)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppFixTotalColsBound = SharedFlagsModule.FFlagLuaAppFixTotalColsBound
local FFlagLuaAppEnableNxMRoduxApportioning = SharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning
local config = {
	[GameCollectionItemTypes.GameCollectionItemType.EmphasisTile] = require(GameCollections.renderEmphasisTile),
	[GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile] = require(GameCollections.renderTwoByOneTile),
	[GameCollectionItemTypes.GameCollectionItemType.Blank] = RenderBlankTileModule
}

if SharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile then
	config[GameCollectionItemTypes.GameCollectionItemType.OneByTwoTile] = RenderOneByTwoTileModule
end
local SpanForItemType = if FFlagLuaAppEnableNxMRoduxApportioning then GameCollectionItemTypes.SpanForItemType else nil

return {
	BuildCollectionEntries = function(List, p1, p2, p3, p4, PageContext, SortIndex, TopicId, p5)
		-- upvalues: FFlagLuaAppEnableNxMRoduxApportioning (copy), config (copy), SpanForItemType (copy), CalculateGridLayoutModule (copy), FFlagLuaAppFixTotalColsBound (copy), GridLayoutTelemetryModule (copy), DiscoveryEventErrorLogger (copy), GameCollectionItemTypes (copy), RenderBlankTileModule (copy), CryoModule (copy)
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
			v1 = p3
			v2 = p2
		end
		local TotalCols = nil
		local Layout = nil
		local TotalRows = nil
		
		if FFlagLuaAppEnableNxMRoduxApportioning and p5 then
			Layout = p5
			TotalRows = #p5
		else
			local GridLayoutModule = CalculateGridLayoutModule(#List, p1, v2)
			Layout = GridLayoutModule.layout
			TotalRows = GridLayoutModule.totalRows
			TotalCols = GridLayoutModule.totalCols
		end
		local t = {}
		
		for i1 = 1, TotalRows do
			local v3 = 1
			local TotalCols1 = if FFlagLuaAppEnableNxMRoduxApportioning or FFlagLuaAppFixTotalColsBound then p1 else TotalCols
			for i2 = v3, TotalCols1 do
				local LayoutEntry = Layout[i1] and Layout[i1][i2]
				
				if not LayoutEntry or LayoutEntry <= 0 then
					table.insert(List1, {
						gameCollectionItemTypeOverride = GameCollectionItemTypes.GameCollectionItemType.Blank,
						customRenderFunction = RenderBlankTileModule
					})
					continue
				end
				local GameCollectionItemTypeOverride = v1 and v1[LayoutEntry] or nil
				local Entry = if FFlagLuaAppEnableNxMRoduxApportioning then List[LayoutEntry] else nil
				
				if GameCollectionItemTypeOverride then
					t[LayoutEntry] = true
					
					if FFlagLuaAppEnableNxMRoduxApportioning then
						GridLayoutTelemetryModule.logTilePlaced(Entry and Entry.adId, Entry and Entry.universeId, GameCollectionItemTypeOverride, PageContext, p1, TotalRows, LayoutEntry, #List1 + 1, SortIndex, TopicId, nil)
					else
						local Entry1 = List[LayoutEntry]
						GridLayoutTelemetryModule.logTilePlaced(Entry1 and Entry1.adId, Entry1 and Entry1.universeId, GameCollectionItemTypeOverride, PageContext, p1, TotalRows, LayoutEntry, #List1 + 1, SortIndex, TopicId, if FFlagLuaAppFixTotalColsBound then TotalCols else nil)
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
				else
					table.insert(List1, CryoModule.Dictionary.join(if FFlagLuaAppEnableNxMRoduxApportioning then Entry else List[LayoutEntry], {
						spanOverride = v2 and v2[LayoutEntry] or nil,
						gameCollectionItemTypeOverride = GameCollectionItemTypeOverride,
						tileType = GameCollectionItemTypeOverride or GameCollectionItemTypes.GameCollectionItemType.GameTile,
						showDescription = GameCollectionItemTypeOverride == GameCollectionItemTypes.GameCollectionItemType.EmphasisTile and p4 or nil,
						customRenderFunction = GameCollectionItemTypeOverride and config[GameCollectionItemTypeOverride] or nil
					}))
				end
			end
		end
		if v1 then
			for i3, value1 in v1 do
				if not t[i3] then
					local Entry = List[i3]
					GridLayoutTelemetryModule.logTileSkipped(Entry and Entry.adId, Entry and Entry.universeId, value1, PageContext, p1, TotalRows, i3, SortIndex, TopicId)
				end
			end
		end
		return List1
	end
}
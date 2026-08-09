local gameCollections = script:FindFirstAncestor("GameCollections")
local parent = gameCollections.Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local calculateGridLayoutModule = require(gameCollections.calculateGridLayout)
local renderEmphasisTileModule = require(gameCollections.renderEmphasisTile)
local renderTwoByOneTileModule = require(gameCollections.renderTwoByOneTile)
local renderBlankTileModule = require(gameCollections.renderBlankTile)
local cryoModule = require(parent.Cryo)
local _ = require(parent.React)
local gridLayoutTelemetryModule = require(gameCollections.GridLayoutTelemetry)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppFixTotalColsBound = sharedFlagsModule.FFlagLuaAppFixTotalColsBound
local fFlagLuaAppEnableNxMRoduxApportioning = sharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning
local t = {
	[gameCollectionItemTypes.GameCollectionItemType.EmphasisTile] = renderEmphasisTileModule,
	[gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile] = renderTwoByOneTileModule,
	[gameCollectionItemTypes.GameCollectionItemType.Blank] = renderBlankTileModule
}
local var9 = if fFlagLuaAppEnableNxMRoduxApportioning then gameCollectionItemTypes.SpanForItemType else nil

return {
	BuildCollectionEntries = function(p0, p1, p2, p3, p4, p5, p6, p7, p8) --[[ line: 38 ]]
		-- upvalues: fFlagLuaAppEnableNxMRoduxApportioning (ref), t (ref), var9 (ref), calculateGridLayoutModule (ref), fFlagLuaAppFixTotalColsBound (ref), gridLayoutTelemetryModule (ref), discoveryEventErrorLogger (ref), gameCollectionItemTypes (ref), renderBlankTileModule (ref), cryoModule (ref)
		local var13, var14
		local t_1 = {}
		local _ = nil
		local _ = nil
		
		if fFlagLuaAppEnableNxMRoduxApportioning then
			local t_2 = {}
			local t_3 = {}
			
			for i, v in p0 do
				if v and v.componentType then
					if t[v.componentType] then
						t_2[i] = v.componentType
					end
					local componentType = var9[v.componentType]
					
					if componentType then
						t_3[i] = {
							colSpan = componentType.colSpan,
							rowSpan = componentType.rowSpan,
							alignmentType = v.alignmentType,
							minRowPadding = tonumber(v.minRowPadding) or 0
						}
					end
				end
			end
			var13 = t_2
			var14 = t_3
		else
			var13 = p3
			var14 = p2
		end
		local layout, totalRows
		local _ = nil
		local _ = nil
		local totalCols = nil
		
		if fFlagLuaAppEnableNxMRoduxApportioning and p8 then
			layout = p8
			totalRows = #p8
		else
			local var15 = calculateGridLayoutModule(#p0, p1, var14)
			layout = var15.layout
			totalRows = var15.totalRows
			totalCols = var15.totalCols
		end
		local t_2 = {}
		
		for i = 1, totalRows do
			local var17 = 1
			
			for var17 = var17, if fFlagLuaAppEnableNxMRoduxApportioning or fFlagLuaAppFixTotalColsBound then p1 else totalCols do
				local var18 = layout[i] and layout[i][var17]
				
				if not var18 or var18 <= 0 then
					table.insert(t_1, {
						gameCollectionItemTypeOverride = gameCollectionItemTypes.GameCollectionItemType.Blank,
						customRenderFunction = renderBlankTileModule
					})
					continue
				end
				local var19 = if var13 then var13[var18] else nil
				local var20 = if fFlagLuaAppEnableNxMRoduxApportioning then p0[var18] else nil
				
				if var19 then
					t_2[var18] = true
					
					if fFlagLuaAppEnableNxMRoduxApportioning then
						gridLayoutTelemetryModule.logTilePlaced(var20 and var20.adId, var20 and var20.universeId, var19, p5, p1, totalRows, var18, #t_1 + 1, p6, p7, nil)
					else
						local var21 = p0[var18]
						gridLayoutTelemetryModule.logTilePlaced(var21 and var21.adId, var21 and var21.universeId, var19, p5, p1, totalRows, var18, #t_1 + 1, p6, p7, if fFlagLuaAppFixTotalColsBound then totalCols else nil)
					end
				end
				if fFlagLuaAppEnableNxMRoduxApportioning and not var20 then
					discoveryEventErrorLogger.reportError("GameCollectionItemBuilder_StaleLayoutEntry", "layout entryIndex points past end of entries", {
						entryIndex = var18,
						entriesCount = #p0,
						pageContext = p5,
						sortIndex = p6,
						topicId = p7
					})
					table.insert(t_1, {
						gameCollectionItemTypeOverride = gameCollectionItemTypes.GameCollectionItemType.Blank,
						customRenderFunction = renderBlankTileModule
					})
				else
					table.insert(t_1, cryoModule.Dictionary.join(if fFlagLuaAppEnableNxMRoduxApportioning then var20 else p0[var18], {
						spanOverride = if var14 then var14[var18] else nil,
						gameCollectionItemTypeOverride = var19,
						tileType = var19 or gameCollectionItemTypes.GameCollectionItemType.GameTile,
						showDescription = if var19 == gameCollectionItemTypes.GameCollectionItemType.EmphasisTile then p4 else nil,
						customRenderFunction = if var19 then t[var19] else nil
					}))
				end
			end
		end
		if var13 then
			for i_1, v in var13 do
				if not t_2[i_1] then
					local var22 = p0[i_1]
					gridLayoutTelemetryModule.logTileSkipped(var22 and var22.adId, var22 and var22.universeId, v, p5, p1, totalRows, i_1, p6, p7)
				end
			end
		end
		return t_1
	end
}
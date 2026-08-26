local gameCollections = script:FindFirstAncestor("GameCollections")
local parent = gameCollections.Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local calculateGridLayoutModule = require(gameCollections.calculateGridLayout)
local renderEmphasisTileModule = require(gameCollections.renderEmphasisTile)
local sponsoredTilesModule = require(parent.SponsoredTiles)
local renderTwoByOneTile = sponsoredTilesModule.renderTwoByOneTile
local renderOneByTwoTile = sponsoredTilesModule.renderOneByTwoTile
local renderBlankTileModule = require(gameCollections.renderBlankTile)
local cryoModule = require(parent.Cryo)
local _ = require(parent.React)
local gridLayoutTelemetryModule = require(gameCollections.GridLayoutTelemetry)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local apportioningDiagnosticTelemetry = require(parent.DiscoveryUtils).ApportioningDiagnosticTelemetry
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppFixTotalColsBound = sharedFlagsModule.FFlagLuaAppFixTotalColsBound
local fFlagLuaAppEnableNxMRoduxApportioning = sharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning
local fFlagLuaAppEnableHomepageOneByTwoTile = sharedFlagsModule.FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppEnableNxMApportioningExtraLogging = sharedFlagsModule.FFlagLuaAppEnableNxMApportioningExtraLogging
local t = {
	[gameCollectionItemTypes.GameCollectionItemType.EmphasisTile] = renderEmphasisTileModule,
	[gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile] = renderTwoByOneTile,
	[gameCollectionItemTypes.GameCollectionItemType.Blank] = renderBlankTileModule
}

if fFlagLuaAppEnableHomepageOneByTwoTile then
	t[gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile] = renderOneByTwoTile
end
local var1 = if fFlagLuaAppEnableNxMRoduxApportioning then gameCollectionItemTypes.SpanForItemType else nil

return {
	BuildCollectionEntries = function(p1, p2, p3, p4, p5, p6, p7, p8, p9)
		-- upvalues: fFlagLuaAppEnableNxMRoduxApportioning (ref), t (ref), var1 (ref), fFlagLuaAppEnableNxMApportioningExtraLogging (ref), apportioningDiagnosticTelemetry (ref), calculateGridLayoutModule (ref), fFlagLuaAppFixTotalColsBound (ref), gridLayoutTelemetryModule (ref), discoveryEventErrorLogger (ref), gameCollectionItemTypes (ref), renderBlankTileModule (ref), cryoModule (ref)
		local var2, var3
		local t_1 = {}
		local _ = nil
		local _ = nil
		
		if fFlagLuaAppEnableNxMRoduxApportioning then
			local t_2 = {}
			local t_3 = {}
			
			for i, v in p1 do
				if v and v.componentType then
					if t[v.componentType] then
						t_2[i] = v.componentType
					end
					local componentType = var1[v.componentType]
					
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
			var2 = t_2
			var3 = t_3
		else
			var2 = p4
			var3 = p3
		end
		local layout, totalRows
		local _ = nil
		local _ = nil
		local totalCols = nil
		
		if fFlagLuaAppEnableNxMRoduxApportioning and p9 then
			layout = p9
			totalRows = #p9
		elseif fFlagLuaAppEnableNxMApportioningExtraLogging and var3 then
			local var4 = 0
			local var5 = 0
			local var6 = 0
			
			for i, v in var3 do
				var4 += 1
				
				if var6 < i then
					var6 = i
				end
				if #p1 < i then
					var5 += 1
				end
			end
			if var5 > 0 then
				apportioningDiagnosticTelemetry.log("LegacySpanOverridesMismatch", {
					entriesCount = #p1,
					itemsPerRow = p2,
					spanOverrideCount = var4,
					spanOverrideOutOfRangeCount = var5,
					spanOverrideMaxKey = var6,
					pageContext = p6,
					sortIndex = p7,
					topicId = p8,
					nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
				})
			end
		end
		local var7 = calculateGridLayoutModule(#p1, p2, var3)
		layout = var7.layout
		totalRows = var7.totalRows
		totalCols = var7.totalCols
		local t_2 = {}
		local var8 = if fFlagLuaAppEnableNxMApportioningExtraLogging then {
			realTileCount = 0,
			blankStaleCount = 0,
			blankShadowOrEmptyCount = 0
		} else nil
		
		for i = 1, totalRows do
			local var9 = 1
			
			for var9 = var9, if fFlagLuaAppEnableNxMRoduxApportioning or fFlagLuaAppFixTotalColsBound then p2 else totalCols do
				local var10 = layout[i] and layout[i][var9]
				
				if not var10 or var10 <= 0 then
					table.insert(t_1, {
						gameCollectionItemTypeOverride = gameCollectionItemTypes.GameCollectionItemType.Blank,
						customRenderFunction = renderBlankTileModule
					})
					
					if fFlagLuaAppEnableNxMApportioningExtraLogging and var8 then
						var8.blankShadowOrEmptyCount += 1
					end
				end
				local var11 = if var2 then var2[var10] else nil
				local var12 = if fFlagLuaAppEnableNxMRoduxApportioning then p1[var10] else nil
				
				if var11 then
					t_2[var10] = true
					
					if fFlagLuaAppEnableNxMRoduxApportioning then
						gridLayoutTelemetryModule.logTilePlaced(var12 and var12.adId, var12 and var12.universeId, var11, p6, p2, totalRows, var10, #t_1 + 1, p7, p8, nil)
					else
						local var13 = p1[var10]
						gridLayoutTelemetryModule.logTilePlaced(var13 and var13.adId, var13 and var13.universeId, var11, p6, p2, totalRows, var10, #t_1 + 1, p7, p8, if fFlagLuaAppFixTotalColsBound then totalCols else nil)
					end
				end
				if fFlagLuaAppEnableNxMRoduxApportioning and not var12 then
					discoveryEventErrorLogger.reportError("GameCollectionItemBuilder_StaleLayoutEntry", "layout entryIndex points past end of entries", {
						entryIndex = var10,
						entriesCount = #p1,
						pageContext = p6,
						sortIndex = p7,
						topicId = p8
					})
					table.insert(t_1, {
						gameCollectionItemTypeOverride = gameCollectionItemTypes.GameCollectionItemType.Blank,
						customRenderFunction = renderBlankTileModule
					})
					
					if fFlagLuaAppEnableNxMApportioningExtraLogging and var8 then
						var8.blankStaleCount += 1
					end
				else
					table.insert(t_1, cryoModule.Dictionary.join(if fFlagLuaAppEnableNxMRoduxApportioning then var12 else p1[var10], {
						spanOverride = if var3 then var3[var10] else nil,
						gameCollectionItemTypeOverride = var11,
						tileType = var11 or gameCollectionItemTypes.GameCollectionItemType.GameTile,
						showDescription = if var11 == gameCollectionItemTypes.GameCollectionItemType.EmphasisTile then p5 else nil,
						customRenderFunction = if var11 then t[var11] else nil
					}))
					
					if fFlagLuaAppEnableNxMApportioningExtraLogging and var8 then
						var8.realTileCount += 1
					end
				end
			end
		end
		if fFlagLuaAppEnableNxMApportioningExtraLogging and var8 then
			apportioningDiagnosticTelemetry.log("DerivedEntriesComposed", {
				realTileCount = var8.realTileCount,
				blankStaleCount = var8.blankStaleCount,
				blankShadowOrEmptyCount = var8.blankShadowOrEmptyCount,
				entriesCount = #p1,
				totalRows = totalRows,
				totalCols = totalCols,
				itemsPerRow = p2,
				pageContext = p6,
				sortIndex = p7,
				topicId = p8,
				nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
			})
		end
		if var2 then
			for i_1, v in var2 do
				if not t_2[i_1] then
					local var14 = p1[i_1]
					gridLayoutTelemetryModule.logTileSkipped(var14 and var14.adId, var14 and var14.universeId, v, p6, p2, totalRows, i_1, p7, p8)
				end
			end
		end
		return t_1
	end
}
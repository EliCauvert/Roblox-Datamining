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
local var9 = if fFlagLuaAppEnableNxMRoduxApportioning then gameCollectionItemTypes.SpanForItemType else nil

return {
	BuildCollectionEntries = function(p0, p1, p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: fFlagLuaAppEnableNxMRoduxApportioning (ref), t (ref), var9 (ref), fFlagLuaAppEnableNxMApportioningExtraLogging (ref), apportioningDiagnosticTelemetry (ref), calculateGridLayoutModule (ref), fFlagLuaAppFixTotalColsBound (ref), gridLayoutTelemetryModule (ref), discoveryEventErrorLogger (ref), gameCollectionItemTypes (ref), renderBlankTileModule (ref), cryoModule (ref)
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
		elseif fFlagLuaAppEnableNxMApportioningExtraLogging and var14 then
			local var15 = 0
			local var16 = 0
			local var17 = 0
			
			for i, v in var14 do
				var15 += 1
				
				if var17 < i then
					var17 = i
				end
				if #p0 < i then
					var16 += 1
				end
			end
			if var16 > 0 then
				apportioningDiagnosticTelemetry.log("LegacySpanOverridesMismatch", {
					entriesCount = #p0,
					itemsPerRow = p1,
					spanOverrideCount = var15,
					spanOverrideOutOfRangeCount = var16,
					spanOverrideMaxKey = var17,
					pageContext = p5,
					sortIndex = p6,
					topicId = p7,
					nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
				})
			end
		end
		local var18 = calculateGridLayoutModule(#p0, p1, var14)
		layout = var18.layout
		totalRows = var18.totalRows
		totalCols = var18.totalCols
		local t_2 = {}
		local var20 = if fFlagLuaAppEnableNxMApportioningExtraLogging then {
			realTileCount = 0,
			blankStaleCount = 0,
			blankShadowOrEmptyCount = 0
		} else nil
		
		for i = 1, totalRows do
			local var21 = 1
			
			for var21 = var21, if fFlagLuaAppEnableNxMRoduxApportioning or fFlagLuaAppFixTotalColsBound then p1 else totalCols do
				local var22 = layout[i] and layout[i][var21]
				
				if not var22 or var22 <= 0 then
					table.insert(t_1, {
						gameCollectionItemTypeOverride = gameCollectionItemTypes.GameCollectionItemType.Blank,
						customRenderFunction = renderBlankTileModule
					})
					
					if fFlagLuaAppEnableNxMApportioningExtraLogging and var20 then
						var20.blankShadowOrEmptyCount += 1
					end
				end
				local var23 = if var13 then var13[var22] else nil
				local var24 = if fFlagLuaAppEnableNxMRoduxApportioning then p0[var22] else nil
				
				if var23 then
					t_2[var22] = true
					
					if fFlagLuaAppEnableNxMRoduxApportioning then
						gridLayoutTelemetryModule.logTilePlaced(var24 and var24.adId, var24 and var24.universeId, var23, p5, p1, totalRows, var22, #t_1 + 1, p6, p7, nil)
					else
						local var25 = p0[var22]
						gridLayoutTelemetryModule.logTilePlaced(var25 and var25.adId, var25 and var25.universeId, var23, p5, p1, totalRows, var22, #t_1 + 1, p6, p7, if fFlagLuaAppFixTotalColsBound then totalCols else nil)
					end
				end
				if fFlagLuaAppEnableNxMRoduxApportioning and not var24 then
					discoveryEventErrorLogger.reportError("GameCollectionItemBuilder_StaleLayoutEntry", "layout entryIndex points past end of entries", {
						entryIndex = var22,
						entriesCount = #p0,
						pageContext = p5,
						sortIndex = p6,
						topicId = p7
					})
					table.insert(t_1, {
						gameCollectionItemTypeOverride = gameCollectionItemTypes.GameCollectionItemType.Blank,
						customRenderFunction = renderBlankTileModule
					})
					
					if fFlagLuaAppEnableNxMApportioningExtraLogging and var20 then
						var20.blankStaleCount += 1
					end
				else
					table.insert(t_1, cryoModule.Dictionary.join(if fFlagLuaAppEnableNxMRoduxApportioning then var24 else p0[var22], {
						spanOverride = if var14 then var14[var22] else nil,
						gameCollectionItemTypeOverride = var23,
						tileType = var23 or gameCollectionItemTypes.GameCollectionItemType.GameTile,
						showDescription = if var23 == gameCollectionItemTypes.GameCollectionItemType.EmphasisTile then p4 else nil,
						customRenderFunction = if var23 then t[var23] else nil
					}))
					
					if fFlagLuaAppEnableNxMApportioningExtraLogging and var20 then
						var20.realTileCount += 1
					end
				end
			end
		end
		if fFlagLuaAppEnableNxMApportioningExtraLogging and var20 then
			apportioningDiagnosticTelemetry.log("DerivedEntriesComposed", {
				realTileCount = var20.realTileCount,
				blankStaleCount = var20.blankStaleCount,
				blankShadowOrEmptyCount = var20.blankShadowOrEmptyCount,
				entriesCount = #p0,
				totalRows = totalRows,
				totalCols = totalCols,
				itemsPerRow = p1,
				pageContext = p5,
				sortIndex = p6,
				topicId = p7,
				nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
			})
		end
		if var13 then
			for i_1, v in var13 do
				if not t_2[i_1] then
					local var26 = p0[i_1]
					gridLayoutTelemetryModule.logTileSkipped(var26 and var26.adId, var26 and var26.universeId, v, p5, p1, totalRows, i_1, p6, p7)
				end
			end
		end
		return t_1
	end
}
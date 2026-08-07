local gameCollections = script:FindFirstAncestor("GameCollections")
local parent = gameCollections.Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local calculateGridLayoutModule = require(gameCollections.calculateGridLayout)
local renderEmphasisTileModule = require(gameCollections.renderEmphasisTile)
local renderTwoByOneTileModule = require(gameCollections.renderTwoByOneTile)
local renderOneByTwoTileModule = require(gameCollections.renderOneByTwoTile)
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
	[gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile] = renderTwoByOneTileModule,
	[gameCollectionItemTypes.GameCollectionItemType.Blank] = renderBlankTileModule
}

if fFlagLuaAppEnableHomepageOneByTwoTile then
	t[gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile] = renderOneByTwoTileModule
end
local var10 = if fFlagLuaAppEnableNxMRoduxApportioning then gameCollectionItemTypes.SpanForItemType else nil

return {
	BuildCollectionEntries = function(p0, p1, p2, p3, p4, p5, p6, p7, p8) --[[ line: 48 ]]
		-- upvalues: fFlagLuaAppEnableNxMRoduxApportioning (ref), t (ref), var10 (ref), fFlagLuaAppEnableNxMApportioningExtraLogging (ref), apportioningDiagnosticTelemetry (ref), calculateGridLayoutModule (ref), fFlagLuaAppFixTotalColsBound (ref), gridLayoutTelemetryModule (ref), discoveryEventErrorLogger (ref), gameCollectionItemTypes (ref), renderBlankTileModule (ref), cryoModule (ref)
		local var14, var15
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
					local componentType = var10[v.componentType]
					
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
			var14 = t_2
			var15 = t_3
		else
			var14 = p3
			var15 = p2
		end
		local layout, totalRows
		local _ = nil
		local _ = nil
		local totalCols = nil
		
		if fFlagLuaAppEnableNxMRoduxApportioning and p8 then
			layout = p8
			totalRows = #p8
		elseif fFlagLuaAppEnableNxMApportioningExtraLogging and var15 then
			local var16 = 0
			local var17 = 0
			local var18 = 0
			
			for i, v in var15 do
				var16 += 1
				
				if var18 < i then
					var18 = i
				end
				if #p0 < i then
					var17 += 1
				end
			end
			if var17 > 0 then
				apportioningDiagnosticTelemetry.log("LegacySpanOverridesMismatch", {
					entriesCount = #p0,
					itemsPerRow = p1,
					spanOverrideCount = var16,
					spanOverrideOutOfRangeCount = var17,
					spanOverrideMaxKey = var18,
					pageContext = p5,
					sortIndex = p6,
					topicId = p7,
					nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
				})
			end
		end
		local var19 = calculateGridLayoutModule(#p0, p1, var15)
		layout = var19.layout
		totalRows = var19.totalRows
		totalCols = var19.totalCols
		local t_2 = {}
		local var21 = if fFlagLuaAppEnableNxMApportioningExtraLogging then {
			realTileCount = 0,
			blankStaleCount = 0,
			blankShadowOrEmptyCount = 0
		} else nil
		
		for i = 1, totalRows do
			local var22 = 1
			
			for var22 = var22, if fFlagLuaAppEnableNxMRoduxApportioning or fFlagLuaAppFixTotalColsBound then p1 else totalCols do
				local var23 = layout[i] and layout[i][var22]
				
				if not var23 or var23 <= 0 then
					table.insert(t_1, {
						gameCollectionItemTypeOverride = gameCollectionItemTypes.GameCollectionItemType.Blank,
						customRenderFunction = renderBlankTileModule
					})
					
					if fFlagLuaAppEnableNxMApportioningExtraLogging and var21 then
						var21.blankShadowOrEmptyCount += 1
					end
				end
				local var24 = if var14 then var14[var23] else nil
				local var25 = if fFlagLuaAppEnableNxMRoduxApportioning then p0[var23] else nil
				
				if var24 then
					t_2[var23] = true
					
					if fFlagLuaAppEnableNxMRoduxApportioning then
						gridLayoutTelemetryModule.logTilePlaced(var25 and var25.adId, var25 and var25.universeId, var24, p5, p1, totalRows, var23, #t_1 + 1, p6, p7, nil)
					else
						local var26 = p0[var23]
						gridLayoutTelemetryModule.logTilePlaced(var26 and var26.adId, var26 and var26.universeId, var24, p5, p1, totalRows, var23, #t_1 + 1, p6, p7, if fFlagLuaAppFixTotalColsBound then totalCols else nil)
					end
				end
				if fFlagLuaAppEnableNxMRoduxApportioning and not var25 then
					discoveryEventErrorLogger.reportError("GameCollectionItemBuilder_StaleLayoutEntry", "layout entryIndex points past end of entries", {
						entryIndex = var23,
						entriesCount = #p0,
						pageContext = p5,
						sortIndex = p6,
						topicId = p7
					})
					table.insert(t_1, {
						gameCollectionItemTypeOverride = gameCollectionItemTypes.GameCollectionItemType.Blank,
						customRenderFunction = renderBlankTileModule
					})
					
					if fFlagLuaAppEnableNxMApportioningExtraLogging and var21 then
						var21.blankStaleCount += 1
					end
				else
					table.insert(t_1, cryoModule.Dictionary.join(if fFlagLuaAppEnableNxMRoduxApportioning then var25 else p0[var23], {
						spanOverride = if var15 then var15[var23] else nil,
						gameCollectionItemTypeOverride = var24,
						tileType = var24 or gameCollectionItemTypes.GameCollectionItemType.GameTile,
						showDescription = if var24 == gameCollectionItemTypes.GameCollectionItemType.EmphasisTile then p4 else nil,
						customRenderFunction = if var24 then t[var24] else nil
					}))
					
					if fFlagLuaAppEnableNxMApportioningExtraLogging and var21 then
						var21.realTileCount += 1
					end
				end
			end
		end
		if fFlagLuaAppEnableNxMApportioningExtraLogging and var21 then
			apportioningDiagnosticTelemetry.log("DerivedEntriesComposed", {
				realTileCount = var21.realTileCount,
				blankStaleCount = var21.blankStaleCount,
				blankShadowOrEmptyCount = var21.blankShadowOrEmptyCount,
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
		if var14 then
			for i_1, v in var14 do
				if not t_2[i_1] then
					local var27 = p0[i_1]
					gridLayoutTelemetryModule.logTileSkipped(var27 and var27.adId, var27 and var27.universeId, v, p5, p1, totalRows, i_1, p6, p7)
				end
			end
		end
		return t_1
	end
}
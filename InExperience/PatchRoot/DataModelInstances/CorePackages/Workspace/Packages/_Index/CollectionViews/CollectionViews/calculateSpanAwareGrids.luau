local parent = script:FindFirstAncestor("CollectionViews").Parent
local discoveryTypesModule = require(parent.DiscoveryTypes)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local apportioningDiagnosticTelemetry = discoveryUtilsModule.ApportioningDiagnosticTelemetry
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local gameCollectionItemTypes = discoveryTypesModule.GameCollectionItemTypes
local gameCollectionItemType = gameCollectionItemTypes.GameCollectionItemType
local spanForItemType = gameCollectionItemTypes.SpanForItemType
local fFlagLuaAppEnableNxMRoduxApportioning = sharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning
local fFlagLuaAppApportioningInCollectionViews = sharedFlagsModule.FFlagLuaAppApportioningInCollectionViews
local fFlagSduiPoolBackedFeed = sharedFlagsModule.FFlagSduiPoolBackedFeed
local fFlagLuaAppEnableNxMApportioningExtraLogging = sharedFlagsModule.FFlagLuaAppEnableNxMApportioningExtraLogging
local luaAppFixApportioningTileTailConflict = game:DefineFastFlag("LuaAppFixApportioningTileTailConflict", false)
local t = {
	[gameCollectionItemType.TwoByOneTile] = { colSpan = 2, rowSpan = 1 }
}

local function defaultGetSpanConfig(p1)
	-- upvalues: fFlagLuaAppEnableNxMRoduxApportioning (ref), spanForItemType (ref), t (ref)
	local var1 = p1 and (if fFlagLuaAppEnableNxMRoduxApportioning then spanForItemType[p1.componentType] else t[p1.componentType])
	
	return if var1 then {
		colSpan = var1.colSpan,
		rowSpan = if fFlagLuaAppEnableNxMRoduxApportioning then var1.rowSpan else 1,
		minRowPadding = tonumber(p1.minRowPadding) or 0,
		alignmentType = p1.alignmentType
	} else nil
end

local function processOneGrid(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: discoveryEventErrorLogger (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref), fFlagSduiPoolBackedFeed (ref), fFlagLuaAppEnableNxMApportioningExtraLogging (ref), apportioningDiagnosticTelemetry (ref), luaAppFixApportioningTileTailConflict (ref), fFlagLuaAppApportioningInCollectionViews (ref), defaultGetSpanConfig (ref)
	local var1 = p5 * p4
	local t = {}
	local t_1 = {}
	local var2 = 0
	local var3 = 1
	local t_2 = {}
	
	local function nextFreePosition(p8)
		-- upvalues: p4 (ref), t_2 (ref)
		repeat
			local var4 = math.floor(p8 / p4) + 1
			local var5 = not t_2[var4] or t_2[var4][p8 % p4 + 1] ~= -1
			if not var5 then
				p8 += 1
			end
		until var5
		return p8
	end
	
	local function writeLayoutCell(p8, p9, p10)
		-- upvalues: p5 (ref), discoveryEventErrorLogger (copy), p4 (ref), t_2 (ref)
		if p5 < p8 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_LayoutWritePastMaxRows", "writeLayoutCell attempted to write past maxRows", { row = p8, col = p9, maxRows = p5, itemsPerRow = p4 })
			
			return
		elseif not t_2[p8] then
			t_2[p8] = {}
		end
		t_2[p8][p9] = p10
	end
	
	local function tryPlaceSpanTile(p8, p9)
		-- upvalues: fFlagLuaAppEnableNxMRoduxApportioning (copy), fFlagSduiPoolBackedFeed (copy), p7 (ref), nextFreePosition (ref), var2 (write), p4 (ref), var3 (write), fFlagLuaAppEnableNxMApportioningExtraLogging (copy), apportioningDiagnosticTelemetry (copy), p5 (ref), var1 (ref), p1 (ref), luaAppFixApportioningTileTailConflict (copy), t_2 (ref), writeLayoutCell (ref), t (ref)
		local colSpan = p9.colSpan
		local var4 = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then p9.rowSpan else nil
		local minRowPadding = p9.minRowPadding
		local alignmentType = p9.alignmentType
		local var5 = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then nextFreePosition(var2) else var2
		local var6 = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then math.floor(var5 / p4) + 1 else math.ceil((var2 + 1) / p4)
		local var7 = var5 % p4 + 1
		
		if var6 < var3 then
			if fFlagLuaAppEnableNxMApportioningExtraLogging then
				apportioningDiagnosticTelemetry.log("SpanDeferred", {
					reason = "padding_constraint",
					originalIndex = p8,
					colSpan = colSpan,
					rowSpan = var4,
					alignmentType = alignmentType,
					minRowPadding = minRowPadding,
					currentRow = var6,
					currentColumn = var7,
					nextAllowedRow = var3,
					nextScanPosition = var2,
					itemsPerRow = p4,
					maxRows = p5,
					nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
				})
			end
			return false
		elseif fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 or var1 >= var2 + colSpan then
			if alignmentType == "LeftPin" and var7 ~= 1 then
				if fFlagLuaAppEnableNxMApportioningExtraLogging then
					apportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "left_pin_misaligned",
						originalIndex = p8,
						colSpan = colSpan,
						rowSpan = var4,
						alignmentType = alignmentType,
						currentRow = var6,
						currentColumn = var7,
						nextScanPosition = var2,
						itemsPerRow = p4,
						maxRows = p5,
						nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif alignmentType == "RightPin" and var7 + colSpan - 1 ~= p4 then
				if fFlagLuaAppEnableNxMApportioningExtraLogging then
					apportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "right_pin_misaligned",
						originalIndex = p8,
						colSpan = colSpan,
						rowSpan = var4,
						alignmentType = alignmentType,
						currentRow = var6,
						currentColumn = var7,
						nextScanPosition = var2,
						itemsPerRow = p4,
						maxRows = p5,
						nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif p4 < var7 + colSpan - 1 then
				if fFlagLuaAppEnableNxMApportioningExtraLogging then
					apportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "horizontal_wrap",
						originalIndex = p8,
						colSpan = colSpan,
						rowSpan = var4,
						alignmentType = alignmentType,
						currentRow = var6,
						currentColumn = var7,
						nextScanPosition = var2,
						itemsPerRow = p4,
						maxRows = p5,
						nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif (fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7) and p5 < var6 + var4 - 1 then
				if fFlagLuaAppEnableNxMApportioningExtraLogging then
					apportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "vertical_overflow",
						originalIndex = p8,
						colSpan = colSpan,
						rowSpan = var4,
						alignmentType = alignmentType,
						currentRow = var6,
						currentColumn = var7,
						nextScanPosition = var2,
						itemsPerRow = p4,
						maxRows = p5,
						nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif (fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7) and (var4 > 1 and #p1 - p8 < var7 - 1) then
				if fFlagLuaAppEnableNxMApportioningExtraLogging then
					apportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "insufficient_trailing_entries",
						originalIndex = p8,
						colSpan = colSpan,
						rowSpan = var4,
						alignmentType = alignmentType,
						currentRow = var6,
						currentColumn = var7,
						allEntriesCount = #p1,
						nextScanPosition = var2,
						itemsPerRow = p4,
						maxRows = p5,
						nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif luaAppFixApportioningTileTailConflict and (fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7) then
				for i_1 = 0, var4 - 1 do
					for i = 0, colSpan - 1 do
						local var8 = var6 + i_1
						local var9 = var7 + i
						
						if not t_2[var8] or t_2[var8][var9] == nil then
							continue
						end
						if fFlagLuaAppEnableNxMApportioningExtraLogging then
							apportioningDiagnosticTelemetry.log("SpanDeferred", {
								reason = "span_cell_collision",
								originalIndex = p8,
								colSpan = colSpan,
								rowSpan = var4,
								alignmentType = alignmentType,
								currentRow = var6,
								currentColumn = var7,
								collidingRow = var8,
								collidingCol = var9,
								collidingValue = t_2[var8][var9],
								itemsPerRow = p4,
								maxRows = p5,
								nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
							})
						end
						return false
					end
				end
			end
			if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then
				for i_3 = 0, var4 - 1 do
					for i_2 = 0, colSpan - 1 do
						writeLayoutCell(var6 + i_3, var7 + i_2, -1)
					end
				end
				writeLayoutCell(var6, var7, p8)
				var2 = var5 + colSpan
				var3 = var6 + var4 - 1 + minRowPadding
			else
				table.insert(t, p8)
				var2 += colSpan
				var3 = var6 + minRowPadding
			end
			return true
		elseif fFlagLuaAppEnableNxMApportioningExtraLogging then
			apportioningDiagnosticTelemetry.log("SpanDeferred", {
				reason = "totalcells_exceeded_legacy",
				originalIndex = p8,
				colSpan = colSpan,
				rowSpan = var4,
				alignmentType = alignmentType,
				minRowPadding = minRowPadding,
				nextScanPosition = var2,
				totalCells = var1,
				itemsPerRow = p4,
				maxRows = p5,
				nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
			})
		end
		return false
	end
	
	local function tryPlaceDeferredSpanTiles()
		-- upvalues: t_1 (ref), tryPlaceSpanTile (ref)
		while #t_1 > 0 do
			local var10 = t_1[1]
			
			if not tryPlaceSpanTile(var10.index, var10.spanConfig) then break end
			table.remove(t_1, 1)
		end
	end
	
	for i, v in p3 do
		if #t_1 > 0 then
			table.insert(t_1, v)
		elseif not tryPlaceSpanTile(v.index, v.spanConfig) then
			table.insert(t_1, v)
		end
	end
	local var11 = p2
	
	for i_1 = p2, #p1 do
		local var12 = p1[i_1]
		
		if not var12 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_InvalidEntry", "calculateSpanAwareGrids called with an invalid entry", {
				allEntriesCount = #p1,
				indexInAllEntries = i_1,
				itemsPerRow = p4
			})
			var11 = i_1 + 1
			continue
		end
		if var1 > var2 then
			local var13 = if fFlagLuaAppApportioningInCollectionViews and p6 ~= nil then p6(var12, i_1) else defaultGetSpanConfig(var12)
			
			if var13 then
				if #t_1 > 0 then
					table.insert(t_1, { index = i_1, spanConfig = var13 })
				elseif not tryPlaceSpanTile(i_1, var13) then
					table.insert(t_1, { index = i_1, spanConfig = var13 })
				end
				var11 = i_1 + 1
			elseif fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then
				local var14 = nextFreePosition(var2)
				
				if var1 <= var14 then break end
				writeLayoutCell(math.floor(var14 / p4) + 1, var14 % p4 + 1, i_1)
				var2 = var14 + 1
			else
				table.insert(t, i_1)
				var2 += 1
			end
			tryPlaceDeferredSpanTiles()
			var11 = i_1 + 1
		elseif not fFlagLuaAppEnableNxMApportioningExtraLogging then
			break
		end
		apportioningDiagnosticTelemetry.log("GridFull", {
			nextScanPosition = var2,
			totalCells = var1,
			itemsPerRow = p4,
			maxRows = p5,
			remainingEntries = #p1 - i_1 + 1,
			deferredCount = #t_1,
			stoppedAtIndex = i_1,
			allEntriesCount = #p1,
			nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
		})
		break
	end
	return {
		placedIndices = t,
		pendingSpanTiles = t_1,
		nextStartIndex = var11,
		layout = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then t_2 else nil
	}
end

return {
	calculateSpanAwareGrids = function(p10, p11, p12, p13, p14)
		-- upvalues: discoveryEventErrorLogger (ref), processOneGrid (ref), fFlagLuaAppApportioningInCollectionViews (ref), fFlagSduiPoolBackedFeed (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref)
		if not p10 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_MissingEntries", "calculateSpanAwareGrids called without entries", { gridConfigsCount = #p11, itemsPerRow = p12 })
			
			return {}
		elseif #p10 == 0 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_EmptyEntries", "calculateSpanAwareGrids called with empty entries", {
				allEntriesCount = #p10,
				gridConfigsCount = #p11,
				itemsPerRow = p12
			})
			
			return {}
		elseif #p11 == 0 then
			return {}
		elseif not p12 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_MissingItemsPerRow", "calculateSpanAwareGrids called without itemsPerRow", { allEntriesCount = #p10, gridConfigsCount = #p11 })
			
			return {}
		elseif p12 <= 0 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_InvalidItemsPerRow", "calculateSpanAwareGrids called with invalid itemsPerRow", {
				allEntriesCount = #p10,
				gridConfigsCount = #p11,
				itemsPerRow = p12
			})
			
			return {}
		end
		local t = {}
		local var15 = 1
		local t_1 = {}
		
		for i, v in p11 do
			local maxRows = v.maxRows
			
			if not maxRows or maxRows <= 0 then
				maxRows = 1e999
			end
			local var16 = processOneGrid(p10, var15, t_1, p12, maxRows, if fFlagLuaAppApportioningInCollectionViews then p13 else nil, if fFlagSduiPoolBackedFeed then p14 else nil)
			t[v.sortKey] = {
				entryIndices = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p14 then nil else var16.placedIndices,
				layout = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p14 then var16.layout else nil
			}
			var15 = var16.nextStartIndex
			t_1 = var16.pendingSpanTiles
		end
		return t
	end,
	processOneGrid = processOneGrid
}
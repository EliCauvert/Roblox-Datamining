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

local function defaultGetSpanConfig(p0)
	-- upvalues: fFlagLuaAppEnableNxMRoduxApportioning (ref), spanForItemType (ref), t (ref)
	local var7 = p0 and (if fFlagLuaAppEnableNxMRoduxApportioning then spanForItemType[p0.componentType] else t[p0.componentType])
	
	return if var7 then {
		colSpan = var7.colSpan,
		rowSpan = if fFlagLuaAppEnableNxMRoduxApportioning then var7.rowSpan else 1,
		minRowPadding = tonumber(p0.minRowPadding) or 0,
		alignmentType = p0.alignmentType
	} else nil
end

local function processOneGrid(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: discoveryEventErrorLogger (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref), fFlagSduiPoolBackedFeed (ref), fFlagLuaAppEnableNxMApportioningExtraLogging (ref), apportioningDiagnosticTelemetry (ref), luaAppFixApportioningTileTailConflict (ref), fFlagLuaAppApportioningInCollectionViews (ref), defaultGetSpanConfig (ref)
	local var8 = p5 * p4
	local t = {}
	local t_1 = {}
	local var11 = 0
	local var12 = 1
	local t_2 = {}
	
	local function nextFreePosition(p8)
		-- upvalues: p4 (ref), t_2 (ref)
		repeat
			local var22 = math.floor(p8 / p4) + 1
			local var23 = not t_2[var22] or t_2[var22][p8 % p4 + 1] ~= -1
			if not var23 then
				p8 += 1
			end
		until var23
		return p8
	end
	
	local function writeLayoutCell(p9, p10, p11)
		-- upvalues: p5 (ref), discoveryEventErrorLogger (copy), p4 (ref), t_2 (ref)
		if p5 < p9 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_LayoutWritePastMaxRows", "writeLayoutCell attempted to write past maxRows", { row = p9, col = p10, maxRows = p5, itemsPerRow = p4 })
			
			return
		elseif not t_2[p9] then
			t_2[p9] = {}
		end
		t_2[p9][p10] = p11
	end
	
	local function tryPlaceSpanTile(p12, p13)
		-- upvalues: fFlagLuaAppEnableNxMRoduxApportioning (copy), fFlagSduiPoolBackedFeed (copy), p7 (ref), nextFreePosition (ref), var11 (write), p4 (ref), var12 (write), fFlagLuaAppEnableNxMApportioningExtraLogging (copy), apportioningDiagnosticTelemetry (copy), p5 (ref), var8 (ref), p1 (ref), luaAppFixApportioningTileTailConflict (copy), t_2 (ref), writeLayoutCell (ref), t (ref)
		local colSpan = p13.colSpan
		local var24 = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then p13.rowSpan else nil
		local minRowPadding = p13.minRowPadding
		local alignmentType = p13.alignmentType
		local var25 = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then nextFreePosition(var11) else var11
		local var26 = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then math.floor(var25 / p4) + 1 else math.ceil((var11 + 1) / p4)
		local var27 = var25 % p4 + 1
		
		if var26 < var12 then
			if fFlagLuaAppEnableNxMApportioningExtraLogging then
				apportioningDiagnosticTelemetry.log("SpanDeferred", {
					reason = "padding_constraint",
					originalIndex = p12,
					colSpan = colSpan,
					rowSpan = var24,
					alignmentType = alignmentType,
					minRowPadding = minRowPadding,
					currentRow = var26,
					currentColumn = var27,
					nextAllowedRow = var12,
					nextScanPosition = var11,
					itemsPerRow = p4,
					maxRows = p5,
					nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
				})
			end
			return false
		elseif fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 or var8 >= var11 + colSpan then
			if alignmentType == "LeftPin" and var27 ~= 1 then
				if fFlagLuaAppEnableNxMApportioningExtraLogging then
					apportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "left_pin_misaligned",
						originalIndex = p12,
						colSpan = colSpan,
						rowSpan = var24,
						alignmentType = alignmentType,
						currentRow = var26,
						currentColumn = var27,
						nextScanPosition = var11,
						itemsPerRow = p4,
						maxRows = p5,
						nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif alignmentType == "RightPin" and var27 + colSpan - 1 ~= p4 then
				if fFlagLuaAppEnableNxMApportioningExtraLogging then
					apportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "right_pin_misaligned",
						originalIndex = p12,
						colSpan = colSpan,
						rowSpan = var24,
						alignmentType = alignmentType,
						currentRow = var26,
						currentColumn = var27,
						nextScanPosition = var11,
						itemsPerRow = p4,
						maxRows = p5,
						nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif p4 < var27 + colSpan - 1 then
				if fFlagLuaAppEnableNxMApportioningExtraLogging then
					apportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "horizontal_wrap",
						originalIndex = p12,
						colSpan = colSpan,
						rowSpan = var24,
						alignmentType = alignmentType,
						currentRow = var26,
						currentColumn = var27,
						nextScanPosition = var11,
						itemsPerRow = p4,
						maxRows = p5,
						nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif (fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7) and p5 < var26 + var24 - 1 then
				if fFlagLuaAppEnableNxMApportioningExtraLogging then
					apportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "vertical_overflow",
						originalIndex = p12,
						colSpan = colSpan,
						rowSpan = var24,
						alignmentType = alignmentType,
						currentRow = var26,
						currentColumn = var27,
						nextScanPosition = var11,
						itemsPerRow = p4,
						maxRows = p5,
						nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif (fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7) and (var24 > 1 and #p1 - p12 < var27 - 1) then
				if fFlagLuaAppEnableNxMApportioningExtraLogging then
					apportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "insufficient_trailing_entries",
						originalIndex = p12,
						colSpan = colSpan,
						rowSpan = var24,
						alignmentType = alignmentType,
						currentRow = var26,
						currentColumn = var27,
						allEntriesCount = #p1,
						nextScanPosition = var11,
						itemsPerRow = p4,
						maxRows = p5,
						nxmApportioningFlagValue = fFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif luaAppFixApportioningTileTailConflict and (fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7) then
				for i_1 = 0, var24 - 1 do
					for i = 0, colSpan - 1 do
						local var28 = var26 + i_1
						local var29 = var27 + i
						
						if not t_2[var28] or t_2[var28][var29] == nil then
							continue
						end
						if fFlagLuaAppEnableNxMApportioningExtraLogging then
							apportioningDiagnosticTelemetry.log("SpanDeferred", {
								reason = "span_cell_collision",
								originalIndex = p12,
								colSpan = colSpan,
								rowSpan = var24,
								alignmentType = alignmentType,
								currentRow = var26,
								currentColumn = var27,
								collidingRow = var28,
								collidingCol = var29,
								collidingValue = t_2[var28][var29],
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
				for i_3 = 0, var24 - 1 do
					for i_2 = 0, colSpan - 1 do
						writeLayoutCell(var26 + i_3, var27 + i_2, -1)
					end
				end
				writeLayoutCell(var26, var27, p12)
				var11 = var25 + colSpan
				var12 = var26 + var24 - 1 + minRowPadding
			else
				table.insert(t, p12)
				var11 += colSpan
				var12 = var26 + minRowPadding
			end
			return true
		elseif fFlagLuaAppEnableNxMApportioningExtraLogging then
			apportioningDiagnosticTelemetry.log("SpanDeferred", {
				reason = "totalcells_exceeded_legacy",
				originalIndex = p12,
				colSpan = colSpan,
				rowSpan = var24,
				alignmentType = alignmentType,
				minRowPadding = minRowPadding,
				nextScanPosition = var11,
				totalCells = var8,
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
			local var30 = t_1[1]
			
			if not tryPlaceSpanTile(var30.index, var30.spanConfig) then break end
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
	local var18 = p2
	
	for i_1 = p2, #p1 do
		local var19 = p1[i_1]
		
		if not var19 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_InvalidEntry", "calculateSpanAwareGrids called with an invalid entry", {
				allEntriesCount = #p1,
				indexInAllEntries = i_1,
				itemsPerRow = p4
			})
			var18 = i_1 + 1
			continue
		end
		if var8 > var11 then
			local var20 = if fFlagLuaAppApportioningInCollectionViews and p6 ~= nil then p6(var19, i_1) else defaultGetSpanConfig(var19)
			
			if var20 then
				if #t_1 > 0 then
					table.insert(t_1, { index = i_1, spanConfig = var20 })
				elseif not tryPlaceSpanTile(i_1, var20) then
					table.insert(t_1, { index = i_1, spanConfig = var20 })
				end
				var18 = i_1 + 1
			elseif fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then
				local var21 = nextFreePosition(var11)
				
				if var8 <= var21 then break end
				writeLayoutCell(math.floor(var21 / p4) + 1, var21 % p4 + 1, i_1)
				var11 = var21 + 1
			else
				table.insert(t, i_1)
				var11 += 1
			end
			tryPlaceDeferredSpanTiles()
			var18 = i_1 + 1
		elseif not fFlagLuaAppEnableNxMApportioningExtraLogging then
			break
		end
		apportioningDiagnosticTelemetry.log("GridFull", {
			nextScanPosition = var11,
			totalCells = var8,
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
		nextStartIndex = var18,
		layout = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then t_2 else nil
	}
end

return {
	calculateSpanAwareGrids = function(p14, p15, p16, p17, p18)
		-- upvalues: discoveryEventErrorLogger (ref), processOneGrid (ref), fFlagLuaAppApportioningInCollectionViews (ref), fFlagSduiPoolBackedFeed (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref)
		if not p14 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_MissingEntries", "calculateSpanAwareGrids called without entries", { gridConfigsCount = #p15, itemsPerRow = p16 })
			
			return {}
		elseif #p14 == 0 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_EmptyEntries", "calculateSpanAwareGrids called with empty entries", {
				allEntriesCount = #p14,
				gridConfigsCount = #p15,
				itemsPerRow = p16
			})
			
			return {}
		elseif #p15 == 0 then
			return {}
		elseif not p16 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_MissingItemsPerRow", "calculateSpanAwareGrids called without itemsPerRow", { allEntriesCount = #p14, gridConfigsCount = #p15 })
			
			return {}
		elseif p16 <= 0 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_InvalidItemsPerRow", "calculateSpanAwareGrids called with invalid itemsPerRow", {
				allEntriesCount = #p14,
				gridConfigsCount = #p15,
				itemsPerRow = p16
			})
			
			return {}
		end
		local t = {}
		local var32 = 1
		local t_1 = {}
		
		for i, v in p15 do
			local maxRows = v.maxRows
			
			if not maxRows or maxRows <= 0 then
				maxRows = 1e999
			end
			local var34 = processOneGrid(p14, var32, t_1, p16, maxRows, if fFlagLuaAppApportioningInCollectionViews then p17 else nil, if fFlagSduiPoolBackedFeed then p18 else nil)
			t[v.sortKey] = {
				entryIndices = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p18 then nil else var34.placedIndices,
				layout = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p18 then var34.layout else nil
			}
			var32 = var34.nextStartIndex
			t_1 = var34.pendingSpanTiles
		end
		return t
	end,
	processOneGrid = processOneGrid
}
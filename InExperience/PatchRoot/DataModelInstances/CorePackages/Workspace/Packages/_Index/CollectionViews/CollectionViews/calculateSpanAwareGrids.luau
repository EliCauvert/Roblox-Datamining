local Parent = script:FindFirstAncestor("CollectionViews").Parent
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local SharedFlagsModule = require(Parent.SharedFlags)
local ApportioningDiagnosticTelemetry = DiscoveryUtilsModule.ApportioningDiagnosticTelemetry
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local SpanForItemType = GameCollectionItemTypes.SpanForItemType
local FFlagLuaAppEnableNxMRoduxApportioning = SharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning
local FFlagLuaAppEnableNxMApportioningExtraLogging = SharedFlagsModule.FFlagLuaAppEnableNxMApportioningExtraLogging
local LuaAppFixApportioningTileTailConflict = game:DefineFastFlag("LuaAppFixApportioningTileTailConflict", false)
local config = {
	[GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile] = { colSpan = 2, rowSpan = 1 }
}

local function defaultGetSpanConfig(p1) --[[ Line: 76 ]]
	-- upvalues: FFlagLuaAppEnableNxMRoduxApportioning (copy), SpanForItemType (copy), config (copy)
	local SpanForItemTypeEntry = p1 and (if FFlagLuaAppEnableNxMRoduxApportioning then SpanForItemType[p1.componentType] else config[p1.componentType])
	
	return if SpanForItemTypeEntry then {
		colSpan = SpanForItemTypeEntry.colSpan,
		rowSpan = if FFlagLuaAppEnableNxMRoduxApportioning then SpanForItemTypeEntry.rowSpan else 1,
		minRowPadding = tonumber(p1.minRowPadding) or 0,
		alignmentType = p1.alignmentType
	} else nil
end

local function processOneGrid(p1, NextStartIndex, PendingSpanTiles, ItemsPerRow: number, MaxRows, Callback, p2) --[[ Line: 95 ]]
	-- upvalues: DiscoveryEventErrorLogger (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy), FFlagLuaAppEnableNxMApportioningExtraLogging (copy), ApportioningDiagnosticTelemetry (copy), LuaAppFixApportioningTileTailConflict (copy), defaultGetSpanConfig (copy)
	local ScaledMaxRows = MaxRows * ItemsPerRow
	local List = {}
	local List1 = {}
	local NextScanPosition = 0
	local NextAllowedRow = 1
	local t = {}
	
	local function nextFreePosition(NextScanPosition: number): number --[[ Line: 120 ]]
		-- upvalues: ItemsPerRow (copy), t (copy)
		repeat
			local NewFloored = math.floor(NextScanPosition / ItemsPerRow) + 1
			local Inverted: boolean = not t[NewFloored] or t[NewFloored][NextScanPosition % ItemsPerRow + 1] ~= -1
			if not Inverted then
				NextScanPosition += 1
			end
		until Inverted
		return NextScanPosition
	end
	
	local function writeLayoutCell(NewFloored, Col, Index) --[[ Line: 134 ]]
		-- upvalues: MaxRows (copy), DiscoveryEventErrorLogger (upval), ItemsPerRow (copy), t (copy)
		if MaxRows < NewFloored then
			DiscoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_LayoutWritePastMaxRows", "writeLayoutCell attempted to write past maxRows", {
				row = NewFloored,
				col = Col,
				maxRows = MaxRows,
				itemsPerRow = ItemsPerRow
			})
			
			return
		end
		if not t[NewFloored] then
			t[NewFloored] = {}
		end
		t[NewFloored][Col] = Index
	end
	
	local function tryPlaceSpanTile(OriginalIndex, SpanConfig): boolean --[[ Line: 154 ]]
		-- upvalues: FFlagLuaAppEnableNxMRoduxApportioning (upval), p2 (copy), nextFreePosition (copy), NextScanPosition (ref), ItemsPerRow (copy), NextAllowedRow (ref), FFlagLuaAppEnableNxMApportioningExtraLogging (upval), ApportioningDiagnosticTelemetry (upval), MaxRows (copy), ScaledMaxRows (copy), p1 (copy), LuaAppFixApportioningTileTailConflict (upval), t (copy), writeLayoutCell (copy), List (copy)
		local ColSpan: number = SpanConfig.colSpan
		local RowSpan = if FFlagLuaAppEnableNxMRoduxApportioning or p2 then SpanConfig.rowSpan else nil
		local MinRowPadding: number = SpanConfig.minRowPadding
		local AlignmentType = SpanConfig.alignmentType
		local NextFreePositionResult = if FFlagLuaAppEnableNxMRoduxApportioning or p2 then nextFreePosition(NextScanPosition) else NextScanPosition
		local NewFloored: number = if FFlagLuaAppEnableNxMRoduxApportioning or p2 then math.floor(NextFreePositionResult / ItemsPerRow) + 1 else math.ceil((NextScanPosition + 1) / ItemsPerRow)
		local NewNextFreePositionResult = NextFreePositionResult % ItemsPerRow + 1
		
		if NewFloored < NextAllowedRow then
			if FFlagLuaAppEnableNxMApportioningExtraLogging then
				ApportioningDiagnosticTelemetry.log("SpanDeferred", {
					reason = "padding_constraint",
					originalIndex = OriginalIndex,
					colSpan = ColSpan,
					rowSpan = RowSpan,
					alignmentType = AlignmentType,
					minRowPadding = MinRowPadding,
					currentRow = NewFloored,
					currentColumn = NewNextFreePositionResult,
					nextAllowedRow = NextAllowedRow,
					nextScanPosition = NextScanPosition,
					itemsPerRow = ItemsPerRow,
					maxRows = MaxRows,
					nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
				})
			end
			return false
		elseif FFlagLuaAppEnableNxMRoduxApportioning or p2 or ScaledMaxRows >= NextScanPosition + ColSpan then
			if AlignmentType == "LeftPin" and NewNextFreePositionResult ~= 1 then
				if FFlagLuaAppEnableNxMApportioningExtraLogging then
					ApportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "left_pin_misaligned",
						originalIndex = OriginalIndex,
						colSpan = ColSpan,
						rowSpan = RowSpan,
						alignmentType = AlignmentType,
						currentRow = NewFloored,
						currentColumn = NewNextFreePositionResult,
						nextScanPosition = NextScanPosition,
						itemsPerRow = ItemsPerRow,
						maxRows = MaxRows,
						nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif AlignmentType == "RightPin" and NewNextFreePositionResult + ColSpan - 1 ~= ItemsPerRow then
				if FFlagLuaAppEnableNxMApportioningExtraLogging then
					ApportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "right_pin_misaligned",
						originalIndex = OriginalIndex,
						colSpan = ColSpan,
						rowSpan = RowSpan,
						alignmentType = AlignmentType,
						currentRow = NewFloored,
						currentColumn = NewNextFreePositionResult,
						nextScanPosition = NextScanPosition,
						itemsPerRow = ItemsPerRow,
						maxRows = MaxRows,
						nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif ItemsPerRow < NewNextFreePositionResult + ColSpan - 1 then
				if FFlagLuaAppEnableNxMApportioningExtraLogging then
					ApportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "horizontal_wrap",
						originalIndex = OriginalIndex,
						colSpan = ColSpan,
						rowSpan = RowSpan,
						alignmentType = AlignmentType,
						currentRow = NewFloored,
						currentColumn = NewNextFreePositionResult,
						nextScanPosition = NextScanPosition,
						itemsPerRow = ItemsPerRow,
						maxRows = MaxRows,
						nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif (FFlagLuaAppEnableNxMRoduxApportioning or p2) and MaxRows < NewFloored + RowSpan - 1 then
				if FFlagLuaAppEnableNxMApportioningExtraLogging then
					ApportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "vertical_overflow",
						originalIndex = OriginalIndex,
						colSpan = ColSpan,
						rowSpan = RowSpan,
						alignmentType = AlignmentType,
						currentRow = NewFloored,
						currentColumn = NewNextFreePositionResult,
						nextScanPosition = NextScanPosition,
						itemsPerRow = ItemsPerRow,
						maxRows = MaxRows,
						nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			elseif (FFlagLuaAppEnableNxMRoduxApportioning or p2) and (RowSpan > 1 and #p1 - OriginalIndex < NewNextFreePositionResult - 1) then
				if FFlagLuaAppEnableNxMApportioningExtraLogging then
					ApportioningDiagnosticTelemetry.log("SpanDeferred", {
						reason = "insufficient_trailing_entries",
						originalIndex = OriginalIndex,
						colSpan = ColSpan,
						rowSpan = RowSpan,
						alignmentType = AlignmentType,
						currentRow = NewFloored,
						currentColumn = NewNextFreePositionResult,
						allEntriesCount = #p1,
						nextScanPosition = NextScanPosition,
						itemsPerRow = ItemsPerRow,
						maxRows = MaxRows,
						nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
					})
				end
				return false
			else
				if LuaAppFixApportioningTileTailConflict and (FFlagLuaAppEnableNxMRoduxApportioning or p2) then
					local NewNewFloored = nil
					local NewNewNextFreePositionResult = nil
					for i2 = 0, RowSpan - 1 do
						for i = 0, ColSpan - 1 do
							NewNewFloored = NewFloored + i2
							NewNewNextFreePositionResult = NewNextFreePositionResult + i
							
							if not t[NewNewFloored] or t[NewNewFloored][NewNewNextFreePositionResult] == nil then
								continue
							elseif FFlagLuaAppEnableNxMApportioningExtraLogging then
								ApportioningDiagnosticTelemetry.log("SpanDeferred", {
									reason = "span_cell_collision",
									originalIndex = OriginalIndex,
									colSpan = ColSpan,
									rowSpan = RowSpan,
									alignmentType = AlignmentType,
									currentRow = NewFloored,
									currentColumn = NewNextFreePositionResult,
									collidingRow = NewNewFloored,
									collidingCol = NewNewNextFreePositionResult,
									collidingValue = t[NewNewFloored][NewNewNextFreePositionResult],
									itemsPerRow = ItemsPerRow,
									maxRows = MaxRows,
									nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
								})
							end
							return false
						end
					end
				end
				if FFlagLuaAppEnableNxMRoduxApportioning or p2 then
					for i1 = 0, RowSpan - 1 do
						for i3 = 0, ColSpan - 1 do
							writeLayoutCell(NewFloored + i1, NewNextFreePositionResult + i3, -1)
						end
					end
					writeLayoutCell(NewFloored, NewNextFreePositionResult, OriginalIndex)
					NextScanPosition = NextFreePositionResult + ColSpan
					NextAllowedRow = NewFloored + RowSpan - 1 + MinRowPadding
				else
					table.insert(List, OriginalIndex)
					NextScanPosition += ColSpan
					NextAllowedRow = NewFloored + MinRowPadding
				end
				return true
			end
		else
			if FFlagLuaAppEnableNxMApportioningExtraLogging then
				ApportioningDiagnosticTelemetry.log("SpanDeferred", {
					reason = "totalcells_exceeded_legacy",
					originalIndex = OriginalIndex,
					colSpan = ColSpan,
					rowSpan = RowSpan,
					alignmentType = AlignmentType,
					minRowPadding = MinRowPadding,
					nextScanPosition = NextScanPosition,
					totalCells = ScaledMaxRows,
					itemsPerRow = ItemsPerRow,
					maxRows = MaxRows,
					nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
				})
			end
			return false
		end
	end
	
	local function tryPlaceDeferredSpanTiles() --[[ Line: 359 ]]
		-- upvalues: List1 (copy), tryPlaceSpanTile (copy)
		while #List1 > 0 do
			local Entry = List1[1]
			
			if not tryPlaceSpanTile(Entry.index, Entry.spanConfig) then break end
			table.remove(List1, 1)
		end
	end
	
	for _, pendingSpanTile in PendingSpanTiles do
		if #List1 > 0 then
			table.insert(List1, pendingSpanTile)
		elseif not tryPlaceSpanTile(pendingSpanTile.index, pendingSpanTile.spanConfig) then
			table.insert(List1, pendingSpanTile)
		end
	end
	local NextStartIndex1: number = NextStartIndex
	
	for i = NextStartIndex, #p1 do
		local v1 = p1[i]
		
		if not v1 then
			DiscoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_InvalidEntry", "calculateSpanAwareGrids called with an invalid entry", {
				allEntriesCount = #p1,
				indexInAllEntries = i,
				itemsPerRow = ItemsPerRow
			})
			NextStartIndex1 = i + 1
			continue
		end
		if ScaledMaxRows <= NextScanPosition then
			if not FFlagLuaAppEnableNxMApportioningExtraLogging then break end
			ApportioningDiagnosticTelemetry.log("GridFull", {
				nextScanPosition = NextScanPosition,
				totalCells = ScaledMaxRows,
				itemsPerRow = ItemsPerRow,
				maxRows = MaxRows,
				remainingEntries = #p1 - i + 1,
				deferredCount = #List1,
				stoppedAtIndex = i,
				allEntriesCount = #p1,
				nxmApportioningFlagValue = FFlagLuaAppEnableNxMRoduxApportioning
			})
			break
		end
		local DefaultGetSpanConfigResult = if Callback == nil then defaultGetSpanConfig(v1) else Callback(v1, i)
		
		if DefaultGetSpanConfigResult then
			if #List1 > 0 then
				table.insert(List1, { index = i, spanConfig = DefaultGetSpanConfigResult })
			elseif not tryPlaceSpanTile(i, DefaultGetSpanConfigResult) then
				table.insert(List1, { index = i, spanConfig = DefaultGetSpanConfigResult })
			end
			NextStartIndex1 = i + 1
		else
			if FFlagLuaAppEnableNxMRoduxApportioning or p2 then
				local NextFreePositionResult: number = nextFreePosition(NextScanPosition)
				
				if ScaledMaxRows <= NextFreePositionResult then break end
				writeLayoutCell(math.floor(NextFreePositionResult / ItemsPerRow) + 1, NextFreePositionResult % ItemsPerRow + 1, i)
				NextScanPosition = NextFreePositionResult + 1
			else
				table.insert(List, i)
				NextScanPosition += 1
			end
			tryPlaceDeferredSpanTiles()
			NextStartIndex1 = i + 1
		end
	end
	return {
		placedIndices = List,
		pendingSpanTiles = List1,
		nextStartIndex = NextStartIndex1,
		layout = if FFlagLuaAppEnableNxMRoduxApportioning or p2 then t else nil
	}
end

return {
	calculateSpanAwareGrids = function(p3, List, ItemsPerRow: number, p4, p5) --[[ Line: 461 ]]
		-- upvalues: DiscoveryEventErrorLogger (copy), processOneGrid (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy)
		if not p3 then
			DiscoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_MissingEntries", "calculateSpanAwareGrids called without entries", { gridConfigsCount = #List, itemsPerRow = ItemsPerRow })
			
			return {}
		end
		if #p3 == 0 then
			DiscoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_EmptyEntries", "calculateSpanAwareGrids called with empty entries", {
				allEntriesCount = #p3,
				gridConfigsCount = #List,
				itemsPerRow = ItemsPerRow
			})
			
			return {}
		end
		if #List == 0 then
			return {}
		end
		if not ItemsPerRow then
			DiscoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_MissingItemsPerRow", "calculateSpanAwareGrids called without itemsPerRow", { allEntriesCount = #p3, gridConfigsCount = #List })
			
			return {}
		end
		if ItemsPerRow <= 0 then
			DiscoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_InvalidItemsPerRow", "calculateSpanAwareGrids called with invalid itemsPerRow", {
				allEntriesCount = #p3,
				gridConfigsCount = #List,
				itemsPerRow = ItemsPerRow
			})
			
			return {}
		end
		local t = {}
		local NextStartIndex = 1
		local PendingSpanTiles = {}
		
		for _, value in List do
			local MaxRows = value.maxRows
			
			if not MaxRows or MaxRows <= 0 then
				MaxRows = 1e999
			end
			local ProcessOneGridResult = processOneGrid(p3, NextStartIndex, PendingSpanTiles, ItemsPerRow, MaxRows, p4, p5)
			t[value.sortKey] = {
				entryIndices = if FFlagLuaAppEnableNxMRoduxApportioning or p5 then nil else ProcessOneGridResult.placedIndices,
				layout = if FFlagLuaAppEnableNxMRoduxApportioning or p5 then ProcessOneGridResult.layout else nil
			}
			NextStartIndex = ProcessOneGridResult.nextStartIndex
			PendingSpanTiles = ProcessOneGridResult.pendingSpanTiles
		end
		return t
	end,
	processOneGrid = processOneGrid
}
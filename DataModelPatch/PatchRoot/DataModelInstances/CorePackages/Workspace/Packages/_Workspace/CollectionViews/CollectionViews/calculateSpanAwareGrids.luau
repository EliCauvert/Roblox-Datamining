local Parent = script:FindFirstAncestor("CollectionViews").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local SpanForItemType = GameCollectionItemTypes.SpanForItemType
local FFlagLuaAppEnableNxMRoduxApportioning = SharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning
local FFlagLuaAppApportioningInCollectionViews = SharedFlagsModule.FFlagLuaAppApportioningInCollectionViews
local FFlagSduiPoolBackedFeed = SharedFlagsModule.FFlagSduiPoolBackedFeed
local config = {
	[GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile] = { colSpan = 2, rowSpan = 1 }
}

local function defaultGetSpanConfig(p1)
	-- upvalues: FFlagLuaAppEnableNxMRoduxApportioning (copy), SpanForItemType (copy), config (copy)
	local SpanForItemTypeEntry = p1 and (if FFlagLuaAppEnableNxMRoduxApportioning then SpanForItemType[p1.componentType] else config[p1.componentType])
	
	return if SpanForItemTypeEntry then {
		colSpan = SpanForItemTypeEntry.colSpan,
		rowSpan = if FFlagLuaAppEnableNxMRoduxApportioning then SpanForItemTypeEntry.rowSpan else 1,
		minRowPadding = tonumber(p1.minRowPadding) or 0,
		alignmentType = p1.alignmentType
	} else nil
end

local function processOneGrid(p1, NextStartIndex, PendingSpanTiles, ItemsPerRow: number, MaxRows, Callback, p2)
	-- upvalues: DiscoveryEventErrorLogger (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy), FFlagSduiPoolBackedFeed (copy), FFlagLuaAppApportioningInCollectionViews (copy), defaultGetSpanConfig (copy)
	local ScaledMaxRows = MaxRows * ItemsPerRow
	local List = {}
	local List1 = {}
	local Count = 0
	local v1 = 1
	local t = {}
	
	local function nextFreePosition(Count: number): number
		-- upvalues: ItemsPerRow (copy), t (copy)
		repeat
			local NewFloored = math.floor(Count / ItemsPerRow) + 1
			local Inverted: boolean = not t[NewFloored] or t[NewFloored][Count % ItemsPerRow + 1] ~= -1
			if not Inverted then
				Count += 1
			end
		until Inverted
		return Count
	end
	
	local function writeLayoutCell(NewFloored, Col, Index)
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
	
	local function tryPlaceSpanTile(Index, SpanConfig): boolean
		-- upvalues: FFlagLuaAppEnableNxMRoduxApportioning (upval), FFlagSduiPoolBackedFeed (upval), p2 (copy), nextFreePosition (copy), Count (ref), ItemsPerRow (copy), v1 (ref), ScaledMaxRows (copy), MaxRows (copy), p1 (copy), writeLayoutCell (copy), List (copy)
		local ColSpan: number = SpanConfig.colSpan
		local RowSpan = if FFlagLuaAppEnableNxMRoduxApportioning or FFlagSduiPoolBackedFeed and p2 then SpanConfig.rowSpan else nil
		local MinRowPadding: number = SpanConfig.minRowPadding
		local AlignmentType = SpanConfig.alignmentType
		local NextFreePositionResult = if FFlagLuaAppEnableNxMRoduxApportioning or FFlagSduiPoolBackedFeed and p2 then nextFreePosition(Count) else Count
		local NewFloored: number = if FFlagLuaAppEnableNxMRoduxApportioning or FFlagSduiPoolBackedFeed and p2 then math.floor(NextFreePositionResult / ItemsPerRow) + 1 else math.ceil((Count + 1) / ItemsPerRow)
		local NewNextFreePositionResult = NextFreePositionResult % ItemsPerRow + 1
		
		if NewFloored < v1 then
			return false
		end
		if not FFlagLuaAppEnableNxMRoduxApportioning and (not FFlagSduiPoolBackedFeed or not p2) and ScaledMaxRows < Count + ColSpan then
			return false
		end
		if AlignmentType == "LeftPin" and NewNextFreePositionResult ~= 1 then
			return false
		end
		if AlignmentType == "RightPin" and NewNextFreePositionResult + ColSpan - 1 ~= ItemsPerRow then
			return false
		end
		if ItemsPerRow < NewNextFreePositionResult + ColSpan - 1 then
			return false
		end
		if (FFlagLuaAppEnableNxMRoduxApportioning or FFlagSduiPoolBackedFeed and p2) and MaxRows < NewFloored + RowSpan - 1 then
			return false
		end
		if (FFlagLuaAppEnableNxMRoduxApportioning or FFlagSduiPoolBackedFeed and p2) and (RowSpan > 1 and #p1 - Index < NewNextFreePositionResult - 1) then
			return false
		end
		if FFlagLuaAppEnableNxMRoduxApportioning or FFlagSduiPoolBackedFeed and p2 then
			for i = 0, RowSpan - 1 do
				for i1 = 0, ColSpan - 1 do
					writeLayoutCell(NewFloored + i, NewNextFreePositionResult + i1, -1)
				end
			end
			writeLayoutCell(NewFloored, NewNextFreePositionResult, Index)
			Count = NextFreePositionResult + ColSpan
			v1 = NewFloored + RowSpan - 1 + MinRowPadding
		else
			table.insert(List, Index)
			Count += ColSpan
			v1 = NewFloored + MinRowPadding
		end
		return true
	end
	
	local function tryPlaceDeferredSpanTiles()
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
		local v2 = p1[i]
		
		if not v2 then
			DiscoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_InvalidEntry", "calculateSpanAwareGrids called with an invalid entry", {
				allEntriesCount = #p1,
				indexInAllEntries = i,
				itemsPerRow = ItemsPerRow
			})
			NextStartIndex1 = i + 1
			continue
		end
		if ScaledMaxRows <= Count then break end
		local CallbackResult = if FFlagLuaAppApportioningInCollectionViews and Callback ~= nil then Callback(v2, i) else defaultGetSpanConfig(v2)
		
		if CallbackResult then
			if #List1 > 0 then
				table.insert(List1, { index = i, spanConfig = CallbackResult })
			elseif not tryPlaceSpanTile(i, CallbackResult) then
				table.insert(List1, { index = i, spanConfig = CallbackResult })
			end
			NextStartIndex1 = i + 1
		else
			if FFlagLuaAppEnableNxMRoduxApportioning or FFlagSduiPoolBackedFeed and p2 then
				local NextFreePositionResult: number = nextFreePosition(Count)
				
				if ScaledMaxRows <= NextFreePositionResult then break end
				writeLayoutCell(math.floor(NextFreePositionResult / ItemsPerRow) + 1, NextFreePositionResult % ItemsPerRow + 1, i)
				Count = NextFreePositionResult + 1
			else
				table.insert(List, i)
				Count += 1
			end
			tryPlaceDeferredSpanTiles()
			NextStartIndex1 = i + 1
		end
	end
	return {
		placedIndices = List,
		pendingSpanTiles = List1,
		nextStartIndex = NextStartIndex1,
		layout = if FFlagLuaAppEnableNxMRoduxApportioning or FFlagSduiPoolBackedFeed and p2 then t else nil
	}
end

return {
	calculateSpanAwareGrids = function(p3, List, ItemsPerRow: number, p4, p5)
		-- upvalues: DiscoveryEventErrorLogger (copy), processOneGrid (copy), FFlagLuaAppApportioningInCollectionViews (copy), FFlagSduiPoolBackedFeed (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy)
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
			local ProcessOneGridResult = processOneGrid(p3, NextStartIndex, PendingSpanTiles, ItemsPerRow, MaxRows, if FFlagLuaAppApportioningInCollectionViews then p4 else nil, if FFlagSduiPoolBackedFeed then p5 else nil)
			t[value.sortKey] = {
				entryIndices = if FFlagLuaAppEnableNxMRoduxApportioning or FFlagSduiPoolBackedFeed and p5 then nil else ProcessOneGridResult.placedIndices,
				layout = if FFlagLuaAppEnableNxMRoduxApportioning or FFlagSduiPoolBackedFeed and p5 then ProcessOneGridResult.layout else nil
			}
			NextStartIndex = ProcessOneGridResult.nextStartIndex
			PendingSpanTiles = ProcessOneGridResult.pendingSpanTiles
		end
		return t
	end,
	processOneGrid = processOneGrid
}
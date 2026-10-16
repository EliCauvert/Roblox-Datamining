local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AveragePropagationModule = require(ViewRecycler.Core.Layout.Policies.AveragePropagation)
local CollapsedEstimatedTreeModule = require(ViewRecycler.Core.Layout.SizeTree.CollapsedEstimatedTree)
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local DetachedMeasurementCacheModule = require(ViewRecycler.Core.Layout.Policies.DetachedMeasurementCache)
local _ = require(ViewRecycler.Core.Layout.LayoutRuntime)
local TypesModule = require(ViewRecycler.Core.Types)
local StaticPartsModule = require(ViewRecycler.Core.Layout.staticParts)
local LayoutMeasured = require(ViewRecycler.Internal.createDebugLogger)("Layout.measured")

return function(p1) --[[ Line: 45 | Named "measured" ]]
	-- upvalues: AveragePropagationModule (copy), DetachedMeasurementCacheModule (copy), CollapsedEstimatedTreeModule (copy), TypesModule (copy), LayoutMeasured (copy), DataSourceChangeTypeModule (copy), StaticPartsModule (copy)
	local P0 = p1 or {}
	local EstimatedItemLength = P0.estimatedItemLength or 50
	local EstimationPolicy = P0.estimationPolicy or AveragePropagationModule.new({ initialAverage = EstimatedItemLength })
	local NewDetachedMeasurementCache = DetachedMeasurementCacheModule.new(P0.detachedMeasurementCapacity)
	local NewCollapsedEstimatedTree = CollapsedEstimatedTreeModule.new(EstimatedItemLength)
	local TakeResults = {}
	local t = {}
	local List = {}
	local Total = 0
	local Count = 0
	local v1 = nil
	local StartOffset = 0
	local Length = 0
	
	local function _() --[[ Line: 62 | Named "average" ]]
		-- upvalues: Count (ref), Total (ref), EstimatedItemLength (copy)
		return if Count > 0 then Total / Count else EstimatedItemLength
	end
	
	local _ = function(Key, Amount) --[[ Line: 66 | Named "addActiveMeasurement" ]]
		-- upvalues: TakeResults (copy), Total (ref), Count (ref)
		TakeResults[Key] = Amount
		Total += Amount
		Count += 1
	end
	
	local _ = function(Key) --[[ Line: 72 | Named "restoreActiveMeasurement" ]]
		-- upvalues: NewDetachedMeasurementCache (copy), TakeResults (copy), Total (ref), Count (ref)
		local TakeResult = NewDetachedMeasurementCache.take(Key)
		
		if TakeResult ~= nil then
			TakeResults[Key] = TakeResult
			Total += TakeResult
			Count += 1
		end
	end
	
	local _ = function(Key) --[[ Line: 79 | Named "detachActiveMeasurement" ]]
		-- upvalues: TakeResults (copy), Total (ref), Count (ref), NewDetachedMeasurementCache (copy)
		local TakeResult = TakeResults[Key]
		
		if TakeResult ~= nil then
			TakeResults[Key] = nil
			Total -= TakeResult
			Count -= 1
			NewDetachedMeasurementCache.put(Key, TakeResult)
			
			return
		end
	end
	
	local _ = function(p2) --[[ Line: 199 | Named "rebuildFromKeys" ]]
		-- upvalues: List (ref), NewCollapsedEstimatedTree (copy), TakeResults (copy)
		List = p2
		NewCollapsedEstimatedTree.buildFromMeasurements(#p2, function(p3) --[[ Line: 201 ]]
			-- upvalues: TakeResults (upval), p2 (copy)
			return TakeResults[p2[p3]]
		end)
	end
	
	local function applyReset(Keys) --[[ Line: 206 ]]
		-- upvalues: t (ref), NewDetachedMeasurementCache (copy), TakeResults (copy), Total (ref), Count (ref), List (ref), NewCollapsedEstimatedTree (copy)
		local CountKeys = #Keys
		local Buffer = table.create(CountKeys)
		local t1 = {}
		
		for i = 1, CountKeys do
			local Key = Keys[i]
			
			if t1[Key] ~= nil then
				error(`Layout.measured: duplicate key "{Key}"`, 2)
			end
			Buffer[i] = Key
			t1[Key] = true
		end
		for i1 in t1 do
			if t[i1] == nil then
				local TakeResult = NewDetachedMeasurementCache.take(i1)
				
				if TakeResult ~= nil then
					TakeResults[i1] = TakeResult
					Total += TakeResult
					Count += 1
				end
			end
		end
		for _, value in List do
			if t1[value] == nil then
				local TakeResult = TakeResults[value]
				
				if TakeResult ~= nil then
					TakeResults[value] = nil
					Total -= TakeResult
					Count -= 1
					NewDetachedMeasurementCache.put(value, TakeResult)
				end
			end
		end
		t = t1
		List = Buffer
		NewCollapsedEstimatedTree.buildFromMeasurements(#Buffer, function(p2) --[[ Line: 201 ]]
			-- upvalues: TakeResults (upval), Buffer (copy)
			return TakeResults[Buffer[p2]]
		end)
	end
	
	local function applyInsert(Index: number, List1) --[[ Line: 235 ]]
		-- upvalues: t (ref), NewDetachedMeasurementCache (copy), TakeResults (copy), Total (ref), Count (ref), NewCollapsedEstimatedTree (copy), List (ref)
		local CountList1 = #List1
		local t2 = {}
		
		for i = 0, CountList1 - 1 do
			local Entry = List1[i + 1]
			
			if t[Entry] ~= nil or t2[Entry] ~= nil then
				error(`Layout.measured: duplicate key "{Entry}"`, 2)
			end
			t2[Entry] = true
		end
		for _, value in List1 do
			local TakeResult = NewDetachedMeasurementCache.take(value)
			
			if TakeResult ~= nil then
				TakeResults[value] = TakeResult
				Total += TakeResult
				Count += 1
			end
			t[value] = true
		end
		if NewCollapsedEstimatedTree.prefersIncremental(CountList1) then
			for i1, value1 in List1 do
				local IndexDelta = Index + i1 - 1
				table.insert(List, IndexDelta, value1)
				NewCollapsedEstimatedTree.insert(IndexDelta, TakeResults[value1])
			end
			return
		else
			local CountList = #List
			local Buffer = table.create(CountList + CountList1)
			table.move(List, 1, Index - 1, 1, Buffer)
			
			for i2, value2 in List1 do
				Buffer[Index + i2 - 1] = value2
			end
			table.move(List, Index, CountList, Index + CountList1, Buffer)
			List = Buffer
			NewCollapsedEstimatedTree.buildFromMeasurements(#Buffer, function(p2) --[[ Line: 201 ]]
				-- upvalues: TakeResults (upval), Buffer (copy)
				return TakeResults[Buffer[p2]]
			end)
		end
	end
	
	local function applyRemove(Index: number, Keys) --[[ Line: 271 ]]
		-- upvalues: List (ref), t (ref), TakeResults (copy), Total (ref), Count (ref), NewDetachedMeasurementCache (copy), NewCollapsedEstimatedTree (copy)
		local CountKeys = #Keys
		
		for i = Index, Index + CountKeys - 1 do
			local Entry = List[i]
			assert(Entry == Keys[i - Index + 1], "Layout.measured: remove keys do not match current order")
			t[Entry] = nil
			local TakeResult = TakeResults[Entry]
			
			if TakeResult ~= nil then
				TakeResults[Entry] = nil
				Total -= TakeResult
				Count -= 1
				NewDetachedMeasurementCache.put(Entry, TakeResult)
			end
		end
		if NewCollapsedEstimatedTree.prefersIncremental(CountKeys) then
			for _ = 1, CountKeys do
				table.remove(List, Index)
				NewCollapsedEstimatedTree.remove(Index)
			end
			return
		else
			local CountList = #List
			local Buffer = table.create(CountList - CountKeys)
			table.move(List, 1, Index - 1, 1, Buffer)
			table.move(List, Index + CountKeys, CountList, Index, Buffer)
			List = Buffer
			NewCollapsedEstimatedTree.buildFromMeasurements(#Buffer, function(p2) --[[ Line: 201 ]]
				-- upvalues: TakeResults (upval), Buffer (copy)
				return TakeResults[Buffer[p2]]
			end)
		end
	end
	
	local _ = function(Index, p2, p3) --[[ Line: 295 | Named "applyMove" ]]
		-- upvalues: List (ref), NewCollapsedEstimatedTree (copy), TakeResults (copy)
		assert(List[Index] == p3, "Layout.measured: move key does not match current order")
		table.remove(List, Index)
		NewCollapsedEstimatedTree.remove(Index)
		table.insert(List, p2, p3)
		NewCollapsedEstimatedTree.insert(p2, TakeResults[p3])
	end
	
	local function applyReorder(Tbl) --[[ Line: 303 ]]
		-- upvalues: List (ref), t (ref), NewCollapsedEstimatedTree (copy), TakeResults (copy)
		assert(#Tbl == #List, "Layout.measured: reorder must contain every active key")
		local t3 = {}
		
		for _, value in Tbl do
			assert(t[value] == true and t3[value] == nil, "Layout.measured: reorder must contain every active key once")
			t3[value] = true
		end
		local Copy = table.clone(Tbl)
		List = Copy
		NewCollapsedEstimatedTree.buildFromMeasurements(#Copy, function(p2) --[[ Line: 201 ]]
			-- upvalues: TakeResults (upval), Copy (copy)
			return TakeResults[Copy[p2]]
		end)
	end
	
	return {
		getItemCount = function() --[[ Line: 90 ]]
			-- upvalues: NewCollapsedEstimatedTree (copy)
			return NewCollapsedEstimatedTree.length()
		end,
		getContentLength = function() --[[ Line: 94 ]]
			-- upvalues: NewCollapsedEstimatedTree (copy)
			return NewCollapsedEstimatedTree.totalSum()
		end,
		getIntersectingIndexRange = function(p2, p3) --[[ Line: 115 ]]
			-- upvalues: NewCollapsedEstimatedTree (copy), v1 (ref), TypesModule (upval), StartOffset (ref), Length (ref)
			local LengthResult: number = NewCollapsedEstimatedTree.length()
			
			if LengthResult == 0 or p3 <= p2 then
				v1 = nil
				
				return TypesModule.EMPTY_INDEX_RANGE
			end
			local EntryAtPrefixSumResult, EntryAtPrefixSumResult2, EntryAtPrefixSumResult3 = NewCollapsedEstimatedTree.entryAtPrefixSum(p2)
			local ClampedValue = math.clamp(EntryAtPrefixSumResult, 1, LengthResult)
			
			if EntryAtPrefixSumResult == ClampedValue then
				v1 = ClampedValue
				StartOffset = EntryAtPrefixSumResult2
				Length = EntryAtPrefixSumResult3
			else
				v1 = nil
			end
			local ClampedValue1 = math.clamp(NewCollapsedEstimatedTree.indexAtPrefixSum(p3), ClampedValue, LengthResult)
			
			if p3 <= NewCollapsedEstimatedTree.prefixSum(ClampedValue1) then
				ClampedValue1 -= 1
			end
			return if ClampedValue1 < ClampedValue then TypesModule.EMPTY_INDEX_RANGE else { firstIndex = ClampedValue, lastIndex = ClampedValue1 }
		end,
		expandIndexRange = function(p2, p3, p4) --[[ Line: 342 ]]
			-- upvalues: StaticPartsModule (upval), NewCollapsedEstimatedTree (copy)
			return StaticPartsModule.expandItemRange(p2, p3, p4 or p3, NewCollapsedEstimatedTree.length())
		end,
		getItemLayout = function(p2) --[[ Line: 98 ]]
			-- upvalues: v1 (ref), StartOffset (ref), Length (ref), NewCollapsedEstimatedTree (copy)
			return if v1 == p2 then { startOffset = StartOffset, length = Length } else {
				startOffset = NewCollapsedEstimatedTree.prefixSum(p2),
				length = NewCollapsedEstimatedTree.getSize(p2)
			}
		end,
		getItemLayouts = function(p2, p3, p4) --[[ Line: 111 ]]
			-- upvalues: NewCollapsedEstimatedTree (copy)
			NewCollapsedEstimatedTree.fillRange(p2, p3, p4)
		end,
		updateItemMeasurement = function(p2) --[[ Line: 142 ]]
			-- upvalues: List (ref), LayoutMeasured (upval), TakeResults (copy), v1 (ref), Total (ref), Count (ref), NewCollapsedEstimatedTree (copy), EstimationPolicy (copy), EstimatedItemLength (copy)
			local ItemIndex = p2.itemIndex
			local ItemKey = p2.itemKey
			local Length = p2.length
			
			if List[ItemIndex] ~= ItemKey then
				LayoutMeasured("measurement DROPPED key=%s index=%d (index now holds %s)", ItemKey, ItemIndex, (tostring(List[ItemIndex])))
				
				return { accepted = false, geometryChanged = false }
			end
			local TakeResult = TakeResults[ItemKey]
			
			if TakeResult == Length then
				return { accepted = true, geometryChanged = false }
			end
			v1 = nil
			
			if TakeResult == nil then
				TakeResults[ItemKey] = Length
				Total += Length
				Count += 1
			else
				Total += Length - TakeResult
				TakeResults[ItemKey] = Length
			end
			local IsNotSizeMatch = NewCollapsedEstimatedTree.getSize(ItemIndex) ~= Length
			NewCollapsedEstimatedTree.update(ItemIndex, Length)
			
			if EstimationPolicy.recordMeasurementAndShouldUpdateEstimates(if Count > 0 then Total / Count else EstimatedItemLength) then
				IsNotSizeMatch = NewCollapsedEstimatedTree.setEstimatedItemLength(if Count > 0 then Total / Count else EstimatedItemLength) or IsNotSizeMatch
			end
			LayoutMeasured("measurement key=%s index=%d length=%.1f (avg=%.2f, changed=%s)", ItemKey, ItemIndex, Length, if Count > 0 then Total / Count else EstimatedItemLength, (tostring(IsNotSizeMatch)))
			
			return { accepted = true, geometryChanged = IsNotSizeMatch }
		end,
		requiresItemMeasurement = function(): boolean --[[ Line: 195 ]]
			return true
		end,
		applyDataSourceChange = function(p2): boolean --[[ Line: 316 ]]
			-- upvalues: v1 (ref), DataSourceChangeTypeModule (upval), applyReset (copy), applyInsert (copy), applyRemove (copy), List (ref), NewCollapsedEstimatedTree (copy), TakeResults (copy), applyReorder (copy)
			v1 = nil
			local Flag = true
			
			if p2.type == DataSourceChangeTypeModule.Reset then
				applyReset(p2.keys)
				
				return Flag
			end
			if p2.type == DataSourceChangeTypeModule.Insert then
				applyInsert(p2.index, p2.keys)
				
				return Flag
			end
			if p2.type == DataSourceChangeTypeModule.Remove then
				applyRemove(p2.index, p2.keys)
				
				return Flag
			end
			if p2.type == DataSourceChangeTypeModule.Update then
				Flag = false
				
				return Flag
			end
			if p2.type == DataSourceChangeTypeModule.Move then
				local FromIndex = p2.fromIndex
				local ToIndex = p2.toIndex
				local Key = p2.key
				assert(List[FromIndex] == Key, "Layout.measured: move key does not match current order")
				table.remove(List, FromIndex)
				NewCollapsedEstimatedTree.remove(FromIndex)
				table.insert(List, ToIndex, Key)
				NewCollapsedEstimatedTree.insert(ToIndex, TakeResults[Key])
				
				return Flag
			else
				if p2.type == DataSourceChangeTypeModule.Reorder then
					applyReorder(p2.keys)
				end
				return Flag
			end
		end,
		setViewportCrossAxisLength = StaticPartsModule.geometryUnchanged,
		destroy = function() --[[ Line: 351 ]] end
	}
end
local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact084
local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AveragePropagationModule = require(ViewRecycler.Core.Layout.Policies.AveragePropagation)
local CollapsedEstimatedTreeModule = require(ViewRecycler.Core.Layout.SizeTree.CollapsedEstimatedTree)
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local DetachedMeasurementCacheModule = require(ViewRecycler.Core.Layout.Policies.DetachedMeasurementCache)
local _ = require(ViewRecycler.Core.Layout.LayoutRuntime)
local TypesModule = require(ViewRecycler.Core.Types)
local StaticPartsModule = require(ViewRecycler.Core.Layout.staticParts)
local LayoutMeasured = require(ViewRecycler.Internal.createDebugLogger)("Layout.measured")

return function(p1)
	-- upvalues: AveragePropagationModule (copy), DetachedMeasurementCacheModule (copy), FFlagViewRecyclerReact084 (copy), CollapsedEstimatedTreeModule (copy), TypesModule (copy), LayoutMeasured (copy), DataSourceChangeTypeModule (copy), StaticPartsModule (copy)
	local P0 = p1 or {}
	local EstimatedItemLength = P0.estimatedItemLength or 50
	local EstimationPolicy = P0.estimationPolicy or AveragePropagationModule.new({ initialAverage = EstimatedItemLength })
	local NewDetachedMeasurementCache = DetachedMeasurementCacheModule.new(P0.detachedMeasurementCapacity)
	local GetEstimatedItemLength = if FFlagViewRecyclerReact084 then P0.getEstimatedItemLength else nil
	local NewCollapsedEstimatedTree = CollapsedEstimatedTreeModule.new(EstimatedItemLength)
	local TakeResults = {}
	local t = {}
	local List2 = {}
	local Total = 0
	local Count = 0
	local v1 = nil
	local StartOffset = 0
	local Length = 0
	local v2 = nil
	local List = nil
	local List1 = nil
	local Callback: ((any, any) -> ())? = nil
	
	if FFlagViewRecyclerReact084 then
		v2 = {}
		List = {}
		List1 = {}
		
		Callback = function(p2, p3)
			-- upvalues: GetEstimatedItemLength (ref), List (ref), List1 (ref)
			if GetEstimatedItemLength ~= nil then
				table.insert(List, p2)
				table.insert(List1, p3)
			end
		end
	end
	local function _()
		-- upvalues: Count (ref), Total (ref), EstimatedItemLength (copy)
		return if Count > 0 then Total / Count else EstimatedItemLength
	end
	
	local _ = function(Key, Amount)
		-- upvalues: TakeResults (copy), Total (ref), Count (ref)
		TakeResults[Key] = Amount
		Total += Amount
		Count += 1
	end
	
	local _ = function(Key)
		-- upvalues: NewDetachedMeasurementCache (copy), TakeResults (copy), Total (ref), Count (ref)
		local TakeResult = NewDetachedMeasurementCache.take(Key)
		
		if TakeResult ~= nil then
			TakeResults[Key] = TakeResult
			Total += TakeResult
			Count += 1
		end
	end
	
	local _ = function(Key)
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
	
	local function getItemCount()
		-- upvalues: NewCollapsedEstimatedTree (copy)
		return NewCollapsedEstimatedTree.length()
	end
	
	local function getContentLength()
		-- upvalues: NewCollapsedEstimatedTree (copy)
		return NewCollapsedEstimatedTree.totalSum()
	end
	
	local function getItemLayout(p2)
		-- upvalues: v1 (ref), StartOffset (ref), Length (ref), NewCollapsedEstimatedTree (copy)
		return if v1 == p2 then { startOffset = StartOffset, length = Length } else {
			startOffset = NewCollapsedEstimatedTree.prefixSum(p2),
			length = NewCollapsedEstimatedTree.getSize(p2)
		}
	end
	
	local function getItemLayouts(p2, p3, p4)
		-- upvalues: NewCollapsedEstimatedTree (copy)
		NewCollapsedEstimatedTree.fillRange(p2, p3, p4)
	end
	
	local function getIntersectingIndexRange(p2, p3)
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
	end
	
	local function updateItemMeasurement(p2)
		-- upvalues: List2 (ref), LayoutMeasured (upval), TakeResults (copy), v1 (ref), Total (ref), Count (ref), NewCollapsedEstimatedTree (copy), EstimationPolicy (copy), EstimatedItemLength (copy)
		local ItemIndex = p2.itemIndex
		local ItemKey = p2.itemKey
		local Length = p2.length
		
		if List2[ItemIndex] ~= ItemKey then
			LayoutMeasured("measurement DROPPED key=%s index=%d (index now holds %s)", ItemKey, ItemIndex, (tostring(List2[ItemIndex])))
			
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
			IsNotSizeMatch = NewCollapsedEstimatedTree.setEstimatedItemLength((math.round(if Count > 0 then Total / Count else EstimatedItemLength))) or IsNotSizeMatch
		end
		LayoutMeasured("measurement key=%s index=%d length=%.1f (avg=%.2f, changed=%s)", ItemKey, ItemIndex, Length, if Count > 0 then Total / Count else EstimatedItemLength, (tostring(IsNotSizeMatch)))
		
		return { accepted = true, geometryChanged = IsNotSizeMatch }
	end
	
	local function requiresItemMeasurement(): boolean
		return true
	end
	
	local function rebuildFromKeys(p2)
		-- upvalues: List2 (ref), FFlagViewRecyclerReact084 (upval), NewCollapsedEstimatedTree (copy), TakeResults (copy), GetEstimatedItemLength (ref), v2 (ref)
		List2 = p2
		
		if FFlagViewRecyclerReact084 then
			NewCollapsedEstimatedTree.buildFromMeasurements(#p2, function(p3)
				-- upvalues: TakeResults (upval), p2 (copy)
				return TakeResults[p2[p3]]
			end, if GetEstimatedItemLength == nil then nil else function(p3)
				-- upvalues: v2 (upval), p2 (copy)
				return v2[p2[p3]]
			end)
			
			return
		else
			NewCollapsedEstimatedTree.buildFromMeasurements(#p2, function(p3)
				-- upvalues: TakeResults (upval), p2 (copy)
				return TakeResults[p2[p3]]
			end)
		end
	end
	
	local function applyReset(Keys)
		-- upvalues: t (ref), NewDetachedMeasurementCache (copy), TakeResults (copy), Total (ref), Count (ref), List2 (ref), FFlagViewRecyclerReact084 (upval), v2 (ref), Callback (ref), rebuildFromKeys (copy)
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
		for _, value in List2 do
			if t1[value] == nil then
				local TakeResult = TakeResults[value]
				
				if TakeResult ~= nil then
					TakeResults[value] = nil
					Total -= TakeResult
					Count -= 1
					NewDetachedMeasurementCache.put(value, TakeResult)
				end
				if FFlagViewRecyclerReact084 then
					v2[value] = nil
				end
			end
		end
		t = t1
		
		if FFlagViewRecyclerReact084 then
			for i2, value1 in Buffer do
				Callback(value1, i2)
			end
		end
		rebuildFromKeys(Buffer)
	end
	
	local function applyInsert(Index: number, List)
		-- upvalues: t (ref), FFlagViewRecyclerReact084 (upval), NewDetachedMeasurementCache (copy), TakeResults (copy), Total (ref), Count (ref), Callback (ref), NewCollapsedEstimatedTree (copy), List2 (ref), rebuildFromKeys (copy)
		local CountList = #List
		local t2 = {}
		
		for i = 0, CountList - 1 do
			local Entry = List[i + 1]
			
			if t[Entry] ~= nil or t2[Entry] ~= nil then
				error(`Layout.measured: duplicate key "{Entry}"`, 2)
			end
			t2[Entry] = true
		end
		if FFlagViewRecyclerReact084 then
			for i1, value in List do
				local TakeResult = NewDetachedMeasurementCache.take(value)
				
				if TakeResult ~= nil then
					TakeResults[value] = TakeResult
					Total += TakeResult
					Count += 1
				end
				t[value] = true
				Callback(value, Index + i1 - 1)
			end
		else
			for _, value1 in List do
				local TakeResult = NewDetachedMeasurementCache.take(value1)
				
				if TakeResult ~= nil then
					TakeResults[value1] = TakeResult
					Total += TakeResult
					Count += 1
				end
				t[value1] = true
			end
		end
		if NewCollapsedEstimatedTree.prefersIncremental(CountList) then
			for i2, value2 in List do
				local IndexDelta = Index + i2 - 1
				table.insert(List2, IndexDelta, value2)
				NewCollapsedEstimatedTree.insert(IndexDelta, TakeResults[value2])
			end
			return
		else
			local CountList2 = #List2
			local Buffer = table.create(CountList2 + CountList)
			table.move(List2, 1, Index - 1, 1, Buffer)
			
			for i3, value3 in List do
				Buffer[Index + i3 - 1] = value3
			end
			table.move(List2, Index, CountList2, Index + CountList, Buffer)
			rebuildFromKeys(Buffer)
		end
	end
	
	local function applyRemove(Index: number, Keys)
		-- upvalues: List2 (ref), t (ref), TakeResults (copy), Total (ref), Count (ref), NewDetachedMeasurementCache (copy), FFlagViewRecyclerReact084 (upval), v2 (ref), NewCollapsedEstimatedTree (copy), rebuildFromKeys (copy)
		local CountKeys = #Keys
		
		for i = Index, Index + CountKeys - 1 do
			local Entry = List2[i]
			assert(Entry == Keys[i - Index + 1], "Layout.measured: remove keys do not match current order")
			t[Entry] = nil
			local TakeResult = TakeResults[Entry]
			
			if TakeResult ~= nil then
				TakeResults[Entry] = nil
				Total -= TakeResult
				Count -= 1
				NewDetachedMeasurementCache.put(Entry, TakeResult)
			end
			if FFlagViewRecyclerReact084 then
				v2[Entry] = nil
			end
		end
		if NewCollapsedEstimatedTree.prefersIncremental(CountKeys) then
			for _ = 1, CountKeys do
				table.remove(List2, Index)
				NewCollapsedEstimatedTree.remove(Index)
			end
			return
		else
			local CountList2 = #List2
			local Buffer = table.create(CountList2 - CountKeys)
			table.move(List2, 1, Index - 1, 1, Buffer)
			table.move(List2, Index + CountKeys, CountList2, Index, Buffer)
			rebuildFromKeys(Buffer)
		end
	end
	
	local function applyMove(Index, ToIndex, Key)
		-- upvalues: List2 (ref), NewCollapsedEstimatedTree (copy), FFlagViewRecyclerReact084 (upval), TakeResults (copy), v2 (ref)
		assert(List2[Index] == Key, "Layout.measured: move key does not match current order")
		table.remove(List2, Index)
		NewCollapsedEstimatedTree.remove(Index)
		table.insert(List2, ToIndex, Key)
		
		if FFlagViewRecyclerReact084 then
			NewCollapsedEstimatedTree.insert(ToIndex, TakeResults[Key], v2[Key])
			
			return
		else
			NewCollapsedEstimatedTree.insert(ToIndex, TakeResults[Key])
		end
	end
	
	local function applyReorder(Tbl)
		-- upvalues: List2 (ref), t (ref), rebuildFromKeys (copy)
		assert(#Tbl == #List2, "Layout.measured: reorder must contain every active key")
		local t3 = {}
		
		for _, value in Tbl do
			assert(t[value] == true and t3[value] == nil, "Layout.measured: reorder must contain every active key once")
			t3[value] = true
		end
		rebuildFromKeys(table.clone(Tbl))
	end
	
	local function applyDataSourceChange(p2): boolean
		-- upvalues: v1 (ref), DataSourceChangeTypeModule (upval), applyReset (copy), applyInsert (copy), applyRemove (copy), FFlagViewRecyclerReact084 (upval), Callback (ref), applyMove (copy), applyReorder (copy)
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
			
			if FFlagViewRecyclerReact084 then
				for _, key in p2.keys do
					Callback(key, 0)
				end
				return Flag
			end
		else
			if p2.type == DataSourceChangeTypeModule.Move then
				applyMove(p2.fromIndex, p2.toIndex, p2.key)
				
				return Flag
			end
			if p2.type == DataSourceChangeTypeModule.Reorder then
				applyReorder(p2.keys)
			end
		end
		return Flag
	end
	
	local readEstimate = nil
	local ResolveItemEstimates: ((any) -> any)? = nil
	
	if FFlagViewRecyclerReact084 then
		readEstimate = function(p3, p4): number
			-- upvalues: GetEstimatedItemLength (ref)
			local EstimatedItemLength: number = GetEstimatedItemLength(p3, p4)
			
			if EstimatedItemLength ~= nil then
				assert(type(EstimatedItemLength) == "number" and EstimatedItemLength >= 0 and EstimatedItemLength < 1e999, "Layout.measured: getEstimatedItemLength must return nil or a finite, non-negative number")
			end
			return EstimatedItemLength
		end
		
		ResolveItemEstimates = function(Callback)
			-- upvalues: List (ref), v1 (ref), t (ref), List2 (ref), List1 (ref), NewCollapsedEstimatedTree (copy), readEstimate (ref), v2 (ref), TakeResults (copy), rebuildFromKeys (copy)
			local CountList = #List
			
			if CountList == 0 then
				return false
			end
			v1 = nil
			local v3 = nil
			
			for i = 1, CountList do
				local Entry = List[i]
				
				if t[Entry] ~= nil and List2[List1[i]] ~= Entry then
					v3 = v3 or {}
					v3[Entry] = 0
				end
			end
			if v3 ~= nil then
				for i2, value in List2 do
					if v3[value] ~= nil then
						v3[value] = i2
					end
				end
			end
			local Inverted = not NewCollapsedEstimatedTree.prefersIncremental(CountList)
			local SetItemEstimateResult = false
			
			for i1 = 1, CountList do
				local Entry = List[i1]
				
				if t[Entry] ~= nil then
					local Entry1 = if v3 == nil or v3[Entry] == nil then List1[i1] else v3[Entry]
					local Estimate = readEstimate(Callback(Entry1), Entry1)
					
					if Inverted then
						SetItemEstimateResult = SetItemEstimateResult or v2[Entry] ~= Estimate and TakeResults[Entry] == nil
					else
						SetItemEstimateResult = NewCollapsedEstimatedTree.setItemEstimate(Entry1, Estimate) or SetItemEstimateResult
					end
					v2[Entry] = Estimate
				end
			end
			table.clear(List)
			table.clear(List1)
			
			if Inverted then
				rebuildFromKeys(List2)
			end
			return SetItemEstimateResult
		end
	end
	return {
		getItemCount = getItemCount,
		getContentLength = getContentLength,
		getIntersectingIndexRange = getIntersectingIndexRange,
		expandIndexRange = function(p3, p4, p5)
			-- upvalues: StaticPartsModule (upval), NewCollapsedEstimatedTree (copy)
			return StaticPartsModule.expandItemRange(p3, p4, p5 or p4, NewCollapsedEstimatedTree.length())
		end,
		getItemLayout = getItemLayout,
		getItemLayouts = getItemLayouts,
		updateItemMeasurement = updateItemMeasurement,
		requiresItemMeasurement = requiresItemMeasurement,
		isItemMeasured = function(p3): boolean
			-- upvalues: List2 (ref), TakeResults (copy)
			local Entry = List2[p3]
			
			return Entry ~= nil and TakeResults[Entry] ~= nil
		end,
		applyDataSourceChange = applyDataSourceChange,
		resolveItemEstimates = if FFlagViewRecyclerReact084 then if GetEstimatedItemLength == nil then nil else ResolveItemEstimates else nil,
		setViewportCrossAxisLength = StaticPartsModule.geometryUnchanged,
		stackedSpacing = function(): number
			return 0
		end,
		destroy = function() end
	}
end
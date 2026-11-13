local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact084
local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.DataSource)
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local DiagnosticsModule = require(ViewRecycler.Core.Diagnostics)
local _ = require(ViewRecycler.Core.Layout)
local PlacementTypesModule = require(ViewRecycler.Core.Placement.PlacementTypes)
local ShallowTableModule = require(ViewRecycler.Internal.ShallowTable)
local TypesModule = require(ViewRecycler.Core.Types)
local _ = require(ViewRecycler.Core.Recycling.SlotBinder)
local CloneFrozenFunction = ShallowTableModule.cloneFrozen
local ContainsEqualFunction = ShallowTableModule.containsEqual
local OptionalContainsEqualFunction = ShallowTableModule.optionalContainsEqual
local ITEMLAYOUTKEYS = TypesModule.ITEM_LAYOUT_KEYS
local ITEMPLACEMENTKEYS = PlacementTypesModule.ITEM_PLACEMENT_KEYS
local Frozen = table.freeze({ firstIndex = 1, lastIndex = 0 })
local Frozen1 = table.freeze({})
local Frozen2 = table.freeze({})
local Frozen3 = table.freeze({
	hasViewportRelativePlacements = false,
	retainedItems = Frozen2,
	additionalItems = Frozen2,
	placements = Frozen1
})

local function _(p1, p2): boolean
	return p1.firstIndex == p2.firstIndex and p1.lastIndex == p2.lastIndex
end

local _ = function(p1, p2): boolean
	if p1 == p2 then
		return true
	else
		local ItemLayout = p1.itemLayout
		local ItemLayout1 = p2.itemLayout
		
		return p1.assignment == p2.assignment and (p1.pinnedPosition == p2.pinnedPosition and (ItemLayout.crossAxisIndex == ItemLayout1.crossAxisIndex and ItemLayout.crossAxisCount == ItemLayout1.crossAxisCount)) and ItemLayout.crossAxisSpacing == ItemLayout1.crossAxisSpacing
	end
end

local function resolveLayout(Tbl, ItemLayout, p1)
	-- upvalues: ContainsEqualFunction (copy), ITEMLAYOUTKEYS (copy), CloneFrozenFunction (copy)
	return if ItemLayout == nil or not ContainsEqualFunction(ItemLayout, Tbl, ITEMLAYOUTKEYS) then if table.isfrozen(Tbl) then Tbl elseif p1 then table.freeze(Tbl) else CloneFrozenFunction(Tbl) else ItemLayout
end

local function resolvePlacement(p1, ScrollOffset, State)
	-- upvalues: Frozen1 (copy), ContainsEqualFunction (copy), ITEMPLACEMENTKEYS (copy), OptionalContainsEqualFunction (copy)
	local Tbl = Frozen1
	local Tbl1 = nil
	
	if p1 == nil or not p1.viewportRelative then
		if p1 ~= nil then
			Tbl = {
				mainAxisOffset = p1.mainAxisOffset,
				mainAxisLength = p1.mainAxisLength,
				mainAxisEndLimit = p1.mainAxisEndLimit,
				zIndex = p1.zIndex
			}
		end
	else
		local MainAxisEndLimit = p1.mainAxisEndLimit
		Tbl = {
			mainAxisOffset = ScrollOffset + (p1.mainAxisOffset or 0),
			mainAxisLength = p1.mainAxisLength,
			mainAxisEndLimit = if MainAxisEndLimit == nil then nil else ScrollOffset + MainAxisEndLimit,
			zIndex = p1.zIndex
		}
		Tbl1 = {
			viewportRelative = true,
			mainAxisOffset = p1.mainAxisOffset,
			mainAxisLength = p1.mainAxisLength,
			mainAxisEndLimit = MainAxisEndLimit,
			zIndex = p1.zIndex
		}
	end
	if State == nil or not ContainsEqualFunction(State.canvasPlacement, Tbl, ITEMPLACEMENTKEYS) then
		if Tbl ~= Frozen1 then
			table.freeze(Tbl)
		end
	else
		Tbl = State.canvasPlacement
	end
	if State ~= nil and OptionalContainsEqualFunction(State.viewportPlacement, Tbl1, ITEMPLACEMENTKEYS) then
		Tbl1 = State.viewportPlacement
		
		return Tbl, Tbl1
	end
	if Tbl1 ~= nil then
		table.freeze(Tbl1)
	end
	return Tbl, Tbl1
end

local Callback: ((any, any) -> any)? = nil
local sortByIndex = nil
local Callback1: ((any, any, any, any) -> ())? = nil

if FFlagViewRecyclerReact084 then
	Callback = function(p1, Row)
		local Index = Row.index
		
		return if Index == nil or Row.side then 0 elseif Index < p1.firstIndex then p1.firstIndex - Index else math.max(0, Index - p1.lastIndex)
	end
	
	sortByIndex = function(p1)
		for i = 2, #p1 do
			local v1 = p1[i]
			local Count: number = i
			while Count > 1 and v1.index < p1[Count - 1].index do
				p1[Count] = p1[Count - 1]
				Count -= 1
			end
			p1[Count] = v1
		end
	end
	
	Callback1 = function(List2, VisibleRange, List, List1)
		-- upvalues: sortByIndex (ref)
		local FirstIndex = VisibleRange.firstIndex
		local LastIndex = VisibleRange.lastIndex
		local Count = 0
		
		for _, value in List2 do
			local Index = value.index
			
			if Index == nil or value.side or FirstIndex <= Index and Index <= LastIndex then
				Count += 1
				List2[Count] = value
			elseif Index < FirstIndex then
				table.insert(List, value)
			else
				table.insert(List1, value)
			end
		end
		sortByIndex(List)
		sortByIndex(List1)
		local CountList = #List
		local Count1 = 1
		
		for i = Count + 1, #List2 do
			local Entry = nil
			if CountList >= 1 and (List1[Count1] == nil or FirstIndex - List[CountList].index <= List1[Count1].index - LastIndex) then
				Entry = List[CountList]
				CountList -= 1
			else
				Entry = List1[Count1]
				Count1 += 1
			end
			List2[i] = Entry
		end
		table.clear(List)
		table.clear(List1)
	end
end
return function(p2)
	-- upvalues: FFlagViewRecyclerReact084 (copy), Frozen (copy), Frozen3 (copy), Frozen2 (copy), DataSourceChangeTypeModule (copy), TypesModule (copy), resolveLayout (copy), Frozen1 (copy), resolvePlacement (copy), Callback (ref), Callback1 (ref), DiagnosticsModule (copy)
	local SlotBinder = p2.slotBinder
	local IsReadyOnAssignment = if FFlagViewRecyclerReact084 then p2.isReadyOnAssignment else nil
	local Flag = false
	local t = {}
	local t1 = {}
	local IsLargestMatch = true
	local t2 = {}
	local Rows = {}
	local Flag1 = false
	local Frozen4 = Frozen
	local v2 = if FFlagViewRecyclerReact084 then nil else nil
	local ContentStartOffset = 0
	local Layout = nil
	local Frozen5 = Frozen3
	local Count = 0
	local Frozen6 = Frozen2
	local Flag2 = false
	local Flag3 = false
	local Flag4 = false
	local Tbl = {}
	local v3 = nil
	local Frozen7 = Frozen
	
	local function _()
		-- upvalues: Flag1 (ref), Frozen4 (ref), v3 (ref), Frozen (upval), Frozen7 (ref)
		return if Flag1 then Frozen4 elseif v3 == nil then Frozen else Frozen7
	end
	
	local function noteDataChange(p3)
		-- upvalues: DataSourceChangeTypeModule (upval), Flag2 (ref), Flag3 (ref), Tbl (copy), Flag1 (ref), Frozen4 (ref), v3 (ref), Frozen (upval), Frozen7 (ref), TypesModule (upval)
		for _, change in p3.changes do
			local Type = change.type
			
			if Type == DataSourceChangeTypeModule.Reset then
				Flag2 = true
				Flag3 = true
			else
				if Type == DataSourceChangeTypeModule.Reorder then
					Flag2 = true
					continue
				end
				if Type == DataSourceChangeTypeModule.Update then
					for _, key in change.keys do
						Tbl[key] = true
					end
				elseif Type == DataSourceChangeTypeModule.Insert then
					for _, key1 in change.keys do
						Tbl[key1] = true
					end
					local Frozen1 = if Flag1 then Frozen4 elseif v3 == nil then Frozen else Frozen7
					
					if not Flag2 and not TypesModule.isIndexRangeEmpty(Frozen1) and change.index <= Frozen1.lastIndex then
						Flag2 = true
					end
				elseif Type == DataSourceChangeTypeModule.Remove then
					local Frozen2 = if Flag1 then Frozen4 elseif v3 == nil then Frozen else Frozen7
					
					if not Flag2 and not TypesModule.isIndexRangeEmpty(Frozen2) and change.index <= Frozen2.lastIndex then
						Flag2 = true
					end
				elseif Type == DataSourceChangeTypeModule.Move then
					local Frozen3 = if Flag1 then Frozen4 elseif v3 == nil then Frozen else Frozen7
					
					if not Flag2 and not TypesModule.isIndexRangeEmpty(Frozen3) and math.min(change.fromIndex, change.toIndex) <= Frozen3.lastIndex and Frozen3.firstIndex <= math.max(change.fromIndex, change.toIndex) then
						Flag2 = true
					end
				end
			end
		end
	end
	
	local function publish(p4, ItemLayout, CanvasPlacement, ViewportPlacement, ContentStartOffset): boolean
		local State = p4.state
		local Assignment = p4.assignment
		
		if State == nil or State.assignment ~= Assignment or State.index ~= p4.index or State.pinnedPosition ~= p4.pinnedPosition or State.itemLayout ~= ItemLayout or State.canvasPlacement ~= CanvasPlacement or State.viewportPlacement ~= ViewportPlacement or State.contentStartOffset ~= ContentStartOffset or p4.record.itemView ~= p4.view then
			local Frozen = table.freeze({
				assignment = Assignment,
				index = p4.index,
				pinnedPosition = p4.pinnedPosition,
				itemLayout = ItemLayout,
				canvasPlacement = CanvasPlacement,
				viewportPlacement = ViewportPlacement,
				contentStartOffset = ContentStartOffset
			})
			p4.state = Frozen
			p4.record = table.freeze({ itemView = p4.view, state = Frozen })
			
			return true
		else
			return false
		end
	end
	
	local Epoch = 0
	local DataSource = nil
	local Layout1 = nil
	local ScrollOffset = 0
	local ContentStartOffset1 = 0
	local v4 = false
	local FirstIndex = 0
	local Smallest = 0
	local List = {}
	local Keys = {}
	local Count1 = 0
	local v5 = nil
	local v6 = nil
	
	if FFlagViewRecyclerReact084 then
		v5 = {}
		v6 = {}
	end
	local T = Frozen2
	local T1 = Frozen2
	local v7 = nil
	local Placements = {}
	
	local _ = function(Key, Index, Value, ViewType)
		-- upvalues: Epoch (ref), Count1 (ref), List (copy)
		local config = {
			side = false,
			entered = true,
			changed = true,
			key = Key,
			value = Value,
			viewType = ViewType,
			index = Index,
			epoch = Epoch
		}
		Count1 += 1
		table.insert(List, config)
		
		return config
	end
	
	local _ = function(p4, Value, ViewType)
		-- upvalues: Keys (copy), Epoch (ref), Count1 (ref), List (copy)
		table.insert(Keys, p4.key)
		local config = {
			side = false,
			entered = true,
			changed = true,
			key = p4.key,
			value = Value,
			viewType = ViewType,
			index = p4.index,
			epoch = Epoch
		}
		Count1 += 1
		table.insert(List, config)
		config.side = p4.side
		
		return config
	end
	
	local _ = function(p4, p5)
		-- upvalues: Epoch (ref)
		assert(p4.epoch ~= Epoch, `Virtualizer: duplicate key "{p29}"`)
		p4.epoch = Epoch
		p4.entered = false
		p4.changed = false
	end
	
	local function enterIndex(Index)
		-- upvalues: DataSource (ref), t2 (ref), Epoch (ref), p2 (copy), Count1 (ref), List (copy)
		local ItemKey = DataSource.getItemKey(Index)
		local Entry = t2[ItemKey]
		
		if Entry == nil then
			local Item = DataSource.getItem(Index)
			local config = {
				side = false,
				entered = true,
				changed = true,
				key = ItemKey,
				value = Item,
				viewType = p2.getItemViewType(Item, Index),
				index = Index,
				epoch = Epoch
			}
			Count1 += 1
			table.insert(List, config)
			
			return config
		else
			assert(Entry.epoch ~= Epoch, `Virtualizer: duplicate key "{ItemKey}"`)
			Entry.epoch = Epoch
			Entry.entered = false
			Entry.changed = false
			Entry.index = Index
			Entry.side = false
			
			return Entry
		end
	end
	
	local function reread(p4, Changed)
		-- upvalues: DataSource (ref), p2 (copy), Keys (copy), Epoch (ref), Count1 (ref), List (copy)
		local Index = p4.index
		
		if Index == nil or p4.entered then
			return nil
		end
		local Item = DataSource.getItem(Index)
		local ItemViewType = p2.getItemViewType(Item, Index)
		
		if ItemViewType == p4.viewType then
			table.insert(List, {
				key = p4.key,
				value = Item,
				viewType = ItemViewType,
				changed = Changed
			})
			
			return nil
		else
			table.insert(Keys, p4.key)
			local config = {
				side = false,
				entered = true,
				changed = true,
				key = p4.key,
				value = Item,
				viewType = ItemViewType,
				index = p4.index,
				epoch = Epoch
			}
			Count1 += 1
			table.insert(List, config)
			config.side = p4.side
			
			return config
		end
	end
	
	local function restate(p4)
		-- upvalues: Placements (ref), resolveLayout (upval), v4 (ref), v7 (ref), FirstIndex (ref), Smallest (ref), Layout1 (ref), Frozen1 (upval), resolvePlacement (upval), ScrollOffset (ref), publish (copy), ContentStartOffset1 (ref), T (ref), T1 (ref)
		local State = p4.state
		local ItemLayout = if State == nil then nil else State.itemLayout
		local Placement = Placements[p4.key]
		local Index = p4.index
		local ResolveLayoutResult = if Index == nil then resolveLayout({
			startOffset = 0,
			length = if Placement == nil then 0 else Placement.mainAxisLength or 0
		}, ItemLayout, true) elseif ItemLayout == nil or v4 or State.index ~= Index then if v7 == nil or FirstIndex > Index or Index > Smallest then resolveLayout(Layout1.getItemLayout(Index), ItemLayout) else resolveLayout(v7[Index - FirstIndex + 1], ItemLayout, true) else ItemLayout
		local CanvasPlacement = Frozen1
		local ViewportPlacement = nil
		
		if Placement ~= nil or State ~= nil and State.canvasPlacement ~= Frozen1 then
			CanvasPlacement, ViewportPlacement = resolvePlacement(Placement, ScrollOffset, State)
		end
		if publish(p4, ResolveLayoutResult, CanvasPlacement, ViewportPlacement, ContentStartOffset1) then
			if p4.entered then
				T = if table.isfrozen(T) then {} else T
				table.insert(T, p4.record)
				
				return
			end
			T1 = if table.isfrozen(T1) then {} else T1
			table.insert(T1, p4.record)
		end
	end
	
	local KeepReadyViewsAhead = if FFlagViewRecyclerReact084 then function(List, p4, p5: number)
		-- upvalues: IsReadyOnAssignment (ref), Callback (upval), Rows (ref)
		local Callback1 = IsReadyOnAssignment
		local List1 = {}
		local List2 = {}
		
		for _, Row in List do
			local Index = Row.index
			local IsIndexBelow: boolean = p5 > 0 and Index < p4.firstIndex or p5 < 0 and p4.lastIndex < Index
			local IsIndexBelow1: boolean = Index < p4.firstIndex or Index > p4.lastIndex
			
			if Callback1(Row.view) then
				if IsIndexBelow or p5 == 0 and IsIndexBelow1 then
					table.insert(List2, { row = Row, distance = Callback(p4, Row) })
				end
			elseif not IsIndexBelow then
				table.insert(List1, { row = Row, distance = Callback(p4, Row) })
			end
		end
		if #List1 == 0 or #List2 == 0 then return end
		table.sort(List1, function(A, B): boolean
			return A.distance < B.distance
		end)
		table.sort(List2, function(A, B): boolean
			return B.distance < A.distance
		end)
		local t = {}
		local Row1 = nil
		
		for _, value in List1 do
			Row1 = value.row
			
			for i, value1 in List2 do
				if not t[i] and value1.row.viewType == Row1.viewType then
					if p5 == 0 and value1.distance <= value.distance then break end
					t[i] = true
					local Row2 = value1.row
					local View = Row1.view
					Row1.view = Row2.view
					Row2.view = View
					Rows[Row1.view] = Row1
					Rows[Row2.view] = Row2
					Row1.entered = true
					Row2.entered = true
					break
				else
					continue
				end
			end
		end
	end else nil
	
	local function release()
		-- upvalues: Flag1 (ref), Frozen2 (upval), IsLargestMatch (ref), t (ref), Flag2 (ref), v3 (ref), Frozen7 (ref), Frozen4 (ref), SlotBinder (copy), t1 (ref), t2 (ref), Rows (ref), Frozen (upval), FFlagViewRecyclerReact084 (upval), v2 (ref), Frozen5 (ref), Frozen3 (upval), Layout (ref), Frozen6 (ref)
		if not Flag1 then
			return Frozen2
		end
		if IsLargestMatch and #t > 0 and not Flag2 then
			local Buffer = table.create(#t)
			
			for i, value in t do
				Buffer[i] = value.key
			end
			v3 = Buffer
			Frozen7 = Frozen4
		else
			v3 = nil
		end
		Flag2 = false
		local ReleaseAllResult = SlotBinder.releaseAll()
		t = {}
		t1 = {}
		IsLargestMatch = true
		t2 = {}
		Rows = {}
		Flag1 = false
		Frozen4 = Frozen
		
		if FFlagViewRecyclerReact084 then
			v2 = nil
		end
		Frozen5 = Frozen3
		Layout = nil
		Frozen6 = Frozen2
		
		return ReleaseAllResult
	end
	
	return {
		noteDataChange = noteDataChange,
		invalidateKeys = function()
			-- upvalues: Flag2 (ref)
			Flag2 = true
		end,
		invalidatePayloads = function()
			-- upvalues: Flag3 (ref)
			Flag3 = true
		end,
		invalidateLayout = function()
			-- upvalues: Flag4 (ref)
			Flag4 = true
		end,
		apply = function(Keys1)
			-- upvalues: Flag (ref), DataSource (ref), Layout1 (ref), Frozen3 (upval), ScrollOffset (ref), ContentStartOffset1 (ref), v4 (ref), Flag4 (ref), Layout (ref), ContentStartOffset (ref), Frozen4 (ref), Tbl (copy), Flag1 (ref), Flag2 (ref), Flag3 (ref), Frozen5 (ref), Count (ref), Epoch (ref), FirstIndex (ref), Smallest (ref), List (copy), Keys (copy), Count1 (ref), IsLargestMatch (ref), t (ref), t1 (ref), enterIndex (copy), v3 (ref), Frozen7 (ref), t2 (ref), p2 (copy), reread (copy), FFlagViewRecyclerReact084 (upval), IsReadyOnAssignment (ref), Callback1 (upval), v5 (ref), v6 (ref), SlotBinder (copy), Rows (ref), v2 (ref), KeepReadyViewsAhead (ref), T (ref), Frozen2 (upval), T1 (ref), v7 (ref), Placements (ref), restate (copy), Frozen6 (ref), DiagnosticsModule (upval)
			if Flag then
				return nil, nil
			end
			DataSource = Keys1.dataSource
			Layout1 = Keys1.layout
			local Plan = Keys1.plan or Frozen3
			local MountedRange = Keys1.mountedRange
			ScrollOffset = Keys1.scrollOffset
			ContentStartOffset1 = Keys1.contentStartOffset
			v4 = Flag4 or Layout1 ~= Layout
			local IsNotContentStartOffsetMatch = ContentStartOffset1 ~= ContentStartOffset
			local Frozen = Frozen4
			local Inverted = not (MountedRange.firstIndex == Frozen.firstIndex and MountedRange.lastIndex == Frozen.lastIndex)
			local HasNextEntry = next(Tbl) ~= nil
			
			if Flag1 and not Flag2 and not Flag3 and not v4 and not IsNotContentStartOffsetMatch and not Inverted and not HasNextEntry and Plan == Frozen5 then
				return nil, nil
			end
			Count += 1
			Epoch = Count
			FirstIndex = MountedRange.firstIndex
			Smallest = math.min(MountedRange.lastIndex, (DataSource.getItemCount()))
			local Largest = math.max(0, Smallest - FirstIndex + 1)
			local Buffer = table.create(Largest)
			local List1 = {}
			table.clear(List)
			local List2 = {}
			table.clear(Keys)
			Count1 = 0
			local NoFlag1 = not Flag1 or (not IsLargestMatch or Flag2)
			local NoFlag1_1 = NoFlag1 or (v4 or IsNotContentStartOffsetMatch)
			
			if NoFlag1 then
				local v8 = if Flag2 or Flag1 then nil else v3
				for i5 = FirstIndex, Smallest do
					local ItemKey = if v8 == nil or Frozen7.firstIndex > i5 or i5 > Frozen7.lastIndex then DataSource.getItemKey(i5) else v8[i5 - Frozen7.firstIndex + 1]
					local Entry1 = t2[ItemKey]
					
					if Entry1 == nil then
						local Item = DataSource.getItem(i5)
						local NewI = i5 - FirstIndex + 1
						local config1 = {
							side = false,
							entered = true,
							changed = true,
							key = ItemKey,
							value = Item,
							viewType = p2.getItemViewType(Item, i5),
							index = i5,
							epoch = Epoch
						}
						Count1 += 1
						table.insert(List, config1)
						Buffer[NewI] = config1
					else
						assert(Entry1.epoch ~= Epoch, `Virtualizer: duplicate key "{ItemKey}"`)
						Entry1.epoch = Epoch
						Entry1.entered = false
						Entry1.changed = false
						Entry1.index = i5
						Entry1.side = false
						Buffer[i5 - FirstIndex + 1] = Entry1
					end
				end
				for _, value4 in t2 do
					if value4.epoch ~= Epoch then
						table.insert(List2, value4)
					end
				end
			else
				local FirstIndex1: number = Frozen4.firstIndex
				local LastIndex: number = Frozen4.lastIndex
				local Largest1 = math.max(FirstIndex1, FirstIndex)
				local Smallest1 = math.min(LastIndex, Smallest)
				
				for i = FirstIndex1, math.min(LastIndex, FirstIndex - 1) do
					table.insert(List2, t[i - FirstIndex1 + 1])
				end
				for i1 = math.max(FirstIndex1, Smallest + 1), LastIndex do
					table.insert(List2, t[i1 - FirstIndex1 + 1])
				end
				for _, value1 in t1 do
					table.insert(List2, value1)
				end
				if Largest1 <= Smallest1 then
					table.move(t, Largest1 - FirstIndex1 + 1, Smallest1 - FirstIndex1 + 1, Largest1 - FirstIndex + 1, Buffer)
					
					for i2 = Largest1 - FirstIndex + 1, Smallest1 - FirstIndex + 1 do
						local BufferEntry = Buffer[i2]
						BufferEntry.epoch = Epoch
						BufferEntry.entered = false
						BufferEntry.changed = false
					end
				end
				for i3 = FirstIndex, math.min(Smallest, Largest1 - 1) do
					Buffer[i3 - FirstIndex + 1] = enterIndex(i3)
				end
				for i4 = math.max(FirstIndex, Smallest1 + 1), Smallest do
					Buffer[i4 - FirstIndex + 1] = enterIndex(i4)
				end
			end
			for _, retainedItem in Plan.retainedItems do
				if retainedItem.index < FirstIndex or Smallest < retainedItem.index then
					local Entry3 = t2[retainedItem.key]
					
					if Entry3 == nil then
						local Item = DataSource.getItem(retainedItem.index)
						local config2 = {
							side = false,
							entered = true,
							changed = true,
							key = retainedItem.key,
							value = Item,
							viewType = p2.getItemViewType(Item, retainedItem.index),
							index = retainedItem.index,
							epoch = Epoch
						}
						Count1 += 1
						table.insert(List, config2)
						config2.side = true
						table.insert(List1, config2)
					else
						assert(Entry3.epoch ~= Epoch, `Virtualizer: duplicate key "{retainedItem.key}"`)
						Entry3.epoch = Epoch
						Entry3.entered = false
						Entry3.changed = false
						Entry3.index = retainedItem.index
						Entry3.side = true
						table.insert(List1, Entry3)
					end
				end
			end
			for _, additionalItem in Plan.additionalItems do
				local Position = additionalItem.identity.position
				local PinnedItem = p2.getPinnedItem(Position)
				
				if PinnedItem ~= nil and PinnedItem.key == additionalItem.key then
					local Entry2 = t2[additionalItem.key]
					local config3 = nil
					
					if Entry2 == nil then
						config3 = {
							index = nil,
							side = false,
							entered = true,
							changed = true,
							key = additionalItem.key,
							value = PinnedItem.value,
							viewType = PinnedItem.itemViewType,
							epoch = Epoch
						}
						Count1 += 1
						table.insert(List, config3)
					else
						assert(Entry2.epoch ~= Epoch, `Virtualizer: duplicate key "{additionalItem.key}"`)
						Entry2.epoch = Epoch
						Entry2.entered = false
						Entry2.changed = false
						config3 = Entry2
						
						if config3.viewType == PinnedItem.itemViewType then
							if config3.value ~= PinnedItem.value then
								table.insert(List, {
									key = additionalItem.key,
									value = PinnedItem.value,
									viewType = PinnedItem.itemViewType
								})
							end
						else
							local Value = PinnedItem.value
							local ItemViewType = PinnedItem.itemViewType
							table.insert(Keys, Entry2.key)
							config3 = {
								side = false,
								entered = true,
								changed = true,
								key = Entry2.key,
								value = Value,
								viewType = ItemViewType,
								index = Entry2.index,
								epoch = Epoch
							}
							Count1 += 1
							table.insert(List, config3)
							config3.side = Entry2.side
						end
					end
					config3.index = nil
					config3.side = true
					config3.pinnedPosition = Position
					config3.pinnedRevision = additionalItem.identity.revision
					table.insert(List1, config3)
				end
			end
			if Flag3 then
				for i7, value3 in Buffer do
					Buffer[i7] = reread(value3, false) or value3
				end
				for i11, value7 in List1 do
					List1[i11] = reread(value7, false) or value7
				end
			elseif HasNextEntry then
				for i12 in Tbl do
					local Entry4 = t2[i12]
					local NoEntry: boolean = Entry4 == nil or Entry4.epoch ~= Epoch
					local RereadResult = nil
					
					if not NoEntry then
						RereadResult = reread(Entry4, true)
						NoEntry = RereadResult == nil
					end
					if not NoEntry then
						if Entry4.side then
							List1[table.find(List1, Entry4)] = RereadResult
						else
							Buffer[Entry4.index - FirstIndex + 1] = RereadResult
						end
					end
				end
			end
			for _, value8 in List2 do
				if value8.epoch ~= Epoch then
					table.insert(Keys, value8.key)
				end
			end
			local VisibleRange = nil
			
			if FFlagViewRecyclerReact084 then
				VisibleRange = Keys1.visibleRange
				
				if VisibleRange ~= nil and IsReadyOnAssignment ~= nil and Count1 > 1 then
					Callback1(List, VisibleRange, v5, v6)
				end
			end
			local ApplyResult = SlotBinder.apply(Keys, List)
			
			for _, key in Keys do
				t2[key] = nil
				Rows[t2[key].view] = nil
			end
			for _, value9 in ApplyResult.entered do
				t2[value9.key] = value9
				Rows[value9.view] = value9
			end
			for _, value10 in ApplyResult.updated do
				value10.changed = true
			end
			if FFlagViewRecyclerReact084 and VisibleRange ~= nil and IsReadyOnAssignment ~= nil then
				KeepReadyViewsAhead(Buffer, VisibleRange, if v2 == nil then 0 else math.sign(ScrollOffset - v2))
			end
			local Reassigned = #Keys - #ApplyResult.departed
			T = Frozen2
			T1 = Frozen2
			v7 = nil
			
			if Largest > 1 and Layout1.getItemLayouts ~= nil and (NoFlag1_1 and (v4 or not Flag1) or Largest < Count1 * 2) then
				local Buffer2 = table.create(Largest)
				Layout1.getItemLayouts(FirstIndex, Smallest, Buffer2)
				v7 = Buffer2
			end
			Placements = Plan.placements
			local Placements1 = Frozen5.placements
			
			if NoFlag1_1 then
				for _, value11 in Buffer do
					restate(value11)
				end
			else
				for _, value in Buffer do
					if value.entered or value.changed then
						restate(value)
					end
				end
				for placement in Placements do
					local Entry = t2[placement]
					
					if Entry ~= nil and not Entry.side and not Entry.entered and not Entry.changed then
						restate(Entry)
					end
				end
				for i9 in Placements1 do
					local Entry5 = t2[i9]
					
					if Entry5 ~= nil and Placements[i9] == nil and (not Entry5.side and not Entry5.entered and not Entry5.changed) then
						restate(Entry5)
					end
				end
			end
			for _, value12 in List1 do
				restate(value12)
			end
			local Flag5: boolean = #Buffer ~= #t or (#List1 ~= #t1 or Inverted)
			
			if not Flag5 and NoFlag1 then
				for i8, value5 in Buffer do
					if t[i8] ~= value5 then
						Flag5 = true
						break
					end
				end
			end
			if not Flag5 then
				for i10, value6 in List1 do
					if t1[i10] ~= value6 then
						Flag5 = true
						break
					end
				end
			end
			t = Buffer
			t1 = List1
			IsLargestMatch = Largest == math.max(0, MountedRange.lastIndex - MountedRange.firstIndex + 1)
			Flag1 = true
			Frozen4 = MountedRange
			
			if FFlagViewRecyclerReact084 then
				v2 = ScrollOffset
			end
			ContentStartOffset = ContentStartOffset1
			Layout = Layout1
			Frozen5 = Plan
			Flag2 = false
			Flag3 = false
			Flag4 = false
			
			if HasNextEntry then
				table.clear(Tbl)
			end
			v3 = nil
			local Departed = ApplyResult.departed
			
			if not Flag5 and #T == 0 and #T1 == 0 and #Departed == 0 then
				return nil, nil
			end
			local Buffer1 = table.create(#t + #t1)
			
			for i6, value2 in t do
				Buffer1[i6] = value2.record
			end
			local CountT = #t
			
			for i13, value13 in t1 do
				Buffer1[CountT + i13] = value13.record
			end
			Frozen6 = table.freeze(Buffer1)
			local Touched = #T + #T1 + #Departed
			local config = { entered = T, updated = T1, departed = Departed }
			
			if Touched == 0 then
				return config, nil
			else
				return config, {
					kind = DiagnosticsModule.EventKind.ItemViewsSynchronized,
					retained = #Buffer1 - #T - #T1,
					reassigned = Reassigned,
					acquired = #T - Reassigned,
					released = #Departed,
					touched = Touched
				}
			end
		end,
		release = release,
		destroy = function()
			-- upvalues: Flag (ref), release (copy), v3 (ref), SlotBinder (copy)
			if not Flag then
				release()
				v3 = nil
				SlotBinder.destroy()
				Flag = true
				
				return
			end
		end,
		isApplied = function()
			-- upvalues: Flag1 (ref)
			return Flag1
		end,
		getMountedViews = function()
			-- upvalues: Frozen6 (ref)
			return Frozen6
		end,
		validate = function(List)
			-- upvalues: Rows (ref), t2 (ref)
			local List1 = {}
			local Count = 0
			
			for _, value in List do
				local Row = Rows[value.itemView]
				local State = value.state
				
				if Row ~= nil then
					local State1 = Row.state
					local IsCrossAxisSpacingMatch = nil
					
					if State1 == State then
						IsCrossAxisSpacingMatch = true
					else
						local ItemLayout = State1.itemLayout
						local ItemLayout1 = State.itemLayout
						IsCrossAxisSpacingMatch = State1.assignment == State.assignment and (State1.pinnedPosition == State.pinnedPosition and (ItemLayout.crossAxisIndex == ItemLayout1.crossAxisIndex and (ItemLayout.crossAxisCount == ItemLayout1.crossAxisCount and ItemLayout.crossAxisSpacing == ItemLayout1.crossAxisSpacing)))
					end
					if IsCrossAxisSpacingMatch then
						table.insert(List1, {
							index = Row.index,
							key = Row.key,
							pinnedPosition = Row.pinnedPosition,
							pinnedRevision = Row.pinnedRevision,
							length = value.length
						})
						continue
					end
				end
				if State.index == nil or State.pinnedPosition ~= nil or t2[State.assignment.key] ~= nil then
					Count += 1
				else
					table.insert(List1, {
						index = State.index,
						key = State.assignment.key,
						length = value.length
					})
				end
			end
			return List1, Count
		end
	}
end
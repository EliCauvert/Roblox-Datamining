local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.DataSource)
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local DiagnosticsModule = require(ViewRecycler.Core.Diagnostics)
local _ = require(ViewRecycler.Core.Layout)
local ShallowTableModule = require(ViewRecycler.Internal.ShallowTable)
local TypesModule = require(ViewRecycler.Core.Types)
local _ = require(ViewRecycler.Core.Recycling.SlotBinder)
local CloneFrozenFunction = ShallowTableModule.cloneFrozen
local ContainsEqualFunction = ShallowTableModule.containsEqual
local OptionalContainsEqualFunction = ShallowTableModule.optionalContainsEqual
local ITEMLAYOUTKEYS = TypesModule.ITEM_LAYOUT_KEYS
local ITEMPLACEMENTKEYS = require(ViewRecycler.Core.Placement.PlacementTypes).ITEM_PLACEMENT_KEYS
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

return function(p1)
	-- upvalues: Frozen (copy), Frozen3 (copy), Frozen2 (copy), DataSourceChangeTypeModule (copy), TypesModule (copy), resolveLayout (copy), Frozen1 (copy), resolvePlacement (copy), DiagnosticsModule (copy)
	local SlotBinder = p1.slotBinder
	local Flag = false
	local t = {}
	local t1 = {}
	local IsLargestMatch = true
	local t2 = {}
	local t3 = {}
	local Flag1 = false
	local Frozen4 = Frozen
	local ContentStartOffset = 0
	local Layout = nil
	local Frozen5 = Frozen3
	local Count = 0
	local Frozen6 = Frozen2
	local Flag2 = false
	local Flag3 = false
	local Flag4 = false
	local Tbl = {}
	local v1 = nil
	local Frozen7 = Frozen
	
	local function _()
		-- upvalues: Flag1 (ref), Frozen4 (ref), v1 (ref), Frozen (upval), Frozen7 (ref)
		return if Flag1 then Frozen4 elseif v1 == nil then Frozen else Frozen7
	end
	
	local function publish(p2, ItemLayout, CanvasPlacement, ViewportPlacement, ContentStartOffset): boolean
		local State = p2.state
		local Assignment = p2.assignment
		
		if State == nil or State.assignment ~= Assignment or State.index ~= p2.index or State.pinnedPosition ~= p2.pinnedPosition or State.itemLayout ~= ItemLayout or State.canvasPlacement ~= CanvasPlacement or State.viewportPlacement ~= ViewportPlacement or State.contentStartOffset ~= ContentStartOffset or p2.record.itemView ~= p2.view then
			local Frozen = table.freeze({
				assignment = Assignment,
				index = p2.index,
				pinnedPosition = p2.pinnedPosition,
				itemLayout = ItemLayout,
				canvasPlacement = CanvasPlacement,
				viewportPlacement = ViewportPlacement,
				contentStartOffset = ContentStartOffset
			})
			p2.state = Frozen
			p2.record = table.freeze({ itemView = p2.view, state = Frozen })
			
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
	local v2 = false
	local FirstIndex = 0
	local Smallest = 0
	local List = {}
	local Keys = {}
	local Count1 = 0
	local T = Frozen2
	local T1 = Frozen2
	local v3 = nil
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
	
	local _ = function(p2, Value, ViewType)
		-- upvalues: Keys (copy), Epoch (ref), Count1 (ref), List (copy)
		table.insert(Keys, p2.key)
		local config = {
			side = false,
			entered = true,
			changed = true,
			key = p2.key,
			value = Value,
			viewType = ViewType,
			index = p2.index,
			epoch = Epoch
		}
		Count1 += 1
		table.insert(List, config)
		config.side = p2.side
		
		return config
	end
	
	local _ = function(p2, p3)
		-- upvalues: Epoch (ref)
		assert(p2.epoch ~= Epoch, `Virtualizer: duplicate key "{p24}"`)
		p2.epoch = Epoch
		p2.entered = false
		p2.changed = false
	end
	
	local function enterIndex(Index)
		-- upvalues: DataSource (ref), t2 (ref), Epoch (ref), p1 (copy), Count1 (ref), List (copy)
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
				viewType = p1.getItemViewType(Item, Index),
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
	
	local function reread(p2, Changed)
		-- upvalues: DataSource (ref), p1 (copy), Keys (copy), Epoch (ref), Count1 (ref), List (copy)
		local Index = p2.index
		
		if Index == nil or p2.entered then
			return nil
		end
		local Item = DataSource.getItem(Index)
		local ItemViewType = p1.getItemViewType(Item, Index)
		
		if ItemViewType == p2.viewType then
			table.insert(List, {
				key = p2.key,
				value = Item,
				viewType = ItemViewType,
				changed = Changed
			})
			
			return nil
		else
			table.insert(Keys, p2.key)
			local config = {
				side = false,
				entered = true,
				changed = true,
				key = p2.key,
				value = Item,
				viewType = ItemViewType,
				index = p2.index,
				epoch = Epoch
			}
			Count1 += 1
			table.insert(List, config)
			config.side = p2.side
			
			return config
		end
	end
	
	local function restate(p2)
		-- upvalues: Placements (ref), resolveLayout (upval), v2 (ref), v3 (ref), FirstIndex (ref), Smallest (ref), Layout1 (ref), Frozen1 (upval), resolvePlacement (upval), ScrollOffset (ref), publish (copy), ContentStartOffset1 (ref), T (ref), T1 (ref)
		local State = p2.state
		local ItemLayout = if State == nil then nil else State.itemLayout
		local Placement = Placements[p2.key]
		local Index = p2.index
		local ResolveLayoutResult = if Index == nil then resolveLayout({
			startOffset = 0,
			length = if Placement == nil then 0 else Placement.mainAxisLength or 0
		}, ItemLayout, true) elseif ItemLayout == nil or v2 or State.index ~= Index then if v3 == nil or FirstIndex > Index or Index > Smallest then resolveLayout(Layout1.getItemLayout(Index), ItemLayout) else resolveLayout(v3[Index - FirstIndex + 1], ItemLayout, true) else ItemLayout
		local CanvasPlacement = Frozen1
		local ViewportPlacement = nil
		
		if Placement ~= nil or State ~= nil and State.canvasPlacement ~= Frozen1 then
			CanvasPlacement, ViewportPlacement = resolvePlacement(Placement, ScrollOffset, State)
		end
		if publish(p2, ResolveLayoutResult, CanvasPlacement, ViewportPlacement, ContentStartOffset1) then
			if p2.entered then
				T = if table.isfrozen(T) then {} else T
				table.insert(T, p2.record)
				
				return
			end
			T1 = if table.isfrozen(T1) then {} else T1
			table.insert(T1, p2.record)
		end
	end
	
	local function release()
		-- upvalues: Flag1 (ref), Frozen2 (upval), IsLargestMatch (ref), t (ref), Flag2 (ref), v1 (ref), Frozen7 (ref), Frozen4 (ref), SlotBinder (copy), t1 (ref), t2 (ref), t3 (ref), Frozen (upval), Frozen5 (ref), Frozen3 (upval), Layout (ref), Frozen6 (ref)
		if not Flag1 then
			return Frozen2
		end
		if IsLargestMatch and #t > 0 and not Flag2 then
			local Buffer = table.create(#t)
			
			for i, value in t do
				Buffer[i] = value.key
			end
			v1 = Buffer
			Frozen7 = Frozen4
		else
			v1 = nil
		end
		Flag2 = false
		t = {}
		t1 = {}
		IsLargestMatch = true
		t2 = {}
		t3 = {}
		Flag1 = false
		Frozen4 = Frozen
		Frozen5 = Frozen3
		Layout = nil
		Frozen6 = Frozen2
		
		return (SlotBinder.releaseAll())
	end
	
	return {
		noteDataChange = function(p2)
			-- upvalues: DataSourceChangeTypeModule (upval), Flag2 (ref), Flag3 (ref), Tbl (copy), Flag1 (ref), Frozen4 (ref), v1 (ref), Frozen (upval), Frozen7 (ref), TypesModule (upval)
			for _, change in p2.changes do
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
						local Frozen1 = if Flag1 then Frozen4 elseif v1 == nil then Frozen else Frozen7
						
						if not Flag2 and not TypesModule.isIndexRangeEmpty(Frozen1) and change.index <= Frozen1.lastIndex then
							Flag2 = true
						end
					elseif Type == DataSourceChangeTypeModule.Remove then
						local Frozen2 = if Flag1 then Frozen4 elseif v1 == nil then Frozen else Frozen7
						
						if not Flag2 and not TypesModule.isIndexRangeEmpty(Frozen2) and change.index <= Frozen2.lastIndex then
							Flag2 = true
						end
					elseif Type == DataSourceChangeTypeModule.Move then
						local Frozen3 = if Flag1 then Frozen4 elseif v1 == nil then Frozen else Frozen7
						
						if not Flag2 and not TypesModule.isIndexRangeEmpty(Frozen3) and math.min(change.fromIndex, change.toIndex) <= Frozen3.lastIndex and Frozen3.firstIndex <= math.max(change.fromIndex, change.toIndex) then
							Flag2 = true
						end
					end
				end
			end
		end,
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
			-- upvalues: Flag (ref), DataSource (ref), Layout1 (ref), Frozen3 (upval), ScrollOffset (ref), ContentStartOffset1 (ref), v2 (ref), Flag4 (ref), Layout (ref), ContentStartOffset (ref), Frozen4 (ref), Tbl (copy), Flag1 (ref), Flag2 (ref), Flag3 (ref), Frozen5 (ref), Count (ref), Epoch (ref), FirstIndex (ref), Smallest (ref), List (copy), Keys (copy), Count1 (ref), IsLargestMatch (ref), t (ref), t1 (ref), enterIndex (copy), v1 (ref), Frozen7 (ref), t2 (ref), p1 (copy), reread (copy), SlotBinder (copy), t3 (ref), T (ref), Frozen2 (upval), T1 (ref), v3 (ref), Placements (ref), restate (copy), Frozen6 (ref), DiagnosticsModule (upval)
			if Flag then
				return nil, nil
			end
			DataSource = Keys1.dataSource
			Layout1 = Keys1.layout
			local Plan = Keys1.plan or Frozen3
			local MountedRange = Keys1.mountedRange
			ScrollOffset = Keys1.scrollOffset
			ContentStartOffset1 = Keys1.contentStartOffset
			v2 = Flag4 or Layout1 ~= Layout
			local IsNotContentStartOffsetMatch = ContentStartOffset1 ~= ContentStartOffset
			local Frozen = Frozen4
			local Inverted = not (MountedRange.firstIndex == Frozen.firstIndex and MountedRange.lastIndex == Frozen.lastIndex)
			local HasNextEntry = next(Tbl) ~= nil
			
			if Flag1 and not Flag2 and not Flag3 and not v2 and not IsNotContentStartOffsetMatch and not Inverted and not HasNextEntry and Plan == Frozen5 then
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
			local NoFlag1_1 = NoFlag1 or (v2 or IsNotContentStartOffsetMatch)
			
			if NoFlag1 then
				local v4 = if Flag2 or Flag1 then nil else v1
				for i8 = FirstIndex, Smallest do
					local ItemKey = if v4 == nil or Frozen7.firstIndex > i8 or i8 > Frozen7.lastIndex then DataSource.getItemKey(i8) else v4[i8 - Frozen7.firstIndex + 1]
					local Entry = t2[ItemKey]
					
					if Entry == nil then
						local Item = DataSource.getItem(i8)
						local NewI = i8 - FirstIndex + 1
						local config1 = {
							side = false,
							entered = true,
							changed = true,
							key = ItemKey,
							value = Item,
							viewType = p1.getItemViewType(Item, i8),
							index = i8,
							epoch = Epoch
						}
						Count1 += 1
						table.insert(List, config1)
						Buffer[NewI] = config1
					else
						assert(Entry.epoch ~= Epoch, `Virtualizer: duplicate key "{ItemKey}"`)
						Entry.epoch = Epoch
						Entry.entered = false
						Entry.changed = false
						Entry.index = i8
						Entry.side = false
						Buffer[i8 - FirstIndex + 1] = Entry
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
				
				for i2 = FirstIndex1, math.min(LastIndex, FirstIndex - 1) do
					table.insert(List2, t[i2 - FirstIndex1 + 1])
				end
				for i3 = math.max(FirstIndex1, Smallest + 1), LastIndex do
					table.insert(List2, t[i3 - FirstIndex1 + 1])
				end
				for _, value3 in t1 do
					table.insert(List2, value3)
				end
				if Largest1 <= Smallest1 then
					table.move(t, Largest1 - FirstIndex1 + 1, Smallest1 - FirstIndex1 + 1, Largest1 - FirstIndex + 1, Buffer)
					
					for i5 = Largest1 - FirstIndex + 1, Smallest1 - FirstIndex + 1 do
						local BufferEntry = Buffer[i5]
						BufferEntry.epoch = Epoch
						BufferEntry.entered = false
						BufferEntry.changed = false
					end
				end
				for i6 = FirstIndex, math.min(Smallest, Largest1 - 1) do
					Buffer[i6 - FirstIndex + 1] = enterIndex(i6)
				end
				for i7 = math.max(FirstIndex, Smallest1 + 1), Smallest do
					Buffer[i7 - FirstIndex + 1] = enterIndex(i7)
				end
			end
			for _, retainedItem in Plan.retainedItems do
				if retainedItem.index < FirstIndex or Smallest < retainedItem.index then
					local Entry = t2[retainedItem.key]
					
					if Entry == nil then
						local Item = DataSource.getItem(retainedItem.index)
						local config2 = {
							side = false,
							entered = true,
							changed = true,
							key = retainedItem.key,
							value = Item,
							viewType = p1.getItemViewType(Item, retainedItem.index),
							index = retainedItem.index,
							epoch = Epoch
						}
						Count1 += 1
						table.insert(List, config2)
						config2.side = true
						table.insert(List1, config2)
					else
						assert(Entry.epoch ~= Epoch, `Virtualizer: duplicate key "{retainedItem.key}"`)
						Entry.epoch = Epoch
						Entry.entered = false
						Entry.changed = false
						Entry.index = retainedItem.index
						Entry.side = true
						table.insert(List1, Entry)
					end
				end
			end
			for _, additionalItem in Plan.additionalItems do
				local Position = additionalItem.identity.position
				local PinnedItem = p1.getPinnedItem(Position)
				
				if PinnedItem ~= nil and PinnedItem.key == additionalItem.key then
					local Entry = t2[additionalItem.key]
					local config4 = nil
					
					if Entry == nil then
						local config3 = {
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
						config4 = config3
					else
						assert(Entry.epoch ~= Epoch, `Virtualizer: duplicate key "{additionalItem.key}"`)
						Entry.epoch = Epoch
						Entry.entered = false
						Entry.changed = false
						config4 = Entry
						
						if config4.viewType == PinnedItem.itemViewType then
							if config4.value ~= PinnedItem.value then
								table.insert(List, {
									key = additionalItem.key,
									value = PinnedItem.value,
									viewType = PinnedItem.itemViewType
								})
							end
						else
							local Value = PinnedItem.value
							local ItemViewType = PinnedItem.itemViewType
							table.insert(Keys, Entry.key)
							local config5 = {
								side = false,
								entered = true,
								changed = true,
								key = Entry.key,
								value = Value,
								viewType = ItemViewType,
								index = Entry.index,
								epoch = Epoch
							}
							Count1 += 1
							table.insert(List, config5)
							config5.side = Entry.side
							config4 = config5
						end
					end
					config4.index = nil
					config4.side = true
					config4.pinnedPosition = Position
					config4.pinnedRevision = additionalItem.identity.revision
					table.insert(List1, config4)
				end
			end
			if Flag3 then
				for i10, value6 in Buffer do
					Buffer[i10] = reread(value6, false) or value6
				end
				for i11, value7 in List1 do
					List1[i11] = reread(value7, false) or value7
				end
			elseif HasNextEntry then
				for i4 in Tbl do
					local Entry = t2[i4]
					local NoEntry: boolean = Entry == nil or Entry.epoch ~= Epoch
					local RereadResult = nil
					
					if not NoEntry then
						RereadResult = reread(Entry, true)
						NoEntry = RereadResult == nil
					end
					if not NoEntry then
						if Entry.side then
							List1[table.find(List1, Entry)] = RereadResult
						else
							Buffer[Entry.index - FirstIndex + 1] = RereadResult
						end
					end
				end
			end
			for _, value8 in List2 do
				if value8.epoch ~= Epoch then
					table.insert(Keys, value8.key)
				end
			end
			local ApplyResult = SlotBinder.apply(Keys, List)
			
			for _, key in Keys do
				t2[key] = nil
				t3[t2[key].view] = nil
			end
			for _, value9 in ApplyResult.entered do
				t2[value9.key] = value9
				t3[value9.view] = value9
			end
			for _, value2 in ApplyResult.updated do
				value2.changed = true
			end
			local Reassigned = #Keys - #ApplyResult.departed
			T = Frozen2
			T1 = Frozen2
			v3 = nil
			
			if Largest > 1 and Layout1.getItemLayouts ~= nil and (NoFlag1_1 and (v2 or not Flag1) or Largest < Count1 * 2) then
				local Buffer1 = table.create(Largest)
				Layout1.getItemLayouts(FirstIndex, Smallest, Buffer1)
				v3 = Buffer1
			end
			Placements = Plan.placements
			local Placements1 = Frozen5.placements
			
			if NoFlag1_1 then
				for _, value10 in Buffer do
					restate(value10)
				end
			else
				for _, value1 in Buffer do
					if value1.entered or value1.changed then
						restate(value1)
					end
				end
				for placement in Placements do
					local Entry = t2[placement]
					
					if Entry ~= nil and not Entry.side and not Entry.entered and not Entry.changed then
						restate(Entry)
					end
				end
				for i1 in Placements1 do
					local Entry = t2[i1]
					
					if Entry ~= nil and (Placements[i1] == nil and not Entry.side and not Entry.entered and not Entry.changed) then
						restate(Entry)
					end
				end
			end
			for _, value11 in List1 do
				restate(value11)
			end
			local Flag5: boolean = #Buffer ~= #t or (#List1 ~= #t1 or Inverted)
			
			if not Flag5 and NoFlag1 then
				for i12, value12 in Buffer do
					if t[i12] ~= value12 then
						Flag5 = true
						break
					end
				end
			end
			if not Flag5 then
				for i, value in List1 do
					if t1[i] ~= value then
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
			ContentStartOffset = ContentStartOffset1
			Layout = Layout1
			Frozen5 = Plan
			Flag2 = false
			Flag3 = false
			Flag4 = false
			
			if HasNextEntry then
				table.clear(Tbl)
			end
			v1 = nil
			local Departed = ApplyResult.departed
			
			if not Flag5 and #T == 0 and #T1 == 0 and #Departed == 0 then
				return nil, nil
			end
			local Buffer2 = table.create(#t + #t1)
			
			for i13, value13 in t do
				Buffer2[i13] = value13.record
			end
			local CountT = #t
			
			for i9, value5 in t1 do
				Buffer2[CountT + i9] = value5.record
			end
			Frozen6 = table.freeze(Buffer2)
			local Touched = #T + #T1 + #Departed
			local config = { entered = T, updated = T1, departed = Departed }
			
			if Touched == 0 then
				return config, nil
			else
				return config, {
					kind = DiagnosticsModule.EventKind.ItemViewsSynchronized,
					retained = #Buffer2 - #T - #T1,
					reassigned = Reassigned,
					acquired = #T - Reassigned,
					released = #Departed,
					touched = Touched
				}
			end
		end,
		release = release,
		destroy = function()
			-- upvalues: Flag (ref), release (copy), v1 (ref), SlotBinder (copy)
			if not Flag then
				release()
				v1 = nil
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
			-- upvalues: t3 (ref), t2 (ref)
			local List1 = {}
			local Count = 0
			
			for _, value in List do
				local Entry = t3[value.itemView]
				local State = value.state
				
				if Entry ~= nil then
					local State1 = Entry.state
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
							index = Entry.index,
							key = Entry.key,
							pinnedPosition = Entry.pinnedPosition,
							pinnedRevision = Entry.pinnedRevision,
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
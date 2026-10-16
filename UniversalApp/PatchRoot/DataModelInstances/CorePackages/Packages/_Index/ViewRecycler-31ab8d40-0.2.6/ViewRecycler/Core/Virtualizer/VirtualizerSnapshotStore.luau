local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(ViewRecycler.Core.DataSource)
local _ = require(ViewRecycler.Core.Layout)
local PlacementTypesModule = require(ViewRecycler.Core.Placement.PlacementTypes)
local ShallowTableModule = require(ViewRecycler.Internal.ShallowTable)
local TypesModule = require(ViewRecycler.Core.Types)
local _ = require(ViewRecycler.Core.Virtualizer.VirtualizerSnapshot)
local _ = require(ViewRecycler.Core.Virtualizer.ItemRevisionTracker)
local _ = require(ViewRecycler.Core.PinnedItems.createPinnedItemPlanner)
local CloneFrozenFunction = ShallowTableModule.cloneFrozen
local ContainsEqualFunction = ShallowTableModule.containsEqual
local OptionalContainsEqualFunction = ShallowTableModule.optionalContainsEqual
local Frozen = table.freeze({ firstIndex = 1, lastIndex = 0 })
local Frozen1 = table.freeze({})
local Frozen2 = table.freeze({
	hasViewportRelativePlacements = false,
	retainedItems = table.freeze({}),
	additionalAssignments = table.freeze({}),
	placements = table.freeze({})
})
local Frozen3 = table.freeze({ assignmentsChanged = false, placementChanged = false })
local ITEMLAYOUTKEYS = TypesModule.ITEM_LAYOUT_KEYS
local ITEMPLACEMENTKEYS = PlacementTypesModule.ITEM_PLACEMENT_KEYS
local Frozen4 = table.freeze({ "key" })
local Frozen5 = table.freeze({ "revision" })

local function _(p1, p2): boolean --[[ Line: 74 | Named "sameRange" ]]
	return p1.firstIndex == p2.firstIndex and p1.lastIndex == p2.lastIndex
end

return function(p1) --[[ Line: 78 | Named "createVirtualizerSnapshotStore" ]]
	-- upvalues: Frozen (copy), CloneFrozenFunction (copy), Frozen1 (copy), ContainsEqualFunction (copy), ITEMPLACEMENTKEYS (copy), OptionalContainsEqualFunction (copy), ITEMLAYOUTKEYS (copy), PlacementTypesModule (copy), Frozen2 (copy), TypesModule (copy), Frozen4 (copy), Frozen5 (copy), Frozen3 (copy)
	local Planner = p1.planner
	local ItemRevisions = p1.itemRevisions
	local GetRecyclableViewTypeFunction = p1.getRecyclableViewType
	local config = {
		entryIdentity = 0,
		entryLayoutGeometry = 0,
		entryPlacementGeometry = 0,
		entryRange = 0,
		entryScroll = 0,
		snapshotLayoutGeometry = 0,
		snapshotRange = 0,
		snapshotScroll = 0
	}
	local Frozen6 = table.freeze({
		version = 0,
		contentStartOffset = 0,
		contentLength = 0,
		entries = table.freeze({}),
		visibleRange = Frozen,
		mountedRange = Frozen,
		scrollState = CloneFrozenFunction(p1.initialScrollState),
		requiresItemMeasurement = p1.initialRequiresItemMeasurement
	})
	
	local function _(p2) --[[ Line: 108 | Named "recordEntryMaterialization" ]]
		-- upvalues: config (copy)
		config.entryIdentity = p2.identity
		config.entryLayoutGeometry = p2.layoutGeometry
		config.entryPlacementGeometry = p2.placementGeometry
		config.entryRange = p2.range
		config.entryScroll = p2.scroll
	end
	
	local function resolvePlacement(ItemKey, p2, ScrollOffset) --[[ Line: 116 ]]
		-- upvalues: Frozen1 (upval)
		local Placement = p2.placements[ItemKey]
		
		if Placement == nil then
			return Frozen1, nil
		elseif Placement.viewportRelative then
			return table.freeze({
				mainAxisOffset = ScrollOffset + (Placement.mainAxisOffset or 0),
				mainAxisLength = Placement.mainAxisLength,
				zIndex = Placement.zIndex
			}), table.freeze({
				viewportRelative = true,
				mainAxisOffset = Placement.mainAxisOffset,
				mainAxisLength = Placement.mainAxisLength,
				zIndex = Placement.zIndex
			})
		else
			return table.freeze({
				mainAxisOffset = Placement.mainAxisOffset,
				mainAxisLength = Placement.mainAxisLength,
				zIndex = Placement.zIndex
			}), nil
		end
	end
	
	local function makeEntry(p2, Key, Index, Item, RecyclableViewType, Revision, Position, UpdateResult, p3, p4) --[[ Line: 145 ]]
		-- upvalues: Frozen1 (upval), resolvePlacement (copy), ContainsEqualFunction (upval), ITEMPLACEMENTKEYS (upval), OptionalContainsEqualFunction (upval), ITEMLAYOUTKEYS (upval), PlacementTypesModule (upval), CloneFrozenFunction (upval)
		local Config = if Index == nil then {
			startOffset = 0,
			length = UpdateResult.placements[Key].mainAxisLength or 0
		} else p4 or p2.layout.getItemLayout(Index)
		local CanvasPlacement = Frozen1
		local ViewportPlacement = nil
		
		if p2.hasViewportPlacements then
			CanvasPlacement, ViewportPlacement = resolvePlacement(Key, UpdateResult, p2.scrollState.scrollOffset)
		end
		if p3 ~= nil and ContainsEqualFunction(p3.canvasPlacement, CanvasPlacement, ITEMPLACEMENTKEYS) then
			CanvasPlacement = p3.canvasPlacement
		end
		if p3 ~= nil and OptionalContainsEqualFunction(p3.viewportPlacement, ViewportPlacement, ITEMPLACEMENTKEYS) then
			ViewportPlacement = p3.viewportPlacement
		end
		if p3 ~= nil and ContainsEqualFunction(p3.itemLayout, Config, ITEMLAYOUTKEYS) then
			Config = p3.itemLayout
		end
		if p3 == nil or p3.index ~= Index or p3.value ~= Item or p3.recyclableViewType ~= RecyclableViewType or p3.identity.revision ~= Revision or not ContainsEqualFunction(p3.itemLayout, Config, ITEMLAYOUTKEYS) or not ContainsEqualFunction(p3.canvasPlacement, CanvasPlacement, ITEMPLACEMENTKEYS) or not OptionalContainsEqualFunction(p3.viewportPlacement, ViewportPlacement, ITEMPLACEMENTKEYS) then
			local v1: boolean = p3 ~= nil and (p3.index == Index and p3.identity.revision == Revision and p3.identity.kind == PlacementTypesModule.IdentityKind.Pinned == (Position ~= nil))
			
			return table.freeze({
				key = Key,
				index = Index,
				value = Item,
				recyclableViewType = RecyclableViewType,
				identity = if v1 then p3.identity elseif Position == nil then table.freeze({
					kind = PlacementTypesModule.IdentityKind.Data,
					index = Index,
					revision = Revision
				}) else table.freeze({
					kind = PlacementTypesModule.IdentityKind.Pinned,
					position = Position,
					revision = Revision
				}),
				itemLayout = if table.isfrozen(Config) then Config elseif p4 == nil then CloneFrozenFunction(Config) else table.freeze(Config),
				canvasPlacement = CanvasPlacement,
				viewportPlacement = ViewportPlacement,
				measurementIdentity = if v1 then p3.measurementIdentity else table.freeze({
					itemIndex = Index,
					itemKey = Key,
					itemRevision = Revision,
					pinnedPosition = Position
				})
			})
		else
			return p3
		end
	end
	
	local function materializeEntries(p2) --[[ Line: 232 ]]
		-- upvalues: config (copy), Frozen6 (ref), Planner (copy), Frozen2 (upval), TypesModule (upval), makeEntry (copy), GetRecyclableViewTypeFunction (copy), ItemRevisions (copy), ContainsEqualFunction (upval), Frozen4 (upval), Frozen5 (upval)
		local Revisions = p2.revisions
		local MountedRange = p2.mountedRange
		local v1 = false
		
		if config.entryRange ~= Revisions.range then
			local MountedRange1 = Frozen6.mountedRange
			v1 = not (MountedRange1.firstIndex == MountedRange.firstIndex and MountedRange1.lastIndex == MountedRange.lastIndex)
		end
		local IsNotEntryIdentityMatch = config.entryIdentity ~= Revisions.identity
		local IsNotEntryLayoutGeometryMatch = config.entryLayoutGeometry ~= Revisions.layoutGeometry
		local IsNotEntryPlacementGeometryMatch = config.entryPlacementGeometry ~= Revisions.placementGeometry
		local IsNotEntryScrollMatch: boolean = p2.hasViewportPlacements and config.entryScroll ~= Revisions.scroll
		
		if not v1 and not IsNotEntryIdentityMatch and not IsNotEntryLayoutGeometryMatch and not IsNotEntryPlacementGeometryMatch and not IsNotEntryScrollMatch then
			config.entryRange = Revisions.range
			config.entryScroll = Revisions.scroll
			
			return false, false
		end
		local UpdateResult = if p2.hasViewportPlacements then Planner.update({
			dataSource = p2.dataSource,
			layout = p2.layout,
			scrollOffset = p2.scrollState.scrollOffset,
			viewportLength = p2.scrollState.viewportLength,
			contentStartOffset = p2.contentStartOffset
		}) else Frozen2
		
		if v1 and not p2.hasViewportPlacements and not IsNotEntryIdentityMatch and not IsNotEntryLayoutGeometryMatch then
			local NewLastIndex: number = if TypesModule.isIndexRangeEmpty(MountedRange) then 0 else MountedRange.lastIndex - MountedRange.firstIndex + 1
			local Buffer = table.create(NewLastIndex)
			local t = {}
			
			if NewLastIndex > 0 and p2.layout.getItemLayouts ~= nil then
				p2.layout.getItemLayouts(MountedRange.firstIndex, MountedRange.lastIndex, t)
			end
			for i = MountedRange.firstIndex, MountedRange.lastIndex do
				local Entry = Frozen6.entries[i - Frozen6.mountedRange.firstIndex + 1]
				
				if Entry == nil or Entry.index ~= i then
					local ItemKey = p2.dataSource.getItemKey(i)
					local Item = p2.dataSource.getItem(i)
					table.insert(Buffer, makeEntry(p2, ItemKey, i, Item, GetRecyclableViewTypeFunction(Item, i), ItemRevisions.get(ItemKey), nil, UpdateResult, nil, t[i - MountedRange.firstIndex + 1]))
				else
					table.insert(Buffer, Entry)
				end
			end
			table.freeze(Buffer)
			Frozen6 = table.freeze({
				version = Frozen6.version,
				entries = Buffer,
				visibleRange = Frozen6.visibleRange,
				mountedRange = Frozen6.mountedRange,
				scrollState = Frozen6.scrollState,
				contentStartOffset = Frozen6.contentStartOffset,
				contentLength = Frozen6.contentLength,
				requiresItemMeasurement = Frozen6.requiresItemMeasurement
			})
			config.entryIdentity = Revisions.identity
			config.entryLayoutGeometry = Revisions.layoutGeometry
			config.entryPlacementGeometry = Revisions.placementGeometry
			config.entryRange = Revisions.range
			config.entryScroll = Revisions.scroll
			
			return true, true
		elseif v1 or p2.hasViewportPlacements or IsNotEntryIdentityMatch or not IsNotEntryLayoutGeometryMatch then
			local t = {}
			
			for _, entry1 in Frozen6.entries do
				t[entry1.key] = entry1
			end
			local List = {}
			local t1 = {}
			local t2 = {}
			
			if IsNotEntryLayoutGeometryMatch and not TypesModule.isIndexRangeEmpty(MountedRange) and p2.layout.getItemLayouts ~= nil then
				p2.layout.getItemLayouts(MountedRange.firstIndex, MountedRange.lastIndex, t2)
			end
			if not TypesModule.isIndexRangeEmpty(MountedRange) then
				for i2 = MountedRange.firstIndex, MountedRange.lastIndex do
					local ItemKey = p2.dataSource.getItemKey(i2)
					local Entry = t[ItemKey]
					
					if p2.hasViewportPlacements or (not v1 or IsNotEntryIdentityMatch or IsNotEntryLayoutGeometryMatch or Entry == nil or Entry.index ~= i2) then
						local Item = if IsNotEntryIdentityMatch or Entry == nil or Entry.index ~= i2 then p2.dataSource.getItem(i2) else Entry.value
						table.insert(List, makeEntry(p2, ItemKey, i2, Item, if IsNotEntryIdentityMatch or Entry == nil or Entry.index ~= i2 then GetRecyclableViewTypeFunction(Item, i2) else Entry.recyclableViewType, if IsNotEntryIdentityMatch or Entry == nil or Entry.index ~= i2 then ItemRevisions.get(ItemKey) else Entry.identity.revision, nil, UpdateResult, Entry, t2[i2 - MountedRange.firstIndex + 1]))
					else
						table.insert(List, Entry)
					end
					t1[ItemKey] = true
				end
			end
			for _, retainedItem in UpdateResult.retainedItems do
				if not t1[retainedItem.key] then
					local Item = p2.dataSource.getItem(retainedItem.index)
					local Entry = t[retainedItem.key]
					table.insert(List, makeEntry(p2, retainedItem.key, retainedItem.index, Item, if Entry == nil then GetRecyclableViewTypeFunction(Item, retainedItem.index) else Entry.recyclableViewType, ItemRevisions.get(retainedItem.key), nil, UpdateResult, Entry, nil))
					t1[retainedItem.key] = true
				end
			end
			for _, additionalAssignment in UpdateResult.additionalAssignments do
				assert(not t1[additionalAssignment.key], `Virtualizer: duplicate snapshot key "{additionalAssignment.key}"`)
				table.insert(List, makeEntry(p2, additionalAssignment.key, nil, additionalAssignment.value, additionalAssignment.itemViewType, additionalAssignment.identity.revision, additionalAssignment.identity.position, UpdateResult, t[additionalAssignment.key], nil))
			end
			local Flag = #List ~= #Frozen6.entries
			local Flag1: boolean = Flag
			
			if not Flag1 then
				for i3, value in List do
					local IsEntryMatch = value == Frozen6.entries[i3]
					
					if not IsEntryMatch then
						Flag1 = true
						IsEntryMatch = ContainsEqualFunction(value, Frozen6.entries[i3], Frozen4) and ContainsEqualFunction(value.identity, Frozen6.entries[i3].identity, Frozen5)
					end
					if not IsEntryMatch then
						Flag = true
					end
				end
			end
			if Flag1 then
				table.freeze(List)
				Frozen6 = table.freeze({
					version = Frozen6.version,
					entries = List,
					visibleRange = Frozen6.visibleRange,
					mountedRange = Frozen6.mountedRange,
					scrollState = Frozen6.scrollState,
					contentStartOffset = Frozen6.contentStartOffset,
					contentLength = Frozen6.contentLength,
					requiresItemMeasurement = Frozen6.requiresItemMeasurement
				})
			end
			config.entryIdentity = Revisions.identity
			config.entryLayoutGeometry = Revisions.layoutGeometry
			config.entryPlacementGeometry = Revisions.placementGeometry
			config.entryRange = Revisions.range
			config.entryScroll = Revisions.scroll
			
			return Flag, Flag1
		else
			local t3 = {}
			
			if #Frozen6.entries > 0 and p2.layout.getItemLayouts ~= nil then
				p2.layout.getItemLayouts(MountedRange.firstIndex, MountedRange.lastIndex, t3)
			end
			local Buffer = table.create(#Frozen6.entries)
			local v2 = false
			
			for i1, entry in Frozen6.entries do
				local Entry = makeEntry(p2, entry.key, entry.index, entry.value, entry.recyclableViewType, entry.identity.revision, nil, UpdateResult, entry, t3[i1])
				Buffer[i1] = Entry
				v2 = v2 or Entry ~= entry
			end
			if v2 then
				table.freeze(Buffer)
				Frozen6 = table.freeze({
					version = Frozen6.version,
					entries = Buffer,
					visibleRange = Frozen6.visibleRange,
					mountedRange = Frozen6.mountedRange,
					scrollState = Frozen6.scrollState,
					contentStartOffset = Frozen6.contentStartOffset,
					contentLength = Frozen6.contentLength,
					requiresItemMeasurement = Frozen6.requiresItemMeasurement
				})
			end
			config.entryIdentity = Revisions.identity
			config.entryLayoutGeometry = Revisions.layoutGeometry
			config.entryPlacementGeometry = Revisions.placementGeometry
			config.entryRange = Revisions.range
			config.entryScroll = Revisions.scroll
			
			return false, v2
		end
	end
	
	return {
		commit = function(p3) --[[ Line: 497 ]]
			-- upvalues: materializeEntries (copy), config (copy), Frozen6 (ref), CloneFrozenFunction (upval), Frozen3 (upval)
			local Revisions = p3.revisions
			local MaterializeEntriesResult, MaterializeEntriesResult2 = materializeEntries(p3)
			local IsNotSnapshotRangeMatch = config.snapshotRange ~= Revisions.range
			local IsNotSnapshotScrollMatch = config.snapshotScroll ~= Revisions.scroll
			local IsNotSnapshotLayoutGeometryMatch = config.snapshotLayoutGeometry ~= Revisions.layoutGeometry
			local IsNotSnapshotRangeMatch1: boolean = IsNotSnapshotRangeMatch
			
			if IsNotSnapshotRangeMatch1 then
				local VisibleRange = Frozen6.visibleRange
				local VisibleRange1 = p3.visibleRange
				IsNotSnapshotRangeMatch1 = not (VisibleRange.firstIndex == VisibleRange1.firstIndex and VisibleRange.lastIndex == VisibleRange1.lastIndex)
			end
			local IsNotSnapshotRangeMatch2: boolean = IsNotSnapshotRangeMatch
			
			if IsNotSnapshotRangeMatch2 then
				local MountedRange = Frozen6.mountedRange
				local MountedRange1 = p3.mountedRange
				IsNotSnapshotRangeMatch2 = not (MountedRange.firstIndex == MountedRange1.firstIndex and MountedRange.lastIndex == MountedRange1.lastIndex)
			end
			if MaterializeEntriesResult2 or (IsNotSnapshotRangeMatch1 or (IsNotSnapshotRangeMatch2 or (IsNotSnapshotScrollMatch or IsNotSnapshotLayoutGeometryMatch and (Frozen6.contentStartOffset ~= p3.contentStartOffset or (Frozen6.contentLength ~= p3.contentLength or Frozen6.requiresItemMeasurement ~= p3.requiresItemMeasurement))))) then
				Frozen6 = table.freeze({
					version = Frozen6.version + 1,
					entries = Frozen6.entries,
					visibleRange = if IsNotSnapshotRangeMatch1 then CloneFrozenFunction(p3.visibleRange) else Frozen6.visibleRange,
					mountedRange = if IsNotSnapshotRangeMatch2 then CloneFrozenFunction(p3.mountedRange) else Frozen6.mountedRange,
					scrollState = if IsNotSnapshotScrollMatch then CloneFrozenFunction(p3.scrollState) else Frozen6.scrollState,
					contentStartOffset = p3.contentStartOffset,
					contentLength = p3.contentLength,
					requiresItemMeasurement = p3.requiresItemMeasurement
				})
			end
			config.snapshotLayoutGeometry = Revisions.layoutGeometry
			config.snapshotRange = Revisions.range
			config.snapshotScroll = Revisions.scroll
			
			return {
				snapshot = Frozen6,
				presentation = if MaterializeEntriesResult or MaterializeEntriesResult2 then table.freeze({
					assignmentsChanged = MaterializeEntriesResult,
					placementChanged = MaterializeEntriesResult2
				}) else Frozen3
			}
		end,
		getSnapshot = function() --[[ Line: 546 ]]
			-- upvalues: Frozen6 (ref)
			return Frozen6
		end
	}
end
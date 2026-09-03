local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.DataSource)
local _ = require(viewRecycler.Core.Layout)
local placementTypesModule = require(viewRecycler.Core.Placement.PlacementTypes)
local shallowTableModule = require(viewRecycler.Internal.ShallowTable)
local typesModule = require(viewRecycler.Core.Types)
local _ = require(viewRecycler.Core.Virtualizer.VirtualizerSnapshot)
local _ = require(viewRecycler.Core.Virtualizer.ItemRevisionTracker)
local _ = require(viewRecycler.Core.PinnedItems.createPinnedItemPlanner)
local cloneFrozen = shallowTableModule.cloneFrozen
local containsEqual = shallowTableModule.containsEqual
local optionalContainsEqual = shallowTableModule.optionalContainsEqual
local frozen = table.freeze({ firstIndex = 1, lastIndex = 0 })
local frozen_1 = table.freeze({})
local frozen_2 = table.freeze({
	hasViewportRelativePlacements = false,
	retainedItems = table.freeze({}),
	additionalAssignments = table.freeze({}),
	placements = table.freeze({})
})
local frozen_3 = table.freeze({ assignmentsChanged = false, placementChanged = false })
local ITEM_LAYOUT_KEYS = typesModule.ITEM_LAYOUT_KEYS
local ITEM_PLACEMENT_KEYS = placementTypesModule.ITEM_PLACEMENT_KEYS
local frozen_4 = table.freeze({ "key" })
local frozen_5 = table.freeze({ "revision" })

local function _(p1, p2)
	return p1.firstIndex == p2.firstIndex and p1.lastIndex == p2.lastIndex
end

return function(p1)
	-- upvalues: frozen (ref), cloneFrozen (ref), frozen_1 (ref), containsEqual (ref), ITEM_PLACEMENT_KEYS (ref), optionalContainsEqual (ref), ITEM_LAYOUT_KEYS (ref), placementTypesModule (ref), frozen_2 (ref), typesModule (ref), frozen_4 (ref), frozen_5 (ref), frozen_3 (ref)
	local planner = p1.planner
	local itemRevisions = p1.itemRevisions
	local getRecyclableViewType = p1.getRecyclableViewType
	local t = {
		entryIdentity = 0,
		entryLayoutGeometry = 0,
		entryPlacementGeometry = 0,
		entryRange = 0,
		entryScroll = 0,
		snapshotLayoutGeometry = 0,
		snapshotRange = 0,
		snapshotScroll = 0
	}
	local frozen_6 = table.freeze({
		version = 0,
		contentStartOffset = 0,
		contentLength = 0,
		entries = table.freeze({}),
		visibleRange = frozen,
		mountedRange = frozen,
		scrollState = cloneFrozen(p1.initialScrollState),
		requiresItemMeasurement = p1.initialRequiresItemMeasurement
	})
	
	local function _(p2)
		-- upvalues: t (ref)
		t.entryIdentity = p2.identity
		t.entryLayoutGeometry = p2.layoutGeometry
		t.entryPlacementGeometry = p2.placementGeometry
		t.entryRange = p2.range
		t.entryScroll = p2.scroll
	end
	
	local function resolvePlacement(p2, p3, p4)
		-- upvalues: frozen_1 (copy)
		local var1 = p3.placements[p2]
		
		if var1 == nil then
			return frozen_1, nil
		elseif var1.viewportRelative then
			return table.freeze({
				mainAxisOffset = p4 + (var1.mainAxisOffset or 0),
				mainAxisLength = var1.mainAxisLength,
				zIndex = var1.zIndex
			}), table.freeze({
				viewportRelative = true,
				mainAxisOffset = var1.mainAxisOffset,
				mainAxisLength = var1.mainAxisLength,
				zIndex = var1.zIndex
			})
		end
		return table.freeze({
			mainAxisOffset = var1.mainAxisOffset,
			mainAxisLength = var1.mainAxisLength,
			zIndex = var1.zIndex
		}), nil
	end
	
	local function makeEntry(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
		-- upvalues: frozen_1 (copy), resolvePlacement (ref), containsEqual (copy), ITEM_PLACEMENT_KEYS (copy), optionalContainsEqual (copy), ITEM_LAYOUT_KEYS (copy), placementTypesModule (copy), cloneFrozen (copy)
		local var1 = if p4 == nil then {
			startOffset = 0,
			length = p9.placements[p3].mainAxisLength or 0
		} else p11 or p2.layout.getItemLayout(p4)
		local var2 = frozen_1
		local viewportPlacement = nil
		
		if p2.hasViewportPlacements then
			local var3, var4 = resolvePlacement(p3, p9, p2.scrollState.scrollOffset)
			var2 = var3
			viewportPlacement = var4
		end
		if p10 ~= nil and containsEqual(p10.canvasPlacement, var2, ITEM_PLACEMENT_KEYS) then
			var2 = p10.canvasPlacement
		end
		if p10 ~= nil and optionalContainsEqual(p10.viewportPlacement, viewportPlacement, ITEM_PLACEMENT_KEYS) then
			viewportPlacement = p10.viewportPlacement
		end
		if p10 ~= nil and containsEqual(p10.itemLayout, var1, ITEM_LAYOUT_KEYS) then
			var1 = p10.itemLayout
		end
		if p10 ~= nil and p10.index == p4 and (p10.value == p5 and p10.recyclableViewType == p6) and (p10.identity.revision == p7 and containsEqual(p10.itemLayout, var1, ITEM_LAYOUT_KEYS) and (containsEqual(p10.canvasPlacement, var2, ITEM_PLACEMENT_KEYS) and optionalContainsEqual(p10.viewportPlacement, viewportPlacement, ITEM_PLACEMENT_KEYS))) then
			return p10
		end
		local var5 = p10 ~= nil and (p10.index == p4 and (p10.identity.revision == p7 and p10.identity.kind == placementTypesModule.IdentityKind.Pinned == (p8 ~= nil)))
		
		return table.freeze({
			key = p3,
			index = p4,
			value = p5,
			recyclableViewType = p6,
			identity = if var5 then p10.identity elseif p8 == nil then table.freeze({
				kind = placementTypesModule.IdentityKind.Data,
				index = p4,
				revision = p7
			}) else table.freeze({
				kind = placementTypesModule.IdentityKind.Pinned,
				position = p8,
				revision = p7
			}),
			itemLayout = if table.isfrozen(var1) then var1 elseif p11 ~= nil then cloneFrozen(var1) else table.freeze(var1),
			canvasPlacement = var2,
			viewportPlacement = viewportPlacement,
			measurementIdentity = if var5 then p10.measurementIdentity else table.freeze({
				itemIndex = p4,
				itemKey = p3,
				itemRevision = p7,
				pinnedPosition = p8
			})
		})
	end
	
	local function materializeEntries(p2)
		-- upvalues: t (ref), frozen_6 (write), planner (ref), frozen_2 (copy), typesModule (copy), makeEntry (ref), getRecyclableViewType (ref), itemRevisions (ref), containsEqual (copy), frozen_4 (copy), frozen_5 (copy)
		local revisions = p2.revisions
		local mountedRange = p2.mountedRange
		local var1 = false
		
		if t.entryRange ~= revisions.range then
			local mountedRange_1 = frozen_6.mountedRange
			var1 = not (mountedRange_1.firstIndex == mountedRange.firstIndex and mountedRange_1.lastIndex == mountedRange.lastIndex)
		end
		local var2 = t.entryIdentity ~= revisions.identity
		local var3 = t.entryLayoutGeometry ~= revisions.layoutGeometry
		
		if not var1 and not var2 and (not var3 and not (t.entryPlacementGeometry ~= revisions.placementGeometry)) and not (p2.hasViewportPlacements and t.entryScroll ~= revisions.scroll) then
			t.entryRange = revisions.range
			t.entryScroll = revisions.scroll
			
			return false, false
		end
		local var4
		local var5 = if p2.hasViewportPlacements then planner.update({
			dataSource = p2.dataSource,
			layout = p2.layout,
			scrollOffset = p2.scrollState.scrollOffset,
			viewportLength = p2.scrollState.viewportLength,
			contentStartOffset = p2.contentStartOffset
		}) else frozen_2
		
		if var1 and not p2.hasViewportPlacements and (not var2 and not var3) then
			local var6 = if typesModule.isIndexRangeEmpty(mountedRange) then 0 else mountedRange.lastIndex - mountedRange.firstIndex + 1
			local list = table.create(var6)
			local t_1 = {}
			
			if var6 > 0 and p2.layout.getItemLayouts ~= nil then
				p2.layout.getItemLayouts(mountedRange.firstIndex, mountedRange.lastIndex, t_1)
			end
			for i = mountedRange.firstIndex, mountedRange.lastIndex do
				var4 = frozen_6.entries[i - frozen_6.mountedRange.firstIndex + 1]
				
				if var4 == nil or var4.index ~= i then
					local itemKey = p2.dataSource.getItemKey(i)
					local item = p2.dataSource.getItem(i)
					table.insert(list, makeEntry(p2, itemKey, i, item, getRecyclableViewType(item, i), itemRevisions.get(itemKey), nil, var5, nil, t_1[i - mountedRange.firstIndex + 1]))
				else
					table.insert(list, var4)
				end
			end
			table.freeze(list)
			frozen_6 = table.freeze({
				version = frozen_6.version,
				entries = list,
				visibleRange = frozen_6.visibleRange,
				mountedRange = frozen_6.mountedRange,
				scrollState = frozen_6.scrollState,
				contentStartOffset = frozen_6.contentStartOffset,
				contentLength = frozen_6.contentLength,
				requiresItemMeasurement = frozen_6.requiresItemMeasurement
			})
			t.entryIdentity = revisions.identity
			t.entryLayoutGeometry = revisions.layoutGeometry
			t.entryPlacementGeometry = revisions.placementGeometry
			t.entryRange = revisions.range
			t.entryScroll = revisions.scroll
			
			return true, true
		elseif var1 or p2.hasViewportPlacements or (var2 or not var3) then
			local t_1 = {}
			
			for i_1, v_1 in frozen_6.entries do
				t_1[v_1.key] = v_1
			end
			local var7
			local t_2 = {}
			local t_3 = {}
			local t_4 = {}
			
			if var3 and not typesModule.isIndexRangeEmpty(mountedRange) and p2.layout.getItemLayouts ~= nil then
				p2.layout.getItemLayouts(mountedRange.firstIndex, mountedRange.lastIndex, t_4)
			end
			if not typesModule.isIndexRangeEmpty(mountedRange) then
				for i_2 = mountedRange.firstIndex, mountedRange.lastIndex do
					var4 = p2.dataSource.getItemKey(i_2)
					var7 = t_1[var4]
					
					if not p2.hasViewportPlacements and var1 and (not var2 and not var3) and (var7 ~= nil and var7.index == i_2) then
						table.insert(t_2, var7)
						t_3[var4] = true
					end
					local var8 = if var2 or var7 == nil or var7.index ~= i_2 then p2.dataSource.getItem(i_2) else var7.value
					table.insert(t_2, makeEntry(p2, var4, i_2, var8, if var2 or var7 == nil or var7.index ~= i_2 then getRecyclableViewType(var8, i_2) else var7.recyclableViewType, if var2 or var7 == nil or var7.index ~= i_2 then itemRevisions.get(var4) else var7.identity.revision, nil, var5, var7, t_4[i_2 - mountedRange.firstIndex + 1]))
				end
			end
			for var4, var7 in var5.retainedItems do
				if not t_3[var7.key] then
					local item = p2.dataSource.getItem(var7.index)
					local key = t_1[var7.key]
					table.insert(t_2, makeEntry(p2, var7.key, var7.index, item, if key ~= nil then getRecyclableViewType(item, var7.index) else key.recyclableViewType, itemRevisions.get(var7.key), nil, var5, key, nil))
					t_3[var7.key] = true
				end
			end
			for var4, var7 in var5.additionalAssignments do
				assert(not t_3[var7.key], `Virtualizer: duplicate snapshot key "{var39.key}"`)
				table.insert(t_2, makeEntry(p2, var7.key, nil, var7.value, var7.itemViewType, var7.identity.revision, var7.identity.position, var5, t_1[var7.key], nil))
			end
			local var9 = #t_2 ~= #frozen_6.entries
			local var10 = var9
			
			if not var10 then
				for i_5, v_4 in t_2 do
					if v_4 ~= frozen_6.entries[i_5] then
						var10 = true
						
						if not containsEqual(v_4, frozen_6.entries[i_5], frozen_4) or not containsEqual(v_4.identity, frozen_6.entries[i_5].identity, frozen_5) then
							var9 = true
						end
					end
				end
			end
			if var10 then
				table.freeze(t_2)
				frozen_6 = table.freeze({
					version = frozen_6.version,
					entries = t_2,
					visibleRange = frozen_6.visibleRange,
					mountedRange = frozen_6.mountedRange,
					scrollState = frozen_6.scrollState,
					contentStartOffset = frozen_6.contentStartOffset,
					contentLength = frozen_6.contentLength,
					requiresItemMeasurement = frozen_6.requiresItemMeasurement
				})
			end
			t.entryIdentity = revisions.identity
			t.entryLayoutGeometry = revisions.layoutGeometry
			t.entryPlacementGeometry = revisions.placementGeometry
			t.entryRange = revisions.range
			t.entryScroll = revisions.scroll
			
			return var9, var10
		else
			local t_1 = {}
			
			if #frozen_6.entries > 0 and p2.layout.getItemLayouts ~= nil then
				p2.layout.getItemLayouts(mountedRange.firstIndex, mountedRange.lastIndex, t_1)
			end
			local list = table.create(#frozen_6.entries)
			local var11 = false
			
			for i_1, var4 in frozen_6.entries do
				local var12 = makeEntry(p2, var4.key, var4.index, var4.value, var4.recyclableViewType, var4.identity.revision, nil, var5, var4, t_1[i_1])
				list[i_1] = var12
				var11 = var11 or var12 ~= var4
			end
			if var11 then
				table.freeze(list)
				frozen_6 = table.freeze({
					version = frozen_6.version,
					entries = list,
					visibleRange = frozen_6.visibleRange,
					mountedRange = frozen_6.mountedRange,
					scrollState = frozen_6.scrollState,
					contentStartOffset = frozen_6.contentStartOffset,
					contentLength = frozen_6.contentLength,
					requiresItemMeasurement = frozen_6.requiresItemMeasurement
				})
			end
			t.entryIdentity = revisions.identity
			t.entryLayoutGeometry = revisions.layoutGeometry
			t.entryPlacementGeometry = revisions.placementGeometry
			t.entryRange = revisions.range
			t.entryScroll = revisions.scroll
			
			return false, var11
		end
	end
	
	return {
		commit = function(p3)
			-- upvalues: materializeEntries (ref), t (ref), frozen_6 (write), cloneFrozen (copy), frozen_3 (copy)
			local revisions = p3.revisions
			local var13, var14 = materializeEntries(p3)
			local var15 = t.snapshotRange ~= revisions.range
			local var16 = t.snapshotScroll ~= revisions.scroll
			local var17 = t.snapshotLayoutGeometry ~= revisions.layoutGeometry
			local var18 = var15
			
			if var18 then
				local visibleRange = frozen_6.visibleRange
				local visibleRange_1 = p3.visibleRange
				var18 = not (visibleRange.firstIndex == visibleRange_1.firstIndex and visibleRange.lastIndex == visibleRange_1.lastIndex)
			end
			local var19 = var15
			
			if var19 then
				local mountedRange = frozen_6.mountedRange
				local mountedRange_1 = p3.mountedRange
				var19 = not (mountedRange.firstIndex == mountedRange_1.firstIndex and mountedRange.lastIndex == mountedRange_1.lastIndex)
			end
			if var14 or (var18 or (var19 or (var16 or var17 and (if frozen_6.contentStartOffset == p3.contentStartOffset then if frozen_6.contentLength == p3.contentLength then frozen_6.requiresItemMeasurement ~= p3.requiresItemMeasurement else true else true)))) then
				frozen_6 = table.freeze({
					version = frozen_6.version + 1,
					entries = frozen_6.entries,
					visibleRange = if var18 then cloneFrozen(p3.visibleRange) else frozen_6.visibleRange,
					mountedRange = if var19 then cloneFrozen(p3.mountedRange) else frozen_6.mountedRange,
					scrollState = if var16 then cloneFrozen(p3.scrollState) else frozen_6.scrollState,
					contentStartOffset = p3.contentStartOffset,
					contentLength = p3.contentLength,
					requiresItemMeasurement = p3.requiresItemMeasurement
				})
			end
			t.snapshotLayoutGeometry = revisions.layoutGeometry
			t.snapshotRange = revisions.range
			t.snapshotScroll = revisions.scroll
			
			return {
				snapshot = frozen_6,
				presentation = if var13 or var14 then table.freeze({ assignmentsChanged = var13, placementChanged = var14 }) else frozen_3
			}
		end,
		getSnapshot = function()
			-- upvalues: frozen_6 (write)
			return frozen_6
		end
	}
end
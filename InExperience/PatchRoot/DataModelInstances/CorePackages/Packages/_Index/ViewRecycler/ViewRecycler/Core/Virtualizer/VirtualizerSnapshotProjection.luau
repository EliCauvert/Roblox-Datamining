local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local _ = require(viewRecycler.Core.DataSource)
local _ = require(viewRecycler.Core.Layout)
local placementTypesModule = require(viewRecycler.Core.Placement.PlacementTypes)
local recordModule = require(viewRecycler.Internal.Record)
local typesModule = require(viewRecycler.Core.Types)
local _ = require(viewRecycler.Core.Virtualizer.VirtualizerSnapshot)
local _ = require(viewRecycler.Core.Virtualizer.ItemRevisionTracker)
local _ = require(viewRecycler.Core.PinnedItems.createPinnedItemPlanner)
local cloneFrozen = recordModule.cloneFrozen
local containsEqual = recordModule.containsEqual
local optionalContainsEqual = recordModule.optionalContainsEqual
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

local function _(p0, p1)
	return p0.firstIndex == p1.firstIndex and p0.lastIndex == p1.lastIndex
end

return function(p2)
	-- upvalues: frozen (ref), cloneFrozen (ref), frozen_1 (ref), containsEqual (ref), ITEM_PLACEMENT_KEYS (ref), optionalContainsEqual (ref), ITEM_LAYOUT_KEYS (ref), placementTypesModule (ref), frozen_2 (ref), typesModule (ref), frozen_4 (ref), frozen_5 (ref), frozen_3 (ref)
	local planner = p2.planner
	local itemRevisions = p2.itemRevisions
	local getRecyclableViewType = p2.getRecyclableViewType
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
		scrollState = cloneFrozen(p2.initialScrollState),
		requiresItemMeasurement = p2.initialRequiresItemMeasurement
	})
	
	local function _(p3)
		-- upvalues: t (ref)
		t.entryIdentity = p3.identity
		t.entryLayoutGeometry = p3.layoutGeometry
		t.entryPlacementGeometry = p3.placementGeometry
		t.entryRange = p3.range
		t.entryScroll = p3.scroll
	end
	
	local function resolvePlacement(p4, p5, p6)
		-- upvalues: frozen_1 (copy)
		local var15 = p5.placements[p4]
		
		if var15 == nil then
			return frozen_1, nil
		elseif var15.viewportRelative then
			return table.freeze({
				mainAxisOffset = p6 + (var15.mainAxisOffset or 0),
				mainAxisLength = var15.mainAxisLength,
				zIndex = var15.zIndex
			}), table.freeze({
				viewportRelative = true,
				mainAxisOffset = var15.mainAxisOffset,
				mainAxisLength = var15.mainAxisLength,
				zIndex = var15.zIndex
			})
		end
		return table.freeze({
			mainAxisOffset = var15.mainAxisOffset,
			mainAxisLength = var15.mainAxisLength,
			zIndex = var15.zIndex
		}), nil
	end
	
	local function makeEntry(p7, p8, p9, p10, p11, p12, p13, p14, p15, p16)
		-- upvalues: frozen_1 (copy), resolvePlacement (ref), containsEqual (copy), ITEM_PLACEMENT_KEYS (copy), optionalContainsEqual (copy), ITEM_LAYOUT_KEYS (copy), placementTypesModule (copy), cloneFrozen (copy)
		local var16 = if p9 == nil then {
			startOffset = 0,
			length = p14.placements[p8].mainAxisLength or 0
		} else p16 or p7.layout.getItemLayout(p9)
		local var17 = frozen_1
		local viewportPlacement = nil
		
		if p7.hasViewportPlacements then
			local var18, var19 = resolvePlacement(p8, p14, p7.scrollState.scrollOffset)
			var17 = var18
			viewportPlacement = var19
		end
		if p15 ~= nil and containsEqual(p15.canvasPlacement, var17, ITEM_PLACEMENT_KEYS) then
			var17 = p15.canvasPlacement
		end
		if p15 ~= nil and optionalContainsEqual(p15.viewportPlacement, viewportPlacement, ITEM_PLACEMENT_KEYS) then
			viewportPlacement = p15.viewportPlacement
		end
		if p15 ~= nil and containsEqual(p15.itemLayout, var16, ITEM_LAYOUT_KEYS) then
			var16 = p15.itemLayout
		end
		if p15 ~= nil and p15.index == p9 and (p15.value == p10 and p15.recyclableViewType == p11) and (p15.identity.revision == p12 and containsEqual(p15.itemLayout, var16, ITEM_LAYOUT_KEYS) and (containsEqual(p15.canvasPlacement, var17, ITEM_PLACEMENT_KEYS) and optionalContainsEqual(p15.viewportPlacement, viewportPlacement, ITEM_PLACEMENT_KEYS))) then
			return p15
		end
		local var20 = p15 ~= nil and (p15.index == p9 and (p15.identity.revision == p12 and p15.identity.kind == placementTypesModule.IdentityKind.Pinned == (p13 ~= nil)))
		
		return table.freeze({
			key = p8,
			index = p9,
			value = p10,
			recyclableViewType = p11,
			identity = if var20 then p15.identity elseif p13 == nil then table.freeze({
				kind = placementTypesModule.IdentityKind.Data,
				index = p9,
				revision = p12
			}) else table.freeze({
				kind = placementTypesModule.IdentityKind.Pinned,
				position = p13,
				revision = p12
			}),
			itemLayout = if table.isfrozen(var16) then var16 elseif p16 ~= nil then cloneFrozen(var16) else table.freeze(var16),
			canvasPlacement = var17,
			viewportPlacement = viewportPlacement,
			measurementIdentity = if var20 then p15.measurementIdentity else table.freeze({
				itemIndex = p9,
				itemKey = p8,
				itemRevision = p12,
				pinnedPosition = p13
			})
		})
	end
	
	local function materializeEntries(p17)
		-- upvalues: t (ref), frozen_6 (write), planner (ref), frozen_2 (copy), typesModule (copy), makeEntry (ref), getRecyclableViewType (ref), itemRevisions (ref), containsEqual (copy), frozen_4 (copy), frozen_5 (copy)
		local revisions = p17.revisions
		local mountedRange = p17.mountedRange
		local var21 = false
		
		if t.entryRange ~= revisions.range then
			local mountedRange_1 = frozen_6.mountedRange
			var21 = not (mountedRange_1.firstIndex == mountedRange.firstIndex and mountedRange_1.lastIndex == mountedRange.lastIndex)
		end
		local var22 = t.entryIdentity ~= revisions.identity
		local var23 = t.entryLayoutGeometry ~= revisions.layoutGeometry
		
		if not var21 and not var22 and (not var23 and not (t.entryPlacementGeometry ~= revisions.placementGeometry)) and not (p17.hasViewportPlacements and t.entryScroll ~= revisions.scroll) then
			t.entryRange = revisions.range
			t.entryScroll = revisions.scroll
			
			return false, false
		end
		local var28
		local var24 = if p17.hasViewportPlacements then planner.update({
			dataSource = p17.dataSource,
			layout = p17.layout,
			scrollOffset = p17.scrollState.scrollOffset,
			viewportLength = p17.scrollState.viewportLength,
			contentStartOffset = p17.contentStartOffset
		}) else frozen_2
		
		if var21 and not p17.hasViewportPlacements and (not var22 and not var23) then
			local var25 = if typesModule.isIndexRangeEmpty(mountedRange) then 0 else mountedRange.lastIndex - mountedRange.firstIndex + 1
			local list = table.create(var25)
			local t_1 = {}
			
			if var25 > 0 and p17.layout.getItemLayouts ~= nil then
				p17.layout.getItemLayouts(mountedRange.firstIndex, mountedRange.lastIndex, t_1)
			end
			for i = mountedRange.firstIndex, mountedRange.lastIndex do
				var28 = frozen_6.entries[i - frozen_6.mountedRange.firstIndex + 1]
				
				if var28 == nil or var28.index ~= i then
					local itemKey = p17.dataSource.getItemKey(i)
					local item = p17.dataSource.getItem(i)
					table.insert(list, makeEntry(p17, itemKey, i, item, getRecyclableViewType(item, i), itemRevisions.get(itemKey), nil, var24, nil, t_1[i - mountedRange.firstIndex + 1]))
				else
					table.insert(list, var28)
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
		elseif var21 or p17.hasViewportPlacements or (var22 or not var23) then
			local t_1 = {}
			
			for i_1, v_1 in frozen_6.entries do
				t_1[v_1.key] = v_1
			end
			local var39
			local t_2 = {}
			local t_3 = {}
			local t_4 = {}
			
			if var23 and not typesModule.isIndexRangeEmpty(mountedRange) and p17.layout.getItemLayouts ~= nil then
				p17.layout.getItemLayouts(mountedRange.firstIndex, mountedRange.lastIndex, t_4)
			end
			if not typesModule.isIndexRangeEmpty(mountedRange) then
				for i_2 = mountedRange.firstIndex, mountedRange.lastIndex do
					var28 = p17.dataSource.getItemKey(i_2)
					var39 = t_1[var28]
					
					if not p17.hasViewportPlacements and var21 and (not var22 and not var23) and (var39 ~= nil and var39.index == i_2) then
						table.insert(t_2, var39)
						t_3[var28] = true
					end
					local var40 = if var22 or var39 == nil or var39.index ~= i_2 then p17.dataSource.getItem(i_2) else var39.value
					table.insert(t_2, makeEntry(p17, var28, i_2, var40, if var22 or var39 == nil or var39.index ~= i_2 then getRecyclableViewType(var40, i_2) else var39.recyclableViewType, if var22 or var39 == nil or var39.index ~= i_2 then itemRevisions.get(var28) else var39.identity.revision, nil, var24, var39, t_4[i_2 - mountedRange.firstIndex + 1]))
				end
			end
			for var28, var39 in var24.retainedItems do
				if not t_3[var39.key] then
					local item = p17.dataSource.getItem(var39.index)
					local key = t_1[var39.key]
					table.insert(t_2, makeEntry(p17, var39.key, var39.index, item, if key ~= nil then getRecyclableViewType(item, var39.index) else key.recyclableViewType, itemRevisions.get(var39.key), nil, var24, key, nil))
					t_3[var39.key] = true
				end
			end
			for var28, var39 in var24.additionalAssignments do
				assert(not t_3[var39.key], `Virtualizer: duplicate snapshot key "{var39.key}"`)
				table.insert(t_2, makeEntry(p17, var39.key, nil, var39.value, var39.itemViewType, var39.identity.revision, var39.identity.position, var24, t_1[var39.key], nil))
			end
			local var41 = #t_2 ~= #frozen_6.entries
			local var42 = var41
			
			if not var42 then
				for i_5, v_4 in t_2 do
					if v_4 ~= frozen_6.entries[i_5] then
						var42 = true
						
						if not containsEqual(v_4, frozen_6.entries[i_5], frozen_4) or not containsEqual(v_4.identity, frozen_6.entries[i_5].identity, frozen_5) then
							var41 = true
						end
					end
				end
			end
			if var42 then
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
			
			return var41, var42
		else
			local t_1 = {}
			
			if #frozen_6.entries > 0 and p17.layout.getItemLayouts ~= nil then
				p17.layout.getItemLayouts(mountedRange.firstIndex, mountedRange.lastIndex, t_1)
			end
			local list = table.create(#frozen_6.entries)
			local var33 = false
			
			for i_1, var28 in frozen_6.entries do
				local var34 = makeEntry(p17, var28.key, var28.index, var28.value, var28.recyclableViewType, var28.identity.revision, nil, var24, var28, t_1[i_1])
				list[i_1] = var34
				var33 = var33 or var34 ~= var28
			end
			if var33 then
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
			
			return false, var33
		end
	end
	
	return {
		commit = function(p18)
			-- upvalues: materializeEntries (ref), t (ref), frozen_6 (write), cloneFrozen (copy), frozen_3 (copy)
			local revisions = p18.revisions
			local var44, var45 = materializeEntries(p18)
			local var46 = t.snapshotRange ~= revisions.range
			local var47 = t.snapshotScroll ~= revisions.scroll
			local var48 = t.snapshotLayoutGeometry ~= revisions.layoutGeometry
			local var49 = var46
			
			if var49 then
				local visibleRange = frozen_6.visibleRange
				local visibleRange_1 = p18.visibleRange
				var49 = not (visibleRange.firstIndex == visibleRange_1.firstIndex and visibleRange.lastIndex == visibleRange_1.lastIndex)
			end
			local var50 = var46
			
			if var50 then
				local mountedRange = frozen_6.mountedRange
				local mountedRange_1 = p18.mountedRange
				var50 = not (mountedRange.firstIndex == mountedRange_1.firstIndex and mountedRange.lastIndex == mountedRange_1.lastIndex)
			end
			if var45 or (var49 or (var50 or (var47 or var48 and (if frozen_6.contentStartOffset == p18.contentStartOffset then if frozen_6.contentLength == p18.contentLength then frozen_6.requiresItemMeasurement ~= p18.requiresItemMeasurement else true else true)))) then
				frozen_6 = table.freeze({
					version = frozen_6.version + 1,
					entries = frozen_6.entries,
					visibleRange = if var49 then cloneFrozen(p18.visibleRange) else frozen_6.visibleRange,
					mountedRange = if var50 then cloneFrozen(p18.mountedRange) else frozen_6.mountedRange,
					scrollState = if var47 then cloneFrozen(p18.scrollState) else frozen_6.scrollState,
					contentStartOffset = p18.contentStartOffset,
					contentLength = p18.contentLength,
					requiresItemMeasurement = p18.requiresItemMeasurement
				})
			end
			t.snapshotLayoutGeometry = revisions.layoutGeometry
			t.snapshotRange = revisions.range
			t.snapshotScroll = revisions.scroll
			
			return {
				snapshot = frozen_6,
				presentation = if var44 or var45 then table.freeze({ assignmentsChanged = var44, placementChanged = var45 }) else frozen_3
			}
		end,
		getSnapshot = function()
			-- upvalues: frozen_6 (write)
			return frozen_6
		end
	}
end
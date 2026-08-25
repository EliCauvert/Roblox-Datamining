local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataPrefetchModule = require(viewRecycler.Core.DataPrefetch)
local _ = require(viewRecycler.Core.DataSource)
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local diagnosticsModule = require(viewRecycler.Core.Diagnostics)
local _ = require(viewRecycler.Core.Layout)
local overscanPolicyModule = require(viewRecycler.Core.OverscanPolicy)
local _ = require(viewRecycler.Core.PinnedItems)
local cloneFrozen = require(viewRecycler.Internal.Record).cloneFrozen
local _ = require(viewRecycler.Core.Enums.ScrollAlignment)
local scrollObservationKindModule = require(viewRecycler.Core.Enums.ScrollObservationKind)
local typesModule = require(viewRecycler.Core.Types)
local virtualizerCommandTypeModule = require(viewRecycler.Core.Enums.VirtualizerCommandType)
local external = virtualizerCommandTypeModule.External
local internal = virtualizerCommandTypeModule.Internal
local virtualizerEffectTypeModule = require(viewRecycler.Core.Enums.VirtualizerEffectType)
local virtualizerQueryTypeModule = require(viewRecycler.Core.Enums.VirtualizerQueryType)
local _ = require(viewRecycler.Core.Virtualizer.VirtualizerSnapshot)
local dataPrefetchControllerModule = require(viewRecycler.Core.Virtualizer.DataPrefetchController)
local itemRevisionTrackerModule = require(viewRecycler.Core.Virtualizer.ItemRevisionTracker)
local createPinnedItemPlannerModule = require(viewRecycler.Core.PinnedItems.createPinnedItemPlanner)
local scrollPositionControllerModule = require(viewRecycler.Core.Virtualizer.ScrollPositionController)
local viewportModelModule = require(viewRecycler.Core.Virtualizer.ViewportModel)
local virtualizerSnapshotProjectionModule = require(viewRecycler.Core.Virtualizer.VirtualizerSnapshotProjection)
local frozen = table.freeze({ firstIndex = 1, lastIndex = 0 })

local function _(p0, p1)
	return p0.firstIndex == p1.firstIndex and p0.lastIndex == p1.lastIndex
end

local _ = function(p2, p3)
	return p2.scrollOffset == p3.scrollOffset and (p2.viewportLength == p3.viewportLength and (p2.contentLength == p3.contentLength and (p2.distanceFromEnd == p3.distanceFromEnd and (p2.atStart == p3.atStart and p2.atEnd == p3.atEnd))))
end

return function(p4)
	-- upvalues: overscanPolicyModule (ref), itemRevisionTrackerModule (ref), createPinnedItemPlannerModule (ref), viewportModelModule (ref), virtualizerSnapshotProjectionModule (ref), dataPrefetchControllerModule (ref), scrollPositionControllerModule (ref), frozen (ref), virtualizerEffectTypeModule (ref), diagnosticsModule (ref), typesModule (ref), cloneFrozen (ref), dataSourceChangeTypeModule (ref), dataPrefetchModule (ref), external (ref), scrollObservationKindModule (ref), internal (ref), virtualizerQueryTypeModule (ref)
	assert(if p4.overscan ~= nil then p4.overscanPolicy == nil else true, "VirtualizerEngine: overscan and overscanPolicy are mutually exclusive")
	local dataSource = p4.dataSource
	local layout = p4.layout
	local t = {
		overscan = p4.overscan,
		overscanPolicy = p4.overscanPolicy,
		dataPrefetch = p4.dataPrefetch,
		contentAlignment = p4.contentAlignment,
		endThreshold = p4.endThreshold,
		pinnedItems = {
			isItemStickyHeader = p4.isItemStickyHeader,
			pinnedStartItem = p4.pinnedStartItem,
			pinnedEndItem = p4.pinnedEndItem
		},
		preserveScrollPositionOnChange = p4.preserveScrollPositionOnChange ~= false
	}
	local overscanPolicy = t.overscanPolicy or overscanPolicyModule.fixed(t.overscan)
	local preserveScrollPositionOnChange = t.preserveScrollPositionOnChange
	local var19 = itemRevisionTrackerModule()
	local var20 = createPinnedItemPlannerModule(dataSource, t.pinnedItems)
	local var21 = if t.pinnedItems.isItemStickyHeader == nil then if t.pinnedItems.pinnedStartItem == nil then t.pinnedItems.pinnedEndItem ~= nil else true else true
	local var22 = viewportModelModule({
		getLayout = function()
			-- upvalues: layout (write)
			return layout
		end,
		contentAlignment = p4.contentAlignment,
		contentInsetStart = p4.contentInsetStart,
		contentInsetEnd = p4.contentInsetEnd,
		endThreshold = p4.endThreshold
	})
	local var23 = virtualizerSnapshotProjectionModule({
		planner = var20,
		itemRevisions = var19,
		getRecyclableViewType = p4.getRecyclableViewType,
		initialScrollState = var22.getScrollState(),
		initialRequiresItemMeasurement = layout.requiresItemMeasurement()
	})
	local var24 = dataPrefetchControllerModule(t.dataPrefetch)
	local var25 = scrollPositionControllerModule({
		shouldPreserveUserPosition = function()
			-- upvalues: preserveScrollPositionOnChange (write)
			return preserveScrollPositionOnChange
		end,
		getItemCount = function()
			-- upvalues: dataSource (write)
			return dataSource.getItemCount()
		end,
		getItemKey = function(p5)
			-- upvalues: dataSource (write)
			return dataSource.getItemKey(p5)
		end,
		getScrollOffset = var22.getScrollOffset,
		clampScrollOffset = var22.clampScrollOffset,
		getViewportLength = var22.getScrollAxisLength,
		getVisibleRange = var22.getVisibleRange,
		getItemLayout = var22.getPlacedItemLayout,
		getScrollOffsetForItem = var22.getScrollOffsetForItem
	})
	local var26 = false
	local var27 = false
	local var28 = false
	local var29 = frozen
	local var30 = frozen
	local t_1 = {
		identity = 1,
		layoutGeometry = 1,
		placementGeometry = 1,
		range = 0,
		scroll = 0,
		overscanPolicy = 0
	}
	local t_2 = {
		dataSource = dataSource,
		mountedRange = var30,
		options = t.dataPrefetch
	}
	local t_3 = {
		identity = t_1.identity,
		layoutGeometry = t_1.layoutGeometry,
		placementGeometry = t_1.placementGeometry,
		range = t_1.range,
		scroll = t_1.scroll
	}
	local t_4 = {
		contentStartOffset = 0,
		contentLength = 0,
		dataSource = dataSource,
		layout = layout,
		visibleRange = var29,
		mountedRange = var30,
		scrollState = var23.getSnapshot().scrollState,
		requiresItemMeasurement = layout.requiresItemMeasurement(),
		hasViewportPlacements = var21,
		revisions = t_3
	}
	local var35 = nil
	local var36 = nil
	
	local function _(p6)
		-- upvalues: var35 (write), t_1 (ref)
		if var35[p6] then
			return
		end
		var35[p6] = true
		t_1[p6] += 1
	end
	
	local function dataKeys()
		-- upvalues: dataSource (write)
		local list = table.create(dataSource.getItemCount())
		
		for i = 1, dataSource.getItemCount() do
			list[i] = dataSource.getItemKey(i)
		end
		return list
	end
	
	local _ = function(p7, p8)
		-- upvalues: virtualizerEffectTypeModule (copy)
		table.insert(p7, {
			type = virtualizerEffectTypeModule.Diagnostic,
			event = p8
		})
	end
	
	local _ = function(p9, p10, p11)
		-- upvalues: p4 (ref), diagnosticsModule (copy), virtualizerEffectTypeModule (copy)
		if p4.diagnostics ~= nil then
			table.insert(p9, {
				type = virtualizerEffectTypeModule.Diagnostic,
				event = {
					kind = diagnosticsModule.EventKind.RangeChanged,
					rangeKind = p10,
					firstIndex = p11.firstIndex,
					lastIndex = p11.lastIndex
				}
			})
		end
	end
	
	local function refreshRanges(p12)
		-- upvalues: var22 (ref), var29 (write), var30 (write), overscanPolicy (write), layout (write), var36 (write), t_1 (ref), typesModule (copy), frozen (copy), var35 (write), virtualizerEffectTypeModule (copy), cloneFrozen (copy), diagnosticsModule (copy), p4 (ref)
		var22.refreshContentMetrics()
		local visibleRange = var22.getVisibleRange()
		local var48 = overscanPolicy.compute({
			visibleRange = visibleRange,
			scrollOffset = var22.getScrollOffset(),
			viewportLength = var22.getScrollAxisLength(),
			scrollDirection = var22.getScrollDirection(),
			itemCount = layout.getItemCount()
		})
		assert(var48.before >= 0 and (var48.before % 1 == 0 and (var48.after >= 0 and var48.after % 1 == 0)), "VirtualizerEngine: overscan policy must return non-negative integer spans")
		local layoutViewport, layoutViewport_1 = var22.getLayoutViewport()
		var29 = visibleRange
		
		if not (var36 ~= nil and (var36.layoutGeometryVersion == t_1.layoutGeometry and (var36.overscanPolicyVersion == t_1.overscanPolicy and (var36.min <= layoutViewport and (layoutViewport_1 <= var36.max and (var48.before == var36.before and (var48.after == var36.after and (typesModule.isIndexRangeEmpty(visibleRange) or (var30.firstIndex <= visibleRange.firstIndex and visibleRange.lastIndex <= var30.lastIndex))))))))) then
			var30 = if typesModule.isIndexRangeEmpty(visibleRange) then frozen else layout.expandIndexRange(visibleRange, var48.before, var48.after)
			
			if typesModule.isIndexRangeEmpty(var30) then
				var36 = nil
			else
				local itemLayout = layout.getItemLayout(var30.lastIndex)
				var36 = {
					min = layout.getItemLayout(var30.firstIndex).startOffset,
					max = itemLayout.startOffset + itemLayout.length,
					layoutGeometryVersion = t_1.layoutGeometry,
					overscanPolicyVersion = t_1.overscanPolicy,
					before = var48.before,
					after = var48.after
				}
			end
		end
		local var52 = var29
		local var53 = not (var29.firstIndex == var52.firstIndex and var29.lastIndex == var52.lastIndex)
		local var54 = var30
		local var55 = not (var30.firstIndex == var54.firstIndex and var30.lastIndex == var54.lastIndex)
		
		if var53 or var55 then
			local var56 = var35
			
			if not var56.range then
				var56.range = true
				t_1.range += 1
			end
		end
		if var53 then
			table.insert(p12, {
				type = virtualizerEffectTypeModule.VisibleRangeChanged,
				range = cloneFrozen(var29)
			})
			local visible = diagnosticsModule.RangeKind.Visible
			local var57 = var29
			
			if p4.diagnostics ~= nil then
				table.insert(p12, {
					type = virtualizerEffectTypeModule.Diagnostic,
					event = {
						kind = diagnosticsModule.EventKind.RangeChanged,
						rangeKind = visible,
						firstIndex = var57.firstIndex,
						lastIndex = var57.lastIndex
					}
				})
			end
		end
		if var55 then
			table.insert(p12, {
				type = virtualizerEffectTypeModule.MountedRangeChanged,
				range = cloneFrozen(var30)
			})
			local rendered = diagnosticsModule.RangeKind.Rendered
			local var58 = var30
			
			if p4.diagnostics ~= nil then
				table.insert(p12, {
					type = virtualizerEffectTypeModule.Diagnostic,
					event = {
						kind = diagnosticsModule.EventKind.RangeChanged,
						rangeKind = rendered,
						firstIndex = var58.firstIndex,
						lastIndex = var58.lastIndex
					}
				})
			end
		end
		return var55
	end
	
	local function updatePrefetch(p13)
		-- upvalues: t_2 (ref), dataSource (write), var30 (write), t (write), var24 (ref), virtualizerEffectTypeModule (copy)
		t_2.dataSource = dataSource
		t_2.mountedRange = var30
		t_2.options = t.dataPrefetch
		
		for i, v in var24.reconcile(t_2) do
			table.insert(p13, {
				type = virtualizerEffectTypeModule.DataPrefetchRequested,
				request = v
			})
		end
	end
	
	local function commitProjection()
		-- upvalues: var22 (ref), var23 (ref), var35 (write), t_1 (ref), t_3 (ref), t_4 (ref), dataSource (write), layout (write), var29 (write), var30 (write), var21 (write)
		local scrollState = var22.getScrollState()
		local scrollState_1 = var23.getSnapshot().scrollState
		
		if not (scrollState_1.scrollOffset == scrollState.scrollOffset and (scrollState_1.viewportLength == scrollState.viewportLength and (scrollState_1.contentLength == scrollState.contentLength and (scrollState_1.distanceFromEnd == scrollState.distanceFromEnd and (scrollState_1.atStart == scrollState.atStart and scrollState_1.atEnd == scrollState.atEnd))))) then
			local var60 = var35
			
			if not var60.scroll then
				var60.scroll = true
				t_1.scroll += 1
			end
		end
		t_3.identity = t_1.identity
		t_3.layoutGeometry = t_1.layoutGeometry
		t_3.placementGeometry = t_1.placementGeometry
		t_3.range = t_1.range
		t_3.scroll = t_1.scroll
		t_4.dataSource = dataSource
		t_4.layout = layout
		t_4.visibleRange = var29
		t_4.mountedRange = var30
		t_4.scrollState = scrollState
		t_4.contentStartOffset = var22.contentStartOffset(false)
		t_4.contentLength = var22.contentLength(false)
		t_4.requiresItemMeasurement = layout.requiresItemMeasurement()
		t_4.hasViewportPlacements = var21
		
		return var23.commit(t_4)
	end
	
	local function captureAnchorEvidence()
		-- upvalues: typesModule (copy), var29 (write), var22 (ref), dataSource (write)
		if typesModule.isIndexRangeEmpty(var29) then
			return nil
		end
		local t = {}
		
		for i = var29.firstIndex, var29.lastIndex do
			local placedItemLayout = var22.getPlacedItemLayout(i)
			table.insert(t, {
				key = dataSource.getItemKey(i),
				viewportCoordinate = placedItemLayout.startOffset - var22.getScrollOffset(),
				itemLength = placedItemLayout.length
			})
		end
		return {
			scrollOffset = var22.getScrollOffset(),
			viewportLength = var22.getScrollAxisLength(),
			visibleItems = t
		}
	end
	
	local function applyCorrection(p14, p15)
		-- upvalues: var22 (ref), virtualizerEffectTypeModule (copy), p4 (ref), diagnosticsModule (copy)
		if p15 == nil then return end
		local scrollOffset = var22.getScrollOffset()
		var22.setScrollOffset(scrollOffset + p15.delta)
		local var64 = var22.getScrollOffset() - scrollOffset
		
		if math.abs(var64) < 1 then return end
		table.insert(p14, {
			type = virtualizerEffectTypeModule.ScrollCorrection,
			delta = var64
		})
		table.insert(p14, {
			type = virtualizerEffectTypeModule.ScrollPositionChanged,
			offset = var22.getScrollOffset()
		})
		
		if p4.diagnostics ~= nil then
			table.insert(p14, {
				type = virtualizerEffectTypeModule.Diagnostic,
				event = {
					kind = diagnosticsModule.EventKind.ScrollCorrection,
					source = p15.source,
					delta = var64
				}
			})
		end
	end
	
	local function resetLayout(value)
		-- upvalues: dataKeys (ref), var19 (ref), dataSourceChangeTypeModule (copy), layout (write), var22 (ref)
		local value_1 = value or dataKeys()
		var19.applyChange({ type = dataSourceChangeTypeModule.Reset, keys = value_1 })
		layout.applyDataSourceChange({ type = dataSourceChangeTypeModule.Reset, keys = value_1 })
		var22.refreshContentMetrics()
	end
	
	local function applyPolicy(p16)
		-- upvalues: dataPrefetchModule (copy), t (write), overscanPolicy (write), overscanPolicyModule (copy), var35 (write), t_1 (ref), var22 (ref), preserveScrollPositionOnChange (write), var20 (ref), var21 (write)
		assert(if p16.overscan ~= nil then p16.overscanPolicy == nil else true, "VirtualizerEngine: overscan and overscanPolicy are mutually exclusive")
		assert(if p16.overscan ~= nil then p16.overscan >= 0 and p16.overscan % 1 == 0 else true, "VirtualizerEngine: overscan must be a non-negative integer")
		dataPrefetchModule.resolve(p16.dataPrefetch)
		
		if t.overscan ~= p16.overscan or t.overscanPolicy ~= p16.overscanPolicy then
			overscanPolicy = p16.overscanPolicy or overscanPolicyModule.fixed(p16.overscan)
			local var66 = var35
			
			if not var66.overscanPolicy then
				var66.overscanPolicy = true
				t_1.overscanPolicy += 1
			end
		end
		if t.contentAlignment ~= p16.contentAlignment and var22.setContentAlignment(p16.contentAlignment) then
			local var67 = var35
			
			if not var67.layoutGeometry then
				var67.layoutGeometry = true
				t_1.layoutGeometry += 1
			end
		end
		if t.endThreshold ~= p16.endThreshold then
			var22.setEndThreshold(p16.endThreshold)
		end
		if preserveScrollPositionOnChange ~= p16.preserveScrollPositionOnChange then
			preserveScrollPositionOnChange = p16.preserveScrollPositionOnChange
		end
		local contentInsets = var20.getContentInsets()
		
		if var20.setOptions(p16.pinnedItems) then
			local contentInsets_1 = var20.getContentInsets()
			var22.setContentInsets(contentInsets_1.start, contentInsets_1.finish)
			var21 = if p16.pinnedItems.isItemStickyHeader == nil then if p16.pinnedItems.pinnedStartItem == nil then p16.pinnedItems.pinnedEndItem ~= nil else true else true
			
			if not var35.placementGeometry then
				var35.placementGeometry = true
				t_1.placementGeometry += 1
			end
			if t.pinnedItems.pinnedStartItem ~= p16.pinnedItems.pinnedStartItem or t.pinnedItems.pinnedEndItem ~= p16.pinnedItems.pinnedEndItem then
				local var70 = var35
				
				if not var70.identity then
					var70.identity = true
					t_1.identity += 1
				end
			end
			if contentInsets.start ~= contentInsets_1.start or contentInsets.finish ~= contentInsets_1.finish then
				local var71 = var35
				
				if not var71.layoutGeometry then
					var71.layoutGeometry = true
					t_1.layoutGeometry += 1
				end
			end
		end
		t = p16
	end
	
	local function execute(p17, p18)
		-- upvalues: external (copy), var26 (write), dataKeys (ref), resetLayout (ref), var20 (ref), dataSourceChangeTypeModule (copy), dataSource (write), var35 (write), t_1 (ref), var22 (ref), scrollObservationKindModule (copy), var25 (ref), virtualizerEffectTypeModule (copy), layout (write), var21 (write), applyPolicy (ref), internal (copy), captureAnchorEvidence (ref), diagnosticsModule (copy), var19 (ref), applyCorrection (ref), p4 (ref), var27 (write), var24 (ref)
		local var72 = nil
		
		if p17.type == external.Activate then
			if var26 then
				return var72
			end
			local var73 = dataKeys()
			var26 = true
			resetLayout(var73)
			var20.applyDataSourceChange({
				changes = {
					{ type = dataSourceChangeTypeModule.Reset, keys = var73 }
				},
				previousItemCount = dataSource.getItemCount(),
				itemCount = dataSource.getItemCount()
			})
			local var74 = var35
			
			if not var74.layoutGeometry then
				var74.layoutGeometry = true
				t_1.layoutGeometry += 1
			end
			local var75 = var35
			
			if var75.identity then
				return var72
			end
			var75.identity = true
			t_1.identity += 1
			
			return var72
		elseif p17.type == external.SetScrollOffset or p17.type == external.ObserveScrollOffset then
			local var76 = var22.setScrollOffset(if p17.type == external.SetScrollOffset then p17.offset else p17.observation.offset)
			
			if p17.type == external.ObserveScrollOffset and p17.observation.kind == scrollObservationKindModule.Programmatic then
				var25.reconcileHostOffset(var22.getScrollOffset())
				
				return var72
			elseif var76 then
				var25.setViewportAnchor(var22.getScrollOffset())
				
				return var72
			end
		elseif p17.type == external.ScrollToIndex or p17.type == external.ScrollToOffset or (p17.type == external.ScrollBy or p17.type == external.RestoreScrollSnapshot) then
			if p17.type == external.ScrollToIndex then
				var25.setItemAnchor(p17.index, p17.alignment)
				var72 = var22.scrollToOffset(var22.getScrollOffsetForItem(p17.index, p17.alignment))
			elseif p17.type == external.ScrollToOffset then
				var72 = var22.scrollToOffset(p17.offset)
				var25.setViewportAnchor(var72)
			elseif p17.type == external.ScrollBy then
				var72 = var22.scrollBy(p17.delta)
				var25.setViewportAnchor(var72)
			else
				var72 = var22.scrollToOffset(var25.getSnapshotOffset(p17.snapshot))
				var25.restoreSnapshotAnchor(p17.snapshot, var72)
			end
			table.insert(p18, {
				type = virtualizerEffectTypeModule.ScrollPositionChanged,
				offset = var72
			})
			
			return var72
		elseif p17.type ~= external.SetViewportSize then
			local var84, var86
			if p17.type == external.SetPolicy then
				applyPolicy(p17.policy)
				
				return var72
			elseif p17.type == external.SetDataSource or p17.type == external.SetDataSourceAndLayout then
				dataSource = p17.dataSource
				var20.setDataSource(dataSource)
				
				if p17.type == external.SetDataSourceAndLayout then
					layout = p17.layout
				end
				var25.reset()
				resetLayout()
				local var79 = var35
				
				if not var79.layoutGeometry then
					var79.layoutGeometry = true
					t_1.layoutGeometry += 1
				end
				local var80 = var35
				
				if var80.identity then
					return var72
				end
				var80.identity = true
				t_1.identity += 1
				
				return var72
			elseif p17.type == external.SetLayout then
				layout = p17.layout
				var25.reset()
				resetLayout()
				local var81 = var35
				
				if not var81.layoutGeometry then
					var81.layoutGeometry = true
					t_1.layoutGeometry += 1
				end
				local var82 = var35
				
				if var82.identity then
					return var72
				end
				var82.identity = true
				t_1.identity += 1
				
				return var72
			elseif p17.type == internal.ApplyDataSourceChange then
				local scrollState = var22.getScrollState()
				var84 = false
				applyCorrection(p18, var25.applyGeometryChange({
					source = diagnosticsModule.ScrollCorrectionSource.Data,
					dataSourceChange = p17.changeBatch,
					anchorEvidence = captureAnchorEvidence()
				}, function()
					-- upvalues: p17 (ref), var19 (copy), var84 (write), layout (copy), var20 (copy), var22 (copy)
					for i, v in p17.changeBatch.changes do
						var19.applyChange(v)
						var84 = layout.applyDataSourceChange(v) or var84
					end
					var20.applyDataSourceChange(p17.changeBatch)
					var22.refreshContentMetrics()
				end))
				table.insert(p18, {
					type = virtualizerEffectTypeModule.DataSourceChanged,
					changeBatch = p17.changeBatch,
					before = scrollState
				})
				local var85 = var35
				
				if not var85.identity then
					var85.identity = true
					t_1.identity += 1
				end
				return var72
			elseif p17.type == internal.SubmitLogicalMeasurements then
				var86 = 0
				local boundaryDropped = p17.boundaryDropped or 0
				var84 = nil
				local var88 = false
				
				if #p17.measurements > 0 and p4.diagnostics ~= nil then
					table.insert(p18, {
						type = virtualizerEffectTypeModule.Diagnostic,
						event = {
							kind = diagnosticsModule.EventKind.MeasurementsProcessingStarted,
							submitted = #p17.measurements,
							boundaryDropped = boundaryDropped
						}
					})
				end
				applyCorrection(p18, var25.applyGeometryChange({
					source = diagnosticsModule.ScrollCorrectionSource.Measurement
				}, function()
					-- upvalues: p17 (ref), dataSource (copy), var19 (copy), layout (copy), var86 (write), boundaryDropped (write), var88 (write), var84 (write), var20 (copy), var22 (copy)
					for i, v in p17.measurements do
						if v.itemIndex ~= nil and v.pinnedPosition == nil then
							local itemIndex = v.itemIndex
							
							if itemIndex < 1 or itemIndex > dataSource.getItemCount() or (dataSource.getItemKey(itemIndex) ~= v.itemKey or var19.get(v.itemKey) ~= v.itemRevision) then
								boundaryDropped += 1
								continue
							end
							local var91 = layout.updateItemMeasurement(v)
							
							if var91.accepted then
								var86 += 1
							else
								boundaryDropped += 1
							end
							var88 = var88 or var91.geometryChanged
						elseif v.itemIndex == nil and v.pinnedPosition ~= nil then
							var84 = var20.updatePinnedMeasurement(v.pinnedPosition, v.itemKey, v.itemRevision, v.length)
							
							if var84 == nil then
								boundaryDropped += 1
							else
								var86 += 1
							end
						else
							boundaryDropped += 1
						end
					end
					if var84 ~= nil then
						var22.setContentInsets(var84.start, var84.finish)
						var88 = true
					end
					var22.refreshContentMetrics()
				end))
				
				if p4.diagnostics ~= nil then
					table.insert(p18, {
						type = virtualizerEffectTypeModule.Diagnostic,
						event = {
							kind = diagnosticsModule.EventKind.MeasurementsProcessed,
							accepted = var86,
							dropped = boundaryDropped
						}
					})
				end
				return var72
			elseif p17.type == external.SubmitMeasurements then
				error("VirtualizerEngine: physical measurements belong to presentation", 0)
				
				return var72
			elseif p17.type == external.ApplyScrollAnchorOffset then
				var72 = if var25.allowsExternalPositionApplication() then var22.scrollToOffset(p17.offset) else var22.getScrollOffset()
				
				if var72 == var22.getScrollOffset() then
				else
					table.insert(p18, {
						type = virtualizerEffectTypeModule.ScrollPositionChanged,
						offset = var72
					})
					
					return var72
				end
			elseif p17.type == external.Refresh then
				var86 = var35
				
				if var86.identity then
					return var72
				end
				var86.identity = true
				t_1.identity += 1
				
				return var72
			elseif p17.type == external.Destroy then
				var27 = true
				var25.destroy()
				var20.destroy()
				var24.destroy()
				
				return var72
			end
			error("VirtualizerEngine: unknown command", 0)
		elseif var22.setViewportSize(p17.scrollAxisLength, p17.crossAxisLength) then
			if layout.setViewportCrossAxisLength(p17.crossAxisLength) then
				local var77 = var35
				
				if not var77.layoutGeometry then
					var77.layoutGeometry = true
					t_1.layoutGeometry += 1
				end
			end
			if not var21 then
			end
			local var78 = var35
			
			if var78.placementGeometry then
				return var72
			end
			var78.placementGeometry = true
			t_1.placementGeometry += 1
			
			return var72
		end
	end
	
	return {
		dispatch = function(p19)
			-- upvalues: var28 (write), var27 (write), external (copy), var35 (write), execute (ref), refreshRanges (ref), updatePrefetch (ref), commitProjection (ref)
			assert(not var28, "VirtualizerEngine: cannot dispatch during a Geometry transaction")
			assert(not var27 or p19.type == external.Destroy, "VirtualizerEngine: cannot dispatch after destruction")
			var28 = true
			var35 = {}
			local t = {}
			local ok, status = pcall(execute, p19, t)
			
			if not ok then
				var35 = nil
				var28 = false
				error(status, 0)
				
				return
			end
			refreshRanges(t)
			
			if not var27 then
				updatePrefetch(t)
			end
			local var93 = commitProjection()
			var35 = nil
			var28 = false
			
			return {
				snapshot = var93.snapshot,
				presentation = var93.presentation,
				result = status,
				effects = t
			}
		end,
		getSnapshot = var23.getSnapshot,
		query = function(p20)
			-- upvalues: var23 (ref), virtualizerQueryTypeModule (copy), layout (write), var22 (ref), dataSource (write)
			local snapshot = var23.getSnapshot()
			
			if p20.type == virtualizerQueryTypeModule.GetVisibleRange then
				return snapshot.visibleRange
			elseif p20.type == virtualizerQueryTypeModule.GetMountedRange then
				return snapshot.mountedRange
			elseif p20.type == virtualizerQueryTypeModule.GetScrollState then
				return snapshot.scrollState
			elseif p20.type == virtualizerQueryTypeModule.GetContentLength then
				return snapshot.contentLength
			elseif p20.type == virtualizerQueryTypeModule.GetContentStartOffset then
				return snapshot.contentStartOffset
			elseif p20.type == virtualizerQueryTypeModule.RequiresItemMeasurement then
				return snapshot.requiresItemMeasurement
			elseif p20.type == virtualizerQueryTypeModule.GetItemLayout then
				return layout.getItemLayout(p20.index)
			elseif p20.type == virtualizerQueryTypeModule.GetScrollOffsetForItem then
				return var22.getScrollOffsetForItem(p20.index, p20.alignment)
			elseif p20.type ~= virtualizerQueryTypeModule.CaptureScrollSnapshot then
				error("VirtualizerEngine: unknown query", 0)
				
				return
			end
			local var95 = if snapshot.visibleRange.firstIndex <= snapshot.visibleRange.lastIndex then snapshot.visibleRange.firstIndex else nil
			
			return if var95 == nil then {
				anchorKey = nil,
				anchorIndex = nil,
				offsetWithinItem = 0,
				fallbackScrollOffset = snapshot.scrollState.scrollOffset
			} else {
				anchorKey = dataSource.getItemKey(var95),
				anchorIndex = var95,
				offsetWithinItem = snapshot.scrollState.scrollOffset - snapshot.contentStartOffset - layout.getItemLayout(var95).startOffset,
				fallbackScrollOffset = snapshot.scrollState.scrollOffset
			}
		end
	}
end
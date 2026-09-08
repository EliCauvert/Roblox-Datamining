local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local dataPrefetchModule = require(viewRecycler.Core.DataPrefetch)
local _ = require(viewRecycler.Core.DataSource)
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local diagnosticsModule = require(viewRecycler.Core.Diagnostics)
local _ = require(viewRecycler.Core.Layout)
local overscanPolicyModule = require(viewRecycler.Core.OverscanPolicy)
local _ = require(viewRecycler.Core.PinnedItems)
local cloneFrozen = require(viewRecycler.Internal.ShallowTable).cloneFrozen
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
local virtualizerSnapshotStoreModule = require(viewRecycler.Core.Virtualizer.VirtualizerSnapshotStore)
local frozen = table.freeze({ firstIndex = 1, lastIndex = 0 })

local function _(p1, p2)
	return p1.firstIndex == p2.firstIndex and p1.lastIndex == p2.lastIndex
end

local _ = function(p1, p2)
	return p1.scrollOffset == p2.scrollOffset and (p1.viewportLength == p2.viewportLength and (p1.contentLength == p2.contentLength and (p1.distanceFromEnd == p2.distanceFromEnd and (p1.atStart == p2.atStart and p1.atEnd == p2.atEnd))))
end

return function(p1)
	-- upvalues: overscanPolicyModule (ref), itemRevisionTrackerModule (ref), createPinnedItemPlannerModule (ref), viewportModelModule (ref), virtualizerSnapshotStoreModule (ref), dataPrefetchControllerModule (ref), scrollPositionControllerModule (ref), frozen (ref), virtualizerEffectTypeModule (ref), diagnosticsModule (ref), typesModule (ref), cloneFrozen (ref), dataSourceChangeTypeModule (ref), dataPrefetchModule (ref), external (ref), scrollObservationKindModule (ref), internal (ref), virtualizerQueryTypeModule (ref)
	assert(if p1.overscan ~= nil then p1.overscanPolicy == nil else true, "VirtualizerEngine: overscan and overscanPolicy are mutually exclusive")
	local dataSource = p1.dataSource
	local layout = p1.layout
	local t = {
		overscan = p1.overscan,
		overscanPolicy = p1.overscanPolicy,
		dataPrefetch = p1.dataPrefetch,
		contentAlignment = p1.contentAlignment,
		endThreshold = p1.endThreshold,
		pinnedItems = {
			isItemStickyHeader = p1.isItemStickyHeader,
			pinnedStartItem = p1.pinnedStartItem,
			pinnedEndItem = p1.pinnedEndItem
		},
		preserveScrollPositionOnChange = p1.preserveScrollPositionOnChange ~= false
	}
	local overscanPolicy = t.overscanPolicy or overscanPolicyModule.fixed(t.overscan)
	local preserveScrollPositionOnChange = t.preserveScrollPositionOnChange
	local var1 = itemRevisionTrackerModule()
	local var2 = createPinnedItemPlannerModule(dataSource, t.pinnedItems)
	local var3 = if t.pinnedItems.isItemStickyHeader == nil then if t.pinnedItems.pinnedStartItem == nil then t.pinnedItems.pinnedEndItem ~= nil else true else true
	local var4 = viewportModelModule({
		getLayout = function()
			-- upvalues: layout (write)
			return layout
		end,
		contentAlignment = p1.contentAlignment,
		contentInsetStart = p1.contentInsetStart,
		contentInsetEnd = p1.contentInsetEnd,
		endThreshold = p1.endThreshold
	})
	local var5 = virtualizerSnapshotStoreModule({
		planner = var2,
		itemRevisions = var1,
		getRecyclableViewType = p1.getRecyclableViewType,
		initialScrollState = var4.getScrollState(),
		initialRequiresItemMeasurement = layout.requiresItemMeasurement()
	})
	local var6 = dataPrefetchControllerModule(t.dataPrefetch)
	local var7 = scrollPositionControllerModule({
		shouldPreserveUserPosition = function()
			-- upvalues: preserveScrollPositionOnChange (write)
			return preserveScrollPositionOnChange
		end,
		getItemCount = function()
			-- upvalues: dataSource (write)
			return dataSource.getItemCount()
		end,
		getItemKey = function(p2)
			-- upvalues: dataSource (write)
			return dataSource.getItemKey(p2)
		end,
		getScrollOffset = var4.getScrollOffset,
		clampScrollOffset = var4.clampScrollOffset,
		getViewportLength = var4.getScrollAxisLength,
		getVisibleRange = var4.getVisibleRange,
		getItemLayout = var4.getPlacedItemLayout,
		getScrollOffsetForItem = var4.getScrollOffsetForItem
	})
	local var8 = false
	local var9 = false
	local var10 = false
	local var11 = frozen
	local var12 = frozen
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
		mountedRange = var12,
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
		visibleRange = var11,
		mountedRange = var12,
		scrollState = var5.getSnapshot().scrollState,
		requiresItemMeasurement = layout.requiresItemMeasurement(),
		hasViewportPlacements = var3,
		revisions = t_3
	}
	local var13 = nil
	local var14 = nil
	
	local function _(p2)
		-- upvalues: var13 (write), t_1 (ref)
		if var13[p2] then
			return
		end
		var13[p2] = true
		t_1[p2] += 1
	end
	
	local function dataKeys()
		-- upvalues: dataSource (write)
		local list = table.create(dataSource.getItemCount())
		
		for i = 1, dataSource.getItemCount() do
			list[i] = dataSource.getItemKey(i)
		end
		return list
	end
	
	local _ = function(p2, p3)
		-- upvalues: virtualizerEffectTypeModule (copy)
		table.insert(p2, {
			type = virtualizerEffectTypeModule.Diagnostic,
			event = p3
		})
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: p1 (ref), diagnosticsModule (copy), virtualizerEffectTypeModule (copy)
		if p1.diagnostics ~= nil then
			table.insert(p2, {
				type = virtualizerEffectTypeModule.Diagnostic,
				event = {
					kind = diagnosticsModule.EventKind.RangeChanged,
					rangeKind = p3,
					firstIndex = p4.firstIndex,
					lastIndex = p4.lastIndex
				}
			})
		end
	end
	
	local function refreshRanges(p2)
		-- upvalues: var4 (ref), var11 (write), var12 (write), overscanPolicy (write), layout (write), var14 (write), t_1 (ref), typesModule (copy), frozen (copy), var13 (write), virtualizerEffectTypeModule (copy), cloneFrozen (copy), diagnosticsModule (copy), p1 (ref)
		var4.refreshContentMetrics()
		local visibleRange = var4.getVisibleRange()
		local var15 = overscanPolicy.compute({
			visibleRange = visibleRange,
			scrollOffset = var4.getScrollOffset(),
			viewportLength = var4.getScrollAxisLength(),
			scrollDirection = var4.getScrollDirection(),
			itemCount = layout.getItemCount()
		})
		assert(var15.before >= 0 and (var15.before % 1 == 0 and (var15.after >= 0 and var15.after % 1 == 0)), "VirtualizerEngine: overscan policy must return non-negative integer spans")
		local layoutViewport, layoutViewport_1 = var4.getLayoutViewport()
		var11 = visibleRange
		
		if not (var14 ~= nil and (var14.layoutGeometryVersion == t_1.layoutGeometry and (var14.overscanPolicyVersion == t_1.overscanPolicy and (var14.min <= layoutViewport and (layoutViewport_1 <= var14.max and (var15.before == var14.before and (var15.after == var14.after and (typesModule.isIndexRangeEmpty(visibleRange) or (var12.firstIndex <= visibleRange.firstIndex and visibleRange.lastIndex <= var12.lastIndex))))))))) then
			var12 = if typesModule.isIndexRangeEmpty(visibleRange) then frozen else layout.expandIndexRange(visibleRange, var15.before, var15.after)
			
			if typesModule.isIndexRangeEmpty(var12) then
				var14 = nil
			else
				local itemLayout = layout.getItemLayout(var12.lastIndex)
				var14 = {
					min = layout.getItemLayout(var12.firstIndex).startOffset,
					max = itemLayout.startOffset + itemLayout.length,
					layoutGeometryVersion = t_1.layoutGeometry,
					overscanPolicyVersion = t_1.overscanPolicy,
					before = var15.before,
					after = var15.after
				}
			end
		end
		local var16 = var11
		local var17 = not (var11.firstIndex == var16.firstIndex and var11.lastIndex == var16.lastIndex)
		local var18 = var12
		local var19 = not (var12.firstIndex == var18.firstIndex and var12.lastIndex == var18.lastIndex)
		
		if var17 or var19 then
			local var20 = var13
			
			if not var20.range then
				var20.range = true
				t_1.range += 1
			end
		end
		if var17 then
			table.insert(p2, {
				type = virtualizerEffectTypeModule.VisibleRangeChanged,
				range = cloneFrozen(var11)
			})
			local visible = diagnosticsModule.RangeKind.Visible
			local var21 = var11
			
			if p1.diagnostics ~= nil then
				table.insert(p2, {
					type = virtualizerEffectTypeModule.Diagnostic,
					event = {
						kind = diagnosticsModule.EventKind.RangeChanged,
						rangeKind = visible,
						firstIndex = var21.firstIndex,
						lastIndex = var21.lastIndex
					}
				})
			end
		end
		if var19 then
			table.insert(p2, {
				type = virtualizerEffectTypeModule.MountedRangeChanged,
				range = cloneFrozen(var12)
			})
			local rendered = diagnosticsModule.RangeKind.Rendered
			local var22 = var12
			
			if p1.diagnostics ~= nil then
				table.insert(p2, {
					type = virtualizerEffectTypeModule.Diagnostic,
					event = {
						kind = diagnosticsModule.EventKind.RangeChanged,
						rangeKind = rendered,
						firstIndex = var22.firstIndex,
						lastIndex = var22.lastIndex
					}
				})
			end
		end
		return var19
	end
	
	local function updatePrefetch(p2)
		-- upvalues: t_2 (ref), dataSource (write), var12 (write), t (write), var6 (ref), virtualizerEffectTypeModule (copy)
		t_2.dataSource = dataSource
		t_2.mountedRange = var12
		t_2.options = t.dataPrefetch
		
		for i, v in var6.reconcile(t_2) do
			table.insert(p2, {
				type = virtualizerEffectTypeModule.DataPrefetchRequested,
				request = v
			})
		end
	end
	
	local function commitSnapshot()
		-- upvalues: var4 (ref), var5 (ref), var13 (write), t_1 (ref), t_3 (ref), t_4 (ref), dataSource (write), layout (write), var11 (write), var12 (write), var3 (write)
		local scrollState = var4.getScrollState()
		local scrollState_1 = var5.getSnapshot().scrollState
		
		if not (scrollState_1.scrollOffset == scrollState.scrollOffset and (scrollState_1.viewportLength == scrollState.viewportLength and (scrollState_1.contentLength == scrollState.contentLength and (scrollState_1.distanceFromEnd == scrollState.distanceFromEnd and (scrollState_1.atStart == scrollState.atStart and scrollState_1.atEnd == scrollState.atEnd))))) then
			local var15 = var13
			
			if not var15.scroll then
				var15.scroll = true
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
		t_4.visibleRange = var11
		t_4.mountedRange = var12
		t_4.scrollState = scrollState
		t_4.contentStartOffset = var4.contentStartOffset(false)
		t_4.contentLength = var4.contentLength(false)
		t_4.requiresItemMeasurement = layout.requiresItemMeasurement()
		t_4.hasViewportPlacements = var3
		
		return var5.commit(t_4)
	end
	
	local function captureAnchorEvidence()
		-- upvalues: typesModule (copy), var11 (write), var4 (ref), dataSource (write)
		if typesModule.isIndexRangeEmpty(var11) then
			return nil
		end
		local t = {}
		
		for i = var11.firstIndex, var11.lastIndex do
			local placedItemLayout = var4.getPlacedItemLayout(i)
			table.insert(t, {
				key = dataSource.getItemKey(i),
				viewportCoordinate = placedItemLayout.startOffset - var4.getScrollOffset(),
				itemLength = placedItemLayout.length
			})
		end
		return {
			scrollOffset = var4.getScrollOffset(),
			viewportLength = var4.getScrollAxisLength(),
			visibleItems = t
		}
	end
	
	local function applyCorrection(p3, p4)
		-- upvalues: var4 (ref), virtualizerEffectTypeModule (copy), p1 (ref), diagnosticsModule (copy)
		if p4 == nil then return end
		local scrollOffset = var4.getScrollOffset()
		var4.setScrollOffset(scrollOffset + p4.delta)
		local var15 = var4.getScrollOffset() - scrollOffset
		
		if math.abs(var15) < 1 then return end
		table.insert(p3, {
			type = virtualizerEffectTypeModule.ScrollCorrection,
			delta = var15
		})
		table.insert(p3, {
			type = virtualizerEffectTypeModule.ScrollPositionChanged,
			offset = var4.getScrollOffset()
		})
		
		if p1.diagnostics ~= nil then
			table.insert(p3, {
				type = virtualizerEffectTypeModule.Diagnostic,
				event = {
					kind = diagnosticsModule.EventKind.ScrollCorrection,
					source = p4.source,
					delta = var15
				}
			})
		end
	end
	
	local function resetLayout(value)
		-- upvalues: dataKeys (ref), var1 (ref), dataSourceChangeTypeModule (copy), layout (write), var4 (ref)
		local value_1 = value or dataKeys()
		var1.applyChange({ type = dataSourceChangeTypeModule.Reset, keys = value_1 })
		layout.applyDataSourceChange({ type = dataSourceChangeTypeModule.Reset, keys = value_1 })
		var4.refreshContentMetrics()
	end
	
	local function applyPolicy(p3)
		-- upvalues: dataPrefetchModule (copy), t (write), overscanPolicy (write), overscanPolicyModule (copy), var13 (write), t_1 (ref), var4 (ref), preserveScrollPositionOnChange (write), var2 (ref), var3 (write)
		assert(if p3.overscan ~= nil then p3.overscanPolicy == nil else true, "VirtualizerEngine: overscan and overscanPolicy are mutually exclusive")
		assert(if p3.overscan ~= nil then p3.overscan >= 0 and p3.overscan % 1 == 0 else true, "VirtualizerEngine: overscan must be a non-negative integer")
		dataPrefetchModule.resolve(p3.dataPrefetch)
		
		if t.overscan ~= p3.overscan or t.overscanPolicy ~= p3.overscanPolicy then
			overscanPolicy = p3.overscanPolicy or overscanPolicyModule.fixed(p3.overscan)
			local var15 = var13
			
			if not var15.overscanPolicy then
				var15.overscanPolicy = true
				t_1.overscanPolicy += 1
			end
		end
		if t.contentAlignment ~= p3.contentAlignment and var4.setContentAlignment(p3.contentAlignment) then
			local var16 = var13
			
			if not var16.layoutGeometry then
				var16.layoutGeometry = true
				t_1.layoutGeometry += 1
			end
		end
		if t.endThreshold ~= p3.endThreshold then
			var4.setEndThreshold(p3.endThreshold)
		end
		if preserveScrollPositionOnChange ~= p3.preserveScrollPositionOnChange then
			preserveScrollPositionOnChange = p3.preserveScrollPositionOnChange
		end
		local contentInsets = var2.getContentInsets()
		
		if var2.setOptions(p3.pinnedItems) then
			local contentInsets_1 = var2.getContentInsets()
			var4.setContentInsets(contentInsets_1.start, contentInsets_1.finish)
			var3 = if p3.pinnedItems.isItemStickyHeader == nil then if p3.pinnedItems.pinnedStartItem == nil then p3.pinnedItems.pinnedEndItem ~= nil else true else true
			
			if not var13.placementGeometry then
				var13.placementGeometry = true
				t_1.placementGeometry += 1
			end
			if t.pinnedItems.pinnedStartItem ~= p3.pinnedItems.pinnedStartItem or t.pinnedItems.pinnedEndItem ~= p3.pinnedItems.pinnedEndItem then
				local var17 = var13
				
				if not var17.identity then
					var17.identity = true
					t_1.identity += 1
				end
			end
			if contentInsets.start ~= contentInsets_1.start or contentInsets.finish ~= contentInsets_1.finish then
				local var18 = var13
				
				if not var18.layoutGeometry then
					var18.layoutGeometry = true
					t_1.layoutGeometry += 1
				end
			end
		end
		t = p3
	end
	
	local function execute(p3, p4)
		-- upvalues: external (copy), var8 (write), dataKeys (ref), resetLayout (ref), var2 (ref), dataSourceChangeTypeModule (copy), dataSource (write), var13 (write), t_1 (ref), var4 (ref), scrollObservationKindModule (copy), var7 (ref), virtualizerEffectTypeModule (copy), layout (write), var3 (write), applyPolicy (ref), internal (copy), captureAnchorEvidence (ref), diagnosticsModule (copy), var1 (ref), applyCorrection (ref), p1 (ref), var9 (write), var6 (ref)
		local var15 = nil
		
		if p3.type == external.Activate then
			if var8 then
				return var15
			end
			local var16 = dataKeys()
			var8 = true
			resetLayout(var16)
			var2.applyDataSourceChange({
				changes = {
					{ type = dataSourceChangeTypeModule.Reset, keys = var16 }
				},
				previousItemCount = dataSource.getItemCount(),
				itemCount = dataSource.getItemCount()
			})
			local var17 = var13
			
			if not var17.layoutGeometry then
				var17.layoutGeometry = true
				t_1.layoutGeometry += 1
			end
			local var18 = var13
			
			if var18.identity then
				return var15
			end
			var18.identity = true
			t_1.identity += 1
			
			return var15
		elseif p3.type == external.SetScrollOffset or p3.type == external.ObserveScrollOffset then
			local var19 = var4.setScrollOffset(if p3.type == external.SetScrollOffset then p3.offset else p3.observation.offset)
			
			if p3.type == external.ObserveScrollOffset and p3.observation.kind == scrollObservationKindModule.Programmatic then
				var7.reconcileHostOffset(var4.getScrollOffset())
				
				return var15
			elseif var19 then
				var7.setViewportAnchor(var4.getScrollOffset())
				
				return var15
			end
		elseif p3.type == external.ScrollToIndex or p3.type == external.ScrollToOffset or (p3.type == external.ScrollBy or p3.type == external.RestoreScrollAnchorSnapshot) then
			if p3.type == external.ScrollToIndex then
				var7.setItemAnchor(p3.index, p3.alignment)
				var15 = var4.scrollToOffset(var4.getScrollOffsetForItem(p3.index, p3.alignment))
			elseif p3.type == external.ScrollToOffset then
				var15 = var4.scrollToOffset(p3.offset)
				var7.setViewportAnchor(var15)
			elseif p3.type == external.ScrollBy then
				var15 = var4.scrollBy(p3.delta)
				var7.setViewportAnchor(var15)
			else
				var15 = var4.scrollToOffset(var7.getSnapshotOffset(p3.snapshot))
				var7.restoreSnapshotAnchor(p3.snapshot, var15)
			end
			table.insert(p4, {
				type = virtualizerEffectTypeModule.ScrollPositionChanged,
				offset = var15
			})
			
			return var15
		elseif p3.type ~= external.SetViewportSize then
			local var20, var21
			if p3.type == external.SetPolicy then
				applyPolicy(p3.policy)
				
				return var15
			elseif p3.type == external.SetDataSource or p3.type == external.SetDataSourceAndLayout then
				dataSource = p3.dataSource
				var2.setDataSource(dataSource)
				
				if p3.type == external.SetDataSourceAndLayout then
					layout = p3.layout
				end
				var7.reset()
				resetLayout()
				local var22 = var13
				
				if not var22.layoutGeometry then
					var22.layoutGeometry = true
					t_1.layoutGeometry += 1
				end
				local var23 = var13
				
				if var23.identity then
					return var15
				end
				var23.identity = true
				t_1.identity += 1
				
				return var15
			elseif p3.type == external.SetLayout then
				layout = p3.layout
				var7.reset()
				resetLayout()
				local var24 = var13
				
				if not var24.layoutGeometry then
					var24.layoutGeometry = true
					t_1.layoutGeometry += 1
				end
				local var25 = var13
				
				if var25.identity then
					return var15
				end
				var25.identity = true
				t_1.identity += 1
				
				return var15
			elseif p3.type == internal.ApplyDataSourceChange then
				local scrollState = var4.getScrollState()
				var20 = false
				applyCorrection(p4, var7.applyGeometryChange({
					source = diagnosticsModule.ScrollCorrectionSource.Data,
					dataSourceChange = p3.changeBatch,
					anchorEvidence = captureAnchorEvidence()
				}, function()
					-- upvalues: p3 (ref), var1 (copy), var20 (write), layout (copy), var2 (copy), var4 (copy)
					for i, v in p3.changeBatch.changes do
						var1.applyChange(v)
						var20 = layout.applyDataSourceChange(v) or var20
					end
					var2.applyDataSourceChange(p3.changeBatch)
					var4.refreshContentMetrics()
				end))
				table.insert(p4, {
					type = virtualizerEffectTypeModule.DataSourceChanged,
					changeBatch = p3.changeBatch,
					before = scrollState
				})
				local var26 = var13
				
				if not var26.identity then
					var26.identity = true
					t_1.identity += 1
				end
				return var15
			elseif p3.type == internal.SubmitLogicalMeasurements then
				var21 = 0
				local boundaryDropped = p3.boundaryDropped or 0
				var20 = nil
				local var27 = false
				
				if #p3.measurements > 0 and p1.diagnostics ~= nil then
					table.insert(p4, {
						type = virtualizerEffectTypeModule.Diagnostic,
						event = {
							kind = diagnosticsModule.EventKind.MeasurementsProcessingStarted,
							submitted = #p3.measurements,
							boundaryDropped = boundaryDropped
						}
					})
				end
				local t = {
					preserveStartAnchor = true,
					startInsetDelta = 0,
					source = diagnosticsModule.ScrollCorrectionSource.Measurement
				}
				local start = var2.getContentInsets().start
				applyCorrection(p4, var7.applyGeometryChange(t, function()
					-- upvalues: p3 (ref), dataSource (copy), var1 (copy), layout (copy), var21 (write), boundaryDropped (write), var27 (write), var20 (write), var2 (copy), t (ref), start (ref), var4 (copy)
					for i, v in p3.measurements do
						if v.itemIndex ~= nil and v.pinnedPosition == nil then
							local itemIndex = v.itemIndex
							
							if itemIndex < 1 or itemIndex > dataSource.getItemCount() or (dataSource.getItemKey(itemIndex) ~= v.itemKey or var1.get(v.itemKey) ~= v.itemRevision) then
								boundaryDropped += 1
								continue
							end
							local var28 = layout.updateItemMeasurement(v)
							
							if var28.accepted then
								var21 += 1
							else
								boundaryDropped += 1
							end
							var27 = var27 or var28.geometryChanged
						elseif v.itemIndex == nil and v.pinnedPosition ~= nil then
							var20 = var2.updatePinnedMeasurement(v.pinnedPosition, v.itemKey, v.itemRevision, v.length)
							
							if var20 == nil then
								boundaryDropped += 1
							else
								var21 += 1
							end
						else
							boundaryDropped += 1
						end
					end
					if var20 ~= nil then
						t.startInsetDelta = var20.start - start
						var4.setContentInsets(var20.start, var20.finish)
						var27 = true
					end
					var4.refreshContentMetrics()
				end))
				
				if p1.diagnostics ~= nil then
					table.insert(p4, {
						type = virtualizerEffectTypeModule.Diagnostic,
						event = {
							kind = diagnosticsModule.EventKind.MeasurementsProcessed,
							accepted = var21,
							dropped = boundaryDropped
						}
					})
				end
				return var15
			elseif p3.type == external.SubmitMeasurements then
				error("VirtualizerEngine: physical measurements belong to presentation", 0)
				
				return var15
			elseif p3.type == external.ApplyScrollAnchorOffset then
				var15 = if var7.allowsExternalPositionApplication() then var4.scrollToOffset(p3.offset) else var4.getScrollOffset()
				
				if var15 == var4.getScrollOffset() then
				else
					table.insert(p4, {
						type = virtualizerEffectTypeModule.ScrollPositionChanged,
						offset = var15
					})
					
					return var15
				end
			elseif p3.type == external.Refresh then
				var21 = var13
				
				if var21.identity then
					return var15
				end
				var21.identity = true
				t_1.identity += 1
				
				return var15
			elseif p3.type == external.Destroy then
				var9 = true
				var7.destroy()
				var2.destroy()
				var6.destroy()
				
				return var15
			end
			error("VirtualizerEngine: unknown command", 0)
		elseif var4.setViewportSize(p3.scrollAxisLength, p3.crossAxisLength) then
			if layout.setViewportCrossAxisLength(p3.crossAxisLength) then
				local var28 = var13
				
				if not var28.layoutGeometry then
					var28.layoutGeometry = true
					t_1.layoutGeometry += 1
				end
			end
			if not var3 then
			end
			local var29 = var13
			
			if var29.placementGeometry then
				return var15
			end
			var29.placementGeometry = true
			t_1.placementGeometry += 1
			
			return var15
		end
	end
	
	return {
		dispatch = function(p5)
			-- upvalues: var10 (write), var9 (write), external (copy), var13 (write), execute (ref), refreshRanges (ref), updatePrefetch (ref), commitSnapshot (ref)
			assert(not var10, "VirtualizerEngine: cannot dispatch during a Geometry transaction")
			assert(not var9 or p5.type == external.Destroy, "VirtualizerEngine: cannot dispatch after destruction")
			var10 = true
			var13 = {}
			local t = {}
			local ok, status = pcall(execute, p5, t)
			
			if not ok then
				var13 = nil
				var10 = false
				error(status, 0)
				
				return
			end
			refreshRanges(t)
			
			if not var9 then
				updatePrefetch(t)
			end
			local var26 = commitSnapshot()
			var13 = nil
			var10 = false
			
			return {
				snapshot = var26.snapshot,
				presentation = var26.presentation,
				result = status,
				effects = t
			}
		end,
		getSnapshot = var5.getSnapshot,
		query = function(p5)
			-- upvalues: var5 (ref), virtualizerQueryTypeModule (copy), layout (write), var4 (ref), dataSource (write)
			local snapshot = var5.getSnapshot()
			
			if p5.type == virtualizerQueryTypeModule.GetVisibleRange then
				return snapshot.visibleRange
			elseif p5.type == virtualizerQueryTypeModule.GetMountedRange then
				return snapshot.mountedRange
			elseif p5.type == virtualizerQueryTypeModule.GetScrollState then
				return snapshot.scrollState
			elseif p5.type == virtualizerQueryTypeModule.GetContentLength then
				return snapshot.contentLength
			elseif p5.type == virtualizerQueryTypeModule.GetContentStartOffset then
				return snapshot.contentStartOffset
			elseif p5.type == virtualizerQueryTypeModule.RequiresItemMeasurement then
				return snapshot.requiresItemMeasurement
			elseif p5.type == virtualizerQueryTypeModule.GetItemLayout then
				return layout.getItemLayout(p5.index)
			elseif p5.type == virtualizerQueryTypeModule.GetScrollOffsetForItem then
				return var4.getScrollOffsetForItem(p5.index, p5.alignment)
			elseif p5.type ~= virtualizerQueryTypeModule.CaptureScrollAnchorSnapshot then
				error("VirtualizerEngine: unknown query", 0)
				
				return
			end
			local var26 = if snapshot.visibleRange.firstIndex <= snapshot.visibleRange.lastIndex then snapshot.visibleRange.firstIndex else nil
			
			return if var26 == nil then {
				anchorKey = nil,
				anchorIndex = nil,
				offsetWithinItem = 0,
				fallbackScrollOffset = snapshot.scrollState.scrollOffset
			} else {
				anchorKey = dataSource.getItemKey(var26),
				anchorIndex = var26,
				offsetWithinItem = snapshot.scrollState.scrollOffset - snapshot.contentStartOffset - layout.getItemLayout(var26).startOffset,
				fallbackScrollOffset = snapshot.scrollState.scrollOffset
			}
		end
	}
end
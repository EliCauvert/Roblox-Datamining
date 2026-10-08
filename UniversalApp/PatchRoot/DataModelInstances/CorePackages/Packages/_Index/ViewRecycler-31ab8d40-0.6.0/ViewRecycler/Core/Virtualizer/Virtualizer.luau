local viewRecycler = script:FindFirstAncestor("ViewRecycler")
local autoScrollModule = require(viewRecycler.Core.ViewportBehavior.AutoScroll)
local autoScrollTargetModule = require(viewRecycler.Core.Enums.AutoScrollTarget)
local dataPrefetchModule = require(viewRecycler.Core.DataPrefetch)
local _ = require(viewRecycler.Core.DataSource)
local dataSourceChangeTypeModule = require(viewRecycler.Core.Enums.DataSourceChangeType)
local diagnosticsModule = require(viewRecycler.Core.Diagnostics)
local _ = require(viewRecycler.Core.Layout)
local paginationEdgesModule = require(viewRecycler.Core.ViewportBehavior.PaginationEdges)
local _ = require(viewRecycler.Core.PinnedItems)
local placementTypesModule = require(viewRecycler.Core.Placement.PlacementTypes)
local _ = require(viewRecycler.Core.ViewportBehavior.ReachedThreshold)
local scrollAlignmentModule = require(viewRecycler.Core.Enums.ScrollAlignment)
local scrollObservationKindModule = require(viewRecycler.Core.Enums.ScrollObservationKind)
local _ = require(viewRecycler.Core.Types)
local dataPrefetchControllerModule = require(viewRecycler.Core.Virtualizer.DataPrefetchController)
local listRowsModule = require(viewRecycler.Core.Virtualizer.ListRows)
local createPinnedItemPlannerModule = require(viewRecycler.Core.PinnedItems.createPinnedItemPlanner)
local _ = require(viewRecycler.Core.Recycling.RecyclingScope)
local scrollAnchorModule = require(viewRecycler.Core.Virtualizer.ScrollAnchor)
local scrollPolicyModule = require(viewRecycler.Core.ViewportBehavior.ScrollPolicy)
local slotBinderModule = require(viewRecycler.Core.Recycling.SlotBinder)
local viewportModule = require(viewRecycler.Core.Virtualizer.Viewport)
local frozen = table.freeze({})

local function _(p1)
	return {
		initialScrollAlignment = p1.initialScrollAlignment,
		autoScrollOnChange = p1.autoScrollOnChange,
		autoScrollThreshold = p1.autoScrollThreshold,
		startReachedThreshold = p1.startReachedThreshold,
		startReachedEnabled = p1.startReachedEnabled == true,
		endReachedEnabled = p1.endReachedEnabled == true
	}
end

local _ = function(p1)
	return if p1 == nil then nil else { key = p1.key }
end

return function(p1)
	-- upvalues: viewportModule (ref), createPinnedItemPlannerModule (ref), dataPrefetchControllerModule (ref), scrollAnchorModule (ref), scrollPolicyModule (ref), listRowsModule (ref), slotBinderModule (ref), placementTypesModule (ref), diagnosticsModule (ref), dataSourceChangeTypeModule (ref), frozen (ref), paginationEdgesModule (ref), dataPrefetchModule (ref), scrollObservationKindModule (ref), autoScrollModule (ref), scrollAlignmentModule (ref), autoScrollTargetModule (ref)
	local dataSource = p1.dataSource
	local layout = p1.layout
	local isItemStickyHeader = p1.isItemStickyHeader
	local pinnedStartItem = p1.pinnedStartItem
	local pinnedEndItem = p1.pinnedEndItem
	local var1 = p1.preserveScrollPositionOnChange ~= false
	local dataPrefetch = p1.dataPrefetch
	local var2 = if isItemStickyHeader == nil then if pinnedStartItem == nil then pinnedEndItem ~= nil else true else true
	local var3 = viewportModule({
		layout = layout,
		overscan = p1.overscan,
		contentAlignment = p1.contentAlignment,
		endThreshold = p1.endThreshold
	})
	local var4 = dataSource
	local t = { isItemStickyKey = isItemStickyHeader }
	local var5 = pinnedStartItem
	t.pinnedStartItem = if var5 == nil then nil else { key = var5.key }
	local var6 = pinnedEndItem
	t.pinnedEndItem = if var6 == nil then nil else { key = var6.key }
	local var7 = createPinnedItemPlannerModule(var4, t)
	local var8 = dataPrefetchControllerModule(dataPrefetch)
	local var9 = scrollAnchorModule({
		viewport = var3,
		getItemSequence = function()
			-- upvalues: dataSource (write)
			return dataSource
		end,
		shouldPreserveUserPosition = function()
			-- upvalues: var1 (write)
			return var1
		end
	})
	local var10 = scrollPolicyModule({
		initialScrollAlignment = p1.initialScrollAlignment,
		autoScrollOnChange = p1.autoScrollOnChange,
		autoScrollThreshold = p1.autoScrollThreshold,
		startReachedThreshold = p1.startReachedThreshold,
		startReachedEnabled = p1.startReachedEnabled == true,
		endReachedEnabled = p1.endReachedEnabled == true
	})
	local var11 = listRowsModule({
		slotBinder = slotBinderModule({
			recyclingScope = p1.recyclingScope,
			prepareDesiredAssignment = p1.prepareDesiredAssignment
		}),
		getItemViewType = p1.getItemViewType,
		getPinnedItem = function(p2)
			-- upvalues: placementTypesModule (copy), pinnedStartItem (write), pinnedEndItem (write)
			return if p2 == placementTypesModule.PinnedPosition.Start then pinnedStartItem else pinnedEndItem
		end
	})
	local var12 = false
	local var13 = true
	local var14 = false
	local var15 = false
	local var16 = nil
	local var17 = nil
	
	local function _(p2, p3)
		if table.isfrozen(p2.diagnostics) then
			p2.diagnostics = {}
		end
		table.insert(p2.diagnostics, p3)
	end
	
	local function applyCorrection(p2, p3)
		-- upvalues: var3 (ref), p1 (ref), diagnosticsModule (copy)
		if p3 == nil then return end
		local scrollOffset = var3.getScrollOffset()
		var3.setScrollOffset(scrollOffset + p3.delta)
		local var18 = var3.getScrollOffset() - scrollOffset
		p2.scrollCorrection += var18
		p2.scrollPositionChanged = true
		p2.scrollPositionFollowsCorrection = true
		
		if p1.diagnostics ~= nil then
			local t = {
				kind = diagnosticsModule.EventKind.ScrollCorrection,
				source = p3.source,
				delta = var18
			}
			
			if table.isfrozen(p2.diagnostics) then
				p2.diagnostics = {}
			end
			table.insert(p2.diagnostics, t)
		end
	end
	
	local _ = function(p2)
		p2.scrollPositionChanged = true
		p2.scrollPositionFollowsCorrection = false
	end
	
	local _ = function(p2, p3)
		-- upvalues: var9 (ref), var3 (ref)
		if p3 == nil or not var9.allowsPolicyOffset() then return end
		if var3.scrollTo(p3) ~= var3.getScrollOffset() then
			p2.scrollPositionChanged = true
			p2.scrollPositionFollowsCorrection = false
		end
	end
	
	local function readKeys()
		-- upvalues: dataSource (write)
		local itemCount = dataSource.getItemCount()
		local list = table.create(itemCount)
		
		for i = 1, itemCount do
			list[i] = dataSource.getItemKey(i)
		end
		return list
	end
	
	local _ = function(value)
		-- upvalues: layout (write), dataSourceChangeTypeModule (copy), var3 (ref)
		layout.applyDataSourceChange({ type = dataSourceChangeTypeModule.Reset, keys = value })
		var3.refresh()
	end
	
	local _ = nil
	
	local _ = function()
		-- upvalues: var16 (write)
		if var16 ~= nil then
			var16()
			var16 = nil
		end
	end
	
	local t_1 = {}
	
	local _ = function()
		-- upvalues: t_1 (ref), var3 (ref), frozen (copy)
		t_1.policyEligible = true
		t_1.dataChange = nil
		t_1.before = nil
		t_1.replaced = false
		t_1.viewportChanged = false
		t_1.scrollMoved = false
		t_1.contentLengthBefore = var3.getContentLength()
		t_1.scrollCorrection = 0
		t_1.scrollPositionChanged = false
		t_1.scrollPositionFollowsCorrection = false
		t_1.contentLengthChanged = false
		t_1.startReached = false
		t_1.endReached = false
		t_1.entered = frozen
		t_1.updated = frozen
		t_1.departed = frozen
		t_1.dataPrefetchRequests = frozen
		t_1.diagnostics = frozen
		
		return t_1
	end
	
	local _ = function(p2, p3)
		-- upvalues: var10 (ref), var3 (ref), dataSource (write)
		local var18, var19 = var10.checkEdges(var3.scrollState(), dataSource.getItemCount(), p3)
		p2.startReached = p2.startReached or var18
		p2.endReached = p2.endReached or var19
	end
	
	local _ = function()
		-- upvalues: dataSource (write), var3 (ref)
		return {
			itemCount = dataSource.getItemCount(),
			scrollState = var3.scrollState(),
			getScrollOffsetForItem = var3.offsetForItem
		}
	end
	
	local function settlePolicy(value)
		-- upvalues: var3 (ref), var10 (ref), var9 (ref), dataSource (write), paginationEdgesModule (copy)
		if var3.getContentLength() ~= value.contentLengthBefore then
			value.contentLengthChanged = true
			local var18 = var10.contentLengthChanged(var3.scrollState())
			
			if var18 ~= nil and var9.allowsPolicyOffset() and var3.scrollTo(var18) ~= var3.getScrollOffset() then
				value.scrollPositionChanged = true
				value.scrollPositionFollowsCorrection = false
			end
		end
		local dataChange = value.dataChange
		
		if dataChange == nil then
			if value.replaced then
				local var19 = var10.dataReplaced({
					itemCount = dataSource.getItemCount(),
					scrollState = var3.scrollState(),
					getScrollOffsetForItem = var3.offsetForItem
				})
				
				if var19 ~= nil and var9.allowsPolicyOffset() and var3.scrollTo(var19) ~= var3.getScrollOffset() then
					value.scrollPositionChanged = true
					value.scrollPositionFollowsCorrection = false
				end
				var10.observe(var3.scrollState())
			end
			if value.viewportChanged then
				local var20 = var10.viewportChanged({
					itemCount = dataSource.getItemCount(),
					scrollState = var3.scrollState(),
					getScrollOffsetForItem = var3.offsetForItem
				})
				
				if var20 ~= nil and var9.allowsPolicyOffset() and var3.scrollTo(var20) ~= var3.getScrollOffset() then
					value.scrollPositionChanged = true
					value.scrollPositionFollowsCorrection = false
				end
				var10.observe(var3.scrollState())
			elseif value.scrollMoved then
				var10.observe(var3.scrollState())
			end
			if var10.reachesEdges() then
				local var21, var22 = var10.checkEdges(var3.scrollState(), dataSource.getItemCount(), false)
				value.startReached = value.startReached or var21
				value.endReached = value.endReached or var22
			end
			return
		else
			local var23 = var10.dataChanged({
				itemCount = dataSource.getItemCount(),
				scrollState = var3.scrollState(),
				getScrollOffsetForItem = var3.offsetForItem
			}, dataChange, value.before)
			
			if var23 ~= nil and var9.allowsPolicyOffset() and var3.scrollTo(var23) ~= var3.getScrollOffset() then
				value.scrollPositionChanged = true
				value.scrollPositionFollowsCorrection = false
			end
			local var24, var25 = var10.checkEdges(var3.scrollState(), dataSource.getItemCount(), paginationEdgesModule.hasStructuralChange(dataChange))
			value.startReached = value.startReached or var24
			value.endReached = value.endReached or var25
		end
	end
	
	local t_2 = {}
	local t_3 = {}
	
	local function settle(value)
		-- upvalues: var3 (ref), settlePolicy (ref), p1 (ref), diagnosticsModule (copy), var14 (write), var13 (write), t_2 (ref), dataSource (write), layout (write), var2 (write), var7 (ref), var11 (ref), t_3 (ref), dataPrefetch (write), var8 (ref)
		var3.refresh()
		
		if value.policyEligible then
			settlePolicy(value)
		end
		local var18, var19 = var3.updateRanges()
		
		if p1.diagnostics ~= nil then
			if var18 then
				local visibleRange = var3.getVisibleRange()
				local t = {
					kind = diagnosticsModule.EventKind.RangeChanged,
					rangeKind = diagnosticsModule.RangeKind.Visible,
					firstIndex = visibleRange.firstIndex,
					lastIndex = visibleRange.lastIndex
				}
				
				if table.isfrozen(value.diagnostics) then
					value.diagnostics = {}
				end
				table.insert(value.diagnostics, t)
			end
			if var19 then
				local mountedRange = var3.getMountedRange()
				local t = {
					kind = diagnosticsModule.EventKind.RangeChanged,
					rangeKind = diagnosticsModule.RangeKind.Rendered,
					firstIndex = mountedRange.firstIndex,
					lastIndex = mountedRange.lastIndex
				}
				
				if table.isfrozen(value.diagnostics) then
					value.diagnostics = {}
				end
				table.insert(value.diagnostics, t)
			end
		end
		if var14 then return end
		if var13 then
			local scrollOffset = var3.getScrollOffset()
			local contentStartOffset = var3.getContentStartOffset()
			t_2.dataSource = dataSource
			t_2.layout = layout
			t_2.mountedRange = var3.getMountedRange()
			t_2.scrollOffset = scrollOffset
			t_2.contentStartOffset = contentStartOffset
			t_2.plan = if var2 then var7.update({
				itemSequence = dataSource,
				layout = layout,
				scrollOffset = scrollOffset,
				viewportLength = var3.getLength(),
				contentStartOffset = contentStartOffset
			}) else nil
			local var20, var21 = var11.apply(t_2)
			
			if var20 ~= nil then
				value.entered = var20.entered
				value.updated = var20.updated
				value.departed = var20.departed
			end
			if var21 ~= nil then
				if table.isfrozen(value.diagnostics) then
					value.diagnostics = {}
				end
				table.insert(value.diagnostics, var21)
			end
		elseif var11.isApplied() then
			value.departed = var11.release()
		end
		t_3.itemSequence = dataSource
		t_3.mountedRange = var3.getMountedRange()
		t_3.options = dataPrefetch
		value.dataPrefetchRequests = var8.reconcile(t_3)
	end
	
	local _ = nil
	
	local _ = function(p2)
		return if table.isfrozen(p2) then p2 else table.freeze(p2)
	end
	
	local function makeRecord(p2)
		-- upvalues: var17 (write), var11 (ref), var3 (ref), layout (write), var9 (ref)
		local freeze = table.freeze
		local t = { mountedViews = var11.getMountedViews() }
		local entered = p2.entered
		t.entered = if table.isfrozen(entered) then entered else table.freeze(entered)
		local updated = p2.updated
		t.updated = if table.isfrozen(updated) then updated else table.freeze(updated)
		local departed = p2.departed
		t.departed = if table.isfrozen(departed) then departed else table.freeze(departed)
		t.visibleRange = var3.getVisibleRange()
		t.mountedRange = var3.getMountedRange()
		t.scrollState = var3.scrollState(if var17 == nil then nil else var17.scrollState)
		t.contentStartOffset = var3.getContentStartOffset()
		t.contentLength = var3.getContentLength()
		t.requiresItemMeasurement = layout.requiresItemMeasurement()
		t.scrollCorrection = p2.scrollCorrection
		t.scrollPositionChanged = p2.scrollPositionChanged
		t.scrollPositionFollowsCorrection = p2.scrollPositionFollowsCorrection
		t.scrollAnchor = var9.getAnchoredItem()
		t.contentLengthChanged = p2.contentLengthChanged
		t.startReached = p2.startReached
		t.endReached = p2.endReached
		t.dataPrefetchRequests = p2.dataPrefetchRequests
		local diagnostics = p2.diagnostics
		t.diagnostics = if table.isfrozen(diagnostics) then diagnostics else table.freeze(diagnostics)
		
		return freeze(t)
	end
	
	local function mutateAndSettle(value, p2, p3, p4)
		-- upvalues: settle (ref)
		value(p2, p3, p4)
		settle(p2)
	end
	
	local function transact(p2, p3, p4)
		-- upvalues: var15 (write), var14 (write), t_1 (ref), var3 (ref), frozen (copy), mutateAndSettle (ref), var17 (write), makeRecord (ref), p1 (ref)
		assert(not var15, "Virtualizer: cannot mutate during a transaction")
		assert(not var14, "Virtualizer: cannot dispatch after destruction")
		var15 = true
		t_1.policyEligible = true
		t_1.dataChange = nil
		t_1.before = nil
		t_1.replaced = false
		t_1.viewportChanged = false
		t_1.scrollMoved = false
		t_1.contentLengthBefore = var3.getContentLength()
		t_1.scrollCorrection = 0
		t_1.scrollPositionChanged = false
		t_1.scrollPositionFollowsCorrection = false
		t_1.contentLengthChanged = false
		t_1.startReached = false
		t_1.endReached = false
		t_1.entered = frozen
		t_1.updated = frozen
		t_1.departed = frozen
		t_1.dataPrefetchRequests = frozen
		t_1.diagnostics = frozen
		local ok, status = pcall(mutateAndSettle, p2, t_1, p3, p4)
		var15 = false
		
		if not ok then
			error(status, 0)
		end
		local var18 = makeRecord(t_1)
		var17 = var18
		
		if p1.diagnostics ~= nil then
			for i, v in var18.diagnostics do
				p1.diagnostics(v)
			end
		end
		if p1.onTransaction ~= nil then
			p1.onTransaction(var17, var18)
		end
		return var18
	end
	
	local function applyDataChange(p5, p6)
		-- upvalues: var3 (ref), var11 (ref), applyCorrection (ref), var9 (ref), diagnosticsModule (copy), layout (write), var7 (ref)
		p5.before = var3.scrollState()
		p5.dataChange = p6
		var11.noteDataChange(p6)
		local var19 = false
		applyCorrection(p5, var9.preserve({
			source = diagnosticsModule.ScrollCorrectionSource.Data,
			dataSourceChange = p6
		}, function()
			-- upvalues: p6 (ref), var19 (write), layout (copy), var7 (copy), var3 (copy)
			for i, v in p6.changes do
				var19 = layout.applyDataSourceChange(v) or var19
			end
			var7.applyDataSourceChange(p6)
			var3.refresh()
		end))
	end
	
	local var20 = function(p7)
		-- upvalues: transact (ref), applyDataChange (ref)
		transact(applyDataChange, p7)
	end
	
	local var21 = function()
		-- upvalues: var16 (write), var12 (write), var14 (write), dataSource (write), var20 (write)
		if var16 == nil and var12 and not var14 then
			var16 = dataSource.subscribe(var20)
		end
	end
	
	local _ = function(p7)
		-- upvalues: dataSource (write), var16 (write), var7 (ref)
		if p7 ~= dataSource then
			if var16 ~= nil then
				var16()
				var16 = nil
			end
			dataSource = p7
		end
		var7.setItemSequence(dataSource)
	end
	
	local _ = function(p7)
		-- upvalues: layout (write), var3 (ref), var11 (ref)
		layout = p7
		var3.setLayout(p7)
		local crossAxisLength = var3.getCrossAxisLength()
		
		if crossAxisLength > 0 then
			p7.setViewportCrossAxisLength(crossAxisLength)
		end
		var11.invalidateLayout()
	end
	
	local _ = function()
		-- upvalues: var9 (ref), readKeys (ref), layout (write), dataSourceChangeTypeModule (copy), var3 (ref), var11 (ref), var21 (write)
		var9.reset()
		layout.applyDataSourceChange({
			type = dataSourceChangeTypeModule.Reset,
			keys = readKeys()
		})
		var3.refresh()
		var11.invalidateKeys()
		var11.invalidatePayloads()
		var21()
	end
	
	local function submitMeasurements(p7, p8)
		-- upvalues: var11 (ref), p1 (ref), diagnosticsModule (copy), var7 (ref), applyCorrection (ref), var9 (ref), layout (write), var3 (ref)
		local var22, var23 = var11.validate(p8)
		
		if #var22 > 0 and p1.diagnostics ~= nil then
			local t = {
				kind = diagnosticsModule.EventKind.MeasurementsProcessingStarted,
				submitted = #var22,
				boundaryDropped = var23
			}
			
			if table.isfrozen(p7.diagnostics) then
				p7.diagnostics = {}
			end
			table.insert(p7.diagnostics, t)
		end
		local var24 = 0
		local var25 = false
		local var26 = nil
		local t = {
			preserveStartAnchor = true,
			startInsetDelta = 0,
			source = diagnosticsModule.ScrollCorrectionSource.Measurement
		}
		local start = var7.getContentInsets().start
		applyCorrection(p7, var9.preserve(t, function()
			-- upvalues: var22 (ref), layout (copy), var24 (write), var23 (write), var25 (write), var7 (copy), var26 (write), t (ref), start (ref), var3 (copy)
			for i, v in var22 do
				local index = v.index
				
				if index == nil then
					if v.pinnedPosition == nil then
						var23 += 1
					else
						local var27 = var7.updatePinnedMeasurement(v.pinnedPosition, v.key, v.pinnedRevision, v.length)
						
						if var27 == nil then
							var23 += 1
						else
							var24 += 1
							var26 = var27
						end
					end
				end
				local var28 = layout.updateItemMeasurement({ itemIndex = index, itemKey = v.key, length = v.length })
				
				if var28.accepted then
					var24 += 1
				else
					var23 += 1
				end
				var25 = var25 or var28.geometryChanged
			end
			if var26 ~= nil then
				t.startInsetDelta = var26.start - start
				var3.setInsets(var26.start, var26.finish)
				var25 = true
			end
			var3.refresh()
		end))
		
		if p1.diagnostics ~= nil and #var22 > 0 then
			local t_1 = {
				kind = diagnosticsModule.EventKind.MeasurementsProcessed,
				accepted = var24,
				dropped = var23
			}
			
			if table.isfrozen(p7.diagnostics) then
				p7.diagnostics = {}
			end
			table.insert(p7.diagnostics, t_1)
		end
	end
	
	local function setPolicy(value)
		-- upvalues: dataPrefetchModule (copy), var3 (ref), var1 (write), dataPrefetch (write), isItemStickyHeader (write), pinnedStartItem (write), pinnedEndItem (write), var7 (ref), var2 (write), var10 (ref)
		dataPrefetchModule.resolve(value.dataPrefetch)
		local pinnedItems = value.pinnedItems
		var3.setOverscan(value.overscan)
		var3.setContentAlignment(value.contentAlignment)
		var3.setEndThreshold(value.endThreshold)
		var1 = value.preserveScrollPositionOnChange ~= false
		dataPrefetch = value.dataPrefetch
		isItemStickyHeader = pinnedItems.isItemStickyHeader
		pinnedStartItem = pinnedItems.pinnedStartItem
		pinnedEndItem = pinnedItems.pinnedEndItem
		local setOptions = var7.setOptions
		local t = { isItemStickyKey = isItemStickyHeader }
		local var27 = pinnedStartItem
		t.pinnedStartItem = if var27 == nil then nil else { key = var27.key }
		local var28 = pinnedEndItem
		t.pinnedEndItem = if var28 == nil then nil else { key = var28.key }
		
		if setOptions(t) then
			setOptions = var7.getContentInsets()
			var3.setInsets(setOptions.start, setOptions.finish)
		end
		var2 = if isItemStickyHeader == nil then if pinnedStartItem == nil then pinnedEndItem ~= nil else true else true
		var10.configure({
			initialScrollAlignment = value.initialScrollAlignment,
			autoScrollOnChange = value.autoScrollOnChange,
			autoScrollThreshold = value.autoScrollThreshold,
			startReachedThreshold = value.startReachedThreshold,
			startReachedEnabled = value.startReachedEnabled == true,
			endReachedEnabled = value.endReachedEnabled == true
		})
	end
	
	local function setActiveMutation(value, p9)
		-- upvalues: var13 (write), var11 (ref)
		value.policyEligible = false
		
		if p9 and not var13 then
			var11.invalidatePayloads()
		end
		var13 = p9
	end
	
	local function setScrollOffsetMutation(_, p9)
		-- upvalues: var3 (ref), var9 (ref)
		if var3.setScrollOffset(p9) then
			var9.setViewport(p9)
		end
	end
	
	local function observeScrollOffsetMutation(value, p9)
		-- upvalues: var3 (ref), scrollObservationKindModule (copy), var9 (ref)
		local var27 = var3.setScrollOffset(p9.offset)
		
		if p9.kind == scrollObservationKindModule.Programmatic then
			var9.observeHost(p9.offset)
		elseif var27 then
			var9.setViewport(p9.offset)
		end
		if p9.kind == scrollObservationKindModule.User then
			value.scrollMoved = true
		end
	end
	
	local function scrollToIndexMutation(p9, p10, p11)
		-- upvalues: var9 (ref), var3 (ref)
		var9.setItemTarget(p10, p11)
		var3.scrollTo(var3.offsetForItem(p10, p11))
		p9.scrollPositionChanged = true
		p9.scrollPositionFollowsCorrection = false
		p9.scrollMoved = true
	end
	
	local function scrollToOffsetMutation(value, p9)
		-- upvalues: var9 (ref), var3 (ref)
		var9.setViewport(var3.scrollTo(p9))
		value.scrollPositionChanged = true
		value.scrollPositionFollowsCorrection = false
		value.scrollMoved = true
	end
	
	local function scrollByMutation(p9, p10)
		-- upvalues: var9 (ref), var3 (ref)
		var9.setViewport(var3.scrollBy(p10))
		p9.scrollPositionChanged = true
		p9.scrollPositionFollowsCorrection = false
		p9.scrollMoved = true
	end
	
	local function scrollToEdgeMutation(p9, p10)
		-- upvalues: var9 (ref), var3 (ref), autoScrollModule (copy), var10 (ref)
		var9.setViewport(var3.scrollTo(autoScrollModule.getTargetOffset(p10, var3.getContentLength(), var3.getLength())))
		var10.pin(p10)
		p9.scrollPositionChanged = true
		p9.scrollPositionFollowsCorrection = false
	end
	
	local function setViewportSizeMutation(value, p9, p10)
		-- upvalues: var3 (ref), layout (write), var11 (ref), scrollAlignmentModule (copy), var9 (ref)
		local length = var3.getLength()
		local var27 = var3.getContentLength() - length - var3.getScrollOffset()
		
		if var3.setSize(p9, p10) then
			if layout.setViewportCrossAxisLength(p10) then
				var11.invalidateLayout()
			end
			if length > 0 and p9 ~= length and (var3.getContentAlignment() == scrollAlignmentModule.End and var9.allowsPolicyOffset()) then
				var3.refresh()
				local var28 = var3.scrollTo(var3.getContentLength() - p9 - math.max(0, var27))
				
				if var28 ~= var3.getScrollOffset() then
					var9.setViewport(var28)
					value.scrollPositionChanged = true
					value.scrollPositionFollowsCorrection = false
				end
			end
		end
		value.viewportChanged = true
	end
	
	t_1.policyEligible = true
	t_1.dataChange = nil
	t_1.before = nil
	t_1.replaced = false
	t_1.viewportChanged = false
	t_1.scrollMoved = false
	t_1.contentLengthBefore = var3.getContentLength()
	t_1.scrollCorrection = 0
	t_1.scrollPositionChanged = false
	t_1.scrollPositionFollowsCorrection = false
	t_1.contentLengthChanged = false
	t_1.startReached = false
	t_1.endReached = false
	t_1.entered = frozen
	t_1.updated = frozen
	t_1.departed = frozen
	t_1.dataPrefetchRequests = frozen
	t_1.diagnostics = frozen
	var17 = makeRecord(t_1)
	
	return {
		activate = function()
			-- upvalues: transact (ref), var12 (write), readKeys (ref), layout (write), dataSourceChangeTypeModule (copy), var3 (ref), var7 (ref), var11 (ref), var21 (write)
			return transact(function(p9)
				-- upvalues: var12 (copy), readKeys (copy), layout (copy), dataSourceChangeTypeModule (copy), var3 (copy), var7 (copy), var11 (copy), var21 (copy)
				if not var12 then
					var12 = true
					local var27 = readKeys()
					layout.applyDataSourceChange({ type = dataSourceChangeTypeModule.Reset, keys = var27 })
					var3.refresh()
					var7.applyDataSourceChange({
						changes = {
							{ type = dataSourceChangeTypeModule.Reset, keys = var27 }
						},
						previousItemCount = #var27,
						itemCount = #var27
					})
					var11.invalidateKeys()
					var21()
				end
				p9.viewportChanged = true
			end)
		end,
		setActive = function(value)
			-- upvalues: transact (ref), setActiveMutation (ref)
			return transact(setActiveMutation, value)
		end,
		setScrollOffset = function(value)
			-- upvalues: transact (ref), setScrollOffsetMutation (ref)
			return transact(setScrollOffsetMutation, value)
		end,
		observeScrollOffset = function(value)
			-- upvalues: transact (ref), observeScrollOffsetMutation (ref)
			return transact(observeScrollOffsetMutation, value)
		end,
		scrollToIndex = function(p9, p10)
			-- upvalues: transact (ref), scrollToIndexMutation (ref)
			return transact(scrollToIndexMutation, p9, p10)
		end,
		scrollToOffset = function(value)
			-- upvalues: transact (ref), scrollToOffsetMutation (ref)
			return transact(scrollToOffsetMutation, value)
		end,
		scrollToStart = function()
			-- upvalues: transact (ref), scrollToEdgeMutation (ref), autoScrollTargetModule (copy)
			return transact(scrollToEdgeMutation, autoScrollTargetModule.Start)
		end,
		scrollToEnd = function()
			-- upvalues: transact (ref), scrollToEdgeMutation (ref), autoScrollTargetModule (copy)
			return transact(scrollToEdgeMutation, autoScrollTargetModule.End)
		end,
		scrollBy = function(p9)
			-- upvalues: transact (ref), scrollByMutation (ref)
			return transact(scrollByMutation, p9)
		end,
		restoreScrollAnchorSnapshot = function(p9)
			-- upvalues: transact (ref), var9 (ref), var3 (ref)
			return transact(function(p10)
				-- upvalues: var9 (copy), p9 (ref), var3 (copy)
				var9.restore(p9, var3.scrollTo(var9.snapshotOffset(p9)))
				p10.scrollPositionChanged = true
				p10.scrollPositionFollowsCorrection = false
				p10.scrollMoved = true
			end)
		end,
		setViewportSize = function(value, p9)
			-- upvalues: transact (ref), setViewportSizeMutation (ref)
			return transact(setViewportSizeMutation, value, p9)
		end,
		setPolicy = function(value)
			-- upvalues: transact (ref), setPolicy (ref)
			return transact(function()
				-- upvalues: setPolicy (copy), value (ref)
				setPolicy(value)
			end)
		end,
		setDataSource = function(value)
			-- upvalues: transact (ref), dataSource (write), var16 (write), var7 (ref), var9 (ref), readKeys (ref), layout (write), dataSourceChangeTypeModule (copy), var3 (ref), var11 (ref), var21 (write)
			return transact(function(p9)
				-- upvalues: value (ref), dataSource (copy), var16 (copy), var7 (copy), var9 (copy), readKeys (copy), layout (copy), dataSourceChangeTypeModule (copy), var3 (copy), var11 (copy), var21 (copy)
				if value ~= dataSource then
					if var16 ~= nil then
						var16()
						var16 = nil
					end
					dataSource = value
				end
				var7.setItemSequence(dataSource)
				var9.reset()
				layout.applyDataSourceChange({
					type = dataSourceChangeTypeModule.Reset,
					keys = readKeys()
				})
				var3.refresh()
				var11.invalidateKeys()
				var11.invalidatePayloads()
				var21()
				p9.replaced = true
			end)
		end,
		setLayout = function(value)
			-- upvalues: transact (ref), layout (write), var3 (ref), var11 (ref), var9 (ref), readKeys (ref), dataSourceChangeTypeModule (copy)
			return transact(function()
				-- upvalues: value (ref), layout (copy), var3 (copy), var11 (copy), var9 (copy), readKeys (copy), dataSourceChangeTypeModule (copy)
				layout = value
				var3.setLayout(value)
				local crossAxisLength = var3.getCrossAxisLength()
				
				if crossAxisLength > 0 then
					value.setViewportCrossAxisLength(crossAxisLength)
				end
				var11.invalidateLayout()
				var9.reset()
				layout.applyDataSourceChange({
					type = dataSourceChangeTypeModule.Reset,
					keys = readKeys()
				})
				var3.refresh()
			end)
		end,
		setDataSourceAndLayout = function(value, p9)
			-- upvalues: transact (ref), dataSource (write), var16 (write), var7 (ref), layout (write), var3 (ref), var11 (ref), var9 (ref), readKeys (ref), dataSourceChangeTypeModule (copy), var21 (write)
			return transact(function(p10)
				-- upvalues: value (ref), dataSource (copy), var16 (copy), var7 (copy), p9 (ref), layout (copy), var3 (copy), var11 (copy), var9 (copy), readKeys (copy), dataSourceChangeTypeModule (copy), var21 (copy)
				if value ~= dataSource then
					if var16 ~= nil then
						var16()
						var16 = nil
					end
					dataSource = value
				end
				var7.setItemSequence(dataSource)
				layout = p9
				var3.setLayout(p9)
				local crossAxisLength = var3.getCrossAxisLength()
				
				if crossAxisLength > 0 then
					p9.setViewportCrossAxisLength(crossAxisLength)
				end
				var11.invalidateLayout()
				var9.reset()
				layout.applyDataSourceChange({
					type = dataSourceChangeTypeModule.Reset,
					keys = readKeys()
				})
				var3.refresh()
				var11.invalidateKeys()
				var11.invalidatePayloads()
				var21()
				p10.replaced = true
			end)
		end,
		refresh = function()
			-- upvalues: transact (ref), var11 (ref)
			return transact(function()
				-- upvalues: var11 (copy)
				var11.invalidateKeys()
				var11.invalidatePayloads()
			end)
		end,
		submitMeasurements = function(p9)
			-- upvalues: transact (ref), submitMeasurements (ref)
			return transact(submitMeasurements, p9)
		end,
		getCurrent = function()
			-- upvalues: var17 (write)
			return var17
		end,
		getItemLayout = function(p9)
			-- upvalues: layout (write)
			return layout.getItemLayout(p9)
		end,
		getScrollOffsetForItem = function(value, p9)
			-- upvalues: var3 (ref)
			return var3.offsetForItem(value, p9)
		end,
		captureScrollAnchorSnapshot = function()
			-- upvalues: var17 (write), dataSource (write), layout (write)
			local visibleRange = var17.visibleRange
			local scrollOffset = var17.scrollState.scrollOffset
			
			if visibleRange.firstIndex <= visibleRange.lastIndex then
				local firstIndex = visibleRange.firstIndex
				
				return {
					anchorKey = dataSource.getItemKey(firstIndex),
					anchorIndex = firstIndex,
					offsetWithinItem = scrollOffset - var17.contentStartOffset - layout.getItemLayout(firstIndex).startOffset,
					fallbackScrollOffset = scrollOffset
				}
			end
			return {
				anchorKey = nil,
				anchorIndex = nil,
				offsetWithinItem = 0,
				fallbackScrollOffset = scrollOffset
			}
		end,
		destroy = function()
			-- upvalues: var14 (write), transact (ref), var16 (write), var11 (ref), var8 (ref), var7 (ref)
			if var14 then
				return
			end
			transact(function(p9)
				-- upvalues: var16 (copy), var11 (copy), var8 (copy), var7 (copy), var14 (copy)
				p9.policyEligible = false
				
				if var16 ~= nil then
					var16()
					var16 = nil
				end
				p9.departed = var11.release()
				var11.destroy()
				var8.destroy()
				var7.destroy()
				var14 = true
			end)
		end
	}
end
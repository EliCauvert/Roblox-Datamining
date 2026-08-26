local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerModule = require(viewRecyclerReact.Parent.ViewRecycler)
local viewRecyclerRobloxModule = require(viewRecyclerReact.Parent.ViewRecyclerRoblox)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local recyclingScopeContextModule = require(script.Parent.RecyclingScopeContext)
local recyclingViewportContextModule = require(script.Parent.RecyclingViewportContext)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local useCompositionPlacementModule = require(script.Parent.useCompositionPlacement)
local scrollListHostRuntime = viewRecyclerRobloxModule.Internal.ScrollListHostRuntime

local function _(value, p1)
	if value == nil then return end
	if type(value) == "function" then
		value(p1)
		
		return
	end
	value.current = p1
end

local _ = function(p1)
	return if p1 == nil then nil else {
		key = p1.key,
		value = p1.value,
		itemViewType = p1.itemType
	}
end

local function listHostConfiguration(p1)
	return {
		axis = p1.axis,
		dataSource = p1.dataSource,
		layout = p1.layout,
		initialScrollAlignment = p1.initialScrollAlignment,
		autoScrollOnChange = p1.autoScrollOnChange,
		startReachedThreshold = p1.startReachedThreshold,
		onStartReached = p1.onStartReached,
		onEndReached = p1.onEndReached,
		onViewportChanged = p1.onViewportChanged,
		onScrollOffsetChanged = p1.onScrollOffsetChanged,
		onContentLengthChanged = p1.onContentLengthChanged,
		onVisibleRangeChanged = p1.onVisibleRangeChanged,
		onMountedRangeChanged = p1.onMountedRangeChanged,
		onDataPrefetchRequested = p1.onDataPrefetchRequested
	}
end

local _ = function(p1, p2)
	return {
		scrollingFrame = p1.current,
		viewportOverlay = p2.current
	}
end

local function corePolicy(p1)
	local t = {
		overscan = p1.overscan,
		overscanPolicy = p1.overscanPolicy,
		dataPrefetch = p1.dataPrefetch,
		contentAlignment = p1.contentAlignment,
		endThreshold = p1.endReachedThreshold
	}
	local t_1 = { isItemStickyHeader = p1.isItemStickyHeader }
	local pinnedStartItem = p1.pinnedStartItem
	t_1.pinnedStartItem = if pinnedStartItem == nil then nil else {
		key = pinnedStartItem.key,
		value = pinnedStartItem.value,
		itemViewType = pinnedStartItem.itemType
	}
	local pinnedEndItem = p1.pinnedEndItem
	t_1.pinnedEndItem = if pinnedEndItem == nil then nil else {
		key = pinnedEndItem.key,
		value = pinnedEndItem.value,
		itemViewType = pinnedEndItem.itemType
	}
	t.pinnedItems = t_1
	t.preserveScrollPositionOnChange = p1.preserveScrollPositionOnChange ~= false
	
	return t
end

local _ = function(p1, p2)
	-- upvalues: listHostConfiguration (ref), corePolicy (ref)
	return {
		hostConfiguration = listHostConfiguration(p1),
		hostTarget = p2,
		corePolicy = corePolicy(p1)
	}
end

return function(p1)
	-- upvalues: reactModule (ref), recyclingScopeContextModule (ref), recyclingViewportContextModule (ref), signalsModule (ref), useCompositionPlacementModule (ref), scrollListHostRuntime (ref), listHostConfiguration (ref), corePolicy (ref), recyclableViewRegistryModule (ref), viewRecyclerModule (ref)
	local var1 = reactModule.useRef(p1)
	var1.current = p1
	local var2 = reactModule.useContext(recyclingScopeContextModule)
	assert(var2 ~= nil, "VirtualListRenderer requires a RecyclingScope")
	local var3 = reactModule.useContext(recyclingViewportContextModule)
	local var4 = reactModule.useState(function()
		-- upvalues: signalsModule (copy)
		local var5, var6 = signalsModule.createSignal(false)
		
		return { active = var5, setActive = var6 }
	end)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useState(function()
		-- upvalues: var2 (ref)
		return var2.runtime.getRecyclingScope(var2.listOptions)
	end)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var2 (ref)
		var8.setMaxPoolSize(var2.listOptions.maxPoolSize)
	end, { var8, var2.listOptions.maxPoolSize })
	local var9 = useCompositionPlacementModule(var2.runtime, var2.listOptions.maxPoolSize, var2.listOptions.diagnostics)
	local var10 = reactModule.useRef({
		axis = p1.axis,
		layout = p1.layout,
		compositionPlacementManager = var9.manager
	})
	var10.current = {
		axis = p1.axis,
		layout = p1.layout,
		compositionPlacementManager = var9.manager
	}
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref)
		local current = var10.current
		p2.setStructuralPlacement(current.axis, current.layout.requiresItemMeasurement())
		p2.setCompositionPlacementManager(current.compositionPlacementManager)
	end, {})
	local var12 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var11 (ref)
		if p3 ~= nil then
			var11(p2)
		end
	end, { var11 })
	local var13 = reactModule.useState(function()
		-- upvalues: scrollListHostRuntime (copy), listHostConfiguration (copy), var1 (ref), var6 (ref), var7 (ref), corePolicy (copy), var8 (ref), recyclableViewRegistryModule (copy), p1 (ref), var3 (ref), var4 (ref), var12 (ref)
		return scrollListHostRuntime.newForRecyclableViewRecords({
			initialHostConfiguration = listHostConfiguration(var1.current),
			initialHostTarget = {
				scrollingFrame = var6.current,
				viewportOverlay = var7.current
			},
			initialCorePolicy = corePolicy(var1.current),
			core = {
				recyclingScope = var8,
				getItemViewType = function(p2, p3)
					-- upvalues: var1 (copy), recyclableViewRegistryModule (copy)
					local itemType = var1.current.itemType
					assert(recyclableViewRegistryModule.isRegistered(itemType) or type(itemType) == "function", "VirtualList: `itemType` must be a Recyclable view type or selector")
					local var14 = if recyclableViewRegistryModule.isRegistered(itemType) then itemType else itemType(p2, p3)
					assert(recyclableViewRegistryModule.isRegistered(var14), "VirtualList: `itemType` selector must return a Recyclable view type")
					
					return var14
				end,
				diagnostics = p1.diagnostics,
				active = if var3 == nil then nil else var4.active
			},
			prepareItemViewAssignment = var12,
			onItemViewAssignmentChanged = function(value, p2)
				-- upvalues: var1 (copy)
				if p2 == nil then
					value.setCompositionPlacementManager(nil)
				end
				local instrumentation = var1.current._instrumentation
				
				if instrumentation ~= nil and instrumentation.assignmentChanged ~= nil then
					instrumentation.assignmentChanged(value, p2)
				end
			end,
			onItemViewPresentationChanged = function(p2, p3)
				-- upvalues: var1 (copy)
				local instrumentation = var1.current._instrumentation
				
				if instrumentation ~= nil and instrumentation.presentationChanged ~= nil then
					instrumentation.presentationChanged(p2, p3)
				end
			end
		})
	end)
	local var14 = reactModule.useState(function()
		-- upvalues: var1 (ref), var6 (ref), var7 (ref), var13 (ref), listHostConfiguration (copy), corePolicy (copy)
		local current = var1.current
		local t = {
			scrollingFrame = var6.current,
			viewportOverlay = var7.current
		}
		
		return {
			synchronize = function(p2)
				-- upvalues: current (write), var13 (copy), t (write), listHostConfiguration (copy), corePolicy (copy)
				current = p2
				var13.update({
					hostConfiguration = listHostConfiguration(p2),
					hostTarget = t,
					corePolicy = corePolicy(p2)
				})
			end,
			refreshHost = function()
				-- upvalues: t (write), var6 (copy), var7 (copy), var13 (copy), current (write), listHostConfiguration (copy), corePolicy (copy)
				t = {
					scrollingFrame = var6.current,
					viewportOverlay = var7.current
				}
				var13.update({
					hostConfiguration = listHostConfiguration(current),
					hostTarget = t,
					corePolicy = corePolicy(current)
				})
			end
		}
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var13 (ref)
		return var13.connect()
	end, { var13 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return var2.registerConsumer()
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref)
		return function()
			-- upvalues: var5 (copy)
			local current = var5.current
			
			if current ~= nil then
				var5.current = nil
				current()
			end
		end
	end, {})
	reactModule.useLayoutEffect(function()
		-- upvalues: var13 (ref), viewRecyclerModule (copy), var11 (ref)
		for i, v in var13.query({
			type = viewRecyclerModule.VirtualizerQueryType.GetItemViews
		}) do
			var11(v)
		end
	end, {
		var9.manager,
		var11,
		p1.axis,
		p1.layout,
		var13
	})
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), viewRecyclerModule (copy), var13 (ref)
		var13.dispatch({
			type = viewRecyclerModule.VirtualizerCommandType.Activate
		})
		
		return function()
			-- upvalues: var13 (copy)
			var13.destroy()
		end
	end, { var13, var13 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var14 (ref), p1 (ref)
		var14.synchronize(p1)
	end)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var13 (ref)
		local onVisibleRangeChanged = p1.onVisibleRangeChanged
		
		if onVisibleRangeChanged == nil then
			return
		end
		onVisibleRangeChanged(var13.getSnapshot().visibleRange)
	end, { var13, p1.onVisibleRangeChanged })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var13 (ref)
		local onMountedRangeChanged = p1.onMountedRangeChanged
		
		if onMountedRangeChanged == nil then
			return
		end
		onMountedRangeChanged(var13.getSnapshot().mountedRange)
	end, { var13, p1.onMountedRangeChanged })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		if p1.onDataPrefetchRequested == nil then
			return
		end
	end, { var13, p1.onDataPrefetchRequested })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), viewRecyclerModule (copy)
		var13.dispatch({ type = viewRecyclerModule.VirtualizerCommandType.Refresh })
	end, { var13, p1.itemType })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var13 (ref), viewRecyclerModule (copy), p1 (ref)
		local t = {
			scrollToIndex = function(p2, p3)
				-- upvalues: var13 (copy), var13 (copy), viewRecyclerModule (copy)
				if var13.isHostReady() then
					var13.dispatch({
						type = viewRecyclerModule.VirtualizerCommandType.ScrollToIndex,
						index = p2,
						alignment = p3 and p3.alignment
					})
				end
			end,
			scrollToOffset = function(value)
				-- upvalues: var13 (copy), viewRecyclerModule (copy)
				return var13.dispatch({
					type = viewRecyclerModule.VirtualizerCommandType.ScrollToOffset,
					offset = value
				}).result
			end,
			scrollBy = function(p2)
				-- upvalues: var13 (copy), viewRecyclerModule (copy)
				return var13.dispatch({
					type = viewRecyclerModule.VirtualizerCommandType.ScrollBy,
					delta = p2
				}).result
			end,
			getScrollState = function()
				-- upvalues: var13 (copy), viewRecyclerModule (copy)
				return var13.query({
					type = viewRecyclerModule.VirtualizerQueryType.GetScrollState
				})
			end,
			captureScrollSnapshot = function()
				-- upvalues: var13 (copy), viewRecyclerModule (copy)
				return var13.query({
					type = viewRecyclerModule.VirtualizerQueryType.CaptureScrollSnapshot
				})
			end,
			restoreScrollSnapshot = function(p2)
				-- upvalues: var13 (copy), viewRecyclerModule (copy)
				return var13.dispatch({
					type = viewRecyclerModule.VirtualizerCommandType.RestoreScrollSnapshot,
					snapshot = p2
				}).result
			end
		}
		local listRef = p1.listRef
		
		if listRef ~= nil then
			if type(listRef) == "function" then
				listRef(t)
			else
				listRef.current = t
			end
		end
		return function()
			-- upvalues: p1 (copy)
			local listRef = p1.listRef
			
			if listRef == nil then return end
			if type(listRef) == "function" then
				listRef(nil)
				
				return
			end
			listRef.current = nil
		end
	end, { p1.listRef, var13.isHostReady, var13 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref)
		local scrollingFrameRef = p1.scrollingFrameRef
		local current = var6.current
		
		if scrollingFrameRef ~= nil then
			if type(scrollingFrameRef) == "function" then
				scrollingFrameRef(current)
			else
				scrollingFrameRef.current = current
			end
		end
		return function()
			-- upvalues: p1 (copy)
			local scrollingFrameRef = p1.scrollingFrameRef
			
			if scrollingFrameRef == nil then return end
			if type(scrollingFrameRef) == "function" then
				scrollingFrameRef(nil)
				
				return
			end
			scrollingFrameRef.current = nil
		end
	end, { p1.scrollingFrameRef, var6 })
	
	return {
		axis = p1.axis,
		onScrollingFrameChanged = reactModule.useCallback(function(p2)
			-- upvalues: var5 (ref), var3 (ref), var4 (ref), var14 (ref)
			local current = var5.current
			
			if current ~= nil then
				var5.current = nil
				current()
			end
			if p2 ~= nil and var3 ~= nil then
				var5.current = var3.register(p2, var4.setActive)
			end
			var14.refreshHost()
		end, { var4, var14.refreshHost, var3 }),
		onViewportOverlayChanged = reactModule.useCallback(function(_)
			-- upvalues: var14 (ref)
			var14.refreshHost()
		end, { var14.refreshHost }),
		internalRef = var6,
		viewportOverlayRef = var7,
		scrollingFrameProps = p1.scrollingFrameProps,
		tag = p1.tag
	}
end
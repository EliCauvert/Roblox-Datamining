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

local function _(value, p0) --[[ line: 24 | named "assignRef" ]]
	if value == nil then return end
	if type(value) == "function" then
		value(p0)
		
		return
	end
	value.current = p0
end

local _ = function(p1) --[[ line: 35 | named "toCorePinnedItem" ]]
	return if p1 == nil then nil else {
		key = p1.key,
		value = p1.value,
		itemViewType = p1.itemType
	}
end

local function listHostConfiguration(p2) --[[ line: 46 ]]
	return {
		axis = p2.axis,
		dataSource = p2.dataSource,
		layout = p2.layout,
		initialScrollAlignment = p2.initialScrollAlignment,
		autoScrollOnChange = p2.autoScrollOnChange,
		startReachedThreshold = p2.startReachedThreshold,
		onStartReached = p2.onStartReached,
		onEndReached = p2.onEndReached,
		onViewportChanged = p2.onViewportChanged,
		onScrollOffsetChanged = p2.onScrollOffsetChanged,
		onContentLengthChanged = p2.onContentLengthChanged,
		onVisibleRangeChanged = p2.onVisibleRangeChanged,
		onMountedRangeChanged = p2.onMountedRangeChanged,
		onDataPrefetchRequested = p2.onDataPrefetchRequested
	}
end

local _ = function(p3, p4) --[[ line: 65 | named "hostTarget" ]]
	return {
		scrollingFrame = p3.current,
		viewportOverlay = p4.current
	}
end

local function corePolicy(p5) --[[ line: 72 ]]
	local t = {
		overscan = p5.overscan,
		overscanPolicy = p5.overscanPolicy,
		dataPrefetch = p5.dataPrefetch,
		contentAlignment = p5.contentAlignment,
		endThreshold = p5.endReachedThreshold
	}
	local t_1 = { isItemStickyHeader = p5.isItemStickyHeader }
	local pinnedStartItem = p5.pinnedStartItem
	t_1.pinnedStartItem = if pinnedStartItem == nil then nil else {
		key = pinnedStartItem.key,
		value = pinnedStartItem.value,
		itemViewType = pinnedStartItem.itemType
	}
	local pinnedEndItem = p5.pinnedEndItem
	t_1.pinnedEndItem = if pinnedEndItem == nil then nil else {
		key = pinnedEndItem.key,
		value = pinnedEndItem.value,
		itemViewType = pinnedEndItem.itemType
	}
	t.pinnedItems = t_1
	t.preserveScrollPositionOnChange = p5.preserveScrollPositionOnChange ~= false
	
	return t
end

local _ = function(p6, p7) --[[ line: 88 | named "committedUpdate" ]]
	-- upvalues: listHostConfiguration (ref), corePolicy (ref)
	return {
		hostConfiguration = listHostConfiguration(p6),
		hostTarget = p7,
		corePolicy = corePolicy(p6)
	}
end

return function(p8) --[[ line: 96 | named "useVirtualListRuntime" ]]
	-- upvalues: reactModule (ref), recyclingScopeContextModule (ref), recyclingViewportContextModule (ref), signalsModule (ref), useCompositionPlacementModule (ref), scrollListHostRuntime (ref), listHostConfiguration (ref), corePolicy (ref), recyclableViewRegistryModule (ref), viewRecyclerModule (ref)
	local var13 = reactModule.useRef(p8)
	var13.current = p8
	local var14 = reactModule.useContext(recyclingScopeContextModule)
	assert(var14 ~= nil, "VirtualListRenderer requires a RecyclingScope")
	local var15 = reactModule.useContext(recyclingViewportContextModule)
	local var16 = reactModule.useState(function() --[[ line: 103 ]]
		-- upvalues: signalsModule (copy)
		local var27, var28 = signalsModule.createSignal(false)
		
		return { active = var27, setActive = var28 }
	end)
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useState(function() --[[ line: 114 ]]
		-- upvalues: var14 (ref)
		return var14.runtime.getRecyclingScope(var14.listOptions)
	end)
	reactModule.useEffect(function() --[[ line: 117 ]]
		-- upvalues: var20 (ref), var14 (ref)
		var20.setMaxPoolSize(var14.listOptions.maxPoolSize)
	end, { var20, var14.listOptions.maxPoolSize })
	local var21 = useCompositionPlacementModule(var14.runtime, var14.listOptions.maxPoolSize, var14.listOptions.diagnostics)
	local var22 = reactModule.useRef({
		axis = p8.axis,
		layout = p8.layout,
		compositionPlacementManager = var21.manager
	})
	var22.current = {
		axis = p8.axis,
		layout = p8.layout,
		compositionPlacementManager = var21.manager
	}
	local var23 = reactModule.useCallback(function(p9) --[[ line: 136 ]]
		-- upvalues: var22 (ref)
		local current = var22.current
		p9.setStructuralPlacement(current.axis, current.layout.requiresItemMeasurement())
		p9.setCompositionPlacementManager(current.compositionPlacementManager)
	end, {})
	local var24 = reactModule.useCallback(function(p10, p11) --[[ line: 141 ]]
		-- upvalues: var23 (ref)
		if p11 ~= nil then
			var23(p10)
		end
	end, { var23 })
	local var25 = reactModule.useState(function() --[[ line: 146 ]]
		-- upvalues: scrollListHostRuntime (copy), listHostConfiguration (copy), var13 (ref), var18 (ref), var19 (ref), corePolicy (copy), var20 (ref), recyclableViewRegistryModule (copy), p8 (ref), var15 (ref), var16 (ref), var24 (ref)
		return scrollListHostRuntime.newForRecyclableViewRecords({
			initialHostConfiguration = listHostConfiguration(var13.current),
			initialHostTarget = {
				scrollingFrame = var18.current,
				viewportOverlay = var19.current
			},
			initialCorePolicy = corePolicy(var13.current),
			core = {
				recyclingScope = var20,
				getItemViewType = function(p12, p13) --[[ line: 155 ]]
					-- upvalues: var13 (copy), recyclableViewRegistryModule (copy)
					local itemType = var13.current.itemType
					assert(recyclableViewRegistryModule.isRegistered(itemType) or type(itemType) == "function", "VirtualList: `itemType` must be a Recyclable view type or selector")
					local var29 = if recyclableViewRegistryModule.isRegistered(itemType) then itemType else itemType(p12, p13)
					assert(recyclableViewRegistryModule.isRegistered(var29), "VirtualList: `itemType` selector must return a Recyclable view type")
					
					return var29
				end,
				diagnostics = p8.diagnostics,
				active = if var15 == nil then nil else var16.active
			},
			prepareItemViewAssignment = var24,
			onItemViewAssignmentChanged = function(value, p14) --[[ line: 174 ]]
				-- upvalues: var13 (copy)
				if p14 == nil then
					value.setCompositionPlacementManager(nil)
				end
				local instrumentation = var13.current._instrumentation
				
				if instrumentation ~= nil and instrumentation.assignmentChanged ~= nil then
					instrumentation.assignmentChanged(value, p14)
				end
			end,
			onItemViewPresentationChanged = function(p15, p16) --[[ line: 183 ]]
				-- upvalues: var13 (copy)
				local instrumentation = var13.current._instrumentation
				
				if instrumentation ~= nil and instrumentation.presentationChanged ~= nil then
					instrumentation.presentationChanged(p15, p16)
				end
			end
		})
	end)
	local var26 = reactModule.useState(function() --[[ line: 192 ]]
		-- upvalues: var13 (ref), var18 (ref), var19 (ref), var25 (ref), listHostConfiguration (copy), corePolicy (copy)
		local current = var13.current
		local t = {
			scrollingFrame = var18.current,
			viewportOverlay = var19.current
		}
		
		return {
			synchronize = function(p17) --[[ line: 196 ]]
				-- upvalues: current (write), var25 (copy), t (write), listHostConfiguration (copy), corePolicy (copy)
				current = p17
				var25.update({
					hostConfiguration = listHostConfiguration(p17),
					hostTarget = t,
					corePolicy = corePolicy(p17)
				})
			end,
			refreshHost = function() --[[ line: 200 ]]
				-- upvalues: t (write), var18 (copy), var19 (copy), var25 (copy), current (write), listHostConfiguration (copy), corePolicy (copy)
				t = {
					scrollingFrame = var18.current,
					viewportOverlay = var19.current
				}
				var25.update({
					hostConfiguration = listHostConfiguration(current),
					hostTarget = t,
					corePolicy = corePolicy(current)
				})
			end
		}
	end)
	reactModule.useLayoutEffect(function() --[[ line: 207 ]]
		-- upvalues: var25 (ref)
		return var25.connect()
	end, { var25 })
	reactModule.useEffect(function() --[[ line: 211 ]]
		-- upvalues: var14 (ref)
		return var14.registerConsumer()
	end, { var14 })
	reactModule.useEffect(function() --[[ line: 215 ]]
		-- upvalues: var17 (ref)
		return function() --[[ line: 216 ]]
			-- upvalues: var17 (copy)
			local current = var17.current
			
			if current ~= nil then
				var17.current = nil
				current()
			end
		end
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 226 ]]
		-- upvalues: var25 (ref), viewRecyclerModule (copy), var23 (ref)
		for i, v in var25.query({
			type = viewRecyclerModule.VirtualizerQueryType.GetItemViews
		}) do
			var23(v)
		end
	end, {
		var21.manager,
		var23,
		p8.axis,
		p8.layout,
		var25
	})
	reactModule.useEffect(function() --[[ line: 240 ]]
		-- upvalues: var25 (ref), viewRecyclerModule (copy), var25 (ref)
		var25.dispatch({
			type = viewRecyclerModule.VirtualizerCommandType.Activate
		})
		
		return function() --[[ line: 242 ]]
			-- upvalues: var25 (copy)
			var25.destroy()
		end
	end, { var25, var25 })
	reactModule.useLayoutEffect(function() --[[ line: 247 ]]
		-- upvalues: var26 (ref), p8 (ref)
		var26.synchronize(p8)
	end)
	reactModule.useEffect(function() --[[ line: 251 ]]
		-- upvalues: p8 (ref), var25 (ref)
		local onVisibleRangeChanged = p8.onVisibleRangeChanged
		
		if onVisibleRangeChanged == nil then
			return
		end
		onVisibleRangeChanged(var25.getSnapshot().visibleRange)
	end, { var25, p8.onVisibleRangeChanged })
	reactModule.useEffect(function() --[[ line: 259 ]]
		-- upvalues: p8 (ref), var25 (ref)
		local onMountedRangeChanged = p8.onMountedRangeChanged
		
		if onMountedRangeChanged == nil then
			return
		end
		onMountedRangeChanged(var25.getSnapshot().mountedRange)
	end, { var25, p8.onMountedRangeChanged })
	reactModule.useEffect(function() --[[ line: 267 ]]
		-- upvalues: p8 (ref)
		if p8.onDataPrefetchRequested == nil then
			return
		end
	end, { var25, p8.onDataPrefetchRequested })
	reactModule.useEffect(function() --[[ line: 275 ]]
		-- upvalues: var25 (ref), viewRecyclerModule (copy)
		var25.dispatch({ type = viewRecyclerModule.VirtualizerCommandType.Refresh })
	end, { var25, p8.itemType })
	reactModule.useEffect(function() --[[ line: 279 ]]
		-- upvalues: var25 (ref), var25 (ref), viewRecyclerModule (copy), p8 (ref)
		local t = {
			scrollToIndex = function(p18, p19) --[[ line: 281 ]]
				-- upvalues: var25 (copy), var25 (copy), viewRecyclerModule (copy)
				if var25.isHostReady() then
					var25.dispatch({
						type = viewRecyclerModule.VirtualizerCommandType.ScrollToIndex,
						index = p18,
						alignment = p19 and p19.alignment
					})
				end
			end,
			scrollToOffset = function(value) --[[ line: 290 ]]
				-- upvalues: var25 (copy), viewRecyclerModule (copy)
				return var25.dispatch({
					type = viewRecyclerModule.VirtualizerCommandType.ScrollToOffset,
					offset = value
				}).result
			end,
			scrollBy = function(p20) --[[ line: 293 ]]
				-- upvalues: var25 (copy), viewRecyclerModule (copy)
				return var25.dispatch({
					type = viewRecyclerModule.VirtualizerCommandType.ScrollBy,
					delta = p20
				}).result
			end,
			getScrollState = function() --[[ line: 296 ]]
				-- upvalues: var25 (copy), viewRecyclerModule (copy)
				return var25.query({
					type = viewRecyclerModule.VirtualizerQueryType.GetScrollState
				})
			end,
			captureScrollSnapshot = function() --[[ line: 299 ]]
				-- upvalues: var25 (copy), viewRecyclerModule (copy)
				return var25.query({
					type = viewRecyclerModule.VirtualizerQueryType.CaptureScrollSnapshot
				})
			end,
			restoreScrollSnapshot = function(p21) --[[ line: 302 ]]
				-- upvalues: var25 (copy), viewRecyclerModule (copy)
				return var25.dispatch({
					type = viewRecyclerModule.VirtualizerCommandType.RestoreScrollSnapshot,
					snapshot = p21
				}).result
			end
		}
		local listRef = p8.listRef
		
		if listRef ~= nil then
			if type(listRef) == "function" then
				listRef(t)
			else
				listRef.current = t
			end
		end
		return function() --[[ line: 310 ]]
			-- upvalues: p8 (copy)
			local listRef = p8.listRef
			
			if listRef == nil then return end
			if type(listRef) == "function" then
				listRef(nil)
				
				return
			end
			listRef.current = nil
		end
	end, { p8.listRef, var25.isHostReady, var25 })
	reactModule.useEffect(function() --[[ line: 315 ]]
		-- upvalues: p8 (ref), var18 (ref)
		local scrollingFrameRef = p8.scrollingFrameRef
		local current = var18.current
		
		if scrollingFrameRef ~= nil then
			if type(scrollingFrameRef) == "function" then
				scrollingFrameRef(current)
			else
				scrollingFrameRef.current = current
			end
		end
		return function() --[[ line: 317 ]]
			-- upvalues: p8 (copy)
			local scrollingFrameRef = p8.scrollingFrameRef
			
			if scrollingFrameRef == nil then return end
			if type(scrollingFrameRef) == "function" then
				scrollingFrameRef(nil)
				
				return
			end
			scrollingFrameRef.current = nil
		end
	end, { p8.scrollingFrameRef, var18 })
	
	return {
		axis = p8.axis,
		onScrollingFrameChanged = reactModule.useCallback(function(p22) --[[ line: 323 ]]
			-- upvalues: var17 (ref), var15 (ref), var16 (ref), var26 (ref)
			local current = var17.current
			
			if current ~= nil then
				var17.current = nil
				current()
			end
			if p22 ~= nil and var15 ~= nil then
				var17.current = var15.register(p22, var16.setActive)
			end
			var26.refreshHost()
		end, { var16, var26.refreshHost, var15 }),
		onViewportOverlayChanged = reactModule.useCallback(function(_) --[[ line: 341 ]]
			-- upvalues: var26 (ref)
			var26.refreshHost()
		end, { var26.refreshHost }),
		internalRef = var18,
		viewportOverlayRef = var19,
		scrollingFrameProps = p8.scrollingFrameProps,
		tag = p8.tag
	}
end
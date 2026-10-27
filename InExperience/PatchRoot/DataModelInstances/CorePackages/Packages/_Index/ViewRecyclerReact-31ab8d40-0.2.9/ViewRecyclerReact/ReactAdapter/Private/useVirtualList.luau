local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerModule = require(ViewRecyclerReact.Parent.ViewRecycler)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local RecyclingScopeContextModule = require(script.Parent.RecyclingScopeContext)
local RecyclingViewportContextModule = require(script.Parent.RecyclingViewportContext)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local UseCompositionPlacementModule = require(script.Parent.useCompositionPlacement)
local _ = require(script.Parent.VirtualListShell)
local ScrollingFrameVirtualizer = require(ViewRecyclerReact.Parent.ViewRecyclerRoblox).Internal.ScrollingFrameVirtualizer

local function _(Callback: (any) -> (), Current)
	if Callback == nil then return end
	if type(Callback) == "function" then
		Callback(Current)
		
		return
	else
		Callback.current = Current
	end
end

local _ = function(p1)
	return if p1 == nil then nil else {
		key = p1.key,
		value = p1.value,
		itemViewType = p1.itemType
	}
end

local function listHostConfiguration(Current)
	return {
		axis = Current.axis,
		dataSource = Current.dataSource,
		layout = Current.layout,
		initialScrollAlignment = Current.initialScrollAlignment,
		autoScrollOnChange = Current.autoScrollOnChange,
		startReachedThreshold = Current.startReachedThreshold,
		onStartReached = Current.onStartReached,
		onEndReached = Current.onEndReached,
		onViewportChanged = Current.onViewportChanged,
		onScrollOffsetChanged = Current.onScrollOffsetChanged,
		onContentLengthChanged = Current.onContentLengthChanged,
		onVisibleRangeChanged = Current.onVisibleRangeChanged,
		onMountedRangeChanged = Current.onMountedRangeChanged,
		onDataPrefetchRequested = Current.onDataPrefetchRequested
	}
end

local _ = function(p1, p2)
	return {
		scrollingFrame = p1.current,
		viewportOverlay = p2.current
	}
end

local function corePolicy(Current)
	local PinnedStartItem = Current.pinnedStartItem
	local Config = if PinnedStartItem == nil then nil else {
		key = PinnedStartItem.key,
		value = PinnedStartItem.value,
		itemViewType = PinnedStartItem.itemType
	}
	local PinnedEndItem = Current.pinnedEndItem
	
	return {
		overscan = Current.overscan,
		overscanPolicy = Current.overscanPolicy,
		dataPrefetch = Current.dataPrefetch,
		contentAlignment = Current.contentAlignment,
		endThreshold = Current.endReachedThreshold,
		pinnedItems = {
			isItemStickyHeader = Current.isItemStickyHeader,
			pinnedStartItem = Config,
			pinnedEndItem = if PinnedEndItem == nil then nil else {
				key = PinnedEndItem.key,
				value = PinnedEndItem.value,
				itemViewType = PinnedEndItem.itemType
			}
		},
		preserveScrollPositionOnChange = Current.preserveScrollPositionOnChange ~= false
	}
end

local _ = function(p1, HostTarget)
	-- upvalues: listHostConfiguration (copy), corePolicy (copy)
	return {
		hostConfiguration = listHostConfiguration(p1),
		hostTarget = HostTarget,
		corePolicy = corePolicy(p1)
	}
end

return function(Current)
	-- upvalues: ReactModule (copy), RecyclingScopeContextModule (copy), RecyclingViewportContextModule (copy), SignalsModule (copy), UseCompositionPlacementModule (copy), ScrollingFrameVirtualizer (copy), listHostConfiguration (copy), corePolicy (copy), RecyclableViewRegistryModule (copy), ViewRecyclerModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseContextResult = ReactModule.useContext(RecyclingScopeContextModule)
	assert(UseContextResult ~= nil, "VirtualListRenderer requires a RecyclingScope")
	local UseContextResult1 = ReactModule.useContext(RecyclingViewportContextModule)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(false)
		
		return { active = Signal, setActive = Signal2 }
	end)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseStateResult1 = ReactModule.useState(function()
		-- upvalues: UseContextResult (copy)
		return UseContextResult.root.getScope(UseContextResult.listOptions)
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseContextResult (copy)
		UseStateResult1.setMaxPoolSize(UseContextResult.listOptions.maxPoolSize)
	end, {
		UseStateResult1,
		UseContextResult.listOptions.maxPoolSize
	})
	local UseCompositionPlacementModuleResult = UseCompositionPlacementModule(UseContextResult.root, UseContextResult.listOptions.maxPoolSize, UseContextResult.listOptions.diagnostics)
	local UseRefResult4 = ReactModule.useRef({
		axis = Current.axis,
		layout = Current.layout,
		compositionPlacement = UseCompositionPlacementModuleResult
	})
	UseRefResult4.current = {
		axis = Current.axis,
		layout = Current.layout,
		compositionPlacement = UseCompositionPlacementModuleResult
	}
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult4 (copy)
		local Current = UseRefResult4.current
		p1.setStructuralPlacement(Current.axis, Current.layout.requiresItemMeasurement())
		p1.setCompositionPlacement(Current.compositionPlacement)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseResult (copy)
		if p2 ~= nil then
			UseResult(p1)
		end
	end, { UseResult })
	local UseStateResult2 = ReactModule.useState(function()
		-- upvalues: ScrollingFrameVirtualizer (upval), listHostConfiguration (upval), UseRefResult (copy), UseRefResult2 (copy), UseRefResult3 (copy), corePolicy (upval), UseStateResult1 (copy), RecyclableViewRegistryModule (upval), Current (copy), UseContextResult1 (copy), UseStateResult (copy), UseResult1 (copy)
		return ScrollingFrameVirtualizer.newForRecyclableViews({
			initialHostConfiguration = listHostConfiguration(UseRefResult.current),
			initialHostTarget = {
				scrollingFrame = UseRefResult2.current,
				viewportOverlay = UseRefResult3.current
			},
			initialCorePolicy = corePolicy(UseRefResult.current),
			core = {
				recyclingScope = UseStateResult1,
				getItemViewType = function(p1, p2)
					-- upvalues: UseRefResult (upval), RecyclableViewRegistryModule (upval)
					local ItemTypeFunction = UseRefResult.current.itemType
					assert(RecyclableViewRegistryModule.isRegistered(ItemTypeFunction) or type(ItemTypeFunction) == "function", "VirtualList: `itemType` must be a Recyclable view type or selector")
					local ItemTypeFunction1 = if RecyclableViewRegistryModule.isRegistered(ItemTypeFunction) then ItemTypeFunction else ItemTypeFunction(p1, p2)
					assert(RecyclableViewRegistryModule.isRegistered(ItemTypeFunction1), "VirtualList: `itemType` selector must return a Recyclable view type")
					
					return ItemTypeFunction1
				end,
				diagnostics = Current.diagnostics,
				active = if UseContextResult1 == nil then nil else UseStateResult.active
			},
			prepareAssignment = UseResult1,
			onItemViewAssignmentChanged = function(p1, p2)
				-- upvalues: UseRefResult (upval)
				if p2 == nil then
					p1.setCompositionPlacement(nil)
				end
				local Instrumentation = UseRefResult.current._instrumentation
				
				if Instrumentation ~= nil and Instrumentation.assignmentChanged ~= nil then
					Instrumentation.assignmentChanged(p1, p2)
				end
			end,
			onItemViewPresentationChanged = function(p1, p2)
				-- upvalues: UseRefResult (upval)
				local Instrumentation = UseRefResult.current._instrumentation
				
				if Instrumentation ~= nil and Instrumentation.presentationChanged ~= nil then
					Instrumentation.presentationChanged(p1, p2)
				end
			end
		})
	end)
	local UseStateResult3 = ReactModule.useState(function()
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseStateResult2 (copy), listHostConfiguration (upval), corePolicy (upval)
		local Current = UseRefResult.current
		local HostTarget = {
			scrollingFrame = UseRefResult2.current,
			viewportOverlay = UseRefResult3.current
		}
		
		return {
			synchronize = function(Current1)
				-- upvalues: Current (ref), UseStateResult2 (upval), HostTarget (ref), listHostConfiguration (upval), corePolicy (upval)
				Current = Current1
				UseStateResult2.update({
					hostConfiguration = listHostConfiguration(Current1),
					hostTarget = HostTarget,
					corePolicy = corePolicy(Current1)
				})
			end,
			refreshHost = function()
				-- upvalues: HostTarget (ref), UseRefResult2 (upval), UseRefResult3 (upval), UseStateResult2 (upval), Current (ref), listHostConfiguration (upval), corePolicy (upval)
				HostTarget = {
					scrollingFrame = UseRefResult2.current,
					viewportOverlay = UseRefResult3.current
				}
				local Current1 = Current
				UseStateResult2.update({
					hostConfiguration = listHostConfiguration(Current1),
					hostTarget = HostTarget,
					corePolicy = corePolicy(Current1)
				})
			end
		}
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult2 (copy)
		return UseStateResult2.connect()
	end, { UseStateResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy)
		return UseContextResult.registerConsumer()
	end, { UseContextResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult1 (upval)
			local CurrentFunction: () -> () = UseRefResult1.current
			
			if CurrentFunction ~= nil then
				UseRefResult1.current = nil
				CurrentFunction()
			end
		end
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult2 (copy), ViewRecyclerModule (upval), UseResult (copy)
		for _, value in UseStateResult2.query({
			type = ViewRecyclerModule.VirtualizerQueryType.GetItemViews
		}) do
			UseResult(value)
		end
	end, {
		UseCompositionPlacementModuleResult,
		UseResult,
		Current.axis,
		Current.layout,
		UseStateResult2
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), ViewRecyclerModule (upval), UseStateResult2 (copy)
		UseStateResult2.dispatch({
			type = ViewRecyclerModule.VirtualizerCommandType.Activate
		})
		
		return function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2.destroy()
		end
	end, { UseStateResult2, UseStateResult2 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult3 (copy), Current (copy)
		UseStateResult3.synchronize(Current)
	end)
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), UseStateResult2 (copy)
		local OnVisibleRangeChangedFunction: (any) -> () = Current.onVisibleRangeChanged
		
		if OnVisibleRangeChangedFunction ~= nil then
			OnVisibleRangeChangedFunction(UseStateResult2.getSnapshot().visibleRange)
			
			return
		end
	end, { UseStateResult2, Current.onVisibleRangeChanged })
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), UseStateResult2 (copy)
		local OnMountedRangeChangedFunction: (any) -> () = Current.onMountedRangeChanged
		
		if OnMountedRangeChangedFunction ~= nil then
			OnMountedRangeChangedFunction(UseStateResult2.getSnapshot().mountedRange)
			
			return
		end
	end, { UseStateResult2, Current.onMountedRangeChanged })
	ReactModule.useEffect(function()
		-- upvalues: Current (copy)
		if Current.onDataPrefetchRequested == nil then return end
	end, { UseStateResult2, Current.onDataPrefetchRequested })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), ViewRecyclerModule (upval)
		UseStateResult2.dispatch({ type = ViewRecyclerModule.VirtualizerCommandType.Refresh })
	end, { UseStateResult2, Current.itemType })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult2 (copy), ViewRecyclerModule (upval), Current (copy)
		local Current1 = {
			scrollToIndex = function(Index, p1)
				-- upvalues: UseStateResult2 (upval), UseStateResult2 (upval), ViewRecyclerModule (upval)
				if UseStateResult2.isReady() then
					UseStateResult2.dispatch({
						type = ViewRecyclerModule.VirtualizerCommandType.ScrollToIndex,
						index = Index,
						alignment = p1 and p1.alignment
					})
				end
			end,
			scrollToOffset = function(Offset)
				-- upvalues: UseStateResult2 (upval), ViewRecyclerModule (upval)
				return UseStateResult2.dispatch({
					type = ViewRecyclerModule.VirtualizerCommandType.ScrollToOffset,
					offset = Offset
				}).result
			end,
			scrollBy = function(Delta)
				-- upvalues: UseStateResult2 (upval), ViewRecyclerModule (upval)
				return UseStateResult2.dispatch({
					type = ViewRecyclerModule.VirtualizerCommandType.ScrollBy,
					delta = Delta
				}).result
			end,
			getScrollState = function()
				-- upvalues: UseStateResult2 (upval), ViewRecyclerModule (upval)
				return UseStateResult2.query({
					type = ViewRecyclerModule.VirtualizerQueryType.GetScrollState
				})
			end,
			captureScrollAnchorSnapshot = function()
				-- upvalues: UseStateResult2 (upval), ViewRecyclerModule (upval)
				return UseStateResult2.query({
					type = ViewRecyclerModule.VirtualizerQueryType.CaptureScrollAnchorSnapshot
				})
			end,
			restoreScrollAnchorSnapshot = function(Snapshot)
				-- upvalues: UseStateResult2 (upval), ViewRecyclerModule (upval)
				return UseStateResult2.dispatch({
					type = ViewRecyclerModule.VirtualizerCommandType.RestoreScrollAnchorSnapshot,
					snapshot = Snapshot
				}).result
			end
		}
		local ListRefFunction: (any) -> () = Current.listRef
		
		if ListRefFunction ~= nil then
			if type(ListRefFunction) == "function" then
				ListRefFunction(Current1)
			else
				ListRefFunction.current = Current1
			end
		end
		return function()
			-- upvalues: Current (upval)
			local ListRefFunction: (any) -> () = Current.listRef
			
			if ListRefFunction == nil then return end
			if type(ListRefFunction) == "function" then
				ListRefFunction(nil)
				
				return
			else
				ListRefFunction.current = nil
			end
		end
	end, {
		Current.listRef,
		UseStateResult2.isReady,
		UseStateResult2
	})
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), UseRefResult2 (copy)
		local ScrollingFrameRefFunction: (any) -> () = Current.scrollingFrameRef
		local Current1 = UseRefResult2.current
		
		if ScrollingFrameRefFunction ~= nil then
			if type(ScrollingFrameRefFunction) == "function" then
				ScrollingFrameRefFunction(Current1)
			else
				ScrollingFrameRefFunction.current = Current1
			end
		end
		return function()
			-- upvalues: Current (upval)
			local ScrollingFrameRefFunction: (any) -> () = Current.scrollingFrameRef
			
			if ScrollingFrameRefFunction == nil then return end
			if type(ScrollingFrameRefFunction) == "function" then
				ScrollingFrameRefFunction(nil)
				
				return
			else
				ScrollingFrameRefFunction.current = nil
			end
		end
	end, { Current.scrollingFrameRef, UseRefResult2 })
	
	return {
		axis = Current.axis,
		onScrollingFrameChanged = ReactModule.useCallback(function(p1)
			-- upvalues: UseRefResult1 (copy), UseContextResult1 (copy), UseStateResult (copy), UseStateResult3 (copy)
			local CurrentFunction: () -> () = UseRefResult1.current
			
			if CurrentFunction ~= nil then
				UseRefResult1.current = nil
				CurrentFunction()
			end
			if p1 ~= nil and UseContextResult1 ~= nil then
				UseRefResult1.current = UseContextResult1.register(p1, UseStateResult.setActive)
			end
			UseStateResult3.refreshHost()
		end, {
			UseStateResult,
			UseStateResult3.refreshHost,
			UseContextResult1
		}),
		onViewportOverlayChanged = ReactModule.useCallback(function(_)
			-- upvalues: UseStateResult3 (copy)
			UseStateResult3.refreshHost()
		end, { UseStateResult3.refreshHost }),
		internalRef = UseRefResult2,
		viewportOverlayRef = UseRefResult3,
		scrollingFrameProps = Current.scrollingFrameProps,
		tag = Current.tag
	}
end
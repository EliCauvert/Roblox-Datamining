local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ViewRecyclerRobloxModule = require(ViewRecyclerReact.Parent.ViewRecyclerRoblox)
local PlacementKindModule = require(script.Parent.PlacementKind)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local RecyclingScopeContextModule = require(script.Parent.RecyclingScopeContext)
local RecyclingViewportContextModule = require(script.Parent.RecyclingViewportContext)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local _ = require(script.Parent.VirtualListShell)
local UseCompositionPlacementModule = require(script.Parent.useCompositionPlacement)

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

local function configuration(Current, p1)
	local PinnedStartItem = Current.pinnedStartItem
	local Config = if PinnedStartItem == nil then nil else {
		key = PinnedStartItem.key,
		value = PinnedStartItem.value,
		itemViewType = PinnedStartItem.itemType
	}
	local PinnedEndItem = Current.pinnedEndItem
	
	return {
		scrollingFrame = p1.scrollingFrame,
		viewportOverlay = p1.viewportOverlay,
		axis = Current.axis,
		dataSource = Current.dataSource,
		layout = Current.layout,
		onStartReached = Current.onStartReached,
		onEndReached = Current.onEndReached,
		onViewportChanged = Current.onViewportChanged,
		onScrollOffsetChanged = Current.onScrollOffsetChanged,
		onContentLengthChanged = Current.onContentLengthChanged,
		onVisibleRangeChanged = Current.onVisibleRangeChanged,
		onMountedRangeChanged = Current.onMountedRangeChanged,
		onDataPrefetchRequested = Current.onDataPrefetchRequested,
		overscan = Current.overscan,
		dataPrefetch = Current.dataPrefetch,
		contentAlignment = Current.contentAlignment,
		endReachedThreshold = Current.endReachedThreshold,
		initialScrollAlignment = Current.initialScrollAlignment,
		autoScrollOnChange = Current.autoScrollOnChange,
		autoScrollThreshold = Current.autoScrollThreshold,
		startReachedThreshold = Current.startReachedThreshold,
		isItemStickyHeader = Current.isItemStickyHeader,
		pinnedStartItem = Config,
		pinnedEndItem = if PinnedEndItem == nil then nil else {
			key = PinnedEndItem.key,
			value = PinnedEndItem.value,
			itemViewType = PinnedEndItem.itemType
		},
		preserveScrollPositionOnChange = Current.preserveScrollPositionOnChange
	}
end

local _ = function(p1, p2)
	return {
		scrollingFrame = p1.current,
		viewportOverlay = p2.current
	}
end

return function(Current)
	-- upvalues: ReactModule (copy), RecyclingScopeContextModule (copy), RecyclingViewportContextModule (copy), SignalsModule (copy), UseCompositionPlacementModule (copy), configuration (copy), RecyclableViewRegistryModule (copy), PlacementKindModule (copy), ViewRecyclerRobloxModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
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
		UseStateResult1.bind({
			updateCapacity = true,
			releases = {},
			requests = {},
			capacity = UseContextResult.listOptions.maxPoolSize
		})
	end, {
		UseStateResult1,
		UseContextResult.listOptions.maxPoolSize
	})
	local UseCompositionPlacementModuleResult = UseCompositionPlacementModule(UseContextResult.root, UseContextResult.listOptions.maxPoolSize, UseContextResult.listOptions.diagnostics)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseStateResult2 = ReactModule.useState(function()
		-- upvalues: Current (copy), UseRefResult (copy), UseRefResult4 (copy), configuration (upval), UseRefResult2 (copy), UseRefResult3 (copy)
		local Current1 = Current
		
		return {
			synchronize = function(Current)
				-- upvalues: Current1 (ref), UseRefResult (upval), UseRefResult4 (upval), configuration (upval), UseRefResult2 (upval), UseRefResult3 (upval)
				Current1 = Current
				UseRefResult.current = Current
				local Current2 = UseRefResult4.current
				
				if Current2 ~= nil then
					Current2.update((configuration(Current, {
						scrollingFrame = UseRefResult2.current,
						viewportOverlay = UseRefResult3.current
					})))
				end
			end,
			refreshHost = function()
				-- upvalues: UseRefResult4 (upval), configuration (upval), Current1 (ref), UseRefResult2 (upval), UseRefResult3 (upval)
				local Current = UseRefResult4.current
				
				if Current ~= nil then
					Current.update((configuration(Current1, {
						scrollingFrame = UseRefResult2.current,
						viewportOverlay = UseRefResult3.current
					})))
				end
			end
		}
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), Current (copy), configuration (upval), UseRefResult2 (copy), UseRefResult3 (copy), UseStateResult1 (copy), RecyclableViewRegistryModule (upval), UseContextResult1 (copy), UseStateResult (copy), PlacementKindModule (upval), UseCompositionPlacementModuleResult (copy), ViewRecyclerRobloxModule (upval), UseRefResult4 (copy), SignalsModule (upval)
		UseRefResult.current = Current
		
		local function _()
			-- upvalues: UseRefResult (upval)
			local Current = UseRefResult.current
			
			return if Current == nil then nil else Current._instrumentation
		end
		
		local self = setmetatable({}, { __mode = "k" })
		
		local function listSink(Key, p1)
			-- upvalues: self (copy)
			local SelfEntry = self[Key]
			
			if SelfEntry == nil then
				SelfEntry = table.freeze({
					apply = function(Key1)
						-- upvalues: p1 (copy), Key (copy)
						p1.apply(Key, Key1)
					end,
					setMeasurementDependencies = function(Key1)
						-- upvalues: p1 (copy), Key (copy)
						p1.setMeasurementDependencies(Key, Key1)
					end
				})
				self[Key] = SelfEntry
			end
			return SelfEntry
		end
		
		local ConfigurationResult = configuration(Current, {
			scrollingFrame = UseRefResult2.current,
			viewportOverlay = UseRefResult3.current
		})
		ConfigurationResult.recyclingScope = UseStateResult1
		
		function ConfigurationResult.getItemViewType(p1, p2)
			-- upvalues: UseRefResult (upval), RecyclableViewRegistryModule (upval)
			local ItemTypeFunction = UseRefResult.current.itemType
			assert(RecyclableViewRegistryModule.isRegistered(ItemTypeFunction) or type(ItemTypeFunction) == "function", "VirtualList: `itemType` must be a Recyclable view type or selector")
			local ItemTypeFunction1 = if RecyclableViewRegistryModule.isRegistered(ItemTypeFunction) then ItemTypeFunction else ItemTypeFunction(p1, p2)
			assert(RecyclableViewRegistryModule.isRegistered(ItemTypeFunction1), "VirtualList: `itemType` selector must return a Recyclable view type")
			
			return ItemTypeFunction1
		end
		
		ConfigurationResult.diagnostics = Current.diagnostics
		ConfigurationResult.active = if UseContextResult1 == nil then nil else UseStateResult.active(false)
		
		function ConfigurationResult.presentItemView(p1, State, p2, p3)
			-- upvalues: PlacementKindModule (upval), listSink (copy), UseCompositionPlacementModuleResult (upval), UseRefResult (upval)
			p1.transition(if State == nil then nil else table.freeze({
				assignment = State.assignment,
				index = State.index,
				destination = table.freeze({
					kind = PlacementKindModule.List,
					state = State,
					sink = listSink(p1, p3),
					compositionPlacement = UseCompositionPlacementModuleResult
				})
			}))
			local Current = UseRefResult.current
			local Instrumentation = if Current == nil then nil else Current._instrumentation
			
			if p2 and Instrumentation ~= nil and Instrumentation.assignmentChanged ~= nil then
				Instrumentation.assignmentChanged(p1, if State == nil then nil else State.assignment)
			end
		end
		
		function ConfigurationResult.onItemViewPresentationChanged(p1, p2)
			-- upvalues: UseRefResult (upval)
			local Current = UseRefResult.current
			local Instrumentation = if Current == nil then nil else Current._instrumentation
			
			if Instrumentation ~= nil and Instrumentation.presentationChanged ~= nil then
				Instrumentation.presentationChanged(p1, p2)
			end
		end
		
		local Virtualizer = ViewRecyclerRobloxModule.createVirtualizer(ConfigurationResult)
		UseRefResult4.current = Virtualizer
		local Callback = nil
		
		if UseContextResult1 ~= nil then
			local Active = ConfigurationResult.active
			Callback = SignalsModule.createEffect(function(p1)
				-- upvalues: UseStateResult (upval), Active (ref), Virtualizer (copy)
				local ActiveResult = UseStateResult.active(p1)
				
				if ActiveResult ~= Active then
					Active = ActiveResult
					Virtualizer.setActive(ActiveResult)
				end
			end)
		end
		return function()
			-- upvalues: Callback (ref), UseRefResult4 (upval), Virtualizer (copy)
			if Callback ~= nil then
				Callback()
			end
			UseRefResult4.current = nil
			Virtualizer.destroy()
		end
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
		-- upvalues: UseStateResult2 (copy), Current (copy)
		UseStateResult2.synchronize(Current)
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy)
		local Current = UseRefResult4.current
		
		if Current ~= nil then
			Current.refreshItemViews()
		end
	end, { Current.itemType })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy), Current (copy)
		local function _()
			-- upvalues: UseRefResult4 (upval)
			return assert(UseRefResult4.current, "VirtualList: list handle used after unmount")
		end
		
		local Current1 = {
			scrollToIndex = function(p1, p2)
				-- upvalues: UseRefResult4 (upval)
				assert(UseRefResult4.current, "VirtualList: list handle used after unmount").scrollToIndex(p1, p2)
			end,
			scrollToOffset = function(p1)
				-- upvalues: UseRefResult4 (upval)
				return assert(UseRefResult4.current, "VirtualList: list handle used after unmount").scrollToOffset(p1)
			end,
			scrollToStart = function()
				-- upvalues: UseRefResult4 (upval)
				assert(UseRefResult4.current, "VirtualList: list handle used after unmount").scrollToStart()
			end,
			scrollToEnd = function()
				-- upvalues: UseRefResult4 (upval)
				assert(UseRefResult4.current, "VirtualList: list handle used after unmount").scrollToEnd()
			end,
			scrollBy = function(p1)
				-- upvalues: UseRefResult4 (upval)
				return assert(UseRefResult4.current, "VirtualList: list handle used after unmount").scrollBy(p1)
			end,
			getScrollState = function()
				-- upvalues: UseRefResult4 (upval)
				return assert(UseRefResult4.current, "VirtualList: list handle used after unmount").getScrollState()
			end,
			captureScrollAnchorSnapshot = function()
				-- upvalues: UseRefResult4 (upval)
				return assert(UseRefResult4.current, "VirtualList: list handle used after unmount").captureScrollAnchorSnapshot()
			end,
			restoreScrollAnchorSnapshot = function(p1)
				-- upvalues: UseRefResult4 (upval)
				return assert(UseRefResult4.current, "VirtualList: list handle used after unmount").restoreScrollAnchorSnapshot(p1)
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
	end, { Current.listRef })
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
			-- upvalues: UseRefResult1 (copy), UseContextResult1 (copy), UseStateResult (copy), UseStateResult2 (copy)
			local CurrentFunction: () -> () = UseRefResult1.current
			
			if CurrentFunction ~= nil then
				UseRefResult1.current = nil
				CurrentFunction()
			end
			if p1 ~= nil and UseContextResult1 ~= nil then
				UseRefResult1.current = UseContextResult1.register(p1, UseStateResult.setActive)
			end
			UseStateResult2.refreshHost()
		end, {
			UseStateResult,
			UseStateResult2.refreshHost,
			UseContextResult1
		}),
		onViewportOverlayChanged = ReactModule.useCallback(function(_)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2.refreshHost()
		end, { UseStateResult2.refreshHost }),
		internalRef = UseRefResult2,
		viewportOverlayRef = UseRefResult3,
		scrollingFrameProps = Current.scrollingFrameProps,
		tag = Current.tag
	}
end
local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local viewRecyclerRobloxModule = require(viewRecyclerReact.Parent.ViewRecyclerRoblox)
local placementKindModule = require(script.Parent.PlacementKind)
local reactModule = require(viewRecyclerReact.Parent.React)
local recyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local recyclingScopeContextModule = require(script.Parent.RecyclingScopeContext)
local recyclingViewportContextModule = require(script.Parent.RecyclingViewportContext)
local signalsModule = require(viewRecyclerReact.Parent.Signals)
local _ = require(script.Parent.VirtualListShell)
local useCompositionPlacementModule = require(script.Parent.useCompositionPlacement)

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

local function configuration(p1, p2)
	local t = {
		scrollingFrame = p2.scrollingFrame,
		viewportOverlay = p2.viewportOverlay,
		axis = p1.axis,
		dataSource = p1.dataSource,
		layout = p1.layout,
		onStartReached = p1.onStartReached,
		onEndReached = p1.onEndReached,
		onViewportChanged = p1.onViewportChanged,
		onScrollOffsetChanged = p1.onScrollOffsetChanged,
		onContentLengthChanged = p1.onContentLengthChanged,
		onVisibleRangeChanged = p1.onVisibleRangeChanged,
		onMountedRangeChanged = p1.onMountedRangeChanged,
		onDataPrefetchRequested = p1.onDataPrefetchRequested,
		overscan = p1.overscan,
		dataPrefetch = p1.dataPrefetch,
		contentAlignment = p1.contentAlignment,
		endReachedThreshold = p1.endReachedThreshold,
		initialScrollAlignment = p1.initialScrollAlignment,
		autoScrollOnChange = p1.autoScrollOnChange,
		autoScrollThreshold = p1.autoScrollThreshold,
		startReachedThreshold = p1.startReachedThreshold,
		isItemStickyHeader = p1.isItemStickyHeader
	}
	local pinnedStartItem = p1.pinnedStartItem
	t.pinnedStartItem = if pinnedStartItem == nil then nil else {
		key = pinnedStartItem.key,
		value = pinnedStartItem.value,
		itemViewType = pinnedStartItem.itemType
	}
	local pinnedEndItem = p1.pinnedEndItem
	t.pinnedEndItem = if pinnedEndItem == nil then nil else {
		key = pinnedEndItem.key,
		value = pinnedEndItem.value,
		itemViewType = pinnedEndItem.itemType
	}
	t.preserveScrollPositionOnChange = p1.preserveScrollPositionOnChange
	
	return t
end

local _ = function(p1, p2)
	return {
		scrollingFrame = p1.current,
		viewportOverlay = p2.current
	}
end

return function(p1)
	-- upvalues: reactModule (ref), recyclingScopeContextModule (ref), recyclingViewportContextModule (ref), signalsModule (ref), useCompositionPlacementModule (ref), configuration (ref), recyclableViewRegistryModule (ref), placementKindModule (ref), viewRecyclerRobloxModule (ref)
	local var1 = reactModule.useRef(nil)
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
		return var2.root.getScope(var2.listOptions)
	end)
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var2 (ref)
		var8.bind({
			updateCapacity = true,
			releases = {},
			requests = {},
			capacity = var2.listOptions.maxPoolSize
		})
	end, { var8, var2.listOptions.maxPoolSize })
	local var9 = useCompositionPlacementModule(var2.root, var2.listOptions.maxPoolSize, var2.listOptions.diagnostics)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useState(function()
		-- upvalues: p1 (ref), var1 (ref), var10 (ref), configuration (copy), var6 (ref), var7 (ref)
		local var12 = p1
		
		return {
			synchronize = function(p2)
				-- upvalues: var12 (write), var1 (copy), var10 (copy), configuration (copy), var6 (copy), var7 (copy)
				var12 = p2
				var1.current = p2
				local current = var10.current
				
				if current ~= nil then
					current.update(configuration(p2, {
						scrollingFrame = var6.current,
						viewportOverlay = var7.current
					}))
				end
			end,
			refreshHost = function()
				-- upvalues: var10 (copy), configuration (copy), var12 (write), var6 (copy), var7 (copy)
				local current = var10.current
				
				if current ~= nil then
					current.update(configuration(var12, {
						scrollingFrame = var6.current,
						viewportOverlay = var7.current
					}))
				end
			end
		}
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), p1 (ref), configuration (copy), var6 (ref), var7 (ref), var8 (ref), recyclableViewRegistryModule (copy), var3 (ref), var4 (ref), placementKindModule (copy), var9 (ref), viewRecyclerRobloxModule (copy), var10 (ref), signalsModule (copy)
		var1.current = p1
		
		local function _()
			-- upvalues: var1 (copy)
			local current = var1.current
			
			return if current == nil then nil else current._instrumentation
		end
		
		local tbl = setmetatable({}, { __mode = "k" })
		
		local function listSink(p2, p3)
			-- upvalues: tbl (ref)
			local var12 = tbl[p2]
			
			if var12 == nil then
				var12 = table.freeze({
					apply = function(p4)
						-- upvalues: p3 (ref), p2 (ref)
						p3.apply(p2, p4)
					end,
					setMeasurementDependencies = function(value)
						-- upvalues: p3 (ref), p2 (ref)
						p3.setMeasurementDependencies(p2, value)
					end
				})
				tbl[p2] = var12
			end
			return var12
		end
		
		local var12 = configuration(p1, {
			scrollingFrame = var6.current,
			viewportOverlay = var7.current
		})
		var12.recyclingScope = var8
		
		function var27.getItemViewType(p2, p3)
			-- upvalues: var1 (copy), recyclableViewRegistryModule (copy)
			local itemType = var1.current.itemType
			assert(recyclableViewRegistryModule.isRegistered(itemType) or type(itemType) == "function", "VirtualList: `itemType` must be a Recyclable view type or selector")
			local var13 = if recyclableViewRegistryModule.isRegistered(itemType) then itemType else itemType(p2, p3)
			assert(recyclableViewRegistryModule.isRegistered(var13), "VirtualList: `itemType` selector must return a Recyclable view type")
			
			return var13
		end
		
		var12.diagnostics = p1.diagnostics
		var12.active = if var3 == nil then nil else var4.active(false)
		
		function var27.presentItemView(p2, p3, p4, p5)
			-- upvalues: placementKindModule (copy), listSink (ref), var9 (copy), var1 (copy)
			p2.transition(if p3 == nil then nil else table.freeze({
				assignment = p3.assignment,
				index = p3.index,
				destination = table.freeze({
					kind = placementKindModule.List,
					state = p3,
					sink = listSink(p2, p5),
					compositionPlacement = var9
				})
			}))
			local current = var1.current
			local var13 = if current == nil then nil else current._instrumentation
			
			if p4 and var13 ~= nil and var13.assignmentChanged ~= nil then
				var13.assignmentChanged(p2, if p3 == nil then nil else p3.assignment)
			end
		end
		
		function var27.onItemViewPresentationChanged(p2, p3)
			-- upvalues: var1 (copy)
			local current = var1.current
			local var13 = if current == nil then nil else current._instrumentation
			
			if var13 ~= nil and var13.presentationChanged ~= nil then
				var13.presentationChanged(p2, p3)
			end
		end
		
		local var13 = viewRecyclerRobloxModule.createVirtualizer(var12)
		var10.current = var13
		local var14 = nil
		
		if var3 ~= nil then
			local active = var12.active
			var14 = signalsModule.createEffect(function(p2)
				-- upvalues: var4 (copy), active (write), var13 (ref)
				local var15 = var4.active(p2)
				
				if var15 ~= active then
					active = var15
					var13.setActive(var15)
				end
			end)
		end
		return function()
			-- upvalues: var14 (write), var10 (copy), var13 (ref)
			if var14 ~= nil then
				var14()
			end
			var10.current = nil
			var13.destroy()
		end
	end, { var11 })
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
		-- upvalues: var11 (ref), p1 (ref)
		var11.synchronize(p1)
	end)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref)
		local current = var10.current
		
		if current ~= nil then
			current.refreshItemViews()
		end
	end, { p1.itemType })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), p1 (ref)
		local function _()
			-- upvalues: var10 (copy)
			return assert(var10.current, "VirtualList: list handle used after unmount")
		end
		
		local t = {
			scrollToIndex = function(p2, p3)
				-- upvalues: var10 (copy)
				assert(var10.current, "VirtualList: list handle used after unmount").scrollToIndex(p2, p3)
			end,
			scrollToOffset = function(value)
				-- upvalues: var10 (copy)
				return assert(var10.current, "VirtualList: list handle used after unmount").scrollToOffset(value)
			end,
			scrollToStart = function()
				-- upvalues: var10 (copy)
				assert(var10.current, "VirtualList: list handle used after unmount").scrollToStart()
			end,
			scrollToEnd = function()
				-- upvalues: var10 (copy)
				assert(var10.current, "VirtualList: list handle used after unmount").scrollToEnd()
			end,
			scrollBy = function(p2)
				-- upvalues: var10 (copy)
				return assert(var10.current, "VirtualList: list handle used after unmount").scrollBy(p2)
			end,
			getScrollState = function()
				-- upvalues: var10 (copy)
				return assert(var10.current, "VirtualList: list handle used after unmount").getScrollState()
			end,
			captureScrollAnchorSnapshot = function()
				-- upvalues: var10 (copy)
				return assert(var10.current, "VirtualList: list handle used after unmount").captureScrollAnchorSnapshot()
			end,
			restoreScrollAnchorSnapshot = function(p2)
				-- upvalues: var10 (copy)
				return assert(var10.current, "VirtualList: list handle used after unmount").restoreScrollAnchorSnapshot(p2)
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
	end, { p1.listRef })
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
			-- upvalues: var5 (ref), var3 (ref), var4 (ref), var11 (ref)
			local current = var5.current
			
			if current ~= nil then
				var5.current = nil
				current()
			end
			if p2 ~= nil and var3 ~= nil then
				var5.current = var3.register(p2, var4.setActive)
			end
			var11.refreshHost()
		end, { var4, var11.refreshHost, var3 }),
		onViewportOverlayChanged = reactModule.useCallback(function(_)
			-- upvalues: var11 (ref)
			var11.refreshHost()
		end, { var11.refreshHost }),
		internalRef = var6,
		viewportOverlayRef = var7,
		scrollingFrameProps = p1.scrollingFrameProps,
		tag = p1.tag
	}
end
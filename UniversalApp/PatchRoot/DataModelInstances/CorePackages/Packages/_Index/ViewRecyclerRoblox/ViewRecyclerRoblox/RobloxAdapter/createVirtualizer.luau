local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local _ = viewRecyclerModule.Adapter.ScrollPolicy.AutoScroll
local axis = viewRecyclerModule.Axis
local _ = viewRecyclerModule.Layout
local scrollingFrameVirtualizerModule = require(viewRecyclerRoblox.RobloxAdapter.ScrollingFrameVirtualizer)
local _ = require(viewRecyclerRoblox.RobloxAdapter.createRecyclingScope)

return function(p1)
	-- upvalues: axis (ref), viewRecyclerModule (ref), scrollingFrameVirtualizerModule (ref)
	assert(if p1.axis ~= axis.X then p1.axis == axis.Y else true, "createVirtualizer: invalid axis")
	local scrollingFrame = p1.scrollingFrame
	local axis_1 = p1.axis
	local dataSource = p1.dataSource
	local recyclingScope = p1.recyclingScope
	local var1 = false
	
	local function getInstance(p2)
		-- upvalues: p1 (ref)
		local var2 = if p1.getInstance ~= nil then p2 else p1.getInstance(p2)
		assert(typeof(var2) == "Instance" and var2:IsA("GuiObject"), "createVirtualizer: ItemView host must be a GuiObject")
		
		return var2
	end
	
	local layout = p1.layout
	local var2 = nil
	local var3 = nil
	
	local function scrollToOffset(value)
		-- upvalues: var2 (write), viewRecyclerModule (copy)
		return var2.dispatch({
			type = viewRecyclerModule.VirtualizerCommandType.ScrollToOffset,
			offset = value
		}).result
	end
	
	local function scrollBy(p2)
		-- upvalues: var2 (write), viewRecyclerModule (copy)
		return var2.dispatch({
			type = viewRecyclerModule.VirtualizerCommandType.ScrollBy,
			delta = p2
		}).result
	end
	
	local function restoreScrollAnchorSnapshot(p2)
		-- upvalues: var2 (write), viewRecyclerModule (copy)
		return var2.dispatch({
			type = viewRecyclerModule.VirtualizerCommandType.RestoreScrollAnchorSnapshot,
			snapshot = p2
		}).result
	end
	
	local getItemViewType = p1.getItemViewType
	local t = {
		overscan = p1.overscan,
		overscanPolicy = p1.overscanPolicy,
		dataPrefetch = p1.dataPrefetch,
		contentAlignment = p1.contentAlignment,
		endThreshold = p1.endReachedThreshold,
		pinnedItems = {
			isItemStickyHeader = p1.isItemStickyHeader,
			pinnedStartItem = p1.pinnedStartItem,
			pinnedEndItem = p1.pinnedEndItem
		},
		preserveScrollPositionOnChange = p1.preserveScrollPositionOnChange ~= false
	}
	
	local function getListHostConfiguration()
		-- upvalues: axis_1 (ref), dataSource (write), layout (write), p1 (ref)
		return {
			axis = axis_1,
			dataSource = dataSource,
			layout = layout,
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
	
	local function commitConfiguration()
		-- upvalues: var3 (write), getListHostConfiguration (ref), scrollingFrame (ref), p1 (ref), t (write)
		var3.update({
			hostConfiguration = getListHostConfiguration(),
			hostTarget = {
				scrollingFrame = scrollingFrame,
				viewportOverlay = p1.viewportOverlay
			},
			corePolicy = t
		})
	end
	
	local function _(p2)
		-- upvalues: t (write), commitConfiguration (ref)
		local cloned = table.clone(t)
		p2(cloned)
		t = cloned
		commitConfiguration()
	end
	
	var3 = scrollingFrameVirtualizerModule.newForGuiObjects({
		prepareAssignment = nil,
		onItemViewPresentationChanged = nil,
		initialHostConfiguration = getListHostConfiguration(),
		initialHostTarget = {
			scrollingFrame = scrollingFrame,
			viewportOverlay = p1.viewportOverlay
		},
		initialCorePolicy = t,
		getGuiObject = getInstance,
		core = {
			recyclingScope = recyclingScope,
			getItemViewType = getItemViewType,
			diagnostics = p1.diagnostics
		},
		onItemViewAssignmentChanged = recyclingScope.updateItemView
	})
	var2 = var3
	var2.dispatch({
		type = viewRecyclerModule.VirtualizerCommandType.Activate
	})
	var3.connect()
	
	return {
		setScrollOffset = function(value)
			-- upvalues: var2 (write), viewRecyclerModule (copy)
			var2.dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.SetScrollOffset,
				offset = value
			})
		end,
		scrollToOffset = scrollToOffset,
		scrollBy = scrollBy,
		scrollToIndex = function(p2, p3)
			-- upvalues: var2 (write), viewRecyclerModule (copy)
			var2.dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.ScrollToIndex,
				index = p2,
				alignment = p3 and p3.alignment
			})
		end,
		setDataSource = function(value)
			-- upvalues: dataSource (write), commitConfiguration (ref)
			dataSource = value
			commitConfiguration()
		end,
		setLayout = function(value)
			-- upvalues: layout (write), commitConfiguration (ref)
			layout = value
			commitConfiguration()
		end,
		setDataSourceAndLayout = function(value, p2)
			-- upvalues: dataSource (write), layout (write), commitConfiguration (ref)
			dataSource = value
			layout = p2
			commitConfiguration()
		end,
		setOverscan = function(value)
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p2)
				-- upvalues: value (ref)
				p2.overscan = value
				p2.overscanPolicy = nil
			end
			
			local cloned = table.clone(t)
			cloned.overscan = value
			cloned.overscanPolicy = nil
			t = cloned
			commitConfiguration()
		end,
		setOverscanPolicy = function(value)
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p2)
				-- upvalues: value (ref)
				p2.overscanPolicy = value
			end
			
			local cloned = table.clone(t)
			cloned.overscanPolicy = value
			t = cloned
			commitConfiguration()
		end,
		setDataPrefetch = function(value)
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p2)
				-- upvalues: value (ref)
				p2.dataPrefetch = value
			end
			
			local cloned = table.clone(t)
			cloned.dataPrefetch = value
			t = cloned
			commitConfiguration()
		end,
		setContentAlignment = function(value)
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p2)
				-- upvalues: value (ref)
				p2.contentAlignment = value
			end
			
			local cloned = table.clone(t)
			cloned.contentAlignment = value
			t = cloned
			commitConfiguration()
		end,
		setPinnedItems = function(value)
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p2)
				-- upvalues: value (ref)
				p2.pinnedItems = table.clone(value)
			end
			
			local cloned = table.clone(t)
			cloned.pinnedItems = table.clone(value)
			t = cloned
			commitConfiguration()
		end,
		setMaxPoolSize = function(a)
			-- upvalues: recyclingScope (ref)
			recyclingScope.setMaxPoolSize(a)
		end,
		setPreserveScrollPositionOnChange = function(value)
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p2)
				-- upvalues: value (ref)
				p2.preserveScrollPositionOnChange = value
			end
			
			local cloned = table.clone(t)
			cloned.preserveScrollPositionOnChange = value
			t = cloned
			commitConfiguration()
		end,
		refreshItemViews = function()
			-- upvalues: var2 (write), viewRecyclerModule (copy)
			var2.dispatch({ type = viewRecyclerModule.VirtualizerCommandType.Refresh })
		end,
		getVisibleRange = function()
			-- upvalues: var2 (write)
			return var2.getSnapshot().visibleRange
		end,
		getMountedRange = function()
			-- upvalues: var2 (write)
			return var2.getSnapshot().mountedRange
		end,
		getScrollState = function()
			-- upvalues: var2 (write), viewRecyclerModule (copy)
			return var2.query({
				type = viewRecyclerModule.VirtualizerQueryType.GetScrollState
			})
		end,
		captureScrollAnchorSnapshot = function()
			-- upvalues: var2 (write), viewRecyclerModule (copy)
			return var2.query({
				type = viewRecyclerModule.VirtualizerQueryType.CaptureScrollAnchorSnapshot
			})
		end,
		restoreScrollAnchorSnapshot = restoreScrollAnchorSnapshot,
		destroy = function()
			-- upvalues: var1 (write), var3 (write)
			if var1 then
				return
			end
			var1 = true
			var3.destroy()
		end
	}
end
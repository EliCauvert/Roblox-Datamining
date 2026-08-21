local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local _ = viewRecyclerModule.Adapter.ScrollPolicy.AutoScroll
local axis = viewRecyclerModule.Axis
local _ = viewRecyclerModule.Layout
local scrollListHostRuntimeModule = require(viewRecyclerRoblox.RobloxAdapter.ScrollListHostRuntime)
local _ = require(viewRecyclerRoblox.RobloxAdapter.createRecyclingScope)

return function(p0) --[[ line: 79 | named "createVirtualizer" ]]
	-- upvalues: axis (ref), viewRecyclerModule (ref), scrollListHostRuntimeModule (ref)
	assert(if p0.axis ~= axis.X then p0.axis == axis.Y else true, "createVirtualizer: invalid axis")
	local scrollingFrame = p0.scrollingFrame
	local axis_1 = p0.axis
	local dataSource = p0.dataSource
	local recyclingScope = p0.recyclingScope
	local var3 = false
	
	local function getInstance(p1) --[[ line: 88 ]]
		-- upvalues: p0 (ref)
		local var13 = if p0.getInstance ~= nil then p1 else p0.getInstance(p1)
		assert(typeof(var13) == "Instance" and var13:IsA("GuiObject"), "createVirtualizer: ItemView host must be a GuiObject")
		
		return var13
	end
	
	local layout = p0.layout
	local var5 = nil
	local var6 = nil
	
	local function scrollToOffset(value) --[[ line: 101 ]]
		-- upvalues: var5 (write), viewRecyclerModule (copy)
		return var5.dispatch({
			type = viewRecyclerModule.VirtualizerCommandType.ScrollToOffset,
			offset = value
		}).result
	end
	
	local function scrollBy(p2) --[[ line: 105 ]]
		-- upvalues: var5 (write), viewRecyclerModule (copy)
		return var5.dispatch({
			type = viewRecyclerModule.VirtualizerCommandType.ScrollBy,
			delta = p2
		}).result
	end
	
	local function restoreScrollSnapshot(p3) --[[ line: 109 ]]
		-- upvalues: var5 (write), viewRecyclerModule (copy)
		return var5.dispatch({
			type = viewRecyclerModule.VirtualizerCommandType.RestoreScrollSnapshot,
			snapshot = p3
		}).result
	end
	
	local getItemViewType = p0.getItemViewType
	local t = {
		overscan = p0.overscan,
		overscanPolicy = p0.overscanPolicy,
		dataPrefetch = p0.dataPrefetch,
		contentAlignment = p0.contentAlignment,
		endThreshold = p0.endReachedThreshold,
		pinnedItems = {
			isItemStickyHeader = p0.isItemStickyHeader,
			pinnedStartItem = p0.pinnedStartItem,
			pinnedEndItem = p0.pinnedEndItem
		},
		preserveScrollPositionOnChange = p0.preserveScrollPositionOnChange ~= false
	}
	
	local function getListHostConfiguration() --[[ line: 131 ]]
		-- upvalues: axis_1 (ref), dataSource (write), layout (write), p0 (ref)
		return {
			axis = axis_1,
			dataSource = dataSource,
			layout = layout,
			initialScrollAlignment = p0.initialScrollAlignment,
			autoScrollOnChange = p0.autoScrollOnChange,
			startReachedThreshold = p0.startReachedThreshold,
			onStartReached = p0.onStartReached,
			onEndReached = p0.onEndReached,
			onViewportChanged = p0.onViewportChanged,
			onScrollOffsetChanged = p0.onScrollOffsetChanged,
			onContentLengthChanged = p0.onContentLengthChanged,
			onVisibleRangeChanged = p0.onVisibleRangeChanged,
			onMountedRangeChanged = p0.onMountedRangeChanged,
			onDataPrefetchRequested = p0.onDataPrefetchRequested
		}
	end
	
	local function commitConfiguration() --[[ line: 150 ]]
		-- upvalues: var6 (write), getListHostConfiguration (ref), scrollingFrame (ref), p0 (ref), t (write)
		var6.update({
			hostConfiguration = getListHostConfiguration(),
			hostTarget = {
				scrollingFrame = scrollingFrame,
				viewportOverlay = p0.viewportOverlay
			},
			corePolicy = t
		})
	end
	
	local function _(p4) --[[ line: 161 | named "updateCorePolicy" ]]
		-- upvalues: t (write), commitConfiguration (ref)
		local cloned = table.clone(t)
		p4(cloned)
		t = cloned
		commitConfiguration()
	end
	
	var6 = scrollListHostRuntimeModule.newForGuiObjects({
		prepareItemViewAssignment = nil,
		onItemViewPresentationChanged = nil,
		initialHostConfiguration = getListHostConfiguration(),
		initialHostTarget = {
			scrollingFrame = scrollingFrame,
			viewportOverlay = p0.viewportOverlay
		},
		initialCorePolicy = t,
		getGuiObject = getInstance,
		core = {
			recyclingScope = recyclingScope,
			getItemViewType = getItemViewType,
			diagnostics = p0.diagnostics
		},
		onItemViewAssignmentChanged = recyclingScope.updateItemView
	})
	var5 = var6
	var5.dispatch({
		type = viewRecyclerModule.VirtualizerCommandType.Activate
	})
	var6.connect()
	
	return {
		setScrollOffset = function(value) --[[ line: 214 ]]
			-- upvalues: var5 (write), viewRecyclerModule (copy)
			var5.dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.SetScrollOffset,
				offset = value
			})
		end,
		scrollToOffset = scrollToOffset,
		scrollBy = scrollBy,
		scrollToIndex = function(p5, p6) --[[ line: 219 ]]
			-- upvalues: var5 (write), viewRecyclerModule (copy)
			var5.dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.ScrollToIndex,
				index = p5,
				alignment = p6 and p6.alignment
			})
		end,
		setDataSource = function(value) --[[ line: 189 ]]
			-- upvalues: dataSource (write), commitConfiguration (ref)
			dataSource = value
			commitConfiguration()
		end,
		setLayout = function(value) --[[ line: 194 ]]
			-- upvalues: layout (write), commitConfiguration (ref)
			layout = value
			commitConfiguration()
		end,
		setDataSourceAndLayout = function(value, p7) --[[ line: 199 ]]
			-- upvalues: dataSource (write), layout (write), commitConfiguration (ref)
			dataSource = value
			layout = p7
			commitConfiguration()
		end,
		setOverscan = function(value) --[[ line: 229 ]]
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p8) --[[ line: 230 ]]
				-- upvalues: value (ref)
				p8.overscan = value
				p8.overscanPolicy = nil
			end
			
			local cloned = table.clone(t)
			cloned.overscan = value
			cloned.overscanPolicy = nil
			t = cloned
			commitConfiguration()
		end,
		setOverscanPolicy = function(value) --[[ line: 235 ]]
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p9) --[[ line: 236 ]]
				-- upvalues: value (ref)
				p9.overscanPolicy = value
			end
			
			local cloned = table.clone(t)
			cloned.overscanPolicy = value
			t = cloned
			commitConfiguration()
		end,
		setDataPrefetch = function(value) --[[ line: 240 ]]
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p10) --[[ line: 241 ]]
				-- upvalues: value (ref)
				p10.dataPrefetch = value
			end
			
			local cloned = table.clone(t)
			cloned.dataPrefetch = value
			t = cloned
			commitConfiguration()
		end,
		setContentAlignment = function(value) --[[ line: 245 ]]
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p11) --[[ line: 246 ]]
				-- upvalues: value (ref)
				p11.contentAlignment = value
			end
			
			local cloned = table.clone(t)
			cloned.contentAlignment = value
			t = cloned
			commitConfiguration()
		end,
		setPinnedItems = function(value) --[[ line: 250 ]]
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p12) --[[ line: 251 ]]
				-- upvalues: value (ref)
				p12.pinnedItems = table.clone(value)
			end
			
			local cloned = table.clone(t)
			cloned.pinnedItems = table.clone(value)
			t = cloned
			commitConfiguration()
		end,
		setMaxPoolSize = function(a) --[[ line: 255 ]]
			-- upvalues: recyclingScope (ref)
			recyclingScope.setMaxPoolSize(a)
		end,
		setPreserveScrollPositionOnChange = function(value) --[[ line: 258 ]]
			-- upvalues: t (write), commitConfiguration (ref)
			local _ = function(p13) --[[ line: 259 ]]
				-- upvalues: value (ref)
				p13.preserveScrollPositionOnChange = value
			end
			
			local cloned = table.clone(t)
			cloned.preserveScrollPositionOnChange = value
			t = cloned
			commitConfiguration()
		end,
		refreshItemViews = function() --[[ line: 263 ]]
			-- upvalues: var5 (write), viewRecyclerModule (copy)
			var5.dispatch({ type = viewRecyclerModule.VirtualizerCommandType.Refresh })
		end,
		getVisibleRange = function() --[[ line: 266 ]]
			-- upvalues: var5 (write)
			return var5.getSnapshot().visibleRange
		end,
		getMountedRange = function() --[[ line: 269 ]]
			-- upvalues: var5 (write)
			return var5.getSnapshot().mountedRange
		end,
		getScrollState = function() --[[ line: 272 ]]
			-- upvalues: var5 (write), viewRecyclerModule (copy)
			return var5.query({
				type = viewRecyclerModule.VirtualizerQueryType.GetScrollState
			})
		end,
		captureScrollSnapshot = function() --[[ line: 275 ]]
			-- upvalues: var5 (write), viewRecyclerModule (copy)
			return var5.query({
				type = viewRecyclerModule.VirtualizerQueryType.CaptureScrollSnapshot
			})
		end,
		restoreScrollSnapshot = restoreScrollSnapshot,
		destroy = function() --[[ line: 205 ]]
			-- upvalues: var3 (write), var6 (write)
			if var3 then
				return
			end
			var3 = true
			var6.destroy()
		end
	}
end
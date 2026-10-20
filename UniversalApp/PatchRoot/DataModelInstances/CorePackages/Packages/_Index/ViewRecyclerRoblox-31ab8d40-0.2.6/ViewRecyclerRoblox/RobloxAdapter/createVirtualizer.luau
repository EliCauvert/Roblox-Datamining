local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local _ = ViewRecyclerModule.Adapter.ScrollPolicy.AutoScroll
local Axis = ViewRecyclerModule.Axis
local _ = ViewRecyclerModule.Layout
local ScrollingFrameVirtualizerModule = require(ViewRecyclerRoblox.RobloxAdapter.ScrollingFrameVirtualizer)
local _ = require(ViewRecyclerRoblox.RobloxAdapter.createRecyclingScope)

return function(p1)
	-- upvalues: Axis (copy), ViewRecyclerModule (copy), ScrollingFrameVirtualizerModule (copy)
	assert(p1.axis == Axis.X or p1.axis == Axis.Y, "createVirtualizer: invalid axis")
	local ScrollingFrame = p1.scrollingFrame
	local Axis1 = p1.axis
	local DataSource = p1.dataSource
	local RecyclingScope = p1.recyclingScope
	local Flag = false
	local Layout = p1.layout
	local v1 = nil
	local ForGuiObjects = nil
	
	local function scrollToOffset(Offset)
		-- upvalues: v1 (ref), ViewRecyclerModule (upval)
		return v1.dispatch({
			type = ViewRecyclerModule.VirtualizerCommandType.ScrollToOffset,
			offset = Offset
		}).result
	end
	
	local function scrollBy(Delta)
		-- upvalues: v1 (ref), ViewRecyclerModule (upval)
		return v1.dispatch({
			type = ViewRecyclerModule.VirtualizerCommandType.ScrollBy,
			delta = Delta
		}).result
	end
	
	local function restoreScrollAnchorSnapshot(Snapshot)
		-- upvalues: v1 (ref), ViewRecyclerModule (upval)
		return v1.dispatch({
			type = ViewRecyclerModule.VirtualizerCommandType.RestoreScrollAnchorSnapshot,
			snapshot = Snapshot
		}).result
	end
	
	local Tbl = {
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
		-- upvalues: Axis1 (copy), DataSource (ref), Layout (ref), p1 (copy)
		return {
			axis = Axis1,
			dataSource = DataSource,
			layout = Layout,
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
		-- upvalues: ForGuiObjects (ref), getListHostConfiguration (copy), ScrollingFrame (copy), p1 (copy), Tbl (ref)
		ForGuiObjects.update({
			hostConfiguration = getListHostConfiguration(),
			hostTarget = {
				scrollingFrame = ScrollingFrame,
				viewportOverlay = p1.viewportOverlay
			},
			corePolicy = Tbl
		})
	end
	
	local function _(Callback: (any) -> ())
		-- upvalues: Tbl (ref), commitConfiguration (copy)
		local Copy = table.clone(Tbl)
		Callback(Copy)
		Tbl = Copy
		commitConfiguration()
	end
	
	ForGuiObjects = ScrollingFrameVirtualizerModule.newForGuiObjects({
		prepareAssignment = nil,
		onItemViewPresentationChanged = nil,
		initialHostConfiguration = getListHostConfiguration(),
		initialHostTarget = {
			scrollingFrame = ScrollingFrame,
			viewportOverlay = p1.viewportOverlay
		},
		initialCorePolicy = Tbl,
		getGuiObject = function(p2)
			-- upvalues: p1 (copy)
			local _Instance = if p1.getInstance == nil then p2 else p1.getInstance(p2)
			assert(typeof(_Instance) == "Instance" and _Instance:IsA("GuiObject"), "createVirtualizer: ItemView host must be a GuiObject")
			
			return _Instance
		end,
		core = {
			recyclingScope = RecyclingScope,
			getItemViewType = p1.getItemViewType,
			diagnostics = p1.diagnostics
		},
		onItemViewAssignmentChanged = RecyclingScope.updateItemView
	})
	v1 = ForGuiObjects
	v1.dispatch({
		type = ViewRecyclerModule.VirtualizerCommandType.Activate
	})
	ForGuiObjects.connect()
	
	return {
		setScrollOffset = function(Offset)
			-- upvalues: v1 (ref), ViewRecyclerModule (upval)
			v1.dispatch({
				type = ViewRecyclerModule.VirtualizerCommandType.SetScrollOffset,
				offset = Offset
			})
		end,
		scrollToOffset = scrollToOffset,
		scrollBy = scrollBy,
		scrollToIndex = function(Index, p2)
			-- upvalues: v1 (ref), ViewRecyclerModule (upval)
			v1.dispatch({
				type = ViewRecyclerModule.VirtualizerCommandType.ScrollToIndex,
				index = Index,
				alignment = p2 and p2.alignment
			})
		end,
		setDataSource = function(Value)
			-- upvalues: DataSource (ref), commitConfiguration (copy)
			DataSource = Value
			commitConfiguration()
		end,
		setLayout = function(Value)
			-- upvalues: Layout (ref), commitConfiguration (copy)
			Layout = Value
			commitConfiguration()
		end,
		setDataSourceAndLayout = function(Value, Value1)
			-- upvalues: DataSource (ref), Layout (ref), commitConfiguration (copy)
			DataSource = Value
			Layout = Value1
			commitConfiguration()
		end,
		setOverscan = function(Overscan)
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2)
				-- upvalues: Overscan (copy)
				p2.overscan = Overscan
				p2.overscanPolicy = nil
			end
			
			local Copy = table.clone(Tbl)
			Copy.overscan = Overscan
			Copy.overscanPolicy = nil
			Tbl = Copy
			commitConfiguration()
		end,
		setOverscanPolicy = function(OverscanPolicy)
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2)
				-- upvalues: OverscanPolicy (copy)
				p2.overscanPolicy = OverscanPolicy
			end
			
			local Copy = table.clone(Tbl)
			Copy.overscanPolicy = OverscanPolicy
			Tbl = Copy
			commitConfiguration()
		end,
		setDataPrefetch = function(DataPrefetch)
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2)
				-- upvalues: DataPrefetch (copy)
				p2.dataPrefetch = DataPrefetch
			end
			
			local Copy = table.clone(Tbl)
			Copy.dataPrefetch = DataPrefetch
			Tbl = Copy
			commitConfiguration()
		end,
		setContentAlignment = function(ContentAlignment)
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2)
				-- upvalues: ContentAlignment (copy)
				p2.contentAlignment = ContentAlignment
			end
			
			local Copy = table.clone(Tbl)
			Copy.contentAlignment = ContentAlignment
			Tbl = Copy
			commitConfiguration()
		end,
		setPinnedItems = function(Tbl1)
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2)
				-- upvalues: Tbl1 (copy)
				p2.pinnedItems = table.clone(Tbl1)
			end
			
			local Copy = table.clone(Tbl)
			Copy.pinnedItems = table.clone(Tbl1)
			Tbl = Copy
			commitConfiguration()
		end,
		setMaxPoolSize = function(p2)
			-- upvalues: RecyclingScope (copy)
			RecyclingScope.setMaxPoolSize(p2)
		end,
		setPreserveScrollPositionOnChange = function(PreserveScrollPositionOnChange)
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2)
				-- upvalues: PreserveScrollPositionOnChange (copy)
				p2.preserveScrollPositionOnChange = PreserveScrollPositionOnChange
			end
			
			local Copy = table.clone(Tbl)
			Copy.preserveScrollPositionOnChange = PreserveScrollPositionOnChange
			Tbl = Copy
			commitConfiguration()
		end,
		refreshItemViews = function()
			-- upvalues: v1 (ref), ViewRecyclerModule (upval)
			v1.dispatch({ type = ViewRecyclerModule.VirtualizerCommandType.Refresh })
		end,
		getVisibleRange = function()
			-- upvalues: v1 (ref)
			return v1.getSnapshot().visibleRange
		end,
		getMountedRange = function()
			-- upvalues: v1 (ref)
			return v1.getSnapshot().mountedRange
		end,
		getScrollState = function()
			-- upvalues: v1 (ref), ViewRecyclerModule (upval)
			return v1.query({
				type = ViewRecyclerModule.VirtualizerQueryType.GetScrollState
			})
		end,
		captureScrollAnchorSnapshot = function()
			-- upvalues: v1 (ref), ViewRecyclerModule (upval)
			return v1.query({
				type = ViewRecyclerModule.VirtualizerQueryType.CaptureScrollAnchorSnapshot
			})
		end,
		restoreScrollAnchorSnapshot = restoreScrollAnchorSnapshot,
		destroy = function()
			-- upvalues: Flag (ref), ForGuiObjects (ref)
			if not Flag then
				Flag = true
				ForGuiObjects.destroy()
				
				return
			end
		end
	}
end
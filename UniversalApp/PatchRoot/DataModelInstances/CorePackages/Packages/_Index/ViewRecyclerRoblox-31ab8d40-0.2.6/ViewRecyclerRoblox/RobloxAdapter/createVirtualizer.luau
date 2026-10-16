local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local _ = ViewRecyclerModule.Adapter.ScrollPolicy.AutoScroll
local Axis = ViewRecyclerModule.Axis
local _ = ViewRecyclerModule.Layout
local ScrollingFrameVirtualizerModule = require(ViewRecyclerRoblox.RobloxAdapter.ScrollingFrameVirtualizer)
local _ = require(ViewRecyclerRoblox.RobloxAdapter.createRecyclingScope)

return function(p1) --[[ Line: 79 | Named "createVirtualizer" ]]
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
	
	local function scrollToOffset(Offset) --[[ Line: 101 ]]
		-- upvalues: v1 (ref), ViewRecyclerModule (upval)
		return v1.dispatch({
			type = ViewRecyclerModule.VirtualizerCommandType.ScrollToOffset,
			offset = Offset
		}).result
	end
	
	local function scrollBy(Delta) --[[ Line: 105 ]]
		-- upvalues: v1 (ref), ViewRecyclerModule (upval)
		return v1.dispatch({
			type = ViewRecyclerModule.VirtualizerCommandType.ScrollBy,
			delta = Delta
		}).result
	end
	
	local function restoreScrollAnchorSnapshot(Snapshot) --[[ Line: 109 ]]
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
	
	local function getListHostConfiguration() --[[ Line: 131 ]]
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
	
	local function commitConfiguration() --[[ Line: 150 ]]
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
	
	local function _(Callback: (any) -> ()) --[[ Line: 161 | Named "updateCorePolicy" ]]
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
		getGuiObject = function(p2) --[[ Line: 88 ]]
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
		setScrollOffset = function(Offset) --[[ Line: 214 ]]
			-- upvalues: v1 (ref), ViewRecyclerModule (upval)
			v1.dispatch({
				type = ViewRecyclerModule.VirtualizerCommandType.SetScrollOffset,
				offset = Offset
			})
		end,
		scrollToOffset = scrollToOffset,
		scrollBy = scrollBy,
		scrollToIndex = function(Index, p2) --[[ Line: 219 ]]
			-- upvalues: v1 (ref), ViewRecyclerModule (upval)
			v1.dispatch({
				type = ViewRecyclerModule.VirtualizerCommandType.ScrollToIndex,
				index = Index,
				alignment = p2 and p2.alignment
			})
		end,
		setDataSource = function(Value) --[[ Line: 189 ]]
			-- upvalues: DataSource (ref), commitConfiguration (copy)
			DataSource = Value
			commitConfiguration()
		end,
		setLayout = function(Value) --[[ Line: 194 ]]
			-- upvalues: Layout (ref), commitConfiguration (copy)
			Layout = Value
			commitConfiguration()
		end,
		setDataSourceAndLayout = function(Value, Value1) --[[ Line: 199 ]]
			-- upvalues: DataSource (ref), Layout (ref), commitConfiguration (copy)
			DataSource = Value
			Layout = Value1
			commitConfiguration()
		end,
		setOverscan = function(Overscan) --[[ Line: 229 ]]
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2) --[[ Line: 230 ]]
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
		setOverscanPolicy = function(OverscanPolicy) --[[ Line: 235 ]]
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2) --[[ Line: 236 ]]
				-- upvalues: OverscanPolicy (copy)
				p2.overscanPolicy = OverscanPolicy
			end
			
			local Copy = table.clone(Tbl)
			Copy.overscanPolicy = OverscanPolicy
			Tbl = Copy
			commitConfiguration()
		end,
		setDataPrefetch = function(DataPrefetch) --[[ Line: 240 ]]
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2) --[[ Line: 241 ]]
				-- upvalues: DataPrefetch (copy)
				p2.dataPrefetch = DataPrefetch
			end
			
			local Copy = table.clone(Tbl)
			Copy.dataPrefetch = DataPrefetch
			Tbl = Copy
			commitConfiguration()
		end,
		setContentAlignment = function(ContentAlignment) --[[ Line: 245 ]]
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2) --[[ Line: 246 ]]
				-- upvalues: ContentAlignment (copy)
				p2.contentAlignment = ContentAlignment
			end
			
			local Copy = table.clone(Tbl)
			Copy.contentAlignment = ContentAlignment
			Tbl = Copy
			commitConfiguration()
		end,
		setPinnedItems = function(Tbl1) --[[ Line: 250 ]]
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2) --[[ Line: 251 ]]
				-- upvalues: Tbl1 (copy)
				p2.pinnedItems = table.clone(Tbl1)
			end
			
			local Copy = table.clone(Tbl)
			Copy.pinnedItems = table.clone(Tbl1)
			Tbl = Copy
			commitConfiguration()
		end,
		setMaxPoolSize = function(p2) --[[ Line: 255 ]]
			-- upvalues: RecyclingScope (copy)
			RecyclingScope.setMaxPoolSize(p2)
		end,
		setPreserveScrollPositionOnChange = function(PreserveScrollPositionOnChange) --[[ Line: 258 ]]
			-- upvalues: Tbl (ref), commitConfiguration (copy)
			local function _(p2) --[[ Line: 259 ]]
				-- upvalues: PreserveScrollPositionOnChange (copy)
				p2.preserveScrollPositionOnChange = PreserveScrollPositionOnChange
			end
			
			local Copy = table.clone(Tbl)
			Copy.preserveScrollPositionOnChange = PreserveScrollPositionOnChange
			Tbl = Copy
			commitConfiguration()
		end,
		refreshItemViews = function() --[[ Line: 263 ]]
			-- upvalues: v1 (ref), ViewRecyclerModule (upval)
			v1.dispatch({ type = ViewRecyclerModule.VirtualizerCommandType.Refresh })
		end,
		getVisibleRange = function() --[[ Line: 266 ]]
			-- upvalues: v1 (ref)
			return v1.getSnapshot().visibleRange
		end,
		getMountedRange = function() --[[ Line: 269 ]]
			-- upvalues: v1 (ref)
			return v1.getSnapshot().mountedRange
		end,
		getScrollState = function() --[[ Line: 272 ]]
			-- upvalues: v1 (ref), ViewRecyclerModule (upval)
			return v1.query({
				type = ViewRecyclerModule.VirtualizerQueryType.GetScrollState
			})
		end,
		captureScrollAnchorSnapshot = function() --[[ Line: 275 ]]
			-- upvalues: v1 (ref), ViewRecyclerModule (upval)
			return v1.query({
				type = ViewRecyclerModule.VirtualizerQueryType.CaptureScrollAnchorSnapshot
			})
		end,
		restoreScrollAnchorSnapshot = restoreScrollAnchorSnapshot,
		destroy = function() --[[ Line: 205 ]]
			-- upvalues: Flag (ref), ForGuiObjects (ref)
			if not Flag then
				Flag = true
				ForGuiObjects.destroy()
				
				return
			end
		end
	}
end
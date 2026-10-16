local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local HostPlacementModule = require(ViewRecyclerRoblox.RobloxAdapter.HostPlacement)
local HostPresentationPhaseModule = require(ViewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)
local ScrollHostModule = require(ViewRecyclerRoblox.RobloxAdapter.ScrollHost)
local _ = require(ViewRecyclerRoblox.RobloxAdapter.createRecyclingScope)
local Axis = ViewRecyclerModule.Axis
local _ = ViewRecyclerModule.Layout
local ShallowTable = ViewRecyclerModule.Adapter._Private.ShallowTable
local Frozen = table.freeze({
	"scrollingFrame", "viewportOverlay", "axis", "dataSource", "layout",
	"overscan", "dataPrefetch", "contentAlignment", "isItemStickyHeader",
	"pinnedStartItem", "pinnedEndItem", "preserveScrollPositionOnChange",
	"initialScrollAlignment", "autoScrollOnChange", "autoScrollThreshold",
	"onStartReached", "onEndReached", "startReachedThreshold",
	"endReachedThreshold", "onViewportChanged", "onScrollOffsetChanged",
	"onContentLengthChanged", "onVisibleRangeChanged", "onMountedRangeChanged",
	"onDataPrefetchRequested"
})
local Frozen1 = table.freeze({
	"axis", "onStartReached", "onEndReached", "onViewportChanged",
	"onScrollOffsetChanged", "onContentLengthChanged"
})
local Frozen2 = table.freeze({
	"overscan", "dataPrefetch", "contentAlignment", "endReachedThreshold",
	"initialScrollAlignment", "autoScrollOnChange", "autoScrollThreshold",
	"startReachedThreshold", "preserveScrollPositionOnChange", "isItemStickyHeader"
})

local function _(p1) --[[ Line: 169 | Named "pick" ]]
	-- upvalues: Frozen (copy)
	local t = {}
	
	for _, value in Frozen do
		t[value] = p1[value]
	end
	return t
end

local _ = function(p2, p3) --[[ Line: 177 | Named "samePinnedItem" ]]
	-- upvalues: ShallowTable (copy)
	return ShallowTable.equal(p2 or {}, p3 or {})
end

local function samePolicy(p2, p3) --[[ Line: 181 ]]
	-- upvalues: ShallowTable (copy), Frozen2 (copy)
	return ShallowTable.containsEqual(p2, p3, Frozen2) and (p2.onStartReached == nil == (p3.onStartReached == nil) and p2.onEndReached == nil == (p3.onEndReached == nil) and (ShallowTable.equal(p2.pinnedStartItem or {}, p3.pinnedStartItem or {}) and ShallowTable.equal(p2.pinnedEndItem or {}, p3.pinnedEndItem or {})))
end

local _ = function(p2) --[[ Line: 189 | Named "stackedSpacing" ]]
	local StackedSpacingFunction = p2.layout.stackedSpacing
	
	return if StackedSpacingFunction == nil then nil else StackedSpacingFunction()
end

local _ = function(p2) --[[ Line: 196 | Named "assertPlaceable" ]]
	assert(not p2.requiresItemMeasurement() or p2.stackedSpacing ~= nil, "createVirtualizer: a Layout that requires Item measurement must be a Stacked layout")
end

local function corePolicy(p2) --[[ Line: 203 ]]
	return {
		overscan = p2.overscan,
		dataPrefetch = p2.dataPrefetch,
		contentAlignment = p2.contentAlignment,
		endThreshold = p2.endReachedThreshold,
		initialScrollAlignment = p2.initialScrollAlignment,
		autoScrollOnChange = p2.autoScrollOnChange,
		autoScrollThreshold = p2.autoScrollThreshold,
		startReachedThreshold = p2.startReachedThreshold,
		startReachedEnabled = p2.onStartReached ~= nil,
		endReachedEnabled = p2.onEndReached ~= nil,
		pinnedItems = {
			isItemStickyHeader = p2.isItemStickyHeader,
			pinnedStartItem = p2.pinnedStartItem,
			pinnedEndItem = p2.pinnedEndItem
		},
		preserveScrollPositionOnChange = p2.preserveScrollPositionOnChange ~= false
	}
end

return function(p2) --[[ Line: 224 | Named "createVirtualizer" ]]
	-- upvalues: Axis (copy), Frozen (copy), HostPlacementModule (copy), HostPresentationPhaseModule (copy), corePolicy (copy), ViewRecyclerModule (copy), ScrollHostModule (copy), samePolicy (copy), ShallowTable (copy), Frozen1 (copy)
	local Flag: boolean = p2.axis == Axis.X or p2.axis == Axis.Y
	assert(Flag, "createVirtualizer: invalid axis")
	local Layout = p2.layout
	assert(not Layout.requiresItemMeasurement() or Layout.stackedSpacing ~= nil, "createVirtualizer: a Layout that requires Item measurement must be a Stacked layout")
	local t = {}
	
	for _, value in Frozen do
		t[value] = p2[value]
	end
	local Tbl = t
	Flag = false
	local Flag1 = false
	local Flag2 = false
	local Flag3 = false
	local Flag4 = false
	local Virtualizer = nil
	local NewResult = nil
	local StackedSpacingFunction = Tbl.layout.stackedSpacing
	local NewHostPlacement = HostPlacementModule.new({
		container = Tbl.scrollingFrame,
		viewportContainer = Tbl.viewportOverlay,
		axis = Tbl.axis,
		selfSizing = Tbl.layout.requiresItemMeasurement(),
		stackedSpacing = if StackedSpacingFunction == nil then nil else StackedSpacingFunction(),
		onItemMeasurements = function(p3) --[[ Line: 243 ]]
			-- upvalues: Virtualizer (ref)
			Virtualizer.submitMeasurements(p3)
		end,
		onItemViewPresentationChanged = p2.onItemViewPresentationChanged,
		getCanvasOriginOffset = function() --[[ Line: 247 ]]
			-- upvalues: NewResult (ref)
			return if NewResult == nil then 0 else NewResult.getCanvasOriginOffset()
		end
	})
	local Frozen2 = table.freeze({
		apply = NewHostPlacement.apply,
		setMeasurementDependencies = NewHostPlacement.setMeasurementDependencies
	})
	local PresentItemView = p2.presentItemView or function(p3, State, p4, p5) --[[ Line: 257 ]]
		-- upvalues: p2 (copy), HostPresentationPhaseModule (upval)
		local TransitionFunction: (any, any) -> () = p2.transition
		
		if State == nil then
			p5.apply(p3, nil)
			
			if p4 and TransitionFunction ~= nil then
				TransitionFunction(p3, nil)
			end
			return
		else
			local _Instance = if p2.getInstance == nil then p3 else p2.getInstance(p3)
			assert(typeof(_Instance) == "Instance" and _Instance:IsA("GuiObject"), "createVirtualizer: ItemView host must be a GuiObject")
			
			if p4 then
				p5.apply(p3, {
					host = _Instance,
					phase = HostPresentationPhaseModule.Hidden,
					state = State
				})
				
				if TransitionFunction ~= nil then
					TransitionFunction(p3, State.assignment)
				end
			end
			p5.apply(p3, {
				host = _Instance,
				phase = HostPresentationPhaseModule.Presented,
				state = State
			})
		end
	end
	local self = setmetatable({}, { __mode = "k" })
	
	local function _(Key, p3) --[[ Line: 290 | Named "present" ]]
		-- upvalues: self (copy), PresentItemView (copy), Frozen2 (copy)
		local Assignment = if p3 == nil then nil else p3.assignment
		local IsNotSelfEntryMatch = self[Key] ~= Assignment
		
		if IsNotSelfEntryMatch then
			self[Key] = Assignment
		end
		PresentItemView(Key, p3, IsNotSelfEntryMatch, Frozen2)
	end
	
	local v1 = nil
	
	local function presentChanges() --[[ Line: 301 ]]
		-- upvalues: v1 (ref), NewHostPlacement (copy), self (copy), PresentItemView (copy), Frozen2 (copy)
		local v2 = v1
		v1 = nil
		NewHostPlacement.setMountedWindow(v2, function() --[[ Line: 304 ]]
			-- upvalues: v2 (copy), self (upval), PresentItemView (upval), Frozen2 (upval)
			for _, value in v2.departed do
				local HasSelfEntry = self[value] ~= nil
				
				if HasSelfEntry then
					self[value] = nil
				end
				PresentItemView(value, nil, HasSelfEntry, Frozen2)
			end
			for _, value1 in v2.entered do
				local ItemView = value1.itemView
				local State = value1.state
				local Assignment = if State == nil then nil else State.assignment
				local IsNotSelfEntryMatch = self[ItemView] ~= Assignment
				
				if IsNotSelfEntryMatch then
					self[ItemView] = Assignment
				end
				PresentItemView(ItemView, State, IsNotSelfEntryMatch, Frozen2)
			end
			for _, value2 in v2.updated do
				local ItemView = value2.itemView
				local State = value2.state
				local Assignment = if State == nil then nil else State.assignment
				local IsNotSelfEntryMatch = self[ItemView] ~= Assignment
				
				if IsNotSelfEntryMatch then
					self[ItemView] = Assignment
				end
				PresentItemView(ItemView, State, IsNotSelfEntryMatch, Frozen2)
			end
		end)
	end
	
	local function applyRecord(p3, p4) --[[ Line: 317 ]]
		-- upvalues: v1 (ref), NewResult (ref), presentChanges (copy), Flag1 (ref), Flag2 (ref), Flag3 (ref), Tbl (ref), Flag4 (ref)
		v1 = p4
		NewResult.applyRecord(p4, presentChanges)
		
		if not Flag1 then return end
		if p3.visibleRange ~= p4.visibleRange then
			if Flag2 then
				Flag3 = true
			end
			if Tbl.onVisibleRangeChanged ~= nil then
				Tbl.onVisibleRangeChanged(p4.visibleRange)
			end
		end
		if p3.mountedRange ~= p4.mountedRange then
			if Flag2 then
				Flag4 = true
			end
			if Tbl.onMountedRangeChanged ~= nil then
				Tbl.onMountedRangeChanged(p4.mountedRange)
			end
		end
		if Tbl.onDataPrefetchRequested ~= nil then
			for _, dataPrefetchRequest in p4.dataPrefetchRequests do
				Tbl.onDataPrefetchRequested(dataPrefetchRequest)
			end
		end
	end
	
	local CorePolicyResult = corePolicy(Tbl)
	Virtualizer = ViewRecyclerModule.Adapter.createVirtualizer({
		dataSource = Tbl.dataSource,
		layout = Tbl.layout,
		recyclingScope = p2.recyclingScope,
		getItemViewType = p2.getItemViewType,
		overscan = CorePolicyResult.overscan,
		dataPrefetch = CorePolicyResult.dataPrefetch,
		contentAlignment = CorePolicyResult.contentAlignment,
		endThreshold = CorePolicyResult.endThreshold,
		initialScrollAlignment = CorePolicyResult.initialScrollAlignment,
		autoScrollOnChange = CorePolicyResult.autoScrollOnChange,
		autoScrollThreshold = CorePolicyResult.autoScrollThreshold,
		startReachedThreshold = CorePolicyResult.startReachedThreshold,
		startReachedEnabled = CorePolicyResult.startReachedEnabled,
		endReachedEnabled = CorePolicyResult.endReachedEnabled,
		isItemStickyHeader = CorePolicyResult.pinnedItems.isItemStickyHeader,
		pinnedStartItem = CorePolicyResult.pinnedItems.pinnedStartItem,
		pinnedEndItem = CorePolicyResult.pinnedItems.pinnedEndItem,
		preserveScrollPositionOnChange = CorePolicyResult.preserveScrollPositionOnChange,
		diagnostics = p2.diagnostics,
		onTransaction = applyRecord
	})
	NewResult = ScrollHostModule.new({
		observeScrollOffset = Virtualizer.observeScrollOffset,
		setViewportSize = Virtualizer.setViewportSize,
		getCurrent = Virtualizer.getCurrent,
		getInstance = function() --[[ Line: 377 ]]
			-- upvalues: Flag (ref), Tbl (ref)
			return if Flag then nil else Tbl.scrollingFrame
		end,
		getConfiguration = function() --[[ Line: 380 ]]
			-- upvalues: Tbl (ref)
			return Tbl
		end,
		onCanvasOriginMoved = NewHostPlacement.reposition
	})
	
	local function update(p5) --[[ Line: 386 ]]
		-- upvalues: Flag (ref), Tbl (ref), Frozen (upval), Axis (upval), NewHostPlacement (copy), Virtualizer (ref), samePolicy (upval), corePolicy (upval), ShallowTable (upval), Frozen1 (upval), NewResult (ref)
		if Flag then return end
		local Tbl1 = Tbl
		local t = {}
		
		for _, value in Frozen do
			t[value] = p5[value]
		end
		assert(t.axis == Axis.X or t.axis == Axis.Y, "createVirtualizer: invalid axis")
		local Layout = t.layout
		assert(not Layout.requiresItemMeasurement() or Layout.stackedSpacing ~= nil, "createVirtualizer: a Layout that requires Item measurement must be a Stacked layout")
		local IsNotDataSourceMatch = t.dataSource ~= Tbl1.dataSource
		local IsNotLayoutMatch = t.layout ~= Tbl1.layout
		local IsNotScrollingFrameMatch = t.scrollingFrame ~= Tbl1.scrollingFrame
		local IsNotScrollingFrameMatch1: boolean = IsNotScrollingFrameMatch or (t.viewportOverlay ~= Tbl1.viewportOverlay or t.axis ~= Tbl1.axis or (IsNotLayoutMatch or t.isItemStickyHeader == nil ~= (Tbl1.isItemStickyHeader == nil)))
		Tbl = t
		
		if IsNotDataSourceMatch or IsNotLayoutMatch then
			NewHostPlacement.cancelPendingMeasurements()
			
			if IsNotDataSourceMatch and IsNotLayoutMatch then
				Virtualizer.setDataSourceAndLayout(t.dataSource, t.layout)
			elseif IsNotDataSourceMatch then
				Virtualizer.setDataSource(t.dataSource)
			else
				Virtualizer.setLayout(t.layout)
			end
		end
		if IsNotScrollingFrameMatch1 then
			local StackedSpacingFunction = t.layout.stackedSpacing
			NewHostPlacement.setConfiguration({
				container = t.scrollingFrame,
				viewportContainer = t.viewportOverlay,
				axis = t.axis,
				selfSizing = t.layout.requiresItemMeasurement(),
				stackedSpacing = if StackedSpacingFunction == nil then nil else StackedSpacingFunction()
			})
		end
		if not samePolicy(Tbl1, t) then
			Virtualizer.setPolicy((corePolicy(t)))
		end
		if not ShallowTable.containsEqual(Tbl1, t, Frozen1) then
			NewResult.configurationChanged()
		end
		if IsNotScrollingFrameMatch then
			NewResult.scrollingFrameChanged()
		end
	end
	
	local _ = function(Callback: (any) -> ()) --[[ Line: 434 | Named "updateWith" ]]
		-- upvalues: Tbl (ref), update (copy)
		local Copy = table.clone(Tbl)
		Callback(Copy)
		update(Copy)
	end
	
	local Callback: (() -> ())? = nil
	
	local function destroy() --[[ Line: 442 ]]
		-- upvalues: Flag (ref), Callback (ref), Virtualizer (ref), NewHostPlacement (copy)
		if Flag then return end
		Flag = true
		
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
		Virtualizer.destroy()
		NewHostPlacement.destroy()
	end
	
	if p2.active == false then
		Virtualizer.setActive(false)
	end
	Callback = NewResult.connect()
	Flag1 = true
	Flag2 = true
	local Success, Result = pcall(Virtualizer.activate)
	Flag2 = false
	
	if not Success then
		if not Flag then
			Flag = true
			
			if Callback ~= nil then
				Callback()
				Callback = nil
			end
			Virtualizer.destroy()
			NewHostPlacement.destroy()
		end
		error(Result, 0)
	end
	local Current = Virtualizer.getCurrent()
	
	if not Flag3 and Tbl.onVisibleRangeChanged ~= nil then
		Tbl.onVisibleRangeChanged(Current.visibleRange)
	end
	if not Flag4 and Tbl.onMountedRangeChanged ~= nil then
		Tbl.onMountedRangeChanged(Current.mountedRange)
	end
	return {
		update = update,
		setActive = function(p6) --[[ Line: 477 ]]
			-- upvalues: Flag (ref), Virtualizer (ref)
			if not Flag then
				Virtualizer.setActive(p6)
			end
		end,
		setScrollOffset = function(p6) --[[ Line: 482 ]]
			-- upvalues: Virtualizer (ref)
			Virtualizer.setScrollOffset(p6)
		end,
		scrollToOffset = function(p6) --[[ Line: 485 ]]
			-- upvalues: Virtualizer (ref)
			return Virtualizer.scrollToOffset(p6).scrollState.scrollOffset
		end,
		scrollToStart = function() --[[ Line: 488 ]]
			-- upvalues: Virtualizer (ref)
			Virtualizer.scrollToStart()
		end,
		scrollToEnd = function() --[[ Line: 491 ]]
			-- upvalues: Virtualizer (ref)
			Virtualizer.scrollToEnd()
		end,
		scrollBy = function(p6) --[[ Line: 494 ]]
			-- upvalues: Virtualizer (ref)
			return Virtualizer.scrollBy(p6).scrollState.scrollOffset
		end,
		scrollToIndex = function(p6, Alignment) --[[ Line: 497 ]]
			-- upvalues: NewResult (ref), Virtualizer (ref)
			if NewResult.isReady() then
				Virtualizer.scrollToIndex(p6, Alignment and Alignment.alignment)
			end
		end,
		setDataSource = function(DataSource) --[[ Line: 502 ]]
			-- upvalues: Tbl (ref), update (copy)
			local function _(p6) --[[ Line: 503 ]]
				-- upvalues: DataSource (copy)
				p6.dataSource = DataSource
			end
			
			local Copy = table.clone(Tbl)
			Copy.dataSource = DataSource
			update(Copy)
		end,
		setLayout = function(Layout) --[[ Line: 507 ]]
			-- upvalues: Tbl (ref), update (copy)
			local function _(p6) --[[ Line: 508 ]]
				-- upvalues: Layout (copy)
				p6.layout = Layout
			end
			
			local Copy = table.clone(Tbl)
			Copy.layout = Layout
			update(Copy)
		end,
		setDataSourceAndLayout = function(DataSource, Layout) --[[ Line: 512 ]]
			-- upvalues: Tbl (ref), update (copy)
			local function _(p6) --[[ Line: 513 ]]
				-- upvalues: DataSource (copy), Layout (copy)
				p6.dataSource = DataSource
				p6.layout = Layout
			end
			
			local Copy = table.clone(Tbl)
			Copy.dataSource = DataSource
			Copy.layout = Layout
			update(Copy)
		end,
		setOverscan = function(Overscan) --[[ Line: 518 ]]
			-- upvalues: Tbl (ref), update (copy)
			local function _(p6) --[[ Line: 519 ]]
				-- upvalues: Overscan (copy)
				p6.overscan = Overscan
			end
			
			local Copy = table.clone(Tbl)
			Copy.overscan = Overscan
			update(Copy)
		end,
		setDataPrefetch = function(DataPrefetch) --[[ Line: 523 ]]
			-- upvalues: Tbl (ref), update (copy)
			local function _(p6) --[[ Line: 524 ]]
				-- upvalues: DataPrefetch (copy)
				p6.dataPrefetch = DataPrefetch
			end
			
			local Copy = table.clone(Tbl)
			Copy.dataPrefetch = DataPrefetch
			update(Copy)
		end,
		setContentAlignment = function(ContentAlignment) --[[ Line: 528 ]]
			-- upvalues: Tbl (ref), update (copy)
			local function _(p6) --[[ Line: 529 ]]
				-- upvalues: ContentAlignment (copy)
				p6.contentAlignment = ContentAlignment
			end
			
			local Copy = table.clone(Tbl)
			Copy.contentAlignment = ContentAlignment
			update(Copy)
		end,
		setPinnedItems = function(p6) --[[ Line: 533 ]]
			-- upvalues: Tbl (ref), update (copy)
			local function _(p7) --[[ Line: 534 ]]
				-- upvalues: p6 (copy)
				p7.isItemStickyHeader = p6.isItemStickyHeader
				p7.pinnedStartItem = p6.pinnedStartItem
				p7.pinnedEndItem = p6.pinnedEndItem
			end
			
			local Copy = table.clone(Tbl)
			Copy.isItemStickyHeader = p6.isItemStickyHeader
			Copy.pinnedStartItem = p6.pinnedStartItem
			Copy.pinnedEndItem = p6.pinnedEndItem
			update(Copy)
		end,
		setPreserveScrollPositionOnChange = function(PreserveScrollPositionOnChange) --[[ Line: 540 ]]
			-- upvalues: Tbl (ref), update (copy)
			local function _(p6) --[[ Line: 541 ]]
				-- upvalues: PreserveScrollPositionOnChange (copy)
				p6.preserveScrollPositionOnChange = PreserveScrollPositionOnChange
			end
			
			local Copy = table.clone(Tbl)
			Copy.preserveScrollPositionOnChange = PreserveScrollPositionOnChange
			update(Copy)
		end,
		refreshItemViews = function() --[[ Line: 545 ]]
			-- upvalues: Virtualizer (ref)
			Virtualizer.refresh()
		end,
		isReady = NewResult.isReady,
		getVisibleRange = function() --[[ Line: 549 ]]
			-- upvalues: Virtualizer (ref)
			return Virtualizer.getCurrent().visibleRange
		end,
		getMountedRange = function() --[[ Line: 552 ]]
			-- upvalues: Virtualizer (ref)
			return Virtualizer.getCurrent().mountedRange
		end,
		getScrollState = function() --[[ Line: 555 ]]
			-- upvalues: Virtualizer (ref)
			return Virtualizer.getCurrent().scrollState
		end,
		captureScrollAnchorSnapshot = function() --[[ Line: 558 ]]
			-- upvalues: Virtualizer (ref)
			return Virtualizer.captureScrollAnchorSnapshot()
		end,
		restoreScrollAnchorSnapshot = function(p6) --[[ Line: 561 ]]
			-- upvalues: Virtualizer (ref)
			return Virtualizer.restoreScrollAnchorSnapshot(p6).scrollState.scrollOffset
		end,
		destroy = destroy
	}
end
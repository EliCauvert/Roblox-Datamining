local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local hostPlacementModule = require(viewRecyclerRoblox.RobloxAdapter.HostPlacement)
local hostPresentationPhaseModule = require(viewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)
local scrollHostModule = require(viewRecyclerRoblox.RobloxAdapter.ScrollHost)
local _ = require(viewRecyclerRoblox.RobloxAdapter.createRecyclingScope)
local axis = viewRecyclerModule.Axis
local _ = viewRecyclerModule.Layout
local shallowTable = viewRecyclerModule.Adapter._Private.ShallowTable
local frozen = table.freeze({
	"scrollingFrame", "viewportOverlay", "axis", "dataSource", "layout",
	"overscan", "dataPrefetch", "contentAlignment", "isItemStickyHeader",
	"pinnedStartItem", "pinnedEndItem", "preserveScrollPositionOnChange",
	"initialScrollAlignment", "autoScrollOnChange", "autoScrollThreshold",
	"onStartReached", "onEndReached", "startReachedThreshold",
	"endReachedThreshold", "onViewportChanged", "onScrollOffsetChanged",
	"onContentLengthChanged", "onVisibleRangeChanged", "onMountedRangeChanged",
	"onDataPrefetchRequested"
})
local frozen_1 = table.freeze({
	"axis", "onStartReached", "onEndReached", "onViewportChanged",
	"onScrollOffsetChanged", "onContentLengthChanged"
})
local frozen_2 = table.freeze({
	"overscan", "dataPrefetch", "contentAlignment", "endReachedThreshold",
	"initialScrollAlignment", "autoScrollOnChange", "autoScrollThreshold",
	"startReachedThreshold", "preserveScrollPositionOnChange", "isItemStickyHeader"
})

local function _(p1)
	-- upvalues: frozen (ref)
	local t = {}
	
	for i, v in frozen do
		t[v] = p1[v]
	end
	return t
end

local _ = function(p2, p3)
	-- upvalues: shallowTable (ref)
	return shallowTable.equal(p2 or {}, p3 or {})
end

local function samePolicy(p2, p3)
	-- upvalues: shallowTable (ref), frozen_2 (ref)
	local var1 = shallowTable.containsEqual(p2, p3, frozen_2)
	
	if var1 then
		var1 = false
		
		if p2.onStartReached == nil == (p3.onStartReached == nil) then
			var1 = false
			
			if p2.onEndReached == nil == (p3.onEndReached == nil) then
				var1 = shallowTable.equal(p2.pinnedStartItem or {}, p3.pinnedStartItem or {})
				
				if var1 then
					local pinnedEndItem = p3.pinnedEndItem
					var1 = shallowTable.equal(p2.pinnedEndItem or {}, pinnedEndItem or {})
				end
			end
		end
	end
	return var1
end

local _ = function(p2)
	local stackedSpacing = p2.layout.stackedSpacing
	
	return if stackedSpacing == nil then nil else stackedSpacing()
end

local _ = function(p2)
	assert(not p2.requiresItemMeasurement() or p2.stackedSpacing ~= nil, "createVirtualizer: a Layout that requires Item measurement must be a Stacked layout")
end

local function corePolicy(p2)
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

return function(p2)
	-- upvalues: axis (ref), frozen (ref), hostPlacementModule (ref), hostPresentationPhaseModule (ref), corePolicy (ref), viewRecyclerModule (ref), scrollHostModule (ref), samePolicy (ref), shallowTable (ref), frozen_1 (ref)
	assert(if p2.axis ~= axis.X then p2.axis == axis.Y else true, "createVirtualizer: invalid axis")
	local layout = p2.layout
	assert(not layout.requiresItemMeasurement() or layout.stackedSpacing ~= nil, "createVirtualizer: a Layout that requires Item measurement must be a Stacked layout")
	local t = {}
	
	for i, v in frozen do
		t[v] = p2[v]
	end
	local var1 = t
	local var2 = false
	local var3 = false
	local var4 = false
	local var5 = false
	local var6 = false
	local var7 = nil
	local var8 = nil
	local new = hostPlacementModule.new
	local t_1 = {
		container = var1.scrollingFrame,
		viewportContainer = var1.viewportOverlay,
		axis = var1.axis,
		selfSizing = var1.layout.requiresItemMeasurement()
	}
	local stackedSpacing = var1.layout.stackedSpacing
	t_1.stackedSpacing = if stackedSpacing == nil then nil else stackedSpacing()
	
	function t_1.onItemMeasurements(p3)
		-- upvalues: var7 (write)
		var7.submitMeasurements(p3)
	end
	
	t_1.onItemViewPresentationChanged = p2.onItemViewPresentationChanged
	
	function t_1.getCanvasOriginOffset()
		-- upvalues: var8 (write)
		return if var8 == nil then 0 else var8.getCanvasOriginOffset()
	end
	
	new = new(t_1)
	local frozen_2 = table.freeze({
		apply = new.apply,
		setMeasurementDependencies = new.setMeasurementDependencies
	})
	local presentItemView = p2.presentItemView or function(p3, p4, p5, p6)
		-- upvalues: p2 (ref), hostPresentationPhaseModule (copy)
		local transition = p2.transition
		
		if p4 == nil then
			p6.apply(p3, nil)
			
			if p5 and transition ~= nil then
				transition(p3, nil)
			end
			return
		else
			local var9 = if p2.getInstance ~= nil then p3 else p2.getInstance(p3)
			assert(typeof(var9) == "Instance" and var9:IsA("GuiObject"), "createVirtualizer: ItemView host must be a GuiObject")
			
			if p5 then
				p6.apply(p3, {
					host = var9,
					phase = hostPresentationPhaseModule.Hidden,
					state = p4
				})
				
				if transition ~= nil then
					transition(p3, p4.assignment)
				end
			end
			p6.apply(p3, {
				host = var9,
				phase = hostPresentationPhaseModule.Presented,
				state = p4
			})
		end
	end
	local tbl = setmetatable({}, { __mode = "k" })
	
	local function _(p3, p4)
		-- upvalues: tbl (ref), presentItemView (ref), frozen_2 (ref)
		local var9 = if p4 == nil then nil else p4.assignment
		local var10 = tbl[p3] ~= var9
		
		if var10 then
			tbl[p3] = var9
		end
		presentItemView(p3, p4, var10, frozen_2)
	end
	
	local var9 = nil
	
	local function presentChanges()
		-- upvalues: var9 (write), new (ref), tbl (ref), presentItemView (ref), frozen_2 (ref)
		var9 = nil
		new.setMountedWindow(var9, function()
			-- upvalues: var9 (ref), tbl (copy), presentItemView (copy), frozen_2 (copy)
			for i, v in var9.departed do
				local var10 = tbl[v] ~= nil
				
				if var10 then
					tbl[v] = nil
				end
				presentItemView(v, nil, var10, frozen_2)
			end
			for i, v_1 in var9.entered do
				local itemView = v_1.itemView
				local state = v_1.state
				local var11 = if state == nil then nil else state.assignment
				local var12 = tbl[itemView] ~= var11
				
				if var12 then
					tbl[itemView] = var11
				end
				presentItemView(itemView, state, var12, frozen_2)
			end
			for i, v_2 in var9.updated do
				local itemView = v_2.itemView
				local state = v_2.state
				local var13 = if state == nil then nil else state.assignment
				local var14 = tbl[itemView] ~= var13
				
				if var14 then
					tbl[itemView] = var13
				end
				presentItemView(itemView, state, var14, frozen_2)
			end
		end)
	end
	
	local var15 = corePolicy(var1)
	var7 = viewRecyclerModule.Adapter.createVirtualizer({
		dataSource = var1.dataSource,
		layout = var1.layout,
		recyclingScope = p2.recyclingScope,
		getItemViewType = p2.getItemViewType,
		overscan = var15.overscan,
		dataPrefetch = var15.dataPrefetch,
		contentAlignment = var15.contentAlignment,
		endThreshold = var15.endThreshold,
		initialScrollAlignment = var15.initialScrollAlignment,
		autoScrollOnChange = var15.autoScrollOnChange,
		autoScrollThreshold = var15.autoScrollThreshold,
		startReachedThreshold = var15.startReachedThreshold,
		startReachedEnabled = var15.startReachedEnabled,
		endReachedEnabled = var15.endReachedEnabled,
		isItemStickyHeader = var15.pinnedItems.isItemStickyHeader,
		pinnedStartItem = var15.pinnedItems.pinnedStartItem,
		pinnedEndItem = var15.pinnedItems.pinnedEndItem,
		preserveScrollPositionOnChange = var15.preserveScrollPositionOnChange,
		diagnostics = p2.diagnostics,
		onTransaction = function(p3, p4)
			-- upvalues: var9 (write), var8 (write), presentChanges (ref), var3 (write), var4 (write), var5 (write), var1 (write), var6 (write)
			var9 = p4
			var8.applyRecord(p4, presentChanges)
			
			if not var3 then return end
			if p3.visibleRange ~= p4.visibleRange then
				if var4 then
					var5 = true
				end
				if var1.onVisibleRangeChanged ~= nil then
					var1.onVisibleRangeChanged(p4.visibleRange)
				end
			end
			if p3.mountedRange ~= p4.mountedRange then
				if var4 then
					var6 = true
				end
				if var1.onMountedRangeChanged ~= nil then
					var1.onMountedRangeChanged(p4.mountedRange)
				end
			end
			if var1.onDataPrefetchRequested ~= nil then
				for i, v in p4.dataPrefetchRequests do
					var1.onDataPrefetchRequested(v)
				end
			end
		end
	})
	var8 = scrollHostModule.new({
		observeScrollOffset = var7.observeScrollOffset,
		setViewportSize = var7.setViewportSize,
		getCurrent = var7.getCurrent,
		getInstance = function()
			-- upvalues: var2 (write), var1 (write)
			return if var2 then nil else var1.scrollingFrame
		end,
		getConfiguration = function()
			-- upvalues: var1 (write)
			return var1
		end,
		onCanvasOriginMoved = new.reposition
	})
	
	local function update(p5)
		-- upvalues: var2 (write), var1 (write), frozen (copy), axis (copy), new (ref), var7 (write), samePolicy (copy), corePolicy (copy), shallowTable (copy), frozen_1 (copy), var8 (write)
		if var2 then return end
		local t = {}
		
		for i, v in frozen do
			t[v] = p5[v]
		end
		assert(if t.axis ~= axis.X then t.axis == axis.Y else true, "createVirtualizer: invalid axis")
		t = t.layout
		assert(not t.requiresItemMeasurement() or t.stackedSpacing ~= nil, "createVirtualizer: a Layout that requires Item measurement must be a Stacked layout")
		t = t.dataSource ~= var1.dataSource
		local var16 = t.layout ~= var1.layout
		local var17 = t.scrollingFrame ~= var1.scrollingFrame
		local var18 = var17 or (if t.viewportOverlay == var1.viewportOverlay then if t.axis == var1.axis then var16 or t.isItemStickyHeader == nil ~= (var1.isItemStickyHeader == nil) else true else true)
		var1 = t
		
		if t or var16 then
			new.cancelPendingMeasurements()
			
			if t and var16 then
				var7.setDataSourceAndLayout(t.dataSource, t.layout)
			elseif t then
				var7.setDataSource(t.dataSource)
			else
				var7.setLayout(t.layout)
			end
		end
		if var18 then
			local setConfiguration = new.setConfiguration
			local t_1 = {
				container = t.scrollingFrame,
				viewportContainer = t.viewportOverlay,
				axis = t.axis,
				selfSizing = t.layout.requiresItemMeasurement()
			}
			local stackedSpacing = t.layout.stackedSpacing
			t_1.stackedSpacing = if stackedSpacing == nil then nil else stackedSpacing()
			setConfiguration(t_1)
		end
		if not samePolicy(var1, t) then
			var7.setPolicy(corePolicy(t))
		end
		if not shallowTable.containsEqual(var1, t, frozen_1) then
			var8.configurationChanged()
		end
		if var17 then
			var8.scrollingFrameChanged()
		end
	end
	
	local _ = function(p6)
		-- upvalues: var1 (write), update (ref)
		local cloned = table.clone(var1)
		p6(cloned)
		update(cloned)
	end
	
	local var19 = nil
	
	local function destroy()
		-- upvalues: var2 (write), var19 (write), var7 (write), new (ref)
		if var2 then return end
		var2 = true
		
		if var19 ~= nil then
			var19()
			var19 = nil
		end
		var7.destroy()
		new.destroy()
	end
	
	if p2.active == false then
		var7.setActive(false)
	end
	var19 = var8.connect()
	var3 = true
	var4 = true
	local ok, status = pcall(var7.activate)
	var4 = false
	
	if not ok then
		var2 = true
		
		if var19 ~= nil then
			var19()
			var19 = nil
		end
		var7.destroy()
		new.destroy()
		error(status, 0)
	end
	local current = var7.getCurrent()
	
	if var1.onVisibleRangeChanged ~= nil then
		var1.onVisibleRangeChanged(current.visibleRange)
	end
	if var1.onMountedRangeChanged ~= nil then
		var1.onMountedRangeChanged(current.mountedRange)
	end
	return {
		update = update,
		setActive = function(value)
			-- upvalues: var2 (write), var7 (write)
			if not var2 then
				var7.setActive(value)
			end
		end,
		setScrollOffset = function(value)
			-- upvalues: var7 (write)
			var7.setScrollOffset(value)
		end,
		scrollToOffset = function(value)
			-- upvalues: var7 (write)
			return var7.scrollToOffset(value).scrollState.scrollOffset
		end,
		scrollToStart = function()
			-- upvalues: var7 (write)
			var7.scrollToStart()
		end,
		scrollToEnd = function()
			-- upvalues: var7 (write)
			var7.scrollToEnd()
		end,
		scrollBy = function(p6)
			-- upvalues: var7 (write)
			return var7.scrollBy(p6).scrollState.scrollOffset
		end,
		scrollToIndex = function(p6, p7)
			-- upvalues: var8 (write), var7 (write)
			if var8.isReady() then
				var7.scrollToIndex(p6, p7 and p7.alignment)
			end
		end,
		setDataSource = function(value)
			-- upvalues: var1 (write), update (ref)
			local _ = function(p6)
				-- upvalues: value (ref)
				p6.dataSource = value
			end
			
			local cloned = table.clone(var1)
			cloned.dataSource = value
			update(cloned)
		end,
		setLayout = function(value)
			-- upvalues: var1 (write), update (ref)
			local _ = function(p6)
				-- upvalues: value (ref)
				p6.layout = value
			end
			
			local cloned = table.clone(var1)
			cloned.layout = value
			update(cloned)
		end,
		setDataSourceAndLayout = function(value, p6)
			-- upvalues: var1 (write), update (ref)
			local _ = function(p7)
				-- upvalues: value (ref), p6 (ref)
				p7.dataSource = value
				p7.layout = p6
			end
			
			local cloned = table.clone(var1)
			cloned.dataSource = value
			cloned.layout = p6
			update(cloned)
		end,
		setOverscan = function(value)
			-- upvalues: var1 (write), update (ref)
			local _ = function(p6)
				-- upvalues: value (ref)
				p6.overscan = value
			end
			
			local cloned = table.clone(var1)
			cloned.overscan = value
			update(cloned)
		end,
		setDataPrefetch = function(value)
			-- upvalues: var1 (write), update (ref)
			local _ = function(p6)
				-- upvalues: value (ref)
				p6.dataPrefetch = value
			end
			
			local cloned = table.clone(var1)
			cloned.dataPrefetch = value
			update(cloned)
		end,
		setContentAlignment = function(value)
			-- upvalues: var1 (write), update (ref)
			local _ = function(p6)
				-- upvalues: value (ref)
				p6.contentAlignment = value
			end
			
			local cloned = table.clone(var1)
			cloned.contentAlignment = value
			update(cloned)
		end,
		setPinnedItems = function(value)
			-- upvalues: var1 (write), update (ref)
			local _ = function(p6)
				-- upvalues: value (ref)
				p6.isItemStickyHeader = value.isItemStickyHeader
				p6.pinnedStartItem = value.pinnedStartItem
				p6.pinnedEndItem = value.pinnedEndItem
			end
			
			local cloned = table.clone(var1)
			cloned.isItemStickyHeader = value.isItemStickyHeader
			cloned.pinnedStartItem = value.pinnedStartItem
			cloned.pinnedEndItem = value.pinnedEndItem
			update(cloned)
		end,
		setPreserveScrollPositionOnChange = function(value)
			-- upvalues: var1 (write), update (ref)
			local _ = function(p6)
				-- upvalues: value (ref)
				p6.preserveScrollPositionOnChange = value
			end
			
			local cloned = table.clone(var1)
			cloned.preserveScrollPositionOnChange = value
			update(cloned)
		end,
		refreshItemViews = function()
			-- upvalues: var7 (write)
			var7.refresh()
		end,
		isReady = var8.isReady,
		getVisibleRange = function()
			-- upvalues: var7 (write)
			return var7.getCurrent().visibleRange
		end,
		getMountedRange = function()
			-- upvalues: var7 (write)
			return var7.getCurrent().mountedRange
		end,
		getScrollState = function()
			-- upvalues: var7 (write)
			return var7.getCurrent().scrollState
		end,
		captureScrollAnchorSnapshot = function()
			-- upvalues: var7 (write)
			return var7.captureScrollAnchorSnapshot()
		end,
		restoreScrollAnchorSnapshot = function(p6)
			-- upvalues: var7 (write)
			return var7.restoreScrollAnchorSnapshot(p6).scrollState.scrollOffset
		end,
		destroy = destroy
	}
end
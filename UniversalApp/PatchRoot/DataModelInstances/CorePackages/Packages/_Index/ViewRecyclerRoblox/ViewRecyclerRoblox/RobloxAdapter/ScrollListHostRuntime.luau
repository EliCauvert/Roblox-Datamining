local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local viewRecyclerModule = require(viewRecyclerRoblox.Parent.ViewRecycler)
local canvasItemViewRuntimeModule = require(viewRecyclerRoblox.RobloxAdapter.CanvasItemViewRuntime)
local _ = viewRecyclerModule.Layout
local record = viewRecyclerModule.Adapter._Private.Record
local t = {
	createCanvasRuntime = canvasItemViewRuntimeModule.new,
	createCoreVirtualizer = viewRecyclerModule.Adapter.createVirtualizer,
	createScrollHostCoordinator = require(viewRecyclerRoblox.RobloxAdapter.ScrollHostCoordinator).new
}
local t_1 = {}
local frozen = table.freeze({
	"axis", "dataSource", "initialScrollAlignment", "autoScrollOnChange",
	"startReachedThreshold", "onStartReached", "onEndReached", "onViewportChanged",
	"onScrollOffsetChanged", "onContentLengthChanged"
})

local function _(p1, p2)
	-- upvalues: record (ref), frozen (ref)
	return not record.containsEqual(p1, p2, frozen)
end

local function samePinnedItems(p1, p2)
	-- upvalues: record (ref)
	local var1 = true
	
	if p1 ~= p2 then
		var1 = false
		
		if p1.isItemStickyHeader == p2.isItemStickyHeader then
			var1 = record.equal(p1.pinnedStartItem or {}, p2.pinnedStartItem or {})
			
			if var1 then
				var1 = record.equal
				var1 = var1(p1.pinnedEndItem or {}, p2.pinnedEndItem or {})
			end
		end
	end
	return var1
end

local _ = function(p1)
	local cloned = table.clone(p1)
	
	if cloned.overscanPolicy ~= nil then
		cloned.overscan = nil
	end
	return cloned
end

local function applyCorePolicy(p1, p2, p3)
	-- upvalues: samePinnedItems (ref), record (ref), viewRecyclerModule (ref)
	local cloned = table.clone(p3)
	
	if cloned.overscanPolicy ~= nil then
		cloned.overscan = nil
	end
	if p2 ~= nil and samePinnedItems(p2.pinnedItems, cloned.pinnedItems) then
		cloned.pinnedItems = p2.pinnedItems
	end
	if p2 == nil or not record.equal(p2, cloned) then
		p1({
			type = viewRecyclerModule.VirtualizerCommandType.SetPolicy,
			policy = cloned
		})
	end
	return cloned
end

local function createRuntime(p1, p2, p3)
	-- upvalues: t (ref), viewRecyclerModule (ref), applyCorePolicy (ref), record (ref), frozen (ref)
	p3 = p3 or t
	local initialHostConfiguration = p1.initialHostConfiguration
	local initialHostTarget = p1.initialHostTarget
	local core = p1.core
	local var1 = false
	local var2 = false
	local var3 = nil
	local cloned = table.clone(p1.initialCorePolicy)
	
	if cloned.overscanPolicy ~= nil then
		cloned.overscan = nil
	end
	local var4 = cloned
	local var5 = nil
	local var6 = nil
	local var7 = false
	
	local function handleUpdate(p4, p5)
		-- upvalues: var6 (write), var7 (write), viewRecyclerModule (copy), initialHostConfiguration (write)
		if var6 ~= nil then
			var6.handleUpdate(p4, p5)
		end
		for i, v in if var7 then p5.effects else {} do
			local _ = nil
			
			if v.type == viewRecyclerModule.VirtualizerEffectType.VisibleRangeChanged then
				local onVisibleRangeChanged = initialHostConfiguration.onVisibleRangeChanged
				
				if onVisibleRangeChanged ~= nil then
					onVisibleRangeChanged(v.range)
				end
			elseif v.type == viewRecyclerModule.VirtualizerEffectType.MountedRangeChanged then
				local onMountedRangeChanged = initialHostConfiguration.onMountedRangeChanged
				
				if onMountedRangeChanged ~= nil then
					onMountedRangeChanged(v.range)
				end
			elseif v.type == viewRecyclerModule.VirtualizerEffectType.DataPrefetchRequested then
				local onDataPrefetchRequested = initialHostConfiguration.onDataPrefetchRequested
				
				if onDataPrefetchRequested ~= nil then
					onDataPrefetchRequested(v.request)
				end
			end
		end
	end
	
	local function dispatch(p6)
		-- upvalues: viewRecyclerModule (copy), var7 (write), var5 (write), initialHostConfiguration (write)
		local var8 = var5.dispatch(p6)
		
		if p6.type == viewRecyclerModule.VirtualizerCommandType.Activate and not var7 then
			var7 = true
			
			for i, v in var8.effects do
				if v.type == viewRecyclerModule.VirtualizerEffectType.DataPrefetchRequested then
					local onDataPrefetchRequested = initialHostConfiguration.onDataPrefetchRequested
					
					if onDataPrefetchRequested ~= nil then
						onDataPrefetchRequested(v.request)
					end
				end
			end
		end
		return var8
	end
	
	local var9 = p3.createCanvasRuntime({
		container = initialHostTarget.scrollingFrame,
		viewportContainer = initialHostTarget.viewportOverlay,
		axis = initialHostConfiguration.axis,
		selfSizing = initialHostConfiguration.layout.requiresItemMeasurement(),
		onItemMeasurements = function(p7)
			-- upvalues: dispatch (ref), viewRecyclerModule (copy)
			dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.SubmitMeasurements,
				measurements = p7
			})
		end,
		onItemViewPresentationChanged = function(p7, p8)
			-- upvalues: p1 (ref)
			local onItemViewPresentationChanged = p1.onItemViewPresentationChanged
			
			if onItemViewPresentationChanged ~= nil then
				onItemViewPresentationChanged(p7, p8)
			end
		end
	})
	local var10 = p2(var9, p1)
	local cloned_1 = table.clone(core)
	cloned_1.dataSource = initialHostConfiguration.dataSource
	cloned_1.layout = initialHostConfiguration.layout
	cloned_1.prepareItemViewAssignment = var10.prepare
	cloned_1.postCommitItemViewAssignment = var10.postCommit
	cloned_1.presentItemViewAssignment = var10.present
	cloned_1.applyItemViewPlacementIntent = var9.applyPlacementIntent
	cloned_1.overscan = var4.overscan
	cloned_1.overscanPolicy = var4.overscanPolicy
	cloned_1.dataPrefetch = var4.dataPrefetch
	cloned_1.contentAlignment = var4.contentAlignment
	cloned_1.endThreshold = var4.endThreshold
	cloned_1.isItemStickyHeader = var4.pinnedItems.isItemStickyHeader
	cloned_1.pinnedStartItem = var4.pinnedItems.pinnedStartItem
	cloned_1.pinnedEndItem = var4.pinnedItems.pinnedEndItem
	cloned_1.preserveScrollPositionOnChange = var4.preserveScrollPositionOnChange
	cloned_1.onUpdate = handleUpdate
	var5 = p3.createCoreVirtualizer(cloned_1)
	var6 = p3.createScrollHostCoordinator({
		dispatch = dispatch,
		getSnapshot = var5.getSnapshot,
		query = var5.query,
		getInstance = function()
			-- upvalues: var1 (write), initialHostTarget (write)
			return if var1 then nil else initialHostTarget.scrollingFrame
		end,
		getConfiguration = function()
			-- upvalues: initialHostConfiguration (write)
			return initialHostConfiguration
		end
	})
	
	return {
		dispatch = dispatch,
		getSnapshot = var5.getSnapshot,
		query = var5.query,
		connect = function()
			-- upvalues: var1 (write), var2 (write), var6 (write), var3 (write)
			assert(not var1, "ScrollListHostRuntime: cannot connect after destroy")
			assert(not var2, "ScrollListHostRuntime: already connected")
			var2 = true
			local var11 = var6.connect()
			local var12 = false
			
			local function disconnectRuntime()
				-- upvalues: var12 (write), var2 (copy), var3 (copy), var11 (ref)
				if var12 then
					return
				end
				var12 = true
				var2 = false
				var3 = nil
				var11()
			end
			
			var3 = disconnectRuntime
			
			return disconnectRuntime
		end,
		update = function(p7)
			-- upvalues: var1 (write), initialHostConfiguration (write), initialHostTarget (write), var9 (ref), dispatch (ref), viewRecyclerModule (copy), var4 (write), applyCorePolicy (copy), record (copy), frozen (copy), var6 (write)
			if var1 then return end
			local hostConfiguration = p7.hostConfiguration
			local hostTarget = p7.hostTarget
			local var11 = hostConfiguration.dataSource ~= initialHostConfiguration.dataSource
			local var12 = hostConfiguration.layout ~= initialHostConfiguration.layout
			local var13 = hostTarget.scrollingFrame ~= initialHostTarget.scrollingFrame
			local var14 = var13 or (if hostTarget.viewportOverlay == initialHostTarget.viewportOverlay then if hostConfiguration.axis == initialHostConfiguration.axis then var12 else true else true)
			initialHostConfiguration = hostConfiguration
			initialHostTarget = hostTarget
			
			if var11 or var12 then
				var9.cancelPendingMeasurements()
				
				if var11 and var12 then
					dispatch({
						type = viewRecyclerModule.VirtualizerCommandType.SetDataSourceAndLayout,
						dataSource = hostConfiguration.dataSource,
						layout = hostConfiguration.layout
					})
				elseif var11 then
					dispatch({
						type = viewRecyclerModule.VirtualizerCommandType.SetDataSource,
						dataSource = hostConfiguration.dataSource
					})
				else
					dispatch({
						type = viewRecyclerModule.VirtualizerCommandType.SetLayout,
						layout = hostConfiguration.layout
					})
				end
			end
			if var14 then
				var9.setConfiguration({
					container = hostTarget.scrollingFrame,
					viewportContainer = hostTarget.viewportOverlay,
					axis = hostConfiguration.axis,
					selfSizing = hostConfiguration.layout.requiresItemMeasurement()
				})
			end
			var4 = applyCorePolicy(dispatch, var4, p7.corePolicy)
			
			if record.containsEqual(initialHostConfiguration, hostConfiguration, frozen) then
				var6.configurationChanged()
			end
			if var13 then
				var6.hostChanged()
			end
		end,
		isHostReady = var6.isHostReady,
		destroy = function()
			-- upvalues: var1 (write), var3 (write), dispatch (ref), viewRecyclerModule (copy), var9 (ref)
			if var1 then return end
			var1 = true
			
			if var3 ~= nil then
				var3()
				var3 = nil
			end
			dispatch({ type = viewRecyclerModule.VirtualizerCommandType.Destroy })
			var9.destroy()
		end
	}
end

function t_1.newForRecyclableViewRecords(p6, p7)
	-- upvalues: createRuntime (ref)
	return createRuntime(p6, function(p8, p9)
		local tbl = setmetatable({}, { __mode = "k" })
		
		local function _(p10)
			-- upvalues: tbl (ref), p8 (ref)
			local var8 = tbl[p10]
			
			if var8 == nil then
				var8 = {
					apply = function(p11)
						-- upvalues: p8 (copy), p10 (ref)
						p8.applyHostState(p10, p11)
					end
				}
				tbl[p10] = var8
			end
			return var8
		end
		
		return {
			present = nil,
			prepare = function(p10, p11)
				-- upvalues: tbl (ref), p8 (ref)
				if p11 == nil then
					p10.bindPlacement(nil, nil)
					
					return
				end
				local bindPlacement = p10.bindPlacement
				local var8 = "list"
				local var9 = tbl[p10]
				
				if var9 == nil then
					var9 = {
						apply = function(p12)
							-- upvalues: p8 (copy), p10 (ref)
							p8.applyHostState(p10, p12)
						end
					}
					tbl[p10] = var9
				end
				bindPlacement(var8, var9)
			end,
			postCommit = function(p10, p11)
				-- upvalues: p9 (ref)
				local set = p10.set
				
				if set ~= nil then
					set(p11)
				end
				local prepareItemViewAssignment = p9.prepareItemViewAssignment
				
				if prepareItemViewAssignment ~= nil then
					prepareItemViewAssignment(p10, p11)
				end
				local onItemViewAssignmentChanged = p9.onItemViewAssignmentChanged
				
				if onItemViewAssignmentChanged ~= nil then
					onItemViewAssignmentChanged(p10, p11)
				end
			end
		}
	end, p7)
end

function t_1.newForGuiObjects(p6, p7)
	-- upvalues: createRuntime (ref)
	return createRuntime(p6, function(p8, p9)
		-- upvalues: p6 (ref)
		return {
			prepare = function(p10, p11)
				-- upvalues: p8 (ref), p6 (copy)
				if p11 == nil then
					p8.applyHostState(p10, nil)
					
					return
				end
				p8.applyHostState(p10, {
					phase = "hidden",
					visible = false,
					host = p6.getGuiObject(p10),
					assignment = p11
				})
			end,
			postCommit = function(p10, p11)
				-- upvalues: p9 (ref)
				local prepareItemViewAssignment = p9.prepareItemViewAssignment
				
				if prepareItemViewAssignment ~= nil then
					prepareItemViewAssignment(p10, p11)
				end
				local onItemViewAssignmentChanged = p9.onItemViewAssignmentChanged
				
				if onItemViewAssignmentChanged ~= nil then
					onItemViewAssignmentChanged(p10, p11)
				end
			end,
			present = function(p10, p11)
				-- upvalues: p8 (ref), p6 (copy)
				p8.applyHostState(p10, {
					phase = "presented",
					visible = true,
					host = p6.getGuiObject(p10),
					assignment = p11
				})
			end
		}
	end, p7)
end

return t_1
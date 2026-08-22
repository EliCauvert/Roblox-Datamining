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

local function _(p0, p1) --[[ line: 118 | named "scrollHostConfigurationChanged" ]]
	-- upvalues: record (ref), frozen (ref)
	return not record.containsEqual(p0, p1, frozen)
end

local function samePinnedItems(p2, p3) --[[ line: 125 ]]
	-- upvalues: record (ref)
	local var9 = true
	
	if p2 ~= p3 then
		var9 = false
		
		if p2.isItemStickyHeader == p3.isItemStickyHeader then
			var9 = record.equal(p2.pinnedStartItem or {}, p3.pinnedStartItem or {})
			
			if var9 then
				var9 = record.equal
				var9 = var9(p2.pinnedEndItem or {}, p3.pinnedEndItem or {})
			end
		end
	end
	return var9
end

local _ = function(p4) --[[ line: 134 | named "normalizePolicy" ]]
	local cloned = table.clone(p4)
	
	if cloned.overscanPolicy ~= nil then
		cloned.overscan = nil
	end
	return cloned
end

local function applyCorePolicy(p5, p6, p7) --[[ line: 142 ]]
	-- upvalues: samePinnedItems (ref), record (ref), viewRecyclerModule (ref)
	local cloned = table.clone(p7)
	
	if cloned.overscanPolicy ~= nil then
		cloned.overscan = nil
	end
	if p6 ~= nil and samePinnedItems(p6.pinnedItems, cloned.pinnedItems) then
		cloned.pinnedItems = p6.pinnedItems
	end
	if p6 == nil or not record.equal(p6, cloned) then
		p5({
			type = viewRecyclerModule.VirtualizerCommandType.SetPolicy,
			policy = cloned
		})
	end
	return cloned
end

local function createRuntime(p8, p9, p10) --[[ line: 161 ]]
	-- upvalues: t (ref), viewRecyclerModule (ref), applyCorePolicy (ref), record (ref), frozen (ref)
	p10 = p10 or t
	local initialHostConfiguration = p8.initialHostConfiguration
	local initialHostTarget = p8.initialHostTarget
	local core = p8.core
	local var13 = false
	local var14 = false
	local var15 = nil
	local cloned = table.clone(p8.initialCorePolicy)
	
	if cloned.overscanPolicy ~= nil then
		cloned.overscan = nil
	end
	local var17 = cloned
	local var18 = nil
	local var19 = nil
	local var20 = false
	
	local function handleUpdate(p11, p12) --[[ line: 177 ]]
		-- upvalues: var19 (write), var20 (write), viewRecyclerModule (copy), initialHostConfiguration (write)
		if var19 ~= nil then
			var19.handleUpdate(p11, p12)
		end
		for i, v in if var20 then p12.effects else {} do
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
	
	local function dispatch(p13) --[[ line: 201 ]]
		-- upvalues: viewRecyclerModule (copy), var20 (write), var18 (write), initialHostConfiguration (write)
		local var26 = var18.dispatch(p13)
		
		if p13.type == viewRecyclerModule.VirtualizerCommandType.Activate and not var20 then
			var20 = true
			
			for i, v in var26.effects do
				if v.type == viewRecyclerModule.VirtualizerEffectType.DataPrefetchRequested then
					local onDataPrefetchRequested = initialHostConfiguration.onDataPrefetchRequested
					
					if onDataPrefetchRequested ~= nil then
						onDataPrefetchRequested(v.request)
					end
				end
			end
		end
		return var26
	end
	
	local var23 = p10.createCanvasRuntime({
		container = initialHostTarget.scrollingFrame,
		viewportContainer = initialHostTarget.viewportOverlay,
		axis = initialHostConfiguration.axis,
		selfSizing = initialHostConfiguration.layout.requiresItemMeasurement(),
		onItemMeasurements = function(p14) --[[ line: 223 ]]
			-- upvalues: dispatch (ref), viewRecyclerModule (copy)
			dispatch({
				type = viewRecyclerModule.VirtualizerCommandType.SubmitMeasurements,
				measurements = p14
			})
		end,
		onItemViewPresentationChanged = function(p15, p16) --[[ line: 226 ]]
			-- upvalues: p8 (ref)
			local onItemViewPresentationChanged = p8.onItemViewPresentationChanged
			
			if onItemViewPresentationChanged ~= nil then
				onItemViewPresentationChanged(p15, p16)
			end
		end
	})
	local var24 = p9(var23, p8)
	local cloned_1 = table.clone(core)
	cloned_1.dataSource = initialHostConfiguration.dataSource
	cloned_1.layout = initialHostConfiguration.layout
	cloned_1.prepareItemViewAssignment = var24.prepare
	cloned_1.postCommitItemViewAssignment = var24.postCommit
	cloned_1.presentItemViewAssignment = var24.present
	cloned_1.applyItemViewPlacementIntent = var23.applyPlacementIntent
	cloned_1.overscan = var17.overscan
	cloned_1.overscanPolicy = var17.overscanPolicy
	cloned_1.dataPrefetch = var17.dataPrefetch
	cloned_1.contentAlignment = var17.contentAlignment
	cloned_1.endThreshold = var17.endThreshold
	cloned_1.isItemStickyHeader = var17.pinnedItems.isItemStickyHeader
	cloned_1.pinnedStartItem = var17.pinnedItems.pinnedStartItem
	cloned_1.pinnedEndItem = var17.pinnedItems.pinnedEndItem
	cloned_1.preserveScrollPositionOnChange = var17.preserveScrollPositionOnChange
	cloned_1.onUpdate = handleUpdate
	var18 = p10.createCoreVirtualizer(cloned_1)
	var19 = p10.createScrollHostCoordinator({
		dispatch = dispatch,
		getSnapshot = var18.getSnapshot,
		query = var18.query,
		getInstance = function() --[[ line: 257 ]]
			-- upvalues: var13 (write), initialHostTarget (write)
			return if var13 then nil else initialHostTarget.scrollingFrame
		end,
		getConfiguration = function() --[[ line: 260 ]]
			-- upvalues: initialHostConfiguration (write)
			return initialHostConfiguration
		end
	})
	
	return {
		dispatch = dispatch,
		getSnapshot = var18.getSnapshot,
		query = var18.query,
		connect = function() --[[ line: 324 ]]
			-- upvalues: var13 (write), var14 (write), var19 (write), var15 (write)
			assert(not var13, "ScrollListHostRuntime: cannot connect after destroy")
			assert(not var14, "ScrollListHostRuntime: already connected")
			var14 = true
			local var27 = var19.connect()
			local var28 = false
			
			local function disconnectRuntime() --[[ line: 330 ]]
				-- upvalues: var28 (write), var14 (copy), var15 (copy), var27 (ref)
				if var28 then
					return
				end
				var28 = true
				var14 = false
				var15 = nil
				var27()
			end
			
			var15 = disconnectRuntime
			
			return disconnectRuntime
		end,
		update = function(p17) --[[ line: 265 ]]
			-- upvalues: var13 (write), initialHostConfiguration (write), initialHostTarget (write), var23 (ref), dispatch (ref), viewRecyclerModule (copy), var17 (write), applyCorePolicy (copy), record (copy), frozen (copy), var19 (write)
			if var13 then return end
			local hostConfiguration = p17.hostConfiguration
			local hostTarget = p17.hostTarget
			local var30 = hostConfiguration.dataSource ~= initialHostConfiguration.dataSource
			local var31 = hostConfiguration.layout ~= initialHostConfiguration.layout
			local var32 = hostTarget.scrollingFrame ~= initialHostTarget.scrollingFrame
			local var32_1 = var32 or (if hostTarget.viewportOverlay == initialHostTarget.viewportOverlay then if hostConfiguration.axis == initialHostConfiguration.axis then var31 else true else true)
			initialHostConfiguration = hostConfiguration
			initialHostTarget = hostTarget
			
			if var30 or var31 then
				var23.cancelPendingMeasurements()
				
				if var30 and var31 then
					dispatch({
						type = viewRecyclerModule.VirtualizerCommandType.SetDataSourceAndLayout,
						dataSource = hostConfiguration.dataSource,
						layout = hostConfiguration.layout
					})
				elseif var30 then
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
			if var32_1 then
				var23.setConfiguration({
					container = hostTarget.scrollingFrame,
					viewportContainer = hostTarget.viewportOverlay,
					axis = hostConfiguration.axis,
					selfSizing = hostConfiguration.layout.requiresItemMeasurement()
				})
			end
			var17 = applyCorePolicy(dispatch, var17, p17.corePolicy)
			
			if record.containsEqual(initialHostConfiguration, hostConfiguration, frozen) then
				var19.configurationChanged()
			end
			if var32 then
				var19.hostChanged()
			end
		end,
		isHostReady = var19.isHostReady,
		destroy = function() --[[ line: 344 ]]
			-- upvalues: var13 (write), var15 (write), dispatch (ref), viewRecyclerModule (copy), var23 (ref)
			if var13 then return end
			var13 = true
			
			if var15 ~= nil then
				var15()
				var15 = nil
			end
			dispatch({ type = viewRecyclerModule.VirtualizerCommandType.Destroy })
			var23.destroy()
		end
	}
end

function t_1.newForRecyclableViewRecords(p18, p19) --[[ line: 359 ]]
	-- upvalues: createRuntime (ref)
	return createRuntime(p18, function(p20, p21) --[[ line: 367 ]]
		local tbl = setmetatable({}, { __mode = "k" })
		
		local function _(p22) --[[ line: 369 | named "getPlacementPort" ]]
			-- upvalues: tbl (ref), p20 (ref)
			local var35 = tbl[p22]
			
			if var35 == nil then
				var35 = {
					apply = function(p23) --[[ line: 373 ]]
						-- upvalues: p20 (copy), p22 (ref)
						p20.applyHostState(p22, p23)
					end
				}
				tbl[p22] = var35
			end
			return var35
		end
		
		return {
			present = nil,
			prepare = function(p24, p25) --[[ line: 382 ]]
				-- upvalues: tbl (ref), p20 (ref)
				if p25 == nil then
					p24.bindPlacement(nil, nil)
					
					return
				end
				local bindPlacement = p24.bindPlacement
				local var36 = "list"
				local var37 = tbl[p24]
				
				if var37 == nil then
					var37 = {
						apply = function(p26) --[[ line: 373 ]]
							-- upvalues: p20 (copy), p24 (ref)
							p20.applyHostState(p24, p26)
						end
					}
					tbl[p24] = var37
				end
				bindPlacement(var36, var37)
			end,
			postCommit = function(p27, p28) --[[ line: 391 ]]
				-- upvalues: p21 (ref)
				local set = p27.set
				
				if set ~= nil then
					set(p28)
				end
				local prepareItemViewAssignment = p21.prepareItemViewAssignment
				
				if prepareItemViewAssignment ~= nil then
					prepareItemViewAssignment(p27, p28)
				end
				local onItemViewAssignmentChanged = p21.onItemViewAssignmentChanged
				
				if onItemViewAssignmentChanged ~= nil then
					onItemViewAssignmentChanged(p27, p28)
				end
			end
		}
	end, p19)
end

function t_1.newForGuiObjects(p29, p30) --[[ line: 410 ]]
	-- upvalues: createRuntime (ref)
	return createRuntime(p29, function(p31, p32) --[[ line: 418 ]]
		-- upvalues: p29 (ref)
		return {
			prepare = function(p33, p34) --[[ line: 420 ]]
				-- upvalues: p31 (ref), p29 (copy)
				if p34 == nil then
					p31.applyHostState(p33, nil)
					
					return
				end
				p31.applyHostState(p33, {
					phase = "hidden",
					visible = false,
					host = p29.getGuiObject(p33),
					assignment = p34
				})
			end,
			postCommit = function(p35, p36) --[[ line: 432 ]]
				-- upvalues: p32 (ref)
				local prepareItemViewAssignment = p32.prepareItemViewAssignment
				
				if prepareItemViewAssignment ~= nil then
					prepareItemViewAssignment(p35, p36)
				end
				local onItemViewAssignmentChanged = p32.onItemViewAssignmentChanged
				
				if onItemViewAssignmentChanged ~= nil then
					onItemViewAssignmentChanged(p35, p36)
				end
			end,
			present = function(p37, p38) --[[ line: 442 ]]
				-- upvalues: p31 (ref), p29 (copy)
				p31.applyHostState(p37, {
					phase = "presented",
					visible = true,
					host = p29.getGuiObject(p37),
					assignment = p38
				})
			end
		}
	end, p30)
end

return t_1
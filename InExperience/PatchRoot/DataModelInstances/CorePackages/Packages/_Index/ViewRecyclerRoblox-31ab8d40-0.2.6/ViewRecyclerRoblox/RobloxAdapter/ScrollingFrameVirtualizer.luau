local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local HostPresentationPhaseModule = require(ViewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)
local _ = ViewRecyclerModule.Layout
local ShallowTable = ViewRecyclerModule.Adapter._Private.ShallowTable
local config = {
	createHostPlacement = require(ViewRecyclerRoblox.RobloxAdapter.HostPlacement).new,
	createCoreVirtualizer = ViewRecyclerModule.Adapter.createVirtualizer,
	createScrollingFrameSync = require(ViewRecyclerRoblox.RobloxAdapter.ScrollingFrameSync).new
}
local Frozen = table.freeze({
	"axis", "dataSource", "initialScrollAlignment", "autoScrollOnChange",
	"startReachedThreshold", "onStartReached", "onEndReached", "onViewportChanged",
	"onScrollOffsetChanged", "onContentLengthChanged"
})

local function _(p1, p2): boolean --[[ Line: 119 | Named "scrollHostConfigurationChanged" ]]
	-- upvalues: ShallowTable (copy), Frozen (copy)
	return not ShallowTable.containsEqual(p1, p2, Frozen)
end

local function samePinnedItems(PinnedItems, PinnedItems1) --[[ Line: 126 ]]
	-- upvalues: ShallowTable (copy)
	return PinnedItems == PinnedItems1 or PinnedItems.isItemStickyHeader == PinnedItems1.isItemStickyHeader and (ShallowTable.equal(PinnedItems.pinnedStartItem or {}, PinnedItems1.pinnedStartItem or {}) and ShallowTable.equal(PinnedItems.pinnedEndItem or {}, PinnedItems1.pinnedEndItem or {}))
end

local _ = function(Tbl) --[[ Line: 135 | Named "normalizePolicy" ]]
	local Copy = table.clone(Tbl)
	
	if Copy.overscanPolicy ~= nil then
		Copy.overscan = nil
	end
	return Copy
end

local function applyCorePolicy(Callback: (any) -> (), p1, Tbl) --[[ Line: 143 ]]
	-- upvalues: samePinnedItems (copy), ShallowTable (copy), ViewRecyclerModule (copy)
	local Copy = table.clone(Tbl)
	
	if Copy.overscanPolicy ~= nil then
		Copy.overscan = nil
	end
	if p1 ~= nil and samePinnedItems(p1.pinnedItems, Copy.pinnedItems) then
		Copy.pinnedItems = p1.pinnedItems
	end
	if p1 == nil or not ShallowTable.equal(p1, Copy) then
		Callback({
			type = ViewRecyclerModule.VirtualizerCommandType.SetPolicy,
			policy = Copy
		})
	end
	return Copy
end

local function createScrollingFrameVirtualizer(p1, Callback, p2) --[[ Line: 162 ]]
	-- upvalues: config (copy), ViewRecyclerModule (copy), applyCorePolicy (copy), ShallowTable (copy), Frozen (copy)
	local P6 = p2 or config
	local InitialHostConfiguration = p1.initialHostConfiguration
	local InitialHostTarget = p1.initialHostTarget
	local Core = p1.core
	local Flag = false
	local Flag1 = false
	local Callback1 = nil
	local Copy = table.clone(p1.initialCorePolicy)
	
	if Copy.overscanPolicy ~= nil then
		Copy.overscan = nil
	end
	local Copy1 = Copy
	local CoreVirtualizer = nil
	local ScrollingFrameSync = nil
	local Flag2 = false
	
	local function applyVirtualizerUpdate(p3, p4) --[[ Line: 178 ]]
		-- upvalues: ScrollingFrameSync (ref), Flag2 (ref), ViewRecyclerModule (upval), InitialHostConfiguration (ref)
		if ScrollingFrameSync ~= nil then
			ScrollingFrameSync.applyVirtualizerUpdate(p3, p4)
		end
		local Effects = if Flag2 then p4.effects else {}
		for _, effect in Effects do
			if effect.type == ViewRecyclerModule.VirtualizerEffectType.VisibleRangeChanged then
				local OnVisibleRangeChangedFunction: (any) -> () = InitialHostConfiguration.onVisibleRangeChanged
				
				if OnVisibleRangeChangedFunction ~= nil then
					OnVisibleRangeChangedFunction(effect.range)
				end
			elseif effect.type == ViewRecyclerModule.VirtualizerEffectType.MountedRangeChanged then
				local OnMountedRangeChangedFunction: (any) -> () = InitialHostConfiguration.onMountedRangeChanged
				
				if OnMountedRangeChangedFunction ~= nil then
					OnMountedRangeChangedFunction(effect.range)
				end
			elseif effect.type == ViewRecyclerModule.VirtualizerEffectType.DataPrefetchRequested then
				local OnDataPrefetchRequestedFunction: (any) -> () = InitialHostConfiguration.onDataPrefetchRequested
				
				if OnDataPrefetchRequestedFunction ~= nil then
					OnDataPrefetchRequestedFunction(effect.request)
				end
			end
		end
	end
	
	local function dispatch(p5) --[[ Line: 202 ]]
		-- upvalues: ViewRecyclerModule (upval), Flag2 (ref), CoreVirtualizer (ref), InitialHostConfiguration (ref)
		local DispatchResult = CoreVirtualizer.dispatch(p5)
		
		if p5.type == ViewRecyclerModule.VirtualizerCommandType.Activate and not Flag2 then
			Flag2 = true
			
			for _, effect in DispatchResult.effects do
				if effect.type == ViewRecyclerModule.VirtualizerEffectType.DataPrefetchRequested then
					local OnDataPrefetchRequestedFunction: (any) -> () = InitialHostConfiguration.onDataPrefetchRequested
					
					if OnDataPrefetchRequestedFunction ~= nil then
						OnDataPrefetchRequestedFunction(effect.request)
					end
				end
			end
		end
		return DispatchResult
	end
	
	local HostPlacement = P6.createHostPlacement({
		container = InitialHostTarget.scrollingFrame,
		viewportContainer = InitialHostTarget.viewportOverlay,
		axis = InitialHostConfiguration.axis,
		selfSizing = InitialHostConfiguration.layout.requiresItemMeasurement(),
		onItemMeasurements = function(Measurements) --[[ Line: 224 ]]
			-- upvalues: dispatch (copy), ViewRecyclerModule (upval)
			dispatch({
				type = ViewRecyclerModule.VirtualizerCommandType.SubmitMeasurements,
				measurements = Measurements
			})
		end,
		onItemViewPresentationChanged = function(p6, p7) --[[ Line: 227 ]]
			-- upvalues: p1 (copy)
			local OnItemViewPresentationChangedFunction: (any, any) -> () = p1.onItemViewPresentationChanged
			
			if OnItemViewPresentationChangedFunction ~= nil then
				OnItemViewPresentationChangedFunction(p6, p7)
			end
		end
	})
	local CallbackResult = Callback(HostPlacement, p1)
	local Copy2 = table.clone(Core)
	Copy2.dataSource = InitialHostConfiguration.dataSource
	Copy2.layout = InitialHostConfiguration.layout
	Copy2.prepareAssignment = CallbackResult.prepare
	Copy2.postCommitAssignment = CallbackResult.postCommit
	Copy2.presentAssignment = CallbackResult.present
	Copy2.applyPlacementIntent = HostPlacement.applyPlacementIntent
	Copy2.overscan = Copy1.overscan
	Copy2.overscanPolicy = Copy1.overscanPolicy
	Copy2.dataPrefetch = Copy1.dataPrefetch
	Copy2.contentAlignment = Copy1.contentAlignment
	Copy2.endThreshold = Copy1.endThreshold
	Copy2.isItemStickyHeader = Copy1.pinnedItems.isItemStickyHeader
	Copy2.pinnedStartItem = Copy1.pinnedItems.pinnedStartItem
	Copy2.pinnedEndItem = Copy1.pinnedItems.pinnedEndItem
	Copy2.preserveScrollPositionOnChange = Copy1.preserveScrollPositionOnChange
	Copy2.onUpdate = applyVirtualizerUpdate
	CoreVirtualizer = P6.createCoreVirtualizer(Copy2)
	ScrollingFrameSync = P6.createScrollingFrameSync({
		dispatch = dispatch,
		getSnapshot = CoreVirtualizer.getSnapshot,
		query = CoreVirtualizer.query,
		getInstance = function() --[[ Line: 258 ]]
			-- upvalues: Flag (ref), InitialHostTarget (ref)
			return if Flag then nil else InitialHostTarget.scrollingFrame
		end,
		getConfiguration = function() --[[ Line: 261 ]]
			-- upvalues: InitialHostConfiguration (ref)
			return InitialHostConfiguration
		end
	})
	
	return {
		dispatch = dispatch,
		getSnapshot = CoreVirtualizer.getSnapshot,
		query = CoreVirtualizer.query,
		connect = function() --[[ Line: 325 ]]
			-- upvalues: Flag (ref), Flag1 (ref), ScrollingFrameSync (ref), Callback1 (ref)
			assert(not Flag, "ScrollingFrameVirtualizer: cannot connect after destroy")
			assert(not Flag1, "ScrollingFrameVirtualizer: already connected")
			Flag1 = true
			local ConnectResult = ScrollingFrameSync.connect()
			local Flag2 = false
			
			local function disconnect() --[[ Line: 331 ]]
				-- upvalues: Flag2 (ref), Flag1 (upval), Callback1 (upval), ConnectResult (copy)
				if not Flag2 then
					Flag2 = true
					Flag1 = false
					Callback1 = nil
					ConnectResult()
					
					return
				end
			end
			
			Callback1 = disconnect
			
			return disconnect
		end,
		update = function(p6) --[[ Line: 266 ]]
			-- upvalues: Flag (ref), InitialHostConfiguration (ref), InitialHostTarget (ref), HostPlacement (copy), dispatch (copy), ViewRecyclerModule (upval), Copy1 (ref), applyCorePolicy (upval), ShallowTable (upval), Frozen (upval), ScrollingFrameSync (ref)
			if Flag then return end
			local HostConfiguration = p6.hostConfiguration
			local HostTarget = p6.hostTarget
			local InitialHostConfiguration1 = InitialHostConfiguration
			local IsNotDataSourceMatch = HostConfiguration.dataSource ~= InitialHostConfiguration1.dataSource
			local IsNotLayoutMatch = HostConfiguration.layout ~= InitialHostConfiguration1.layout
			local IsNotScrollingFrameMatch = HostTarget.scrollingFrame ~= InitialHostTarget.scrollingFrame
			local IsNotScrollingFrameMatch1: boolean = IsNotScrollingFrameMatch or (HostTarget.viewportOverlay ~= InitialHostTarget.viewportOverlay or HostConfiguration.axis ~= InitialHostConfiguration1.axis or IsNotLayoutMatch)
			InitialHostConfiguration = HostConfiguration
			InitialHostTarget = HostTarget
			
			if IsNotDataSourceMatch or IsNotLayoutMatch then
				HostPlacement.cancelPendingMeasurements()
				
				if IsNotDataSourceMatch and IsNotLayoutMatch then
					dispatch({
						type = ViewRecyclerModule.VirtualizerCommandType.SetDataSourceAndLayout,
						dataSource = HostConfiguration.dataSource,
						layout = HostConfiguration.layout
					})
				elseif IsNotDataSourceMatch then
					dispatch({
						type = ViewRecyclerModule.VirtualizerCommandType.SetDataSource,
						dataSource = HostConfiguration.dataSource
					})
				else
					dispatch({
						type = ViewRecyclerModule.VirtualizerCommandType.SetLayout,
						layout = HostConfiguration.layout
					})
				end
			end
			if IsNotScrollingFrameMatch1 then
				HostPlacement.setConfiguration({
					container = HostTarget.scrollingFrame,
					viewportContainer = HostTarget.viewportOverlay,
					axis = HostConfiguration.axis,
					selfSizing = HostConfiguration.layout.requiresItemMeasurement()
				})
			end
			Copy1 = applyCorePolicy(dispatch, Copy1, p6.corePolicy)
			
			if not ShallowTable.containsEqual(InitialHostConfiguration1, HostConfiguration, Frozen) then
				ScrollingFrameSync.configurationChanged()
			end
			if IsNotScrollingFrameMatch then
				ScrollingFrameSync.scrollingFrameChanged()
			end
		end,
		isReady = ScrollingFrameSync.isReady,
		destroy = function() --[[ Line: 345 ]]
			-- upvalues: Flag (ref), Callback1 (ref), dispatch (copy), ViewRecyclerModule (upval), HostPlacement (copy)
			if Flag then return end
			Flag = true
			
			if Callback1 ~= nil then
				Callback1()
				Callback1 = nil
			end
			dispatch({ type = ViewRecyclerModule.VirtualizerCommandType.Destroy })
			HostPlacement.destroy()
		end
	}
end

return {
	newForRecyclableViews = function(p5, p6) --[[ Line: 360 ]]
		-- upvalues: createScrollingFrameVirtualizer (copy)
		return (createScrollingFrameVirtualizer(p5, function(p7, p8) --[[ Line: 368 ]]
			local self = setmetatable({}, { __mode = "k" })
			
			local function _(Key) --[[ Line: 370 | Named "getPlacementPort" ]]
				-- upvalues: self (copy), p7 (copy)
				local SelfEntry = self[Key]
				
				if SelfEntry == nil then
					SelfEntry = {
						apply = function(p9) --[[ Line: 374 ]]
							-- upvalues: p7 (upval), Key (copy)
							p7.applyHostState(Key, p9)
						end
					}
					self[Key] = SelfEntry
				end
				return SelfEntry
			end
			
			return {
				present = nil,
				prepare = function(Key, p9) --[[ Line: 383 ]]
					-- upvalues: self (copy), p7 (copy)
					if p9 == nil then
						Key.bindPlacement(nil, nil)
						
						return
					end
					local BindPlacementFunction: (any, any) -> () = Key.bindPlacement
					local v1 = "list"
					local SelfEntry = self[Key]
					
					if SelfEntry == nil then
						SelfEntry = {
							apply = function(p10) --[[ Line: 374 ]]
								-- upvalues: p7 (upval), Key (copy)
								p7.applyHostState(Key, p10)
							end
						}
						self[Key] = SelfEntry
					end
					BindPlacementFunction(v1, SelfEntry)
				end,
				postCommit = function(p9, p10) --[[ Line: 392 ]]
					-- upvalues: p8 (copy)
					local SetFunction: (any) -> () = p9.set
					
					if SetFunction ~= nil then
						SetFunction(p10)
					end
					local PrepareAssignmentFunction: (any, any) -> () = p8.prepareAssignment
					
					if PrepareAssignmentFunction ~= nil then
						PrepareAssignmentFunction(p9, p10)
					end
					local OnItemViewAssignmentChangedFunction: (any, any) -> () = p8.onItemViewAssignmentChanged
					
					if OnItemViewAssignmentChangedFunction ~= nil then
						OnItemViewAssignmentChangedFunction(p9, p10)
					end
				end
			}
		end, p6))
	end,
	newForGuiObjects = function(p5, p6) --[[ Line: 411 ]]
		-- upvalues: createScrollingFrameVirtualizer (copy), HostPresentationPhaseModule (copy)
		return (createScrollingFrameVirtualizer(p5, function(p7, p8) --[[ Line: 419 ]]
			-- upvalues: p5 (copy), HostPresentationPhaseModule (upval)
			return {
				prepare = function(p9, Assignment) --[[ Line: 421 ]]
					-- upvalues: p7 (copy), p5 (upval), HostPresentationPhaseModule (upval)
					if Assignment == nil then
						p7.applyHostState(p9, nil)
						
						return
					else
						p7.applyHostState(p9, {
							visible = false,
							host = p5.getGuiObject(p9),
							assignment = Assignment,
							phase = HostPresentationPhaseModule.Hidden
						})
					end
				end,
				postCommit = function(p9, p10) --[[ Line: 433 ]]
					-- upvalues: p8 (copy)
					local PrepareAssignmentFunction: (any, any) -> () = p8.prepareAssignment
					
					if PrepareAssignmentFunction ~= nil then
						PrepareAssignmentFunction(p9, p10)
					end
					local OnItemViewAssignmentChangedFunction: (any, any) -> () = p8.onItemViewAssignmentChanged
					
					if OnItemViewAssignmentChangedFunction ~= nil then
						OnItemViewAssignmentChangedFunction(p9, p10)
					end
				end,
				present = function(p9, Assignment) --[[ Line: 443 ]]
					-- upvalues: p7 (copy), p5 (upval), HostPresentationPhaseModule (upval)
					p7.applyHostState(p9, {
						visible = true,
						host = p5.getGuiObject(p9),
						assignment = Assignment,
						phase = HostPresentationPhaseModule.Presented
					})
				end
			}
		end, p6))
	end
}
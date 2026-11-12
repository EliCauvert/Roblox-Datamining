local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecyclerRoblox").Flags).FFlagViewRecyclerReact084
local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerRoblox").Flags).FFlagViewRecyclerReact08
local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local ViewRecyclerModule = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local AttachedViewportOverlayModule = require(ViewRecyclerRoblox.RobloxAdapter.AttachedViewportOverlay)
local HostPlacementModule = require(ViewRecyclerRoblox.RobloxAdapter.HostPlacement)
local HostPresentationPhaseModule = require(ViewRecyclerRoblox.RobloxAdapter.HostPresentationPhase)
local ReducedMotionModule = require(ViewRecyclerRoblox.RobloxAdapter.ReducedMotion)
local ScrollHostModule = require(ViewRecyclerRoblox.RobloxAdapter.ScrollHost)
local VacantHostsModule = require(ViewRecyclerRoblox.RobloxAdapter.VacantHosts)
local VirtualizerConfigurationKeysModule = require(ViewRecyclerRoblox.RobloxAdapter.VirtualizerConfigurationKeys)
local VisibleItemsPresentationModule = require(ViewRecyclerRoblox.RobloxAdapter.VisibleItemsPresentation)
local _ = require(ViewRecyclerRoblox.RobloxAdapter.createRecyclingScope)
local Axis = ViewRecyclerModule.Axis
local ReachedThreshold = ViewRecyclerModule.Adapter._Private.ReachedThreshold
local ScrollMotion = ViewRecyclerModule.Adapter._Private.ScrollMotion
local ShallowTable = ViewRecyclerModule.Adapter._Private.ShallowTable
local Frozen = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else table.freeze({
	"scrollingFrame", "viewportOverlay", "axis", "dataSource", "layout",
	"overscan", "dataPrefetch", "contentAlignment", "isItemStickyHeader",
	"pinnedStartItem", "pinnedEndItem", "preserveScrollPositionOnChange",
	"initialScrollAlignment", "autoScrollOnChange", "autoScrollThreshold",
	"onStartReached", "onEndReached", "startReachedThreshold",
	"endReachedThreshold", "onViewportChanged", "onScrollOffsetChanged",
	"onContentLengthChanged", "onVisibleRangeChanged", "onMountedRangeChanged",
	"onVisibleItemsPresented", "onDataPrefetchRequested"
})
local Frozen1 = table.freeze({
	"axis", "onStartReached", "onEndReached", "onViewportChanged",
	"onScrollOffsetChanged", "onContentLengthChanged"
})
local Frozen2 = table.freeze(if FFlagViewRecyclerReact084 then {
	"overscan", "contentAlignment", "initialScrollAlignment", "autoScrollOnChange",
	"preserveScrollPositionOnChange", "isItemStickyHeader"
} else {
	"overscan", "dataPrefetch", "contentAlignment", "endReachedThreshold",
	"initialScrollAlignment", "autoScrollOnChange", "autoScrollThreshold",
	"startReachedThreshold", "preserveScrollPositionOnChange", "isItemStickyHeader"
})
local Frozen3 = nil
local Frozen4 = nil
local Callback: ((any, any) -> any)? = nil

if FFlagViewRecyclerReact084 then
	Frozen3 = table.freeze({
		"endReachedThreshold",
		"autoScrollThreshold",
		"startReachedThreshold"
	})
	Frozen4 = table.freeze({ "startItems", "endItems" })
	
	Callback = function(p1, AnimatedScroll)
		-- upvalues: ReducedMotionModule (copy)
		if p1 == nil or p1.animated ~= true or ReducedMotionModule.isEnabled() then
			return nil
		else
			local AnimatedScroll1 = AnimatedScroll or {}
			
			return {
				animated = true,
				jumpDistance = p1.jumpDistance or AnimatedScroll1.jumpDistance,
				frequency = p1.frequency or AnimatedScroll1.frequency,
				cruiseSpeed = p1.cruiseSpeed or AnimatedScroll1.cruiseSpeed,
				approachDistance = p1.approachDistance or AnimatedScroll1.approachDistance,
				landingDistance = p1.landingDistance or AnimatedScroll1.landingDistance
			}
		end
	end
end
local function _(p1)
	-- upvalues: FFlagViewRecyclerReact084 (copy), VirtualizerConfigurationKeysModule (copy), FFlagViewRecyclerReact08 (copy), Frozen (ref)
	local t = {}
	local VirtualizerConfigurationKeysModule1 = if FFlagViewRecyclerReact084 then VirtualizerConfigurationKeysModule elseif FFlagViewRecyclerReact08 then VirtualizerConfigurationKeysModule else Frozen
	for _, value in VirtualizerConfigurationKeysModule1 do
		t[value] = p1[value]
	end
	return t
end

local _ = function(p2, p3)
	-- upvalues: ShallowTable (copy)
	return ShallowTable.equal(p2 or {}, p3 or {})
end

local SameThresholds = if FFlagViewRecyclerReact084 then function(p2, p3): boolean
	-- upvalues: Frozen3 (ref), ReachedThreshold (copy)
	for _, value in Frozen3 do
		if not ReachedThreshold.equal(p2[value], p3[value]) then
			return false
		end
	end
	return true
end else nil

local function samePolicy(IsAxisMatch, p4)
	-- upvalues: FFlagViewRecyclerReact084 (copy), ShallowTable (copy), Frozen2 (copy), SameThresholds (ref), Frozen4 (ref)
	return (if FFlagViewRecyclerReact084 then ShallowTable.containsEqual(IsAxisMatch, p4, Frozen2) and (SameThresholds(IsAxisMatch, p4) and ShallowTable.optionalContainsEqual(IsAxisMatch.dataPrefetch, p4.dataPrefetch, Frozen4)) else ShallowTable.containsEqual(IsAxisMatch, p4, Frozen2)) and (IsAxisMatch.onStartReached == nil == (p4.onStartReached == nil) and IsAxisMatch.onEndReached == nil == (p4.onEndReached == nil) and (ShallowTable.equal(IsAxisMatch.pinnedStartItem or {}, p4.pinnedStartItem or {}) and ShallowTable.equal(IsAxisMatch.pinnedEndItem or {}, p4.pinnedEndItem or {})))
end

local _ = function(p4)
	local StackedSpacingFunction = p4.layout.stackedSpacing
	
	return if StackedSpacingFunction == nil then nil else StackedSpacingFunction()
end

local _ = function(p4)
	assert(not p4.requiresItemMeasurement() or p4.stackedSpacing ~= nil, "createVirtualizer: a Layout that requires Item measurement must be a Stacked layout")
end

local NeedsOwnedOverlay = if FFlagViewRecyclerReact084 then if FFlagViewRecyclerReact084 then function(p4): boolean
	return p4.viewportOverlay == nil and (p4.scrollingFrame ~= nil and (p4.isItemStickyHeader ~= nil or p4.pinnedStartItem ~= nil or p4.pinnedEndItem ~= nil))
end elseif FFlagViewRecyclerReact08 then function(p4): boolean
	return p4.viewportOverlay == nil and (p4.scrollingFrame ~= nil and (p4.isItemStickyHeader ~= nil or p4.pinnedStartItem ~= nil or p4.pinnedEndItem ~= nil))
end else nil elseif FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then function(p4): boolean
	return p4.viewportOverlay == nil and (p4.scrollingFrame ~= nil and (p4.isItemStickyHeader ~= nil or p4.pinnedStartItem ~= nil or p4.pinnedEndItem ~= nil))
end else nil

local function corePolicy(IsAxisMatch)
	return {
		overscan = IsAxisMatch.overscan,
		dataPrefetch = IsAxisMatch.dataPrefetch,
		contentAlignment = IsAxisMatch.contentAlignment,
		endThreshold = IsAxisMatch.endReachedThreshold,
		initialScrollAlignment = IsAxisMatch.initialScrollAlignment,
		autoScrollOnChange = IsAxisMatch.autoScrollOnChange,
		autoScrollThreshold = IsAxisMatch.autoScrollThreshold,
		startReachedThreshold = IsAxisMatch.startReachedThreshold,
		startReachedEnabled = IsAxisMatch.onStartReached ~= nil,
		endReachedEnabled = IsAxisMatch.onEndReached ~= nil,
		pinnedItems = {
			isItemStickyHeader = IsAxisMatch.isItemStickyHeader,
			pinnedStartItem = IsAxisMatch.pinnedStartItem,
			pinnedEndItem = IsAxisMatch.pinnedEndItem
		},
		preserveScrollPositionOnChange = IsAxisMatch.preserveScrollPositionOnChange ~= false
	}
end

return function(p4)
	-- upvalues: Axis (copy), FFlagViewRecyclerReact084 (copy), ScrollMotion (copy), VacantHostsModule (copy), VirtualizerConfigurationKeysModule (copy), FFlagViewRecyclerReact08 (copy), Frozen (ref), VisibleItemsPresentationModule (copy), NeedsOwnedOverlay (ref), AttachedViewportOverlayModule (copy), HostPlacementModule (copy), HostPresentationPhaseModule (copy), corePolicy (copy), ViewRecyclerModule (copy), ScrollHostModule (copy), samePolicy (copy), ShallowTable (copy), Frozen1 (copy), Callback (ref)
	local Tbl: boolean = p4.axis == Axis.X or p4.axis == Axis.Y
	assert(Tbl, "createVirtualizer: invalid axis")
	local Layout = p4.layout
	assert(not Layout.requiresItemMeasurement() or Layout.stackedSpacing ~= nil, "createVirtualizer: a Layout that requires Item measurement must be a Stacked layout")
	local ForScopeResult = nil
	
	if FFlagViewRecyclerReact084 then
		ScrollMotion.validate(p4.animatedScroll, "createVirtualizer: animatedScroll")
		ForScopeResult = VacantHostsModule.forScope(p4.recyclingScope)
	end
	Tbl = {}
	local VirtualizerConfigurationKeysModule1 = if FFlagViewRecyclerReact084 then VirtualizerConfigurationKeysModule elseif FFlagViewRecyclerReact08 then VirtualizerConfigurationKeysModule else Frozen
	for _, value in VirtualizerConfigurationKeysModule1 do
		Tbl[value] = p4[value]
	end
	local Flag = false
	local IsActive = nil
	IsActive = if FFlagViewRecyclerReact084 then p4.active ~= false elseif FFlagViewRecyclerReact08 then p4.active ~= false else nil
	local Flag1 = false
	local Flag2 = false
	local Flag3 = false
	local Flag4 = false
	local Virtualizer = nil
	local NewResult = nil
	local NewVisibleItemsPresentation = VisibleItemsPresentationModule.new(function()
		-- upvalues: Flag (ref), Tbl (ref)
		return if Flag then nil else Tbl.onVisibleItemsPresented
	end)
	local Config = nil
	local syncOwnedOverlay = nil
	local viewportContainer = nil
	
	if FFlagViewRecyclerReact084 then
		Config = nil
		
		syncOwnedOverlay = function(IsAxisMatch)
			-- upvalues: Config (ref), NeedsOwnedOverlay (upval), AttachedViewportOverlayModule (upval)
			local Config1 = Config
			
			if not NeedsOwnedOverlay(IsAxisMatch) then
				Config = nil
				
				return Config1
			end
			local ScrollingFrame = IsAxisMatch.scrollingFrame
			
			if Config1 == nil or Config1.scrollingFrame ~= ScrollingFrame or Config1.axis ~= IsAxisMatch.axis then
				Config = {
					scrollingFrame = ScrollingFrame,
					axis = IsAxisMatch.axis,
					handle = AttachedViewportOverlayModule.new(ScrollingFrame, IsAxisMatch.axis)
				}
				
				return Config1
			else
				return nil
			end
		end
		
		viewportContainer = function(IsAxisMatch)
			-- upvalues: Config (ref)
			local ViewportOverlay = IsAxisMatch.viewportOverlay
			
			if ViewportOverlay == nil then
				local Config1 = Config
				
				return if Config1 == nil then nil else Config1.handle.overlay
			else
				return ViewportOverlay
			end
		end
		
		syncOwnedOverlay(Tbl)
	else
		Config = nil
		syncOwnedOverlay = nil
		viewportContainer = nil
		
		if FFlagViewRecyclerReact08 then
			Config = nil
			
			syncOwnedOverlay = function(p5)
				-- upvalues: Config (ref), NeedsOwnedOverlay (upval), AttachedViewportOverlayModule (upval)
				local Config1 = Config
				
				if not NeedsOwnedOverlay(p5) then
					Config = nil
					
					return Config1
				end
				local ScrollingFrame = p5.scrollingFrame
				
				if Config1 == nil or Config1.scrollingFrame ~= ScrollingFrame or Config1.axis ~= p5.axis then
					Config = {
						scrollingFrame = ScrollingFrame,
						axis = p5.axis,
						handle = AttachedViewportOverlayModule.new(ScrollingFrame, p5.axis)
					}
					
					return Config1
				else
					return nil
				end
			end
			
			viewportContainer = function(p5)
				-- upvalues: Config (ref)
				local ViewportOverlay = p5.viewportOverlay
				
				if ViewportOverlay == nil then
					local Config1 = Config
					
					return if Config1 == nil then nil else Config1.handle.overlay
				else
					return ViewportOverlay
				end
			end
			
			syncOwnedOverlay(Tbl)
		end
	end
	local StackedSpacingFunction = Tbl.layout.stackedSpacing
	local NewHostPlacement = HostPlacementModule.new({
		vacantHosts = if FFlagViewRecyclerReact084 then ForScopeResult else nil,
		container = Tbl.scrollingFrame,
		viewportContainer = if FFlagViewRecyclerReact084 then viewportContainer(Tbl) elseif FFlagViewRecyclerReact08 then viewportContainer(Tbl) else Tbl.viewportOverlay,
		axis = Tbl.axis,
		selfSizing = Tbl.layout.requiresItemMeasurement(),
		stackedSpacing = if StackedSpacingFunction == nil then nil else StackedSpacingFunction(),
		onItemMeasurements = function(p5)
			-- upvalues: Virtualizer (ref)
			Virtualizer.submitMeasurements(p5)
		end,
		onItemViewPresentationChanged = function(p5, p6)
			-- upvalues: p4 (copy), NewVisibleItemsPresentation (copy)
			local OnItemViewPresentationChangedFunction: (any, any) -> () = p4.onItemViewPresentationChanged
			
			if OnItemViewPresentationChangedFunction ~= nil then
				OnItemViewPresentationChangedFunction(p5, p6)
			end
			NewVisibleItemsPresentation.presentationChanged(p5, p6)
		end,
		getCanvasOriginOffset = function()
			-- upvalues: NewResult (ref)
			return if NewResult == nil then 0 else NewResult.getCanvasOriginOffset()
		end
	})
	local Frozen2 = table.freeze({ apply = NewHostPlacement.apply })
	local PresentItemView = p4.presentItemView or function(p5, State, p6, p7)
		-- upvalues: p4 (copy), HostPresentationPhaseModule (upval)
		local TransitionFunction: (any, any) -> () = p4.transition
		
		if State == nil then
			p7.apply(p5, nil)
			
			if p6 and TransitionFunction ~= nil then
				TransitionFunction(p5, nil)
			end
			return
		else
			local _Instance = if p4.getInstance == nil then p5 else p4.getInstance(p5)
			assert(typeof(_Instance) == "Instance" and _Instance:IsA("GuiObject"), "createVirtualizer: ItemView host must be a GuiObject")
			
			if p6 then
				p7.apply(p5, {
					host = _Instance,
					phase = HostPresentationPhaseModule.Hidden,
					state = State
				})
				
				if TransitionFunction ~= nil then
					TransitionFunction(p5, State.assignment)
				end
			end
			p7.apply(p5, {
				host = _Instance,
				phase = HostPresentationPhaseModule.Presented,
				state = State
			})
		end
	end
	local self = setmetatable({}, { __mode = "k" })
	
	local function _(Key, p5)
		-- upvalues: self (copy), PresentItemView (copy), Frozen2 (copy)
		local Assignment = if p5 == nil then nil else p5.assignment
		local IsNotSelfEntryMatch = self[Key] ~= Assignment
		
		if IsNotSelfEntryMatch then
			self[Key] = Assignment
		end
		PresentItemView(Key, p5, IsNotSelfEntryMatch, Frozen2)
	end
	
	local v1 = nil
	
	local function presentChanges()
		-- upvalues: v1 (ref), NewVisibleItemsPresentation (copy), Tbl (ref), NewHostPlacement (copy), self (copy), PresentItemView (copy), Frozen2 (copy)
		local v2 = v1
		v1 = nil
		NewVisibleItemsPresentation.present(v2, Tbl.dataSource.getItemCount(), function()
			-- upvalues: NewHostPlacement (upval), v2 (copy), self (upval), PresentItemView (upval), Frozen2 (upval)
			NewHostPlacement.setMountedWindow(v2, function()
				-- upvalues: v2 (upval), self (upval), PresentItemView (upval), Frozen2 (upval)
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
		end)
	end
	
	local function applyRecord(p5, p6)
		-- upvalues: v1 (ref), NewResult (ref), presentChanges (copy), Flag1 (ref), Flag2 (ref), Flag3 (ref), Tbl (ref), Flag4 (ref)
		v1 = p6
		NewResult.applyRecord(p6, presentChanges)
		
		if not Flag1 then return end
		if p5.visibleRange ~= p6.visibleRange then
			if Flag2 then
				Flag3 = true
			end
			if Tbl.onVisibleRangeChanged ~= nil then
				Tbl.onVisibleRangeChanged(p6.visibleRange)
			end
		end
		if p5.mountedRange ~= p6.mountedRange then
			if Flag2 then
				Flag4 = true
			end
			if Tbl.onMountedRangeChanged ~= nil then
				Tbl.onMountedRangeChanged(p6.mountedRange)
			end
		end
		if Tbl.onDataPrefetchRequested ~= nil then
			for _, dataPrefetchRequest in p6.dataPrefetchRequests do
				Tbl.onDataPrefetchRequested(dataPrefetchRequest)
			end
		end
	end
	
	local CorePolicyResult = corePolicy(Tbl)
	Virtualizer = ViewRecyclerModule.Adapter.createVirtualizer({
		dataSource = Tbl.dataSource,
		layout = Tbl.layout,
		recyclingScope = p4.recyclingScope,
		getItemViewType = p4.getItemViewType,
		isReadyOnAssignment = if FFlagViewRecyclerReact084 then p4.isReadyOnAssignment else nil,
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
		diagnostics = p4.diagnostics,
		onTransaction = applyRecord
	})
	NewResult = ScrollHostModule.new({
		observeScrollOffset = Virtualizer.observeScrollOffset,
		setViewportSize = Virtualizer.setViewportSize,
		getCurrent = Virtualizer.getCurrent,
		stepAnimatedScroll = if FFlagViewRecyclerReact084 then Virtualizer.stepAnimatedScroll else nil,
		stopAnimatedScroll = if FFlagViewRecyclerReact084 then Virtualizer.stopAnimatedScroll else nil,
		getInstance = function()
			-- upvalues: Flag (ref), Tbl (ref)
			return if Flag then nil else Tbl.scrollingFrame
		end,
		getConfiguration = function()
			-- upvalues: Tbl (ref)
			return Tbl
		end,
		onCanvasOriginMoved = NewHostPlacement.reposition
	})
	
	local function update(p7)
		-- upvalues: Flag (ref), Tbl (ref), FFlagViewRecyclerReact084 (upval), VirtualizerConfigurationKeysModule (upval), FFlagViewRecyclerReact08 (upval), Frozen (upval), Axis (upval), ScrollMotion (upval), viewportContainer (ref), syncOwnedOverlay (ref), IsActive (ref), NewHostPlacement (copy), Virtualizer (ref), NewVisibleItemsPresentation (copy), samePolicy (upval), corePolicy (upval), ShallowTable (upval), Frozen1 (upval), NewResult (ref)
		if Flag then return end
		local IsAxisMatch = Tbl
		local t = {}
		local VirtualizerConfigurationKeysModule1 = if FFlagViewRecyclerReact084 then VirtualizerConfigurationKeysModule elseif FFlagViewRecyclerReact08 then VirtualizerConfigurationKeysModule else Frozen
		for _, value in VirtualizerConfigurationKeysModule1 do
			t[value] = p7[value]
		end
		assert(t.axis == Axis.X or t.axis == Axis.Y, "createVirtualizer: invalid axis")
		local Layout = t.layout
		assert(not Layout.requiresItemMeasurement() or Layout.stackedSpacing ~= nil, "createVirtualizer: a Layout that requires Item measurement must be a Stacked layout")
		
		if FFlagViewRecyclerReact084 then
			ScrollMotion.validate(t.animatedScroll, "createVirtualizer: animatedScroll")
		end
		local IsNotDataSourceMatch = t.dataSource ~= IsAxisMatch.dataSource
		local IsNotLayoutMatch = t.layout ~= IsAxisMatch.layout
		local IsNotScrollingFrameMatch = t.scrollingFrame ~= IsAxisMatch.scrollingFrame
		local SyncOwnedOverlayResult = nil
		local IsNotViewportContainerResultMatch = nil
		
		if FFlagViewRecyclerReact084 then
			local ViewportContainerResult = viewportContainer(IsAxisMatch)
			SyncOwnedOverlayResult = syncOwnedOverlay(t)
			IsNotViewportContainerResultMatch = viewportContainer(t) ~= ViewportContainerResult
		else
			SyncOwnedOverlayResult = nil
			IsNotViewportContainerResultMatch = nil
			
			if FFlagViewRecyclerReact08 then
				local ViewportContainerResult = viewportContainer(IsAxisMatch)
				SyncOwnedOverlayResult = syncOwnedOverlay(t)
				IsNotViewportContainerResultMatch = viewportContainer(t) ~= ViewportContainerResult
			end
		end
		local IsNotScrollingFrameMatch1: boolean = IsNotScrollingFrameMatch or ((if FFlagViewRecyclerReact084 then IsNotViewportContainerResultMatch elseif FFlagViewRecyclerReact08 then IsNotViewportContainerResultMatch else t.viewportOverlay ~= IsAxisMatch.viewportOverlay) or (t.axis ~= IsAxisMatch.axis or (IsNotLayoutMatch or t.isItemStickyHeader == nil ~= (IsAxisMatch.isItemStickyHeader == nil))))
		local HasDestroyedHost = if FFlagViewRecyclerReact084 then IsActive and (if IsNotScrollingFrameMatch then NewHostPlacement.hasDestroyedHost() else IsNotViewportContainerResultMatch and NewHostPlacement.hasDestroyedHost()) else nil
		
		if if FFlagViewRecyclerReact084 then HasDestroyedHost else FFlagViewRecyclerReact08 then
			if FFlagViewRecyclerReact084 then
				Virtualizer.setActive(false)
			else
				HasDestroyedHost = IsActive and (if IsNotScrollingFrameMatch then NewHostPlacement.hasDestroyedHost() else IsNotViewportContainerResultMatch and NewHostPlacement.hasDestroyedHost())
				
				if HasDestroyedHost then
					Virtualizer.setActive(false)
				end
			end
		end
		Tbl = t
		
		if IsNotDataSourceMatch then
			NewVisibleItemsPresentation.rearm()
		end
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
				viewportContainer = if FFlagViewRecyclerReact084 then viewportContainer(t) elseif FFlagViewRecyclerReact08 then viewportContainer(t) else t.viewportOverlay,
				axis = t.axis,
				selfSizing = t.layout.requiresItemMeasurement(),
				stackedSpacing = if StackedSpacingFunction == nil then nil else StackedSpacingFunction()
			})
		end
		if if FFlagViewRecyclerReact084 then SyncOwnedOverlayResult ~= nil else FFlagViewRecyclerReact08 then
			if FFlagViewRecyclerReact084 then
				SyncOwnedOverlayResult.handle.destroy()
			elseif SyncOwnedOverlayResult ~= nil then
				SyncOwnedOverlayResult.handle.destroy()
			end
		end
		if not samePolicy(IsAxisMatch, t) then
			Virtualizer.setPolicy((corePolicy(t)))
		end
		if not ShallowTable.containsEqual(IsAxisMatch, t, Frozen1) then
			NewResult.configurationChanged()
		end
		if IsNotScrollingFrameMatch then
			NewResult.scrollingFrameChanged()
		end
		if if FFlagViewRecyclerReact084 then HasDestroyedHost else FFlagViewRecyclerReact08 then
			if FFlagViewRecyclerReact084 then
				Virtualizer.setActive(true)
				
				return
			end
			if HasDestroyedHost then
				Virtualizer.setActive(true)
			end
		end
	end
	
	local _ = function(Callback: (any) -> ())
		-- upvalues: Tbl (ref), update (copy)
		local Copy = table.clone(Tbl)
		Callback(Copy)
		update(Copy)
	end
	
	local Callback1: (() -> ())? = nil
	
	local function destroy()
		-- upvalues: Flag (ref), Callback1 (ref), Virtualizer (ref), NewHostPlacement (copy), FFlagViewRecyclerReact084 (upval), Config (ref), FFlagViewRecyclerReact08 (upval)
		if Flag then return end
		Flag = true
		
		if Callback1 ~= nil then
			Callback1()
			Callback1 = nil
		end
		Virtualizer.destroy()
		NewHostPlacement.destroy()
		local Config1 = nil
		
		if FFlagViewRecyclerReact084 then
			Config1 = Config
			Config = nil
		else
			Config1 = nil
		end
		if if FFlagViewRecyclerReact084 then Config1 ~= nil else FFlagViewRecyclerReact08 then
			if FFlagViewRecyclerReact084 then
				Config1.handle.destroy()
				
				return
			end
			local Config2 = Config
			Config = nil
			
			if Config2 ~= nil then
				Config2.handle.destroy()
			end
		end
	end
	
	if p4.active == false then
		Virtualizer.setActive(false)
	end
	Callback1 = NewResult.connect()
	Flag1 = true
	Flag2 = true
	local Success, Result = pcall(Virtualizer.activate)
	Flag2 = false
	
	if not Success then
		destroy()
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
		setActive = if FFlagViewRecyclerReact084 then function(p8)
			-- upvalues: Flag (ref), IsActive (ref), Virtualizer (ref)
			if not Flag then
				IsActive = p8
				Virtualizer.setActive(p8)
			end
		end elseif FFlagViewRecyclerReact08 then function(p8)
			-- upvalues: Flag (ref), IsActive (ref), Virtualizer (ref)
			if not Flag then
				IsActive = p8
				Virtualizer.setActive(p8)
			end
		end else function(p8)
			-- upvalues: Flag (ref), Virtualizer (ref)
			if not Flag then
				Virtualizer.setActive(p8)
			end
		end,
		scrollToOffset = if FFlagViewRecyclerReact084 then function(p8, p9)
			-- upvalues: Virtualizer (ref), Callback (upval), Tbl (ref)
			local ScrollToOffsetResult = Virtualizer.scrollToOffset(p8, Callback(p9, Tbl.animatedScroll))
			
			return ScrollToOffsetResult.animatedScrollTarget or ScrollToOffsetResult.scrollState.scrollOffset
		end else function(p8)
			-- upvalues: Virtualizer (ref)
			return Virtualizer.scrollToOffset(p8).scrollState.scrollOffset
		end,
		scrollToStart = if FFlagViewRecyclerReact084 then function(p8)
			-- upvalues: Virtualizer (ref), Callback (upval), Tbl (ref)
			Virtualizer.scrollToStart(Callback(p8, Tbl.animatedScroll))
		end else function()
			-- upvalues: Virtualizer (ref)
			Virtualizer.scrollToStart()
		end,
		scrollToEnd = if FFlagViewRecyclerReact084 then function(p8)
			-- upvalues: Virtualizer (ref), Callback (upval), Tbl (ref)
			Virtualizer.scrollToEnd(Callback(p8, Tbl.animatedScroll))
		end else function()
			-- upvalues: Virtualizer (ref)
			Virtualizer.scrollToEnd()
		end,
		scrollBy = function(p8)
			-- upvalues: Virtualizer (ref)
			return Virtualizer.scrollBy(p8).scrollState.scrollOffset
		end,
		scrollToIndex = function(p8, Alignment)
			-- upvalues: NewResult (ref), FFlagViewRecyclerReact084 (upval), Virtualizer (ref), Callback (upval), Tbl (ref)
			if NewResult.isReady() then
				if FFlagViewRecyclerReact084 then
					Virtualizer.scrollToIndex(p8, Alignment and Alignment.alignment, Callback(Alignment, Tbl.animatedScroll))
					
					return
				end
				Virtualizer.scrollToIndex(p8, Alignment and Alignment.alignment)
			end
		end,
		setDataSource = function(DataSource)
			-- upvalues: Tbl (ref), update (copy)
			local function _(p8)
				-- upvalues: DataSource (copy)
				p8.dataSource = DataSource
			end
			
			local Copy = table.clone(Tbl)
			Copy.dataSource = DataSource
			update(Copy)
		end,
		setLayout = function(Layout)
			-- upvalues: Tbl (ref), update (copy)
			local function _(p8)
				-- upvalues: Layout (copy)
				p8.layout = Layout
			end
			
			local Copy = table.clone(Tbl)
			Copy.layout = Layout
			update(Copy)
		end,
		setDataSourceAndLayout = function(DataSource, Layout)
			-- upvalues: Tbl (ref), update (copy)
			local function _(p8)
				-- upvalues: DataSource (copy), Layout (copy)
				p8.dataSource = DataSource
				p8.layout = Layout
			end
			
			local Copy = table.clone(Tbl)
			Copy.dataSource = DataSource
			Copy.layout = Layout
			update(Copy)
		end,
		setOverscan = function(Overscan)
			-- upvalues: Tbl (ref), update (copy)
			local function _(p8)
				-- upvalues: Overscan (copy)
				p8.overscan = Overscan
			end
			
			local Copy = table.clone(Tbl)
			Copy.overscan = Overscan
			update(Copy)
		end,
		setDataPrefetch = function(DataPrefetch)
			-- upvalues: Tbl (ref), update (copy)
			local function _(p8)
				-- upvalues: DataPrefetch (copy)
				p8.dataPrefetch = DataPrefetch
			end
			
			local Copy = table.clone(Tbl)
			Copy.dataPrefetch = DataPrefetch
			update(Copy)
		end,
		setContentAlignment = function(ContentAlignment)
			-- upvalues: Tbl (ref), update (copy)
			local function _(p8)
				-- upvalues: ContentAlignment (copy)
				p8.contentAlignment = ContentAlignment
			end
			
			local Copy = table.clone(Tbl)
			Copy.contentAlignment = ContentAlignment
			update(Copy)
		end,
		setPinnedItems = function(p8)
			-- upvalues: Tbl (ref), update (copy)
			local function _(p9)
				-- upvalues: p8 (copy)
				p9.isItemStickyHeader = p8.isItemStickyHeader
				p9.pinnedStartItem = p8.pinnedStartItem
				p9.pinnedEndItem = p8.pinnedEndItem
			end
			
			local Copy = table.clone(Tbl)
			Copy.isItemStickyHeader = p8.isItemStickyHeader
			Copy.pinnedStartItem = p8.pinnedStartItem
			Copy.pinnedEndItem = p8.pinnedEndItem
			update(Copy)
		end,
		setPreserveScrollPositionOnChange = function(PreserveScrollPositionOnChange)
			-- upvalues: Tbl (ref), update (copy)
			local function _(p8)
				-- upvalues: PreserveScrollPositionOnChange (copy)
				p8.preserveScrollPositionOnChange = PreserveScrollPositionOnChange
			end
			
			local Copy = table.clone(Tbl)
			Copy.preserveScrollPositionOnChange = PreserveScrollPositionOnChange
			update(Copy)
		end,
		refreshItemViews = function()
			-- upvalues: Virtualizer (ref)
			Virtualizer.refresh()
		end,
		isReady = NewResult.isReady,
		getVisibleRange = function()
			-- upvalues: Virtualizer (ref)
			return Virtualizer.getCurrent().visibleRange
		end,
		getMountedRange = function()
			-- upvalues: Virtualizer (ref)
			return Virtualizer.getCurrent().mountedRange
		end,
		getScrollState = function()
			-- upvalues: Virtualizer (ref)
			return Virtualizer.getCurrent().scrollState
		end,
		captureScrollAnchorSnapshot = function()
			-- upvalues: Virtualizer (ref)
			return Virtualizer.captureScrollAnchorSnapshot()
		end,
		restoreScrollAnchorSnapshot = function(p8)
			-- upvalues: Virtualizer (ref)
			return Virtualizer.restoreScrollAnchorSnapshot(p8).scrollState.scrollOffset
		end,
		destroy = destroy,
		setScrollOffset = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else function(p8)
			-- upvalues: Virtualizer (ref)
			Virtualizer.setScrollOffset(p8)
		end
	}
end
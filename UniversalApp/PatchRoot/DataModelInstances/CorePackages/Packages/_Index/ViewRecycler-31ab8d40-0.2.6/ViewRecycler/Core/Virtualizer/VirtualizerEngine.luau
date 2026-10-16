local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local DataPrefetchModule = require(ViewRecycler.Core.DataPrefetch)
local _ = require(ViewRecycler.Core.DataSource)
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local DiagnosticsModule = require(ViewRecycler.Core.Diagnostics)
local _ = require(ViewRecycler.Core.Layout)
local OverscanPolicyModule = require(ViewRecycler.Core.OverscanPolicy)
local _ = require(ViewRecycler.Core.PinnedItems)
local CloneFrozenFunction = require(ViewRecycler.Internal.ShallowTable).cloneFrozen
local _ = require(ViewRecycler.Core.Enums.ScrollAlignment)
local ScrollObservationKindModule = require(ViewRecycler.Core.Enums.ScrollObservationKind)
local TypesModule = require(ViewRecycler.Core.Types)
local VirtualizerCommandTypeModule = require(ViewRecycler.Core.Enums.VirtualizerCommandType)
local External = VirtualizerCommandTypeModule.External
local Internal = VirtualizerCommandTypeModule.Internal
local VirtualizerEffectTypeModule = require(ViewRecycler.Core.Enums.VirtualizerEffectType)
local VirtualizerQueryTypeModule = require(ViewRecycler.Core.Enums.VirtualizerQueryType)
local _ = require(ViewRecycler.Core.Virtualizer.VirtualizerSnapshot)
local DataPrefetchControllerModule = require(ViewRecycler.Core.Virtualizer.DataPrefetchController)
local ItemRevisionTrackerModule = require(ViewRecycler.Core.Virtualizer.ItemRevisionTracker)
local CreatePinnedItemPlannerModule = require(ViewRecycler.Core.PinnedItems.createPinnedItemPlanner)
local ScrollPositionControllerModule = require(ViewRecycler.Core.Virtualizer.ScrollPositionController)
local ViewportModelModule = require(ViewRecycler.Core.Virtualizer.ViewportModel)
local VirtualizerSnapshotStoreModule = require(ViewRecycler.Core.Virtualizer.VirtualizerSnapshotStore)
local Frozen = table.freeze({ firstIndex = 1, lastIndex = 0 })

local function _(p1, p2): boolean --[[ Line: 58 | Named "sameRange" ]]
	return p1.firstIndex == p2.firstIndex and p1.lastIndex == p2.lastIndex
end

local _ = function(p1, p2): boolean --[[ Line: 62 | Named "sameScrollState" ]]
	return p1.scrollOffset == p2.scrollOffset and (p1.viewportLength == p2.viewportLength and (p1.contentLength == p2.contentLength and (p1.distanceFromEnd == p2.distanceFromEnd and p1.atStart == p2.atStart))) and p1.atEnd == p2.atEnd
end

return function(p1) --[[ Line: 71 | Named "createVirtualizerEngine" ]]
	-- upvalues: OverscanPolicyModule (copy), ItemRevisionTrackerModule (copy), CreatePinnedItemPlannerModule (copy), ViewportModelModule (copy), VirtualizerSnapshotStoreModule (copy), DataPrefetchControllerModule (copy), ScrollPositionControllerModule (copy), Frozen (copy), VirtualizerEffectTypeModule (copy), DiagnosticsModule (copy), TypesModule (copy), CloneFrozenFunction (copy), DataSourceChangeTypeModule (copy), DataPrefetchModule (copy), External (copy), ScrollObservationKindModule (copy), Internal (copy), VirtualizerQueryTypeModule (copy)
	local Layout: boolean = p1.overscan == nil or p1.overscanPolicy == nil
	assert(Layout, "VirtualizerEngine: overscan and overscanPolicy are mutually exclusive")
	local DataSource = p1.dataSource
	Layout = p1.layout
	local config = {
		overscan = p1.overscan,
		overscanPolicy = p1.overscanPolicy,
		dataPrefetch = p1.dataPrefetch,
		contentAlignment = p1.contentAlignment,
		endThreshold = p1.endThreshold,
		pinnedItems = {
			isItemStickyHeader = p1.isItemStickyHeader,
			pinnedStartItem = p1.pinnedStartItem,
			pinnedEndItem = p1.pinnedEndItem
		},
		preserveScrollPositionOnChange = p1.preserveScrollPositionOnChange ~= false
	}
	local OverscanPolicy = config.overscanPolicy or OverscanPolicyModule.fixed(config.overscan)
	local PreserveScrollPositionOnChange = config.preserveScrollPositionOnChange
	local ItemRevisionTrackerModuleResult = ItemRevisionTrackerModule()
	local PinnedItemPlannerModule = CreatePinnedItemPlannerModule(DataSource, config.pinnedItems)
	local HasIsItemStickyHeader: boolean = config.pinnedItems.isItemStickyHeader ~= nil or config.pinnedItems.pinnedStartItem ~= nil or config.pinnedItems.pinnedEndItem ~= nil
	local ViewportModelModuleResult = ViewportModelModule({
		getLayout = function() --[[ Line: 101 ]]
			-- upvalues: Layout (ref)
			return Layout
		end,
		contentAlignment = p1.contentAlignment,
		contentInsetStart = p1.contentInsetStart,
		contentInsetEnd = p1.contentInsetEnd,
		endThreshold = p1.endThreshold
	})
	local VirtualizerSnapshotStoreModuleResult = VirtualizerSnapshotStoreModule({
		planner = PinnedItemPlannerModule,
		itemRevisions = ItemRevisionTrackerModuleResult,
		getRecyclableViewType = p1.getRecyclableViewType,
		initialScrollState = ViewportModelModuleResult.getScrollState(),
		initialRequiresItemMeasurement = Layout.requiresItemMeasurement()
	})
	local DataPrefetchControllerModuleResult = DataPrefetchControllerModule(config.dataPrefetch)
	local ScrollPositionControllerModuleResult = ScrollPositionControllerModule({
		shouldPreserveUserPosition = function() --[[ Line: 119 ]]
			-- upvalues: PreserveScrollPositionOnChange (ref)
			return PreserveScrollPositionOnChange
		end,
		getItemCount = function() --[[ Line: 122 ]]
			-- upvalues: DataSource (ref)
			return DataSource.getItemCount()
		end,
		getItemKey = function(FirstIndex) --[[ Line: 125 ]]
			-- upvalues: DataSource (ref)
			return DataSource.getItemKey(FirstIndex)
		end,
		getScrollOffset = ViewportModelModuleResult.getScrollOffset,
		clampScrollOffset = ViewportModelModuleResult.clampScrollOffset,
		getViewportLength = ViewportModelModuleResult.getScrollAxisLength,
		getVisibleRange = ViewportModelModuleResult.getVisibleRange,
		getItemLayout = ViewportModelModuleResult.getPlacedItemLayout,
		getScrollOffsetForItem = ViewportModelModuleResult.getScrollOffsetForItem
	})
	local Flag = false
	local v1 = false
	local Flag1 = false
	local VisibleRange = Frozen
	local ExpandIndexRangeResult = Frozen
	local config1 = {
		identity = 1,
		layoutGeometry = 1,
		placementGeometry = 1,
		range = 0,
		scroll = 0,
		overscanPolicy = 0
	}
	local config2 = {
		dataSource = DataSource,
		mountedRange = ExpandIndexRangeResult,
		options = config.dataPrefetch
	}
	local Revisions = {
		identity = config1.identity,
		layoutGeometry = config1.layoutGeometry,
		placementGeometry = config1.placementGeometry,
		range = config1.range,
		scroll = config1.scroll
	}
	local config3 = {
		contentStartOffset = 0,
		contentLength = 0,
		dataSource = DataSource,
		layout = Layout,
		visibleRange = VisibleRange,
		mountedRange = ExpandIndexRangeResult,
		scrollState = VirtualizerSnapshotStoreModuleResult.getSnapshot().scrollState,
		requiresItemMeasurement = Layout.requiresItemMeasurement(),
		hasViewportPlacements = HasIsItemStickyHeader,
		revisions = Revisions
	}
	local T = nil
	local Config = nil
	
	local function _(Key) --[[ Line: 183 | Named "advanceVersion" ]]
		-- upvalues: T (ref), config1 (copy)
		local T1 = T
		
		if not T1[Key] then
			T1[Key] = true
			config1[Key] += 1
			
			return
		end
	end
	
	local function dataKeys() --[[ Line: 192 ]]
		-- upvalues: DataSource (ref)
		local Buffer = table.create(DataSource.getItemCount())
		
		for i = 1, DataSource.getItemCount() do
			Buffer[i] = DataSource.getItemKey(i)
		end
		return Buffer
	end
	
	local _ = function(List, Event) --[[ Line: 200 | Named "addDiagnostic" ]]
		-- upvalues: VirtualizerEffectTypeModule (upval)
		table.insert(List, {
			type = VirtualizerEffectTypeModule.Diagnostic,
			event = Event
		})
	end
	
	local _ = function(List, RangeKind, p2) --[[ Line: 204 | Named "reportRange" ]]
		-- upvalues: p1 (copy), DiagnosticsModule (upval), VirtualizerEffectTypeModule (upval)
		if p1.diagnostics ~= nil then
			table.insert(List, {
				type = VirtualizerEffectTypeModule.Diagnostic,
				event = {
					kind = DiagnosticsModule.EventKind.RangeChanged,
					rangeKind = RangeKind,
					firstIndex = p2.firstIndex,
					lastIndex = p2.lastIndex
				}
			})
		end
	end
	
	local function refreshRanges(List): boolean --[[ Line: 219 ]]
		-- upvalues: ViewportModelModuleResult (copy), VisibleRange (ref), ExpandIndexRangeResult (ref), OverscanPolicy (ref), Layout (ref), Config (ref), config1 (copy), TypesModule (upval), Frozen (upval), T (ref), VirtualizerEffectTypeModule (upval), CloneFrozenFunction (upval), DiagnosticsModule (upval), p1 (copy)
		ViewportModelModuleResult.refreshContentMetrics()
		local VisibleRange1 = VisibleRange
		local MountedRange = ExpandIndexRangeResult
		local VisibleRange2 = ViewportModelModuleResult.getVisibleRange()
		local ComputeResult = OverscanPolicy.compute({
			visibleRange = VisibleRange2,
			scrollOffset = ViewportModelModuleResult.getScrollOffset(),
			viewportLength = ViewportModelModuleResult.getScrollAxisLength(),
			scrollDirection = ViewportModelModuleResult.getScrollDirection(),
			itemCount = Layout.getItemCount()
		})
		assert(ComputeResult.before >= 0 and (ComputeResult.before % 1 == 0 and ComputeResult.after >= 0) and ComputeResult.after % 1 == 0, "VirtualizerEngine: overscan policy must return non-negative integer spans")
		local LayoutViewport, LayoutViewport2 = ViewportModelModuleResult.getLayoutViewport()
		VisibleRange = VisibleRange2
		
		if Config == nil or (Config.layoutGeometryVersion ~= config1.layoutGeometry or (Config.overscanPolicyVersion ~= config1.overscanPolicy or (Config.min > LayoutViewport or (LayoutViewport2 > Config.max or (ComputeResult.before ~= Config.before or ComputeResult.after ~= Config.after)))) or not TypesModule.isIndexRangeEmpty(VisibleRange2) and (ExpandIndexRangeResult.firstIndex > VisibleRange2.firstIndex or VisibleRange2.lastIndex > ExpandIndexRangeResult.lastIndex)) then
			ExpandIndexRangeResult = if TypesModule.isIndexRangeEmpty(VisibleRange2) then Frozen else Layout.expandIndexRange(VisibleRange2, ComputeResult.before, ComputeResult.after)
			
			if TypesModule.isIndexRangeEmpty(ExpandIndexRangeResult) then
				Config = nil
			else
				local ItemLayout = Layout.getItemLayout(ExpandIndexRangeResult.lastIndex)
				Config = {
					min = Layout.getItemLayout(ExpandIndexRangeResult.firstIndex).startOffset,
					max = ItemLayout.startOffset + ItemLayout.length,
					layoutGeometryVersion = config1.layoutGeometry,
					overscanPolicyVersion = config1.overscanPolicy,
					before = ComputeResult.before,
					after = ComputeResult.after
				}
			end
		end
		local VisibleRange3 = VisibleRange
		local Inverted = not (VisibleRange1.firstIndex == VisibleRange3.firstIndex and VisibleRange1.lastIndex == VisibleRange3.lastIndex)
		local MountedRange1 = ExpandIndexRangeResult
		local Inverted1 = not (MountedRange.firstIndex == MountedRange1.firstIndex and MountedRange.lastIndex == MountedRange1.lastIndex)
		
		if Inverted or Inverted1 then
			local T1 = T
			
			if not T1.range then
				T1.range = true
				config1.range += 1
			end
		end
		if Inverted then
			table.insert(List, {
				type = VirtualizerEffectTypeModule.VisibleRangeChanged,
				range = CloneFrozenFunction(VisibleRange)
			})
			local Visible = DiagnosticsModule.RangeKind.Visible
			local VisibleRange4 = VisibleRange
			
			if p1.diagnostics ~= nil then
				table.insert(List, {
					type = VirtualizerEffectTypeModule.Diagnostic,
					event = {
						kind = DiagnosticsModule.EventKind.RangeChanged,
						rangeKind = Visible,
						firstIndex = VisibleRange4.firstIndex,
						lastIndex = VisibleRange4.lastIndex
					}
				})
			end
		end
		if Inverted1 then
			table.insert(List, {
				type = VirtualizerEffectTypeModule.MountedRangeChanged,
				range = CloneFrozenFunction(ExpandIndexRangeResult)
			})
			local Rendered = DiagnosticsModule.RangeKind.Rendered
			local MountedRange2 = ExpandIndexRangeResult
			
			if p1.diagnostics ~= nil then
				table.insert(List, {
					type = VirtualizerEffectTypeModule.Diagnostic,
					event = {
						kind = DiagnosticsModule.EventKind.RangeChanged,
						rangeKind = Rendered,
						firstIndex = MountedRange2.firstIndex,
						lastIndex = MountedRange2.lastIndex
					}
				})
			end
		end
		return Inverted1
	end
	
	local function updatePrefetch(List) --[[ Line: 292 ]]
		-- upvalues: config2 (copy), DataSource (ref), ExpandIndexRangeResult (ref), config (ref), DataPrefetchControllerModuleResult (copy), VirtualizerEffectTypeModule (upval)
		config2.dataSource = DataSource
		config2.mountedRange = ExpandIndexRangeResult
		config2.options = config.dataPrefetch
		
		for _, Request in DataPrefetchControllerModuleResult.reconcile(config2) do
			table.insert(List, {
				type = VirtualizerEffectTypeModule.DataPrefetchRequested,
				request = Request
			})
		end
	end
	
	local function commitSnapshot() --[[ Line: 304 ]]
		-- upvalues: ViewportModelModuleResult (copy), VirtualizerSnapshotStoreModuleResult (copy), T (ref), config1 (copy), Revisions (copy), config3 (copy), DataSource (ref), Layout (ref), VisibleRange (ref), ExpandIndexRangeResult (ref), HasIsItemStickyHeader (ref)
		local ScrollState = ViewportModelModuleResult.getScrollState()
		local ScrollState1 = VirtualizerSnapshotStoreModuleResult.getSnapshot().scrollState
		
		if ScrollState1.scrollOffset ~= ScrollState.scrollOffset or (ScrollState1.viewportLength ~= ScrollState.viewportLength or (ScrollState1.contentLength ~= ScrollState.contentLength or (ScrollState1.distanceFromEnd ~= ScrollState.distanceFromEnd or (ScrollState1.atStart ~= ScrollState.atStart or ScrollState1.atEnd ~= ScrollState.atEnd)))) then
			local T1 = T
			
			if not T1.scroll then
				T1.scroll = true
				config1.scroll += 1
			end
		end
		Revisions.identity = config1.identity
		Revisions.layoutGeometry = config1.layoutGeometry
		Revisions.placementGeometry = config1.placementGeometry
		Revisions.range = config1.range
		Revisions.scroll = config1.scroll
		config3.dataSource = DataSource
		config3.layout = Layout
		config3.visibleRange = VisibleRange
		config3.mountedRange = ExpandIndexRangeResult
		config3.scrollState = ScrollState
		config3.contentStartOffset = ViewportModelModuleResult.contentStartOffset(false)
		config3.contentLength = ViewportModelModuleResult.contentLength(false)
		config3.requiresItemMeasurement = Layout.requiresItemMeasurement()
		config3.hasViewportPlacements = HasIsItemStickyHeader
		
		return VirtualizerSnapshotStoreModuleResult.commit(config3)
	end
	
	local function captureAnchorEvidence() --[[ Line: 328 ]]
		-- upvalues: TypesModule (upval), VisibleRange (ref), ViewportModelModuleResult (copy), DataSource (ref)
		if TypesModule.isIndexRangeEmpty(VisibleRange) then
			return nil
		end
		local VisibleItems = {}
		
		for i = VisibleRange.firstIndex, VisibleRange.lastIndex do
			local PlacedItemLayout = ViewportModelModuleResult.getPlacedItemLayout(i)
			table.insert(VisibleItems, {
				key = DataSource.getItemKey(i),
				viewportCoordinate = PlacedItemLayout.startOffset - ViewportModelModuleResult.getScrollOffset(),
				itemLength = PlacedItemLayout.length
			})
		end
		return {
			scrollOffset = ViewportModelModuleResult.getScrollOffset(),
			viewportLength = ViewportModelModuleResult.getScrollAxisLength(),
			visibleItems = VisibleItems
		}
	end
	
	local function applyCorrection(List, ApplyGeometryChangeResult) --[[ Line: 348 ]]
		-- upvalues: ViewportModelModuleResult (copy), VirtualizerEffectTypeModule (upval), p1 (copy), DiagnosticsModule (upval)
		if ApplyGeometryChangeResult == nil then return end
		local ScrollOffset = ViewportModelModuleResult.getScrollOffset()
		ViewportModelModuleResult.setScrollOffset(ScrollOffset + ApplyGeometryChangeResult.delta)
		local ScrollOffsetDelta = ViewportModelModuleResult.getScrollOffset() - ScrollOffset
		
		if math.abs(ScrollOffsetDelta) < 1 then return end
		table.insert(List, {
			type = VirtualizerEffectTypeModule.ScrollCorrection,
			delta = ScrollOffsetDelta
		})
		table.insert(List, {
			type = VirtualizerEffectTypeModule.ScrollPositionChanged,
			offset = ViewportModelModuleResult.getScrollOffset()
		})
		
		if p1.diagnostics ~= nil then
			table.insert(List, {
				type = VirtualizerEffectTypeModule.Diagnostic,
				event = {
					kind = DiagnosticsModule.EventKind.ScrollCorrection,
					source = ApplyGeometryChangeResult.source,
					delta = ScrollOffsetDelta
				}
			})
		end
	end
	
	local function resetLayout(Keys) --[[ Line: 375 ]]
		-- upvalues: dataKeys (copy), ItemRevisionTrackerModuleResult (copy), DataSourceChangeTypeModule (upval), Layout (ref), ViewportModelModuleResult (copy)
		local Keys1 = Keys or dataKeys()
		ItemRevisionTrackerModuleResult.applyChange({ type = DataSourceChangeTypeModule.Reset, keys = Keys1 })
		Layout.applyDataSourceChange({ type = DataSourceChangeTypeModule.Reset, keys = Keys1 })
		ViewportModelModuleResult.refreshContentMetrics()
	end
	
	local function applyPolicy(Policy) --[[ Line: 382 ]]
		-- upvalues: DataPrefetchModule (upval), config (ref), OverscanPolicy (ref), OverscanPolicyModule (upval), T (ref), config1 (copy), ViewportModelModuleResult (copy), PreserveScrollPositionOnChange (ref), PinnedItemPlannerModule (copy), HasIsItemStickyHeader (ref)
		assert(Policy.overscan == nil or Policy.overscanPolicy == nil, "VirtualizerEngine: overscan and overscanPolicy are mutually exclusive")
		assert(Policy.overscan == nil or Policy.overscan >= 0 and Policy.overscan % 1 == 0, "VirtualizerEngine: overscan must be a non-negative integer")
		DataPrefetchModule.resolve(Policy.dataPrefetch)
		local config2 = config
		
		if config2.overscan ~= Policy.overscan or config2.overscanPolicy ~= Policy.overscanPolicy then
			OverscanPolicy = Policy.overscanPolicy or OverscanPolicyModule.fixed(Policy.overscan)
			local T1 = T
			
			if not T1.overscanPolicy then
				T1.overscanPolicy = true
				config1.overscanPolicy += 1
			end
		end
		if config2.contentAlignment ~= Policy.contentAlignment and ViewportModelModuleResult.setContentAlignment(Policy.contentAlignment) then
			local T2 = T
			
			if not T2.layoutGeometry then
				T2.layoutGeometry = true
				config1.layoutGeometry += 1
			end
		end
		if config2.endThreshold ~= Policy.endThreshold then
			ViewportModelModuleResult.setEndThreshold(Policy.endThreshold)
		end
		if PreserveScrollPositionOnChange ~= Policy.preserveScrollPositionOnChange then
			PreserveScrollPositionOnChange = Policy.preserveScrollPositionOnChange
		end
		local ContentInsets = PinnedItemPlannerModule.getContentInsets()
		
		if PinnedItemPlannerModule.setOptions(Policy.pinnedItems) then
			local ContentInsets1 = PinnedItemPlannerModule.getContentInsets()
			ViewportModelModuleResult.setContentInsets(ContentInsets1.start, ContentInsets1.finish)
			HasIsItemStickyHeader = Policy.pinnedItems.isItemStickyHeader ~= nil or Policy.pinnedItems.pinnedStartItem ~= nil or Policy.pinnedItems.pinnedEndItem ~= nil
			local T3 = T
			
			if not T3.placementGeometry then
				T3.placementGeometry = true
				config1.placementGeometry += 1
			end
			if config2.pinnedItems.pinnedStartItem ~= Policy.pinnedItems.pinnedStartItem or config2.pinnedItems.pinnedEndItem ~= Policy.pinnedItems.pinnedEndItem then
				local T4 = T
				
				if not T4.identity then
					T4.identity = true
					config1.identity += 1
				end
			end
			if ContentInsets.start ~= ContentInsets1.start or ContentInsets.finish ~= ContentInsets1.finish then
				local T5 = T
				
				if not T5.layoutGeometry then
					T5.layoutGeometry = true
					config1.layoutGeometry += 1
				end
			end
		end
		config = Policy
	end
	
	local function execute(p2, List) --[[ Line: 429 ]]
		-- upvalues: External (upval), Flag (ref), dataKeys (copy), resetLayout (copy), PinnedItemPlannerModule (copy), DataSourceChangeTypeModule (upval), DataSource (ref), T (ref), config1 (copy), ViewportModelModuleResult (copy), ScrollObservationKindModule (upval), ScrollPositionControllerModuleResult (copy), VirtualizerEffectTypeModule (upval), Layout (ref), HasIsItemStickyHeader (ref), applyPolicy (copy), Internal (upval), captureAnchorEvidence (copy), DiagnosticsModule (upval), ItemRevisionTrackerModuleResult (copy), applyCorrection (copy), p1 (copy), v1 (ref), DataPrefetchControllerModuleResult (copy)
		local ScrollToOffsetResult = nil
		
		if p2.type == External.Activate then
			if not Flag then
				local DataKeysResult = dataKeys()
				Flag = true
				resetLayout(DataKeysResult)
				PinnedItemPlannerModule.applyDataSourceChange({
					changes = {
						{
							type = DataSourceChangeTypeModule.Reset,
							keys = DataKeysResult
						}
					},
					previousItemCount = DataSource.getItemCount(),
					itemCount = DataSource.getItemCount()
				})
				local T1 = T
				
				if not T1.layoutGeometry then
					T1.layoutGeometry = true
					local config = config1
					config.layoutGeometry += 1
				end
				local T2 = T
				
				if T2.identity then
					return ScrollToOffsetResult
				else
					T2.identity = true
					local config = config1
					config.identity += 1
					
					return ScrollToOffsetResult
				end
			end
		elseif p2.type == External.SetScrollOffset or p2.type == External.ObserveScrollOffset then
			local SetScrollOffsetResult = ViewportModelModuleResult.setScrollOffset(if p2.type == External.SetScrollOffset then p2.offset else p2.observation.offset)
			
			if p2.type == External.ObserveScrollOffset and p2.observation.kind == ScrollObservationKindModule.Programmatic then
				ScrollPositionControllerModuleResult.reconcileHostOffset(ViewportModelModuleResult.getScrollOffset())
				
				return ScrollToOffsetResult
			elseif SetScrollOffsetResult then
				ScrollPositionControllerModuleResult.setViewportAnchor(ViewportModelModuleResult.getScrollOffset())
				
				return ScrollToOffsetResult
			end
		elseif p2.type == External.ScrollToIndex or p2.type == External.ScrollToOffset or p2.type == External.ScrollBy or p2.type == External.RestoreScrollAnchorSnapshot then
			if p2.type == External.ScrollToIndex then
				ScrollPositionControllerModuleResult.setItemAnchor(p2.index, p2.alignment)
				ScrollToOffsetResult = ViewportModelModuleResult.scrollToOffset(ViewportModelModuleResult.getScrollOffsetForItem(p2.index, p2.alignment))
			elseif p2.type == External.ScrollToOffset then
				ScrollToOffsetResult = ViewportModelModuleResult.scrollToOffset(p2.offset)
				ScrollPositionControllerModuleResult.setViewportAnchor(ScrollToOffsetResult)
			elseif p2.type == External.ScrollBy then
				ScrollToOffsetResult = ViewportModelModuleResult.scrollBy(p2.delta)
				ScrollPositionControllerModuleResult.setViewportAnchor(ScrollToOffsetResult)
			else
				ScrollToOffsetResult = ViewportModelModuleResult.scrollToOffset(ScrollPositionControllerModuleResult.getSnapshotOffset(p2.snapshot))
				ScrollPositionControllerModuleResult.restoreSnapshotAnchor(p2.snapshot, ScrollToOffsetResult)
			end
			table.insert(List, {
				type = VirtualizerEffectTypeModule.ScrollPositionChanged,
				offset = ScrollToOffsetResult
			})
			
			return ScrollToOffsetResult
		elseif p2.type == External.SetViewportSize then
			if ViewportModelModuleResult.setViewportSize(p2.scrollAxisLength, p2.crossAxisLength) then
				if Layout.setViewportCrossAxisLength(p2.crossAxisLength) then
					local T3 = T
					
					if not T3.layoutGeometry then
						T3.layoutGeometry = true
						local config = config1
						config.layoutGeometry += 1
					end
				end
				if HasIsItemStickyHeader then
					local T4 = T
					
					if T4.placementGeometry then
						return ScrollToOffsetResult
					else
						T4.placementGeometry = true
						local config = config1
						config.placementGeometry += 1
						
						return ScrollToOffsetResult
					end
				end
			end
		else
			if p2.type == External.SetPolicy then
				applyPolicy(p2.policy)
				
				return ScrollToOffsetResult
			end
			if p2.type == External.SetDataSource or p2.type == External.SetDataSourceAndLayout then
				DataSource = p2.dataSource
				PinnedItemPlannerModule.setDataSource(DataSource)
				
				if p2.type == External.SetDataSourceAndLayout then
					Layout = p2.layout
				end
				ScrollPositionControllerModuleResult.reset()
				resetLayout()
				local T5 = T
				
				if not T5.layoutGeometry then
					T5.layoutGeometry = true
					local config = config1
					config.layoutGeometry += 1
				end
				local T6 = T
				
				if T6.identity then
					return ScrollToOffsetResult
				else
					T6.identity = true
					local config = config1
					config.identity += 1
					
					return ScrollToOffsetResult
				end
			elseif p2.type == External.SetLayout then
				Layout = p2.layout
				ScrollPositionControllerModuleResult.reset()
				resetLayout()
				local T7 = T
				
				if not T7.layoutGeometry then
					T7.layoutGeometry = true
					local config = config1
					config.layoutGeometry += 1
				end
				local T8 = T
				
				if T8.identity then
					return ScrollToOffsetResult
				else
					T8.identity = true
					local config = config1
					config.identity += 1
					
					return ScrollToOffsetResult
				end
			elseif p2.type == Internal.ApplyDataSourceChange then
				local ScrollState = ViewportModelModuleResult.getScrollState()
				local CaptureAnchorEvidenceResult = captureAnchorEvidence()
				local ApplyDataSourceChangeResult = false
				applyCorrection(List, (ScrollPositionControllerModuleResult.applyGeometryChange({
					source = DiagnosticsModule.ScrollCorrectionSource.Data,
					dataSourceChange = p2.changeBatch,
					anchorEvidence = CaptureAnchorEvidenceResult
				}, function() --[[ Line: 521 ]]
					-- upvalues: p2 (copy), ItemRevisionTrackerModuleResult (upval), ApplyDataSourceChangeResult (ref), Layout (upval), PinnedItemPlannerModule (upval), ViewportModelModuleResult (upval)
					for _, change in p2.changeBatch.changes do
						ItemRevisionTrackerModuleResult.applyChange(change)
						ApplyDataSourceChangeResult = Layout.applyDataSourceChange(change) or ApplyDataSourceChangeResult
					end
					PinnedItemPlannerModule.applyDataSourceChange(p2.changeBatch)
					ViewportModelModuleResult.refreshContentMetrics()
				end)))
				table.insert(List, {
					type = VirtualizerEffectTypeModule.DataSourceChanged,
					changeBatch = p2.changeBatch,
					before = ScrollState
				})
				
				if ApplyDataSourceChangeResult then
					local T9 = T
					
					if not T9.layoutGeometry then
						T9.layoutGeometry = true
						config1.layoutGeometry += 1
					end
				end
				local T10 = T
				
				if not T10.identity then
					T10.identity = true
					config1.identity += 1
				end
				return ScrollToOffsetResult
			elseif p2.type == Internal.SubmitLogicalMeasurements then
				local Type = 0
				local ApplyDataSourceChangeResult = p2.boundaryDropped
				local ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult or 0
				ApplyDataSourceChangeResult = nil
				local Flag2 = false
				
				if #p2.measurements > 0 and p1.diagnostics ~= nil then
					table.insert(List, {
						type = VirtualizerEffectTypeModule.Diagnostic,
						event = {
							kind = DiagnosticsModule.EventKind.MeasurementsProcessingStarted,
							submitted = #p2.measurements,
							boundaryDropped = ApplyDataSourceChangeResult1
						}
					})
				end
				local config = {
					preserveStartAnchor = true,
					startInsetDelta = 0,
					source = DiagnosticsModule.ScrollCorrectionSource.Measurement
				}
				local Start = PinnedItemPlannerModule.getContentInsets().start
				applyCorrection(List, (ScrollPositionControllerModuleResult.applyGeometryChange(config, function() --[[ Line: 556 ]]
					-- upvalues: p2 (copy), DataSource (upval), ItemRevisionTrackerModuleResult (upval), Layout (upval), Type (ref), ApplyDataSourceChangeResult1 (ref), Flag2 (ref), ApplyDataSourceChangeResult (ref), PinnedItemPlannerModule (upval), config (copy), Start (copy), ViewportModelModuleResult (upval)
					for _, measurement in p2.measurements do
						if measurement.itemIndex == nil or measurement.pinnedPosition ~= nil then
							if measurement.itemIndex ~= nil or measurement.pinnedPosition == nil then
								ApplyDataSourceChangeResult1 += 1
								continue
							end
							ApplyDataSourceChangeResult = PinnedItemPlannerModule.updatePinnedMeasurement(measurement.pinnedPosition, measurement.itemKey, measurement.itemRevision, measurement.length)
							
							if ApplyDataSourceChangeResult ~= nil then
								Type += 1
								continue
							else
								ApplyDataSourceChangeResult1 += 1
								continue
							end
						else
							local ItemIndex: number = measurement.itemIndex
							
							if ItemIndex < 1 or ItemIndex > DataSource.getItemCount() or DataSource.getItemKey(ItemIndex) ~= measurement.itemKey or ItemRevisionTrackerModuleResult.get(measurement.itemKey) ~= measurement.itemRevision then
								ApplyDataSourceChangeResult1 += 1
								continue
							end
							local UpdateItemMeasurementResult = Layout.updateItemMeasurement(measurement)
							
							if UpdateItemMeasurementResult.accepted then
								Type += 1
							else
								ApplyDataSourceChangeResult1 += 1
							end
							Flag2 = Flag2 or UpdateItemMeasurementResult.geometryChanged
							continue
						end
					end
					if ApplyDataSourceChangeResult ~= nil then
						config.startInsetDelta = ApplyDataSourceChangeResult.start - Start
						ViewportModelModuleResult.setContentInsets(ApplyDataSourceChangeResult.start, ApplyDataSourceChangeResult.finish)
						Flag2 = true
					end
					ViewportModelModuleResult.refreshContentMetrics()
				end)))
				
				if p1.diagnostics ~= nil then
					table.insert(List, {
						type = VirtualizerEffectTypeModule.Diagnostic,
						event = {
							kind = DiagnosticsModule.EventKind.MeasurementsProcessed,
							accepted = Type,
							dropped = ApplyDataSourceChangeResult1
						}
					})
				end
				if Flag2 then
					local T11 = T
					
					if not T11.layoutGeometry then
						T11.layoutGeometry = true
						config1.layoutGeometry += 1
					end
				end
				return ScrollToOffsetResult
			else
				local Type = p2.type
				local ApplyDataSourceChangeResult1 = External
				ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult1.SubmitMeasurements
				
				if Type == ApplyDataSourceChangeResult1 then
					Type = error
					ApplyDataSourceChangeResult1 = "VirtualizerEngine: physical measurements belong to presentation"
					local ApplyDataSourceChangeResult = 0
					Type(ApplyDataSourceChangeResult1, ApplyDataSourceChangeResult)
					
					return ScrollToOffsetResult
				end
				Type = p2.type
				ApplyDataSourceChangeResult1 = External
				ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult1.ApplyScrollAnchorOffset
				
				if Type == ApplyDataSourceChangeResult1 then
					Type = ViewportModelModuleResult
					Type = Type.getScrollOffset
					Type = Type()
					ApplyDataSourceChangeResult1 = ScrollPositionControllerModuleResult
					ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult1.allowsExternalPositionApplication
					ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult1()
					
					if ApplyDataSourceChangeResult1 then
						ApplyDataSourceChangeResult1 = ViewportModelModuleResult
						ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult1.scrollToOffset
						local ApplyDataSourceChangeResult = p2.offset
						ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult1(ApplyDataSourceChangeResult)
						ScrollToOffsetResult = ApplyDataSourceChangeResult1
					else
						ApplyDataSourceChangeResult1 = ViewportModelModuleResult
						ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult1.getScrollOffset
						ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult1()
						ScrollToOffsetResult = ApplyDataSourceChangeResult1
					end
					if ScrollToOffsetResult ~= Type then
						local Flag2 = {
							type = VirtualizerEffectTypeModule.ScrollPositionChanged,
							offset = ScrollToOffsetResult
						}
						local ApplyDataSourceChangeResult = List
						ApplyDataSourceChangeResult1 = table.insert
						ApplyDataSourceChangeResult1(ApplyDataSourceChangeResult, Flag2)
						
						return ScrollToOffsetResult
					end
				else
					Type = p2.type
					ApplyDataSourceChangeResult1 = External
					ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult1.Refresh
					
					if Type == ApplyDataSourceChangeResult1 then
						Type = T
						ApplyDataSourceChangeResult1 = Type.identity
						
						if ApplyDataSourceChangeResult1 then
							return ScrollToOffsetResult
						else
							ApplyDataSourceChangeResult1 = true
							Type.identity = ApplyDataSourceChangeResult1
							ApplyDataSourceChangeResult1 = config1
							local ApplyDataSourceChangeResult: number = ApplyDataSourceChangeResult1.identity
							ApplyDataSourceChangeResult += 1
							ApplyDataSourceChangeResult1.identity = ApplyDataSourceChangeResult
							
							return ScrollToOffsetResult
						end
					else
						Type = p2.type
						ApplyDataSourceChangeResult1 = External
						ApplyDataSourceChangeResult1 = ApplyDataSourceChangeResult1.Destroy
						
						if Type == ApplyDataSourceChangeResult1 then
							Type = true
							v1 = Type
							Type = ScrollPositionControllerModuleResult
							Type = Type.destroy
							Type()
							Type = PinnedItemPlannerModule
							Type = Type.destroy
							Type()
							Type = DataPrefetchControllerModuleResult
							Type = Type.destroy
							Type()
							
							return ScrollToOffsetResult
						else
							Type = error
							ApplyDataSourceChangeResult1 = "VirtualizerEngine: unknown command"
							local ApplyDataSourceChangeResult = 0
							Type(ApplyDataSourceChangeResult1, ApplyDataSourceChangeResult)
						end
					end
				end
			end
		end
		return ScrollToOffsetResult
	end
	
	return {
		dispatch = function(p3) --[[ Line: 636 ]]
			-- upvalues: Flag1 (ref), v1 (ref), External (upval), T (ref), execute (copy), refreshRanges (copy), updatePrefetch (copy), commitSnapshot (copy)
			assert(not Flag1, "VirtualizerEngine: cannot dispatch during a Geometry transaction")
			assert(not v1 or p3.type == External.Destroy, "VirtualizerEngine: cannot dispatch after destruction")
			Flag1 = true
			T = {}
			local Effects = {}
			local Success, Result = pcall(execute, p3, Effects)
			
			if not Success then
				T = nil
				Flag1 = false
				error(Result, 0)
				
				return
			end
			refreshRanges(Effects)
			
			if not v1 then
				updatePrefetch(Effects)
			end
			local CommitSnapshotResult = commitSnapshot()
			T = nil
			Flag1 = false
			
			return {
				snapshot = CommitSnapshotResult.snapshot,
				presentation = CommitSnapshotResult.presentation,
				result = Result,
				effects = Effects
			}
		end,
		getSnapshot = VirtualizerSnapshotStoreModuleResult.getSnapshot,
		query = function(p3) --[[ Line: 668 ]]
			-- upvalues: VirtualizerSnapshotStoreModuleResult (copy), VirtualizerQueryTypeModule (upval), Layout (ref), ViewportModelModuleResult (copy), DataSource (ref)
			local Snapshot = VirtualizerSnapshotStoreModuleResult.getSnapshot()
			
			if p3.type == VirtualizerQueryTypeModule.GetVisibleRange then
				return Snapshot.visibleRange
			elseif p3.type == VirtualizerQueryTypeModule.GetMountedRange then
				return Snapshot.mountedRange
			elseif p3.type == VirtualizerQueryTypeModule.GetScrollState then
				return Snapshot.scrollState
			elseif p3.type == VirtualizerQueryTypeModule.GetContentLength then
				return Snapshot.contentLength
			elseif p3.type == VirtualizerQueryTypeModule.GetContentStartOffset then
				return Snapshot.contentStartOffset
			elseif p3.type == VirtualizerQueryTypeModule.RequiresItemMeasurement then
				return Snapshot.requiresItemMeasurement
			elseif p3.type == VirtualizerQueryTypeModule.GetItemLayout then
				return Layout.getItemLayout(p3.index)
			elseif p3.type == VirtualizerQueryTypeModule.GetScrollOffsetForItem then
				return ViewportModelModuleResult.getScrollOffsetForItem(p3.index, p3.alignment)
			elseif p3.type ~= VirtualizerQueryTypeModule.CaptureScrollAnchorSnapshot then
				error("VirtualizerEngine: unknown query", 0)
				
				return
			else
				local FirstIndex = if Snapshot.visibleRange.firstIndex <= Snapshot.visibleRange.lastIndex then Snapshot.visibleRange.firstIndex else nil
				
				return if FirstIndex == nil then {
					anchorKey = nil,
					anchorIndex = nil,
					offsetWithinItem = 0,
					fallbackScrollOffset = Snapshot.scrollState.scrollOffset
				} else {
					anchorKey = DataSource.getItemKey(FirstIndex),
					anchorIndex = FirstIndex,
					offsetWithinItem = Snapshot.scrollState.scrollOffset - Snapshot.contentStartOffset - Layout.getItemLayout(FirstIndex).startOffset,
					fallbackScrollOffset = Snapshot.scrollState.scrollOffset
				}
			end
		end
	}
end
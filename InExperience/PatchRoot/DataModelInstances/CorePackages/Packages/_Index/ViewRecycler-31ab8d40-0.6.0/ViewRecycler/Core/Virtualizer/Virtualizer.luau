local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AutoScrollModule = require(ViewRecycler.Core.ViewportBehavior.AutoScroll)
local AutoScrollTargetModule = require(ViewRecycler.Core.Enums.AutoScrollTarget)
local DataPrefetchModule = require(ViewRecycler.Core.DataPrefetch)
local _ = require(ViewRecycler.Core.DataSource)
local DataSourceChangeTypeModule = require(ViewRecycler.Core.Enums.DataSourceChangeType)
local DiagnosticsModule = require(ViewRecycler.Core.Diagnostics)
local _ = require(ViewRecycler.Core.Layout)
local PaginationEdgesModule = require(ViewRecycler.Core.ViewportBehavior.PaginationEdges)
local _ = require(ViewRecycler.Core.PinnedItems)
local PlacementTypesModule = require(ViewRecycler.Core.Placement.PlacementTypes)
local _ = require(ViewRecycler.Core.ViewportBehavior.ReachedThreshold)
local ScrollAlignmentModule = require(ViewRecycler.Core.Enums.ScrollAlignment)
local ScrollObservationKindModule = require(ViewRecycler.Core.Enums.ScrollObservationKind)
local _ = require(ViewRecycler.Core.Types)
local DataPrefetchControllerModule = require(ViewRecycler.Core.Virtualizer.DataPrefetchController)
local ListRowsModule = require(ViewRecycler.Core.Virtualizer.ListRows)
local CreatePinnedItemPlannerModule = require(ViewRecycler.Core.PinnedItems.createPinnedItemPlanner)
local _ = require(ViewRecycler.Core.Recycling.RecyclingScope)
local ScrollAnchorModule = require(ViewRecycler.Core.Virtualizer.ScrollAnchor)
local ScrollPolicyModule = require(ViewRecycler.Core.ViewportBehavior.ScrollPolicy)
local SlotBinderModule = require(ViewRecycler.Core.Recycling.SlotBinder)
local ViewportModule = require(ViewRecycler.Core.Virtualizer.Viewport)
local Frozen = table.freeze({})

local function _(p1) --[[ Line: 159 | Named "policyConfig" ]]
	return {
		initialScrollAlignment = p1.initialScrollAlignment,
		autoScrollOnChange = p1.autoScrollOnChange,
		autoScrollThreshold = p1.autoScrollThreshold,
		startReachedThreshold = p1.startReachedThreshold,
		startReachedEnabled = p1.startReachedEnabled == true,
		endReachedEnabled = p1.endReachedEnabled == true
	}
end

local _ = function(p1) --[[ Line: 170 | Named "keyOnly" ]]
	return if p1 == nil then nil else { key = p1.key }
end

return function(p1) --[[ Line: 174 | Named "createVirtualizer" ]]
	-- upvalues: ViewportModule (copy), CreatePinnedItemPlannerModule (copy), DataPrefetchControllerModule (copy), ScrollAnchorModule (copy), ScrollPolicyModule (copy), ListRowsModule (copy), SlotBinderModule (copy), PlacementTypesModule (copy), DiagnosticsModule (copy), DataSourceChangeTypeModule (copy), Frozen (copy), PaginationEdgesModule (copy), DataPrefetchModule (copy), ScrollObservationKindModule (copy), AutoScrollModule (copy), ScrollAlignmentModule (copy), AutoScrollTargetModule (copy)
	local DataSource = p1.dataSource
	local Layout = p1.layout
	local IsItemStickyHeader = p1.isItemStickyHeader
	local PinnedStartItem = p1.pinnedStartItem
	local PinnedEndItem = p1.pinnedEndItem
	local IsPreserveScrollPositionOnChange = p1.preserveScrollPositionOnChange ~= false
	local DataPrefetch = p1.dataPrefetch
	local HasIsItemStickyHeader: boolean = IsItemStickyHeader ~= nil or PinnedStartItem ~= nil or PinnedEndItem ~= nil
	local ViewportModuleResult = ViewportModule({
		layout = Layout,
		overscan = p1.overscan,
		contentAlignment = p1.contentAlignment,
		endThreshold = p1.endThreshold
	})
	local PinnedStartItem1 = PinnedStartItem
	local Config = if PinnedStartItem1 == nil then nil else { key = PinnedStartItem1.key }
	local PinnedEndItem1 = PinnedEndItem
	local PinnedItemPlannerModule = CreatePinnedItemPlannerModule(DataSource, {
		isItemStickyKey = IsItemStickyHeader,
		pinnedStartItem = Config,
		pinnedEndItem = if PinnedEndItem1 == nil then nil else { key = PinnedEndItem1.key }
	})
	local DataPrefetchControllerModuleResult = DataPrefetchControllerModule(DataPrefetch)
	local ScrollAnchorModuleResult = ScrollAnchorModule({
		viewport = ViewportModuleResult,
		getItemSequence = function() --[[ Line: 198 ]]
			-- upvalues: DataSource (ref)
			return DataSource
		end,
		shouldPreserveUserPosition = function() --[[ Line: 201 ]]
			-- upvalues: IsPreserveScrollPositionOnChange (ref)
			return IsPreserveScrollPositionOnChange
		end
	})
	local ScrollPolicyModuleResult = ScrollPolicyModule({
		initialScrollAlignment = p1.initialScrollAlignment,
		autoScrollOnChange = p1.autoScrollOnChange,
		autoScrollThreshold = p1.autoScrollThreshold,
		startReachedThreshold = p1.startReachedThreshold,
		startReachedEnabled = p1.startReachedEnabled == true,
		endReachedEnabled = p1.endReachedEnabled == true
	})
	local ListRowsModuleResult = ListRowsModule({
		slotBinder = SlotBinderModule({
			recyclingScope = p1.recyclingScope,
			prepareDesiredAssignment = p1.prepareDesiredAssignment
		}),
		getItemViewType = p1.getItemViewType,
		getPinnedItem = function(Start) --[[ Line: 212 ]]
			-- upvalues: PlacementTypesModule (upval), PinnedStartItem (ref), PinnedEndItem (ref)
			return if Start == PlacementTypesModule.PinnedPosition.Start then PinnedStartItem else PinnedEndItem
		end
	})
	local Flag = false
	local ActiveMutation = true
	local Flag1 = false
	local Flag2 = false
	local SubscribeResult: (() -> ())? = nil
	local v1 = nil
	
	local function _(p2, p3) --[[ Line: 224 | Named "addDiagnostic" ]]
		if table.isfrozen(p2.diagnostics) then
			p2.diagnostics = {}
		end
		table.insert(p2.diagnostics, p3)
	end
	
	local function applyCorrection(p2, PreserveResult) --[[ Line: 231 ]]
		-- upvalues: ViewportModuleResult (copy), p1 (copy), DiagnosticsModule (upval)
		if PreserveResult == nil then return end
		local ScrollOffset = ViewportModuleResult.getScrollOffset()
		ViewportModuleResult.setScrollOffset(ScrollOffset + PreserveResult.delta)
		local ScrollOffsetDelta = ViewportModuleResult.getScrollOffset() - ScrollOffset
		p2.scrollCorrection += ScrollOffsetDelta
		p2.scrollPositionChanged = true
		p2.scrollPositionFollowsCorrection = true
		
		if p1.diagnostics ~= nil then
			local config = {
				kind = DiagnosticsModule.EventKind.ScrollCorrection,
				source = PreserveResult.source,
				delta = ScrollOffsetDelta
			}
			
			if table.isfrozen(p2.diagnostics) then
				p2.diagnostics = {}
			end
			table.insert(p2.diagnostics, config)
		end
	end
	
	local _ = function(p2) --[[ Line: 250 | Named "moveScrollPosition" ]]
		p2.scrollPositionChanged = true
		p2.scrollPositionFollowsCorrection = false
	end
	
	local _ = function(p2, p3) --[[ Line: 255 | Named "applyPolicyTarget" ]]
		-- upvalues: ScrollAnchorModuleResult (copy), ViewportModuleResult (copy)
		if p3 == nil or not ScrollAnchorModuleResult.allowsPolicyOffset() then return end
		if ViewportModuleResult.scrollTo(p3) ~= ViewportModuleResult.getScrollOffset() then
			p2.scrollPositionChanged = true
			p2.scrollPositionFollowsCorrection = false
		end
	end
	
	local function readKeys() --[[ Line: 265 ]]
		-- upvalues: DataSource (ref)
		local ItemCount = DataSource.getItemCount()
		local Buffer = table.create(ItemCount)
		
		for i = 1, ItemCount do
			Buffer[i] = DataSource.getItemKey(i)
		end
		return Buffer
	end
	
	local _ = function(Keys) --[[ Line: 274 | Named "resetLayout" ]]
		-- upvalues: Layout (ref), DataSourceChangeTypeModule (upval), ViewportModuleResult (copy)
		Layout.applyDataSourceChange({ type = DataSourceChangeTypeModule.Reset, keys = Keys })
		ViewportModuleResult.refresh()
	end
	
	local v2 = nil
	
	local _ = function() --[[ Line: 281 | Named "unsubscribe" ]]
		-- upvalues: SubscribeResult (ref)
		if SubscribeResult ~= nil then
			SubscribeResult()
			SubscribeResult = nil
		end
	end
	
	local t = {}
	
	local _ = function() --[[ Line: 291 | Named "beginTransaction" ]]
		-- upvalues: t (copy), ViewportModuleResult (copy), Frozen (upval)
		t.policyEligible = true
		t.dataChange = nil
		t.before = nil
		t.replaced = false
		t.viewportChanged = false
		t.scrollMoved = false
		t.contentLengthBefore = ViewportModuleResult.getContentLength()
		t.scrollCorrection = 0
		t.scrollPositionChanged = false
		t.scrollPositionFollowsCorrection = false
		t.contentLengthChanged = false
		t.startReached = false
		t.endReached = false
		t.entered = Frozen
		t.updated = Frozen
		t.departed = Frozen
		t.dataPrefetchRequests = Frozen
		t.diagnostics = Frozen
		
		return t
	end
	
	local _ = function(p2, p3) --[[ Line: 314 | Named "checkEdges" ]]
		-- upvalues: ScrollPolicyModuleResult (copy), ViewportModuleResult (copy), DataSource (ref)
		local CheckEdgesResult, CheckEdgesResult2 = ScrollPolicyModuleResult.checkEdges(ViewportModuleResult.scrollState(), DataSource.getItemCount(), p3)
		p2.startReached = p2.startReached or CheckEdgesResult
		p2.endReached = p2.endReached or CheckEdgesResult2
	end
	
	local _ = function() --[[ Line: 320 | Named "policyContext" ]]
		-- upvalues: DataSource (ref), ViewportModuleResult (copy)
		return {
			itemCount = DataSource.getItemCount(),
			scrollState = ViewportModuleResult.scrollState(),
			getScrollOffsetForItem = ViewportModuleResult.offsetForItem
		}
	end
	
	local function settlePolicy(p2) --[[ Line: 328 ]]
		-- upvalues: ViewportModuleResult (copy), ScrollPolicyModuleResult (copy), ScrollAnchorModuleResult (copy), DataSource (ref), PaginationEdgesModule (upval)
		if ViewportModuleResult.getContentLength() ~= p2.contentLengthBefore then
			p2.contentLengthChanged = true
			local ContentLengthChangedResult = ScrollPolicyModuleResult.contentLengthChanged(ViewportModuleResult.scrollState())
			
			if ContentLengthChangedResult ~= nil and ScrollAnchorModuleResult.allowsPolicyOffset() and ViewportModuleResult.scrollTo(ContentLengthChangedResult) ~= ViewportModuleResult.getScrollOffset() then
				p2.scrollPositionChanged = true
				p2.scrollPositionFollowsCorrection = false
			end
		end
		local DataChange = p2.dataChange
		
		if DataChange == nil then
			if p2.replaced then
				local DataReplacedResult = ScrollPolicyModuleResult.dataReplaced({
					itemCount = DataSource.getItemCount(),
					scrollState = ViewportModuleResult.scrollState(),
					getScrollOffsetForItem = ViewportModuleResult.offsetForItem
				})
				
				if DataReplacedResult ~= nil and ScrollAnchorModuleResult.allowsPolicyOffset() and ViewportModuleResult.scrollTo(DataReplacedResult) ~= ViewportModuleResult.getScrollOffset() then
					p2.scrollPositionChanged = true
					p2.scrollPositionFollowsCorrection = false
				end
				ScrollPolicyModuleResult.observe(ViewportModuleResult.scrollState())
			end
			if p2.viewportChanged then
				local ViewportChangedResult = ScrollPolicyModuleResult.viewportChanged({
					itemCount = DataSource.getItemCount(),
					scrollState = ViewportModuleResult.scrollState(),
					getScrollOffsetForItem = ViewportModuleResult.offsetForItem
				})
				
				if ViewportChangedResult ~= nil and ScrollAnchorModuleResult.allowsPolicyOffset() and ViewportModuleResult.scrollTo(ViewportChangedResult) ~= ViewportModuleResult.getScrollOffset() then
					p2.scrollPositionChanged = true
					p2.scrollPositionFollowsCorrection = false
				end
				ScrollPolicyModuleResult.observe(ViewportModuleResult.scrollState())
			elseif p2.scrollMoved then
				ScrollPolicyModuleResult.observe(ViewportModuleResult.scrollState())
			end
			if ScrollPolicyModuleResult.reachesEdges() then
				local CheckEdgesResult1, CheckEdgesResult2_1 = ScrollPolicyModuleResult.checkEdges(ViewportModuleResult.scrollState(), DataSource.getItemCount(), false)
				p2.startReached = p2.startReached or CheckEdgesResult1
				p2.endReached = p2.endReached or CheckEdgesResult2_1
			end
			return
		else
			local DataChangedResult = ScrollPolicyModuleResult.dataChanged({
				itemCount = DataSource.getItemCount(),
				scrollState = ViewportModuleResult.scrollState(),
				getScrollOffsetForItem = ViewportModuleResult.offsetForItem
			}, DataChange, p2.before)
			
			if DataChangedResult ~= nil and ScrollAnchorModuleResult.allowsPolicyOffset() and ViewportModuleResult.scrollTo(DataChangedResult) ~= ViewportModuleResult.getScrollOffset() then
				p2.scrollPositionChanged = true
				p2.scrollPositionFollowsCorrection = false
			end
			local CheckEdgesResult, CheckEdgesResult2 = ScrollPolicyModuleResult.checkEdges(ViewportModuleResult.scrollState(), DataSource.getItemCount(), (PaginationEdgesModule.hasStructuralChange(DataChange)))
			p2.startReached = p2.startReached or CheckEdgesResult
			p2.endReached = p2.endReached or CheckEdgesResult2
		end
	end
	
	local t1 = {}
	local t2 = {}
	
	local function settle(p2) --[[ Line: 358 ]]
		-- upvalues: ViewportModuleResult (copy), settlePolicy (copy), p1 (copy), DiagnosticsModule (upval), Flag1 (ref), ActiveMutation (ref), t1 (copy), DataSource (ref), Layout (ref), HasIsItemStickyHeader (ref), PinnedItemPlannerModule (copy), ListRowsModuleResult (copy), t2 (copy), DataPrefetch (ref), DataPrefetchControllerModuleResult (copy)
		ViewportModuleResult.refresh()
		
		if p2.policyEligible then
			settlePolicy(p2)
		end
		local UpdateRangesResult, UpdateRangesResult2 = ViewportModuleResult.updateRanges()
		
		if p1.diagnostics ~= nil then
			if UpdateRangesResult then
				local VisibleRange = ViewportModuleResult.getVisibleRange()
				local config = {
					kind = DiagnosticsModule.EventKind.RangeChanged,
					rangeKind = DiagnosticsModule.RangeKind.Visible,
					firstIndex = VisibleRange.firstIndex,
					lastIndex = VisibleRange.lastIndex
				}
				
				if table.isfrozen(p2.diagnostics) then
					p2.diagnostics = {}
				end
				table.insert(p2.diagnostics, config)
			end
			if UpdateRangesResult2 then
				local MountedRange = ViewportModuleResult.getMountedRange()
				local config = {
					kind = DiagnosticsModule.EventKind.RangeChanged,
					rangeKind = DiagnosticsModule.RangeKind.Rendered,
					firstIndex = MountedRange.firstIndex,
					lastIndex = MountedRange.lastIndex
				}
				
				if table.isfrozen(p2.diagnostics) then
					p2.diagnostics = {}
				end
				table.insert(p2.diagnostics, config)
			end
		end
		if Flag1 then return end
		if ActiveMutation then
			local ScrollOffset = ViewportModuleResult.getScrollOffset()
			local ContentStartOffset = ViewportModuleResult.getContentStartOffset()
			t1.dataSource = DataSource
			t1.layout = Layout
			t1.mountedRange = ViewportModuleResult.getMountedRange()
			t1.scrollOffset = ScrollOffset
			t1.contentStartOffset = ContentStartOffset
			t1.plan = if HasIsItemStickyHeader then PinnedItemPlannerModule.update({
				itemSequence = DataSource,
				layout = Layout,
				scrollOffset = ScrollOffset,
				viewportLength = ViewportModuleResult.getLength(),
				contentStartOffset = ContentStartOffset
			}) else nil
			local ApplyResult, ApplyResult2 = ListRowsModuleResult.apply(t1)
			
			if ApplyResult ~= nil then
				p2.entered = ApplyResult.entered
				p2.updated = ApplyResult.updated
				p2.departed = ApplyResult.departed
			end
			if ApplyResult2 ~= nil then
				if table.isfrozen(p2.diagnostics) then
					p2.diagnostics = {}
				end
				table.insert(p2.diagnostics, ApplyResult2)
			end
		elseif ListRowsModuleResult.isApplied() then
			p2.departed = ListRowsModuleResult.release()
		end
		t2.itemSequence = DataSource
		t2.mountedRange = ViewportModuleResult.getMountedRange()
		t2.options = DataPrefetch
		p2.dataPrefetchRequests = DataPrefetchControllerModuleResult.reconcile(t2)
	end
	
	local v3 = nil
	
	local _ = function(Tbl) --[[ Line: 426 | Named "frozen" ]]
		return if table.isfrozen(Tbl) then Tbl else table.freeze(Tbl)
	end
	
	local function makeRecord(p2) --[[ Line: 430 ]]
		-- upvalues: v1 (ref), ListRowsModuleResult (copy), ViewportModuleResult (copy), Layout (ref), ScrollAnchorModuleResult (copy)
		local v4 = v1
		local Entered = p2.entered
		local Entered1 = if table.isfrozen(Entered) then Entered else table.freeze(Entered)
		local Updated = p2.updated
		local Updated1 = if table.isfrozen(Updated) then Updated else table.freeze(Updated)
		local Departed = p2.departed
		local Departed1 = if table.isfrozen(Departed) then Departed else table.freeze(Departed)
		local Diagnostics = p2.diagnostics
		
		return (table.freeze({
			mountedViews = ListRowsModuleResult.getMountedViews(),
			entered = Entered1,
			updated = Updated1,
			departed = Departed1,
			visibleRange = ViewportModuleResult.getVisibleRange(),
			mountedRange = ViewportModuleResult.getMountedRange(),
			scrollState = ViewportModuleResult.scrollState(if v4 == nil then nil else v4.scrollState),
			contentStartOffset = ViewportModuleResult.getContentStartOffset(),
			contentLength = ViewportModuleResult.getContentLength(),
			requiresItemMeasurement = Layout.requiresItemMeasurement(),
			scrollCorrection = p2.scrollCorrection,
			scrollPositionChanged = p2.scrollPositionChanged,
			scrollPositionFollowsCorrection = p2.scrollPositionFollowsCorrection,
			scrollAnchor = ScrollAnchorModuleResult.getAnchoredItem(),
			contentLengthChanged = p2.contentLengthChanged,
			startReached = p2.startReached,
			endReached = p2.endReached,
			dataPrefetchRequests = p2.dataPrefetchRequests,
			diagnostics = if table.isfrozen(Diagnostics) then Diagnostics else table.freeze(Diagnostics)
		}))
	end
	
	local function mutateAndSettle(Callback: (any, any, any) -> (), p2, p3, p4) --[[ Line: 455 ]]
		-- upvalues: settle (copy)
		Callback(p2, p3, p4)
		settle(p2)
	end
	
	local function transact(ScrollToEdgeMutation, End, p2) --[[ Line: 461 ]]
		-- upvalues: Flag2 (ref), Flag1 (ref), t (copy), ViewportModuleResult (copy), Frozen (upval), mutateAndSettle (copy), v1 (ref), makeRecord (copy), p1 (copy)
		assert(not Flag2, "Virtualizer: cannot mutate during a transaction")
		assert(not Flag1, "Virtualizer: cannot dispatch after destruction")
		Flag2 = true
		t.policyEligible = true
		t.dataChange = nil
		t.before = nil
		t.replaced = false
		t.viewportChanged = false
		t.scrollMoved = false
		t.contentLengthBefore = ViewportModuleResult.getContentLength()
		t.scrollCorrection = 0
		t.scrollPositionChanged = false
		t.scrollPositionFollowsCorrection = false
		t.contentLengthChanged = false
		t.startReached = false
		t.endReached = false
		t.entered = Frozen
		t.updated = Frozen
		t.departed = Frozen
		t.dataPrefetchRequests = Frozen
		t.diagnostics = Frozen
		local Success, Result = pcall(mutateAndSettle, ScrollToEdgeMutation, t, End, p2)
		Flag2 = false
		
		if not Success then
			error(Result, 0)
		end
		local v4 = v1
		local Record = makeRecord(t)
		v1 = Record
		
		if p1.diagnostics ~= nil then
			for _, diagnostic in Record.diagnostics do
				p1.diagnostics(diagnostic)
			end
		end
		if p1.onTransaction ~= nil then
			p1.onTransaction(v4, Record)
		end
		return Record
	end
	
	local function applyDataChange(p3, DataChange) --[[ Line: 485 ]]
		-- upvalues: ViewportModuleResult (copy), ListRowsModuleResult (copy), applyCorrection (copy), ScrollAnchorModuleResult (copy), DiagnosticsModule (upval), Layout (ref), PinnedItemPlannerModule (copy)
		p3.before = ViewportModuleResult.scrollState()
		p3.dataChange = DataChange
		ListRowsModuleResult.noteDataChange(DataChange)
		local ApplyDataSourceChangeResult = false
		applyCorrection(p3, ScrollAnchorModuleResult.preserve({
			source = DiagnosticsModule.ScrollCorrectionSource.Data,
			dataSourceChange = DataChange
		}, function() --[[ Line: 495 ]]
			-- upvalues: DataChange (copy), ApplyDataSourceChangeResult (ref), Layout (upval), PinnedItemPlannerModule (upval), ViewportModuleResult (upval)
			for _, change in DataChange.changes do
				ApplyDataSourceChangeResult = Layout.applyDataSourceChange(change) or ApplyDataSourceChangeResult
			end
			PinnedItemPlannerModule.applyDataSourceChange(DataChange)
			ViewportModuleResult.refresh()
		end))
		
		if ApplyDataSourceChangeResult then
			ListRowsModuleResult.invalidateLayout()
		end
	end
	
	v3 = function(p4) --[[ Line: 508 ]]
		-- upvalues: transact (copy), applyDataChange (copy)
		transact(applyDataChange, p4)
	end
	
	v2 = function() --[[ Line: 512 ]]
		-- upvalues: SubscribeResult (ref), Flag (ref), Flag1 (ref), DataSource (ref), v3 (ref)
		if SubscribeResult == nil and Flag and not Flag1 then
			SubscribeResult = DataSource.subscribe(v3)
		end
	end
	
	local _ = function(DataSource1) --[[ Line: 518 | Named "replaceDataSource" ]]
		-- upvalues: DataSource (ref), SubscribeResult (ref), PinnedItemPlannerModule (copy)
		if DataSource1 ~= DataSource then
			if SubscribeResult ~= nil then
				SubscribeResult()
				SubscribeResult = nil
			end
			DataSource = DataSource1
		end
		PinnedItemPlannerModule.setItemSequence(DataSource)
	end
	
	local _ = function(p4) --[[ Line: 526 | Named "replaceLayout" ]]
		-- upvalues: Layout (ref), ViewportModuleResult (copy), ListRowsModuleResult (copy)
		Layout = p4
		ViewportModuleResult.setLayout(p4)
		local CrossAxisLength: number = ViewportModuleResult.getCrossAxisLength()
		
		if CrossAxisLength > 0 then
			p4.setViewportCrossAxisLength(CrossAxisLength)
		end
		ListRowsModuleResult.invalidateLayout()
	end
	
	local _ = function() --[[ Line: 536 | Named "resetData" ]]
		-- upvalues: ScrollAnchorModuleResult (copy), readKeys (copy), Layout (ref), DataSourceChangeTypeModule (upval), ViewportModuleResult (copy), ListRowsModuleResult (copy), v2 (ref)
		ScrollAnchorModuleResult.reset()
		Layout.applyDataSourceChange({
			type = DataSourceChangeTypeModule.Reset,
			keys = readKeys()
		})
		ViewportModuleResult.refresh()
		ListRowsModuleResult.invalidateKeys()
		ListRowsModuleResult.invalidatePayloads()
		v2()
	end
	
	local function submitMeasurements(p4, p5) --[[ Line: 544 ]]
		-- upvalues: ListRowsModuleResult (copy), p1 (copy), DiagnosticsModule (upval), PinnedItemPlannerModule (copy), applyCorrection (copy), ScrollAnchorModuleResult (copy), Layout (ref), ViewportModuleResult (copy)
		local ValidateResult, ValidateResult2 = ListRowsModuleResult.validate(p5)
		
		if #ValidateResult > 0 and p1.diagnostics ~= nil then
			local config1 = {
				kind = DiagnosticsModule.EventKind.MeasurementsProcessingStarted,
				submitted = #ValidateResult,
				boundaryDropped = ValidateResult2
			}
			
			if table.isfrozen(p4.diagnostics) then
				p4.diagnostics = {}
			end
			table.insert(p4.diagnostics, config1)
		end
		local Count = 0
		local Flag = false
		local v5 = nil
		local config = {
			preserveStartAnchor = true,
			startInsetDelta = 0,
			source = DiagnosticsModule.ScrollCorrectionSource.Measurement
		}
		local Start = PinnedItemPlannerModule.getContentInsets().start
		applyCorrection(p4, ScrollAnchorModuleResult.preserve(config, function() --[[ Line: 564 ]]
			-- upvalues: ValidateResult (copy), Layout (upval), Count (ref), ValidateResult2 (ref), Flag (ref), PinnedItemPlannerModule (upval), v5 (ref), config (copy), Start (copy), ViewportModuleResult (upval)
			for _, value in ValidateResult do
				local Index = value.index
				
				if Index == nil then
					if value.pinnedPosition == nil then
						ValidateResult2 += 1
						continue
					else
						local UpdatePinnedMeasurementResult = PinnedItemPlannerModule.updatePinnedMeasurement(value.pinnedPosition, value.key, value.pinnedRevision, value.length)
						
						if UpdatePinnedMeasurementResult == nil then
							ValidateResult2 += 1
							continue
						else
							Count += 1
							v5 = UpdatePinnedMeasurementResult
							continue
						end
					end
				else
					local UpdateItemMeasurementResult = Layout.updateItemMeasurement({
						itemIndex = Index,
						itemKey = value.key,
						length = value.length
					})
					
					if UpdateItemMeasurementResult.accepted then
						Count += 1
					else
						ValidateResult2 += 1
					end
					Flag = Flag or UpdateItemMeasurementResult.geometryChanged
				end
			end
			if v5 ~= nil then
				config.startInsetDelta = v5.start - Start
				ViewportModuleResult.setInsets(v5.start, v5.finish)
				Flag = true
			end
			ViewportModuleResult.refresh()
		end))
		
		if p1.diagnostics ~= nil and #ValidateResult > 0 then
			local config2 = {
				kind = DiagnosticsModule.EventKind.MeasurementsProcessed,
				accepted = Count,
				dropped = ValidateResult2
			}
			
			if table.isfrozen(p4.diagnostics) then
				p4.diagnostics = {}
			end
			table.insert(p4.diagnostics, config2)
		end
		if Flag then
			ListRowsModuleResult.invalidateLayout()
		end
	end
	
	local function setPolicy(p6) --[[ Line: 619 ]]
		-- upvalues: DataPrefetchModule (upval), ViewportModuleResult (copy), IsPreserveScrollPositionOnChange (ref), DataPrefetch (ref), IsItemStickyHeader (ref), PinnedStartItem (ref), PinnedEndItem (ref), PinnedItemPlannerModule (copy), HasIsItemStickyHeader (ref), ScrollPolicyModuleResult (copy)
		DataPrefetchModule.resolve(p6.dataPrefetch)
		local PinnedItems = p6.pinnedItems
		ViewportModuleResult.setOverscan(p6.overscan)
		ViewportModuleResult.setContentAlignment(p6.contentAlignment)
		ViewportModuleResult.setEndThreshold(p6.endThreshold)
		IsPreserveScrollPositionOnChange = p6.preserveScrollPositionOnChange ~= false
		DataPrefetch = p6.dataPrefetch
		IsItemStickyHeader = PinnedItems.isItemStickyHeader
		PinnedStartItem = PinnedItems.pinnedStartItem
		PinnedEndItem = PinnedItems.pinnedEndItem
		local PinnedStartItem1 = PinnedStartItem
		local Config = if PinnedStartItem1 == nil then nil else { key = PinnedStartItem1.key }
		local PinnedEndItem1 = PinnedEndItem
		
		if PinnedItemPlannerModule.setOptions({
			isItemStickyKey = IsItemStickyHeader,
			pinnedStartItem = Config,
			pinnedEndItem = if PinnedEndItem1 == nil then nil else { key = PinnedEndItem1.key }
		}) then
			local ContentInsets = PinnedItemPlannerModule.getContentInsets()
			ViewportModuleResult.setInsets(ContentInsets.start, ContentInsets.finish)
		end
		HasIsItemStickyHeader = IsItemStickyHeader ~= nil or PinnedStartItem ~= nil or PinnedEndItem ~= nil
		ScrollPolicyModuleResult.configure({
			initialScrollAlignment = p6.initialScrollAlignment,
			autoScrollOnChange = p6.autoScrollOnChange,
			autoScrollThreshold = p6.autoScrollThreshold,
			startReachedThreshold = p6.startReachedThreshold,
			startReachedEnabled = p6.startReachedEnabled == true,
			endReachedEnabled = p6.endReachedEnabled == true
		})
	end
	
	local function setActiveMutation(p6, Value) --[[ Line: 644 ]]
		-- upvalues: ActiveMutation (ref), ListRowsModuleResult (copy)
		p6.policyEligible = false
		
		if Value and not ActiveMutation then
			ListRowsModuleResult.invalidatePayloads()
		end
		ActiveMutation = Value
	end
	
	local function setScrollOffsetMutation(_, p6) --[[ Line: 652 ]]
		-- upvalues: ViewportModuleResult (copy), ScrollAnchorModuleResult (copy)
		if ViewportModuleResult.setScrollOffset(p6) then
			ScrollAnchorModuleResult.setViewport(p6)
		end
	end
	
	local function observeScrollOffsetMutation(p6, p7) --[[ Line: 658 ]]
		-- upvalues: ViewportModuleResult (copy), ScrollObservationKindModule (upval), ScrollAnchorModuleResult (copy)
		local SetScrollOffsetResult = ViewportModuleResult.setScrollOffset(p7.offset)
		
		if p7.kind == ScrollObservationKindModule.Programmatic then
			ScrollAnchorModuleResult.observeHost(p7.offset)
		elseif SetScrollOffsetResult then
			ScrollAnchorModuleResult.setViewport(p7.offset)
		end
		if p7.kind == ScrollObservationKindModule.User then
			p6.scrollMoved = true
		end
	end
	
	local function scrollToIndexMutation(p6, p7, p8) --[[ Line: 670 ]]
		-- upvalues: ScrollAnchorModuleResult (copy), ViewportModuleResult (copy)
		ScrollAnchorModuleResult.setItemTarget(p7, p8)
		ViewportModuleResult.scrollTo(ViewportModuleResult.offsetForItem(p7, p8))
		p6.scrollPositionChanged = true
		p6.scrollPositionFollowsCorrection = false
		p6.scrollMoved = true
	end
	
	local function scrollToOffsetMutation(p6, p7) --[[ Line: 677 ]]
		-- upvalues: ScrollAnchorModuleResult (copy), ViewportModuleResult (copy)
		ScrollAnchorModuleResult.setViewport(ViewportModuleResult.scrollTo(p7))
		p6.scrollPositionChanged = true
		p6.scrollPositionFollowsCorrection = false
		p6.scrollMoved = true
	end
	
	local function scrollByMutation(p6, p7) --[[ Line: 683 ]]
		-- upvalues: ScrollAnchorModuleResult (copy), ViewportModuleResult (copy)
		ScrollAnchorModuleResult.setViewport(ViewportModuleResult.scrollBy(p7))
		p6.scrollPositionChanged = true
		p6.scrollPositionFollowsCorrection = false
		p6.scrollMoved = true
	end
	
	local function scrollToEdgeMutation(p6, p7) --[[ Line: 691 ]]
		-- upvalues: ScrollAnchorModuleResult (copy), ViewportModuleResult (copy), AutoScrollModule (upval), ScrollPolicyModuleResult (copy)
		ScrollAnchorModuleResult.setViewport(ViewportModuleResult.scrollTo(AutoScrollModule.getTargetOffset(p7, ViewportModuleResult.getContentLength(), ViewportModuleResult.getLength())))
		ScrollPolicyModuleResult.pin(p7)
		p6.scrollPositionChanged = true
		p6.scrollPositionFollowsCorrection = false
	end
	
	local function setViewportSizeMutation(p6, Length, p7) --[[ Line: 699 ]]
		-- upvalues: ViewportModuleResult (copy), Layout (ref), ListRowsModuleResult (copy), ScrollAlignmentModule (upval), ScrollAnchorModuleResult (copy)
		local Length1: number = ViewportModuleResult.getLength()
		local ContentLengthDelta = ViewportModuleResult.getContentLength() - Length1 - ViewportModuleResult.getScrollOffset()
		
		if ViewportModuleResult.setSize(Length, p7) then
			if Layout.setViewportCrossAxisLength(p7) then
				ListRowsModuleResult.invalidateLayout()
			end
			if Length1 > 0 and Length ~= Length1 and ViewportModuleResult.getContentAlignment() == ScrollAlignmentModule.End and ScrollAnchorModuleResult.allowsPolicyOffset() then
				ViewportModuleResult.refresh()
				local ScrollToResult = ViewportModuleResult.scrollTo(ViewportModuleResult.getContentLength() - Length - math.max(0, ContentLengthDelta))
				
				if ScrollToResult ~= ViewportModuleResult.getScrollOffset() then
					ScrollAnchorModuleResult.setViewport(ScrollToResult)
					p6.scrollPositionChanged = true
					p6.scrollPositionFollowsCorrection = false
				end
			end
		end
		p6.viewportChanged = true
	end
	
	t.policyEligible = true
	t.dataChange = nil
	t.before = nil
	t.replaced = false
	t.viewportChanged = false
	t.scrollMoved = false
	t.contentLengthBefore = ViewportModuleResult.getContentLength()
	t.scrollCorrection = 0
	t.scrollPositionChanged = false
	t.scrollPositionFollowsCorrection = false
	t.contentLengthChanged = false
	t.startReached = false
	t.endReached = false
	t.entered = Frozen
	t.updated = Frozen
	t.departed = Frozen
	t.dataPrefetchRequests = Frozen
	t.diagnostics = Frozen
	v1 = makeRecord(t)
	
	return {
		activate = function() --[[ Line: 728 ]]
			-- upvalues: transact (copy), Flag (ref), readKeys (copy), Layout (ref), DataSourceChangeTypeModule (upval), ViewportModuleResult (copy), PinnedItemPlannerModule (copy), ListRowsModuleResult (copy), v2 (ref)
			return (transact(function(p6) --[[ Line: 729 ]]
				-- upvalues: Flag (upval), readKeys (upval), Layout (upval), DataSourceChangeTypeModule (upval), ViewportModuleResult (upval), PinnedItemPlannerModule (upval), ListRowsModuleResult (upval), v2 (upval)
				if not Flag then
					Flag = true
					local Keys = readKeys()
					Layout.applyDataSourceChange({ type = DataSourceChangeTypeModule.Reset, keys = Keys })
					ViewportModuleResult.refresh()
					PinnedItemPlannerModule.applyDataSourceChange({
						changes = { { type = DataSourceChangeTypeModule.Reset, keys = Keys } },
						previousItemCount = #Keys,
						itemCount = #Keys
					})
					ListRowsModuleResult.invalidateKeys()
					v2()
				end
				p6.viewportChanged = true
			end))
		end,
		setActive = function(p6) --[[ Line: 745 ]]
			-- upvalues: transact (copy), setActiveMutation (copy)
			return (transact(setActiveMutation, p6))
		end,
		setScrollOffset = function(Offset) --[[ Line: 748 ]]
			-- upvalues: transact (copy), setScrollOffsetMutation (copy)
			return (transact(setScrollOffsetMutation, Offset))
		end,
		observeScrollOffset = function(p6) --[[ Line: 751 ]]
			-- upvalues: transact (copy), observeScrollOffsetMutation (copy)
			return (transact(observeScrollOffsetMutation, p6))
		end,
		scrollToIndex = function(p6, p7) --[[ Line: 754 ]]
			-- upvalues: transact (copy), scrollToIndexMutation (copy)
			return (transact(scrollToIndexMutation, p6, p7))
		end,
		scrollToOffset = function(p6) --[[ Line: 757 ]]
			-- upvalues: transact (copy), scrollToOffsetMutation (copy)
			return (transact(scrollToOffsetMutation, p6))
		end,
		scrollToStart = function() --[[ Line: 760 ]]
			-- upvalues: transact (copy), scrollToEdgeMutation (copy), AutoScrollTargetModule (upval)
			return (transact(scrollToEdgeMutation, AutoScrollTargetModule.Start))
		end,
		scrollToEnd = function() --[[ Line: 763 ]]
			-- upvalues: transact (copy), scrollToEdgeMutation (copy), AutoScrollTargetModule (upval)
			return (transact(scrollToEdgeMutation, AutoScrollTargetModule.End))
		end,
		scrollBy = function(p6) --[[ Line: 766 ]]
			-- upvalues: transact (copy), scrollByMutation (copy)
			return (transact(scrollByMutation, p6))
		end,
		restoreScrollAnchorSnapshot = function(p6) --[[ Line: 769 ]]
			-- upvalues: transact (copy), ScrollAnchorModuleResult (copy), ViewportModuleResult (copy)
			return (transact(function(p7) --[[ Line: 770 ]]
				-- upvalues: ScrollAnchorModuleResult (upval), p6 (copy), ViewportModuleResult (upval)
				ScrollAnchorModuleResult.restore(p6, ViewportModuleResult.scrollTo(ScrollAnchorModuleResult.snapshotOffset(p6)))
				p7.scrollPositionChanged = true
				p7.scrollPositionFollowsCorrection = false
				p7.scrollMoved = true
			end))
		end,
		setViewportSize = function(p6, p7) --[[ Line: 776 ]]
			-- upvalues: transact (copy), setViewportSizeMutation (copy)
			return (transact(setViewportSizeMutation, p6, p7))
		end,
		setPolicy = function(p6) --[[ Line: 779 ]]
			-- upvalues: transact (copy), setPolicy (copy)
			return (transact(function() --[[ Line: 780 ]]
				-- upvalues: setPolicy (upval), p6 (copy)
				setPolicy(p6)
			end))
		end,
		setDataSource = function(DataSource1) --[[ Line: 784 ]]
			-- upvalues: transact (copy), DataSource (ref), SubscribeResult (ref), PinnedItemPlannerModule (copy), ScrollAnchorModuleResult (copy), readKeys (copy), Layout (ref), DataSourceChangeTypeModule (upval), ViewportModuleResult (copy), ListRowsModuleResult (copy), v2 (ref)
			return (transact(function(p6) --[[ Line: 785 ]]
				-- upvalues: DataSource1 (copy), DataSource (upval), SubscribeResult (upval), PinnedItemPlannerModule (upval), ScrollAnchorModuleResult (upval), readKeys (upval), Layout (upval), DataSourceChangeTypeModule (upval), ViewportModuleResult (upval), ListRowsModuleResult (upval), v2 (upval)
				if DataSource1 ~= DataSource then
					if SubscribeResult ~= nil then
						SubscribeResult()
						SubscribeResult = nil
					end
					DataSource = DataSource1
				end
				PinnedItemPlannerModule.setItemSequence(DataSource)
				ScrollAnchorModuleResult.reset()
				Layout.applyDataSourceChange({
					type = DataSourceChangeTypeModule.Reset,
					keys = readKeys()
				})
				ViewportModuleResult.refresh()
				ListRowsModuleResult.invalidateKeys()
				ListRowsModuleResult.invalidatePayloads()
				v2()
				p6.replaced = true
			end))
		end,
		setLayout = function(p6) --[[ Line: 791 ]]
			-- upvalues: transact (copy), Layout (ref), ViewportModuleResult (copy), ListRowsModuleResult (copy), ScrollAnchorModuleResult (copy), readKeys (copy), DataSourceChangeTypeModule (upval)
			return (transact(function() --[[ Line: 792 ]]
				-- upvalues: p6 (copy), Layout (upval), ViewportModuleResult (upval), ListRowsModuleResult (upval), ScrollAnchorModuleResult (upval), readKeys (upval), DataSourceChangeTypeModule (upval)
				Layout = p6
				ViewportModuleResult.setLayout(p6)
				local CrossAxisLength: number = ViewportModuleResult.getCrossAxisLength()
				
				if CrossAxisLength > 0 then
					p6.setViewportCrossAxisLength(CrossAxisLength)
				end
				ListRowsModuleResult.invalidateLayout()
				ScrollAnchorModuleResult.reset()
				Layout.applyDataSourceChange({
					type = DataSourceChangeTypeModule.Reset,
					keys = readKeys()
				})
				ViewportModuleResult.refresh()
			end))
		end,
		setDataSourceAndLayout = function(DataSource1, p6) --[[ Line: 798 ]]
			-- upvalues: transact (copy), DataSource (ref), SubscribeResult (ref), PinnedItemPlannerModule (copy), Layout (ref), ViewportModuleResult (copy), ListRowsModuleResult (copy), ScrollAnchorModuleResult (copy), readKeys (copy), DataSourceChangeTypeModule (upval), v2 (ref)
			return (transact(function(p7) --[[ Line: 799 ]]
				-- upvalues: DataSource1 (copy), DataSource (upval), SubscribeResult (upval), PinnedItemPlannerModule (upval), p6 (copy), Layout (upval), ViewportModuleResult (upval), ListRowsModuleResult (upval), ScrollAnchorModuleResult (upval), readKeys (upval), DataSourceChangeTypeModule (upval), v2 (upval)
				if DataSource1 ~= DataSource then
					if SubscribeResult ~= nil then
						SubscribeResult()
						SubscribeResult = nil
					end
					DataSource = DataSource1
				end
				PinnedItemPlannerModule.setItemSequence(DataSource)
				Layout = p6
				ViewportModuleResult.setLayout(p6)
				local CrossAxisLength: number = ViewportModuleResult.getCrossAxisLength()
				
				if CrossAxisLength > 0 then
					p6.setViewportCrossAxisLength(CrossAxisLength)
				end
				ListRowsModuleResult.invalidateLayout()
				ScrollAnchorModuleResult.reset()
				Layout.applyDataSourceChange({
					type = DataSourceChangeTypeModule.Reset,
					keys = readKeys()
				})
				ViewportModuleResult.refresh()
				ListRowsModuleResult.invalidateKeys()
				ListRowsModuleResult.invalidatePayloads()
				v2()
				p7.replaced = true
			end))
		end,
		refresh = function() --[[ Line: 806 ]]
			-- upvalues: transact (copy), ListRowsModuleResult (copy)
			return (transact(function() --[[ Line: 807 ]]
				-- upvalues: ListRowsModuleResult (upval)
				ListRowsModuleResult.invalidateKeys()
				ListRowsModuleResult.invalidatePayloads()
			end))
		end,
		submitMeasurements = function(p6) --[[ Line: 812 ]]
			-- upvalues: transact (copy), submitMeasurements (copy)
			return (transact(submitMeasurements, p6))
		end,
		getCurrent = function() --[[ Line: 815 ]]
			-- upvalues: v1 (ref)
			return v1
		end,
		getItemLayout = function(FirstIndex) --[[ Line: 818 ]]
			-- upvalues: Layout (ref)
			return Layout.getItemLayout(FirstIndex)
		end,
		getScrollOffsetForItem = function(p6, p7) --[[ Line: 821 ]]
			-- upvalues: ViewportModuleResult (copy)
			return ViewportModuleResult.offsetForItem(p6, p7)
		end,
		captureScrollAnchorSnapshot = function() --[[ Line: 824 ]]
			-- upvalues: v1 (ref), DataSource (ref), Layout (ref)
			local v6 = v1
			local VisibleRange = v6.visibleRange
			local ScrollOffset = v6.scrollState.scrollOffset
			
			if VisibleRange.firstIndex <= VisibleRange.lastIndex then
				local FirstIndex = VisibleRange.firstIndex
				
				return {
					anchorKey = DataSource.getItemKey(FirstIndex),
					anchorIndex = FirstIndex,
					offsetWithinItem = ScrollOffset - v6.contentStartOffset - Layout.getItemLayout(FirstIndex).startOffset,
					fallbackScrollOffset = ScrollOffset
				}
			else
				return {
					anchorKey = nil,
					anchorIndex = nil,
					offsetWithinItem = 0,
					fallbackScrollOffset = ScrollOffset
				}
			end
		end,
		destroy = function() --[[ Line: 846 ]]
			-- upvalues: Flag1 (ref), transact (copy), SubscribeResult (ref), ListRowsModuleResult (copy), DataPrefetchControllerModuleResult (copy), PinnedItemPlannerModule (copy)
			if not Flag1 then
				transact(function(p6) --[[ Line: 850 ]]
					-- upvalues: SubscribeResult (upval), ListRowsModuleResult (upval), DataPrefetchControllerModuleResult (upval), PinnedItemPlannerModule (upval), Flag1 (upval)
					p6.policyEligible = false
					
					if SubscribeResult ~= nil then
						SubscribeResult()
						SubscribeResult = nil
					end
					p6.departed = ListRowsModuleResult.release()
					ListRowsModuleResult.destroy()
					DataPrefetchControllerModuleResult.destroy()
					PinnedItemPlannerModule.destroy()
					Flag1 = true
				end)
				
				return
			end
		end
	}
end
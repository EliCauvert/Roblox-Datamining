local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact08
local ViewRecycler = script:FindFirstAncestor("ViewRecycler")
local AutoScrollModule = require(ViewRecycler.Core.ViewportBehavior.AutoScroll)
local _ = require(ViewRecycler.Core.Enums.AutoScrollPolicy)
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
local Callback: ((any) -> any)? = nil
local Callback1: ((any) -> any)? = nil
local Callback2: ((any) -> any)? = nil

if FFlagViewRecyclerReact08 then
	Callback = function(p1)
		return {
			preserveScrollPositionOnChange = p1.preserveScrollPositionOnChange ~= false,
			initialScrollAlignment = p1.initialScrollAlignment,
			autoScrollOnChange = p1.autoScrollOnChange,
			autoScrollThreshold = p1.autoScrollThreshold
		}
	end
	
	Callback1 = function(p1)
		return {
			startReachedThreshold = p1.startReachedThreshold,
			startReachedEnabled = p1.startReachedEnabled == true,
			endReachedEnabled = p1.endReachedEnabled == true
		}
	end
else
	Callback2 = function(p1)
		return {
			initialScrollAlignment = p1.initialScrollAlignment,
			autoScrollOnChange = p1.autoScrollOnChange,
			autoScrollThreshold = p1.autoScrollThreshold,
			startReachedThreshold = p1.startReachedThreshold,
			startReachedEnabled = p1.startReachedEnabled == true,
			endReachedEnabled = p1.endReachedEnabled == true
		}
	end
end
local function _(p1)
	return if p1 == nil then nil else { key = p1.key }
end

return function(p1)
	-- upvalues: FFlagViewRecyclerReact08 (copy), ViewportModule (copy), CreatePinnedItemPlannerModule (copy), DataPrefetchControllerModule (copy), ScrollAnchorModule (copy), Callback (ref), PaginationEdgesModule (copy), Callback1 (ref), ScrollPolicyModule (copy), Callback2 (ref), ListRowsModule (copy), SlotBinderModule (copy), PlacementTypesModule (copy), DiagnosticsModule (copy), DataSourceChangeTypeModule (copy), Frozen (copy), DataPrefetchModule (copy), ScrollObservationKindModule (copy), ScrollAlignmentModule (copy), AutoScrollModule (copy), AutoScrollTargetModule (copy)
	local DataSource = p1.dataSource
	local Layout = p1.layout
	local IsItemStickyHeader = p1.isItemStickyHeader
	local PinnedStartItem = p1.pinnedStartItem
	local PinnedEndItem = p1.pinnedEndItem
	local IsPreserveScrollPositionOnChange = if FFlagViewRecyclerReact08 then nil else p1.preserveScrollPositionOnChange ~= false
	local DataPrefetch = p1.dataPrefetch
	local HasIsItemStickyHeader: boolean = IsItemStickyHeader ~= nil or PinnedStartItem ~= nil or PinnedEndItem ~= nil
	local ViewportModuleResult = ViewportModule({
		layout = Layout,
		overscan = p1.overscan,
		contentAlignment = p1.contentAlignment,
		endThreshold = p1.endThreshold
	})
	local Flag: boolean? = nil
	local Callback4: (() -> boolean)? = nil
	
	if FFlagViewRecyclerReact08 then
		Flag = false
		
		Callback4 = function(): boolean
			-- upvalues: Flag (ref), ViewportModuleResult (copy), DataSource (ref)
			return Flag and (ViewportModuleResult.getLength() > 0 and (DataSource.getItemCount() == 0 or ViewportModuleResult.getContentLength() > 0))
		end
	end
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
		getItemSequence = function()
			-- upvalues: DataSource (ref)
			return DataSource
		end,
		isLaidOut = if FFlagViewRecyclerReact08 then Callback4 else nil,
		config = if FFlagViewRecyclerReact08 then Callback(p1) else nil,
		shouldPreserveUserPosition = if FFlagViewRecyclerReact08 then nil else function()
			-- upvalues: IsPreserveScrollPositionOnChange (ref)
			return IsPreserveScrollPositionOnChange
		end
	})
	local CreateResult = nil
	local PrepareDesiredAssignmentFunction = nil
	local v1 = nil
	
	if FFlagViewRecyclerReact08 then
		CreateResult = PaginationEdgesModule.create(Callback1(p1))
		PrepareDesiredAssignmentFunction = p1.prepareDesiredAssignment
	else
		v1 = ScrollPolicyModule(Callback2(p1))
	end
	local ListRowsModuleResult = ListRowsModule({
		slotBinder = SlotBinderModule({
			recyclingScope = p1.recyclingScope,
			name = if FFlagViewRecyclerReact08 then "Virtualizer" else nil,
			prepareDesiredAssignment = if FFlagViewRecyclerReact08 then if PrepareDesiredAssignmentFunction == nil then nil else function(p2)
				-- upvalues: PrepareDesiredAssignmentFunction (ref)
				return PrepareDesiredAssignmentFunction({ key = p2.key, value = p2.value })
			end else p1.prepareDesiredAssignment
		}),
		getItemViewType = p1.getItemViewType,
		getPinnedItem = function(Start)
			-- upvalues: PlacementTypesModule (upval), PinnedStartItem (ref), PinnedEndItem (ref)
			return if Start == PlacementTypesModule.PinnedPosition.Start then PinnedStartItem else PinnedEndItem
		end
	})
	
	if not FFlagViewRecyclerReact08 then
		Flag = false
	end
	local ActiveMutation = true
	local Flag1 = false
	local Flag2 = false
	local SubscribeResult: (() -> ())? = nil
	local v2 = nil
	
	local function _(p2, p3)
		if table.isfrozen(p2.diagnostics) then
			p2.diagnostics = {}
		end
		table.insert(p2.diagnostics, p3)
	end
	
	local function applyCorrection(p2, PreserveResult)
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
	
	local _ = function(p2)
		p2.scrollPositionChanged = true
		p2.scrollPositionFollowsCorrection = false
	end
	
	local Callback6: ((any, any) -> ())? = nil
	local Callback5: ((any, any) -> ())? = nil
	
	if FFlagViewRecyclerReact08 then
		Callback6 = function(p2, ContentLengthDelta)
			-- upvalues: ViewportModuleResult (copy), ScrollAnchorModuleResult (copy)
			local ScrollOffset = ViewportModuleResult.getScrollOffset()
			local ScrollToResult = ViewportModuleResult.scrollTo(ContentLengthDelta)
			ScrollAnchorModuleResult.setViewport(ScrollToResult)
			
			if ScrollToResult ~= ScrollOffset then
				p2.scrollPositionChanged = true
				p2.scrollPositionFollowsCorrection = false
			end
		end
	else
		Callback5 = function(p2, ContentLengthChangedResult)
			-- upvalues: ScrollAnchorModuleResult (copy), ViewportModuleResult (copy)
			if ContentLengthChangedResult == nil or not ScrollAnchorModuleResult.allowsPolicyOffset() then return end
			if ViewportModuleResult.scrollTo(ContentLengthChangedResult) ~= ViewportModuleResult.getScrollOffset() then
				p2.scrollPositionChanged = true
				p2.scrollPositionFollowsCorrection = false
			end
		end
	end
	local function readKeys()
		-- upvalues: DataSource (ref)
		local ItemCount = DataSource.getItemCount()
		local Buffer = table.create(ItemCount)
		
		for i = 1, ItemCount do
			Buffer[i] = DataSource.getItemKey(i)
		end
		return Buffer
	end
	
	local _ = function(Keys)
		-- upvalues: Layout (ref), DataSourceChangeTypeModule (upval), ViewportModuleResult (copy)
		Layout.applyDataSourceChange({ type = DataSourceChangeTypeModule.Reset, keys = Keys })
		ViewportModuleResult.refresh()
	end
	
	local v3 = nil
	
	local _ = function()
		-- upvalues: SubscribeResult (ref)
		if SubscribeResult ~= nil then
			SubscribeResult()
			SubscribeResult = nil
		end
	end
	
	local t = {}
	
	local function beginTransaction()
		-- upvalues: t (copy), FFlagViewRecyclerReact08 (upval), ViewportModuleResult (copy), Frozen (upval)
		if FFlagViewRecyclerReact08 then
			t.settlesScroll = true
		else
			t.policyEligible = true
		end
		t.dataChange = nil
		
		if not FFlagViewRecyclerReact08 then
			t.before = nil
		end
		t.replaced = false
		t.viewportChanged = false
		t.scrollMoved = false
		
		if FFlagViewRecyclerReact08 then
			t.keptDistanceFromEnd = nil
		end
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
	
	local function checkEdges(p2, HasStructuralChange)
		-- upvalues: FFlagViewRecyclerReact08 (upval), CreateResult (ref), Callback4 (ref), ViewportModuleResult (copy), v1 (ref), DataSource (ref)
		local CheckEdgesResult = nil
		local CheckEdgesResult2 = nil
		if FFlagViewRecyclerReact08 then
			if not CreateResult.isEnabled() or not Callback4() then return end
			CheckEdgesResult, CheckEdgesResult2 = CreateResult.check(ViewportModuleResult.scrollState(), HasStructuralChange)
		else
			CheckEdgesResult, CheckEdgesResult2 = v1.checkEdges(ViewportModuleResult.scrollState(), DataSource.getItemCount(), HasStructuralChange)
		end
		p2.startReached = p2.startReached or CheckEdgesResult
		p2.endReached = p2.endReached or CheckEdgesResult2
	end
	
	local moveSettled = nil
	local Callback7: ((any) -> ())? = nil
	local policyContext = nil
	local Callback3: ((any) -> ())? = nil
	
	if FFlagViewRecyclerReact08 then
		moveSettled = function(p2)
			-- upvalues: Callback6 (ref), t (copy)
			Callback6(t, p2)
		end
		
		Callback7 = function(p2)
			-- upvalues: ViewportModuleResult (copy), ScrollAnchorModuleResult (copy), moveSettled (ref), checkEdges (copy), PaginationEdgesModule (upval)
			p2.contentLengthChanged = ViewportModuleResult.getContentLength() ~= p2.contentLengthBefore
			ScrollAnchorModuleResult.settle(p2, moveSettled)
			local DataChange = p2.dataChange
			checkEdges(p2, DataChange ~= nil and PaginationEdgesModule.hasStructuralChange(DataChange))
		end
	else
		policyContext = function()
			-- upvalues: DataSource (ref), ViewportModuleResult (copy)
			return {
				itemCount = DataSource.getItemCount(),
				scrollState = ViewportModuleResult.scrollState(),
				getScrollOffsetForItem = ViewportModuleResult.offsetForItem
			}
		end
		
		Callback3 = function(p2)
			-- upvalues: ViewportModuleResult (copy), Callback5 (ref), v1 (ref), policyContext (ref), checkEdges (copy), PaginationEdgesModule (upval)
			if ViewportModuleResult.getContentLength() ~= p2.contentLengthBefore then
				p2.contentLengthChanged = true
				Callback5(p2, v1.contentLengthChanged(ViewportModuleResult.scrollState()))
			end
			local DataChange = p2.dataChange
			
			if DataChange ~= nil then
				Callback5(p2, v1.dataChanged(policyContext(), p2.before))
				checkEdges(p2, PaginationEdgesModule.hasStructuralChange(DataChange))
				
				return
			end
			if p2.replaced then
				Callback5(p2, v1.dataReplaced(policyContext()))
				v1.observe(ViewportModuleResult.scrollState())
			end
			if p2.viewportChanged then
				Callback5(p2, v1.viewportChanged(policyContext()))
				v1.observe(ViewportModuleResult.scrollState())
			elseif p2.scrollMoved then
				v1.observe(ViewportModuleResult.scrollState())
			end
			if v1.reachesEdges() then
				checkEdges(p2, false)
			end
		end
	end
	local t1 = {}
	local t2 = {}
	
	local function settle(p2)
		-- upvalues: ViewportModuleResult (copy), FFlagViewRecyclerReact08 (upval), Callback7 (ref), Callback3 (ref), p1 (copy), DiagnosticsModule (upval), Flag1 (ref), ActiveMutation (ref), t1 (copy), DataSource (ref), Layout (ref), HasIsItemStickyHeader (ref), PinnedItemPlannerModule (copy), ListRowsModuleResult (copy), t2 (copy), DataPrefetch (ref), DataPrefetchControllerModuleResult (copy)
		ViewportModuleResult.refresh()
		
		if if FFlagViewRecyclerReact08 then p2.settlesScroll else p2.policyEligible then
			if FFlagViewRecyclerReact08 then
				Callback7(p2)
			else
				Callback3(p2)
			end
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
	
	local v4 = nil
	
	local _ = function(Tbl)
		return if table.isfrozen(Tbl) then Tbl else table.freeze(Tbl)
	end
	
	local function makeRecord(p2)
		-- upvalues: v2 (ref), ListRowsModuleResult (copy), ViewportModuleResult (copy), Layout (ref), ScrollAnchorModuleResult (copy)
		local v5 = v2
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
			scrollState = ViewportModuleResult.scrollState(if v5 == nil then nil else v5.scrollState),
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
	
	local function mutateAndSettle(Callback: (any, any, any) -> (), p2, p3, p4)
		-- upvalues: settle (copy)
		Callback(p2, p3, p4)
		settle(p2)
	end
	
	local function transact(ScrollToEdgeMutation, End, p2)
		-- upvalues: Flag2 (ref), Flag1 (ref), beginTransaction (copy), mutateAndSettle (copy), v2 (ref), makeRecord (copy), p1 (copy)
		assert(not Flag2, "Virtualizer: cannot mutate during a transaction")
		assert(not Flag1, "Virtualizer: cannot dispatch after destruction")
		Flag2 = true
		local BeginTransactionResult = beginTransaction()
		local Success, Result = pcall(mutateAndSettle, ScrollToEdgeMutation, BeginTransactionResult, End, p2)
		Flag2 = false
		
		if not Success then
			error(Result, 0)
		end
		local v5 = v2
		local Record = makeRecord(BeginTransactionResult)
		v2 = Record
		
		if p1.diagnostics ~= nil then
			for _, diagnostic in Record.diagnostics do
				p1.diagnostics(diagnostic)
			end
		end
		if p1.onTransaction ~= nil then
			p1.onTransaction(v5, Record)
		end
		return Record
	end
	
	local function applyDataChange(p3, DataChange)
		-- upvalues: FFlagViewRecyclerReact08 (upval), ViewportModuleResult (copy), ListRowsModuleResult (copy), applyCorrection (copy), ScrollAnchorModuleResult (copy), DiagnosticsModule (upval), Layout (ref), PinnedItemPlannerModule (copy)
		if not FFlagViewRecyclerReact08 then
			p3.before = ViewportModuleResult.scrollState()
		end
		p3.dataChange = DataChange
		ListRowsModuleResult.noteDataChange(DataChange)
		local ApplyDataSourceChangeResult = false
		applyCorrection(p3, ScrollAnchorModuleResult.preserve({
			source = DiagnosticsModule.ScrollCorrectionSource.Data,
			dataSourceChange = DataChange
		}, function()
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
	
	v4 = function(p4)
		-- upvalues: transact (copy), applyDataChange (copy)
		transact(applyDataChange, p4)
	end
	
	v3 = function()
		-- upvalues: SubscribeResult (ref), Flag (ref), Flag1 (ref), DataSource (ref), v4 (ref)
		if SubscribeResult == nil and Flag and not Flag1 then
			SubscribeResult = DataSource.subscribe(v4)
		end
	end
	
	local _ = function(DataSource1)
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
	
	local _ = function(p4)
		-- upvalues: Layout (ref), ViewportModuleResult (copy), ListRowsModuleResult (copy)
		Layout = p4
		ViewportModuleResult.setLayout(p4)
		local CrossAxisLength: number = ViewportModuleResult.getCrossAxisLength()
		
		if CrossAxisLength > 0 then
			p4.setViewportCrossAxisLength(CrossAxisLength)
		end
		ListRowsModuleResult.invalidateLayout()
	end
	
	local _ = function()
		-- upvalues: FFlagViewRecyclerReact08 (upval), ScrollAnchorModuleResult (copy), readKeys (copy), Layout (ref), DataSourceChangeTypeModule (upval), ViewportModuleResult (copy), ListRowsModuleResult (copy), v3 (ref)
		if FFlagViewRecyclerReact08 then
			ScrollAnchorModuleResult.dataSourceReplaced()
		else
			ScrollAnchorModuleResult.reset()
		end
		Layout.applyDataSourceChange({
			type = DataSourceChangeTypeModule.Reset,
			keys = readKeys()
		})
		ViewportModuleResult.refresh()
		ListRowsModuleResult.invalidateKeys()
		ListRowsModuleResult.invalidatePayloads()
		v3()
	end
	
	local function submitMeasurements(p4, p5)
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
		local v6 = nil
		local config = {
			preserveStartAnchor = true,
			startInsetDelta = 0,
			source = DiagnosticsModule.ScrollCorrectionSource.Measurement
		}
		local Start = PinnedItemPlannerModule.getContentInsets().start
		applyCorrection(p4, ScrollAnchorModuleResult.preserve(config, function()
			-- upvalues: ValidateResult (copy), Layout (upval), Count (ref), ValidateResult2 (ref), Flag (ref), PinnedItemPlannerModule (upval), v6 (ref), config (copy), Start (copy), ViewportModuleResult (upval)
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
							v6 = UpdatePinnedMeasurementResult
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
			if v6 ~= nil then
				config.startInsetDelta = v6.start - Start
				ViewportModuleResult.setInsets(v6.start, v6.finish)
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
	
	local function setPolicy(p6)
		-- upvalues: DataPrefetchModule (upval), ViewportModuleResult (copy), FFlagViewRecyclerReact08 (upval), IsPreserveScrollPositionOnChange (ref), DataPrefetch (ref), IsItemStickyHeader (ref), PinnedStartItem (ref), PinnedEndItem (ref), PinnedItemPlannerModule (copy), HasIsItemStickyHeader (ref), ScrollAnchorModuleResult (copy), Callback (upval), CreateResult (ref), Callback1 (upval), v1 (ref), Callback2 (upval)
		DataPrefetchModule.resolve(p6.dataPrefetch)
		local PinnedItems = p6.pinnedItems
		ViewportModuleResult.setOverscan(p6.overscan)
		ViewportModuleResult.setContentAlignment(p6.contentAlignment)
		ViewportModuleResult.setEndThreshold(p6.endThreshold)
		
		if not FFlagViewRecyclerReact08 then
			IsPreserveScrollPositionOnChange = p6.preserveScrollPositionOnChange ~= false
		end
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
		
		if FFlagViewRecyclerReact08 then
			ScrollAnchorModuleResult.configure(Callback(p6))
			CreateResult.configure(Callback1(p6))
			
			return
		else
			v1.configure(Callback2(p6))
		end
	end
	
	local function setActiveMutation(p6, Value)
		-- upvalues: FFlagViewRecyclerReact08 (upval), ActiveMutation (ref), ListRowsModuleResult (copy)
		if FFlagViewRecyclerReact08 then
			p6.settlesScroll = false
		else
			p6.policyEligible = false
		end
		if Value and not ActiveMutation then
			ListRowsModuleResult.invalidatePayloads()
		end
		ActiveMutation = Value
	end
	
	local SetScrollOffsetMutation = if FFlagViewRecyclerReact08 then nil else function(_, p6)
		-- upvalues: ViewportModuleResult (copy), ScrollAnchorModuleResult (copy)
		if ViewportModuleResult.setScrollOffset(p6) then
			ScrollAnchorModuleResult.setViewport(p6)
		end
	end
	
	local function observeScrollOffsetMutation(p6, p7)
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
	
	local FinishProgrammaticScroll = if FFlagViewRecyclerReact08 then function(p6, p7)
		-- upvalues: ScrollAnchorModuleResult (copy)
		ScrollAnchorModuleResult.scrolledProgrammatically(p7)
		p6.scrollPositionChanged = true
		p6.scrollPositionFollowsCorrection = false
		
		if p7 == nil then
			p6.scrollMoved = true
		end
	end else nil
	
	local function scrollToIndexMutation(p6, p7, p8)
		-- upvalues: FFlagViewRecyclerReact08 (upval), Callback6 (ref), ViewportModuleResult (copy), ScrollAnchorModuleResult (copy), FinishProgrammaticScroll (ref)
		if FFlagViewRecyclerReact08 then
			Callback6(p6, ViewportModuleResult.offsetForItem(p7, p8))
		end
		ScrollAnchorModuleResult.setItemTarget(p7, p8)
		
		if FFlagViewRecyclerReact08 then
			FinishProgrammaticScroll(p6, nil)
			
			return
		else
			ViewportModuleResult.scrollTo(ViewportModuleResult.offsetForItem(p7, p8))
			p6.scrollPositionChanged = true
			p6.scrollPositionFollowsCorrection = false
			p6.scrollMoved = true
		end
	end
	
	local function scrollToOffsetMutation(p6, p7)
		-- upvalues: FFlagViewRecyclerReact08 (upval), Callback6 (ref), FinishProgrammaticScroll (ref), ScrollAnchorModuleResult (copy), ViewportModuleResult (copy)
		if FFlagViewRecyclerReact08 then
			Callback6(p6, p7)
			FinishProgrammaticScroll(p6, nil)
			
			return
		else
			ScrollAnchorModuleResult.setViewport(ViewportModuleResult.scrollTo(p7))
			p6.scrollPositionChanged = true
			p6.scrollPositionFollowsCorrection = false
			p6.scrollMoved = true
		end
	end
	
	local function scrollByMutation(p6, Value: number)
		-- upvalues: FFlagViewRecyclerReact08 (upval), Callback6 (ref), ViewportModuleResult (copy), FinishProgrammaticScroll (ref), ScrollAnchorModuleResult (copy)
		if FFlagViewRecyclerReact08 then
			assert(math.abs(Value) < 1e999, "Virtualizer: scroll delta must be finite")
			Callback6(p6, ViewportModuleResult.getScrollOffset() + Value)
			FinishProgrammaticScroll(p6, nil)
			
			return
		else
			ScrollAnchorModuleResult.setViewport(ViewportModuleResult.scrollBy(Value))
			p6.scrollPositionChanged = true
			p6.scrollPositionFollowsCorrection = false
			p6.scrollMoved = true
		end
	end
	
	local function scrollToEdgeMutation(p6, Start)
		-- upvalues: FFlagViewRecyclerReact08 (upval), Callback6 (ref), ScrollAlignmentModule (upval), ViewportModuleResult (copy), FinishProgrammaticScroll (ref), ScrollAnchorModuleResult (copy), AutoScrollModule (upval), v1 (ref)
		if FFlagViewRecyclerReact08 then
			Callback6(p6, if Start == ScrollAlignmentModule.Start then 0 else ViewportModuleResult.getContentLength() - ViewportModuleResult.getLength())
			FinishProgrammaticScroll(p6, Start)
			
			return
		else
			ScrollAnchorModuleResult.setViewport(ViewportModuleResult.scrollTo(AutoScrollModule.getTargetOffset(Start, ViewportModuleResult.getContentLength(), ViewportModuleResult.getLength())))
			v1.pin(Start)
			p6.scrollPositionChanged = true
			p6.scrollPositionFollowsCorrection = false
		end
	end
	
	local function setViewportSizeMutation(p6, Length, p7)
		-- upvalues: ViewportModuleResult (copy), Layout (ref), ListRowsModuleResult (copy), FFlagViewRecyclerReact08 (upval), ScrollAlignmentModule (upval), ScrollAnchorModuleResult (copy)
		local Length1: number = ViewportModuleResult.getLength()
		local ContentLengthDelta = ViewportModuleResult.getContentLength() - Length1 - ViewportModuleResult.getScrollOffset()
		
		if ViewportModuleResult.setSize(Length, p7) then
			if Layout.setViewportCrossAxisLength(p7) then
				ListRowsModuleResult.invalidateLayout()
			end
			if (if FFlagViewRecyclerReact08 then Length1 > 0 else Length1 > 0 and Length ~= Length1) and (if FFlagViewRecyclerReact08 then Length ~= Length1 else ViewportModuleResult.getContentAlignment() == ScrollAlignmentModule.End) and (if FFlagViewRecyclerReact08 then ViewportModuleResult.getContentAlignment() == ScrollAlignmentModule.End else ScrollAnchorModuleResult.allowsPolicyOffset()) then
				if FFlagViewRecyclerReact08 then
					p6.keptDistanceFromEnd = math.max(0, ContentLengthDelta)
				else
					ViewportModuleResult.refresh()
					local ScrollToResult = ViewportModuleResult.scrollTo(ViewportModuleResult.getContentLength() - Length - math.max(0, ContentLengthDelta))
					
					if ScrollToResult ~= ViewportModuleResult.getScrollOffset() then
						ScrollAnchorModuleResult.setViewport(ScrollToResult)
						p6.scrollPositionChanged = true
						p6.scrollPositionFollowsCorrection = false
					end
				end
			end
		end
		p6.viewportChanged = true
	end
	
	v2 = makeRecord((beginTransaction()))
	
	return {
		activate = function()
			-- upvalues: transact (copy), Flag (ref), readKeys (copy), Layout (ref), DataSourceChangeTypeModule (upval), ViewportModuleResult (copy), PinnedItemPlannerModule (copy), ListRowsModuleResult (copy), v3 (ref)
			return (transact(function(p6)
				-- upvalues: Flag (upval), readKeys (upval), Layout (upval), DataSourceChangeTypeModule (upval), ViewportModuleResult (upval), PinnedItemPlannerModule (upval), ListRowsModuleResult (upval), v3 (upval)
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
					v3()
				end
				p6.viewportChanged = true
			end))
		end,
		setActive = function(p6)
			-- upvalues: transact (copy), setActiveMutation (copy)
			return (transact(setActiveMutation, p6))
		end,
		observeScrollOffset = function(p6)
			-- upvalues: transact (copy), observeScrollOffsetMutation (copy)
			return (transact(observeScrollOffsetMutation, p6))
		end,
		scrollToIndex = function(p6, p7)
			-- upvalues: transact (copy), scrollToIndexMutation (copy)
			return (transact(scrollToIndexMutation, p6, p7))
		end,
		scrollToOffset = function(p6)
			-- upvalues: transact (copy), scrollToOffsetMutation (copy)
			return (transact(scrollToOffsetMutation, p6))
		end,
		scrollToStart = function()
			-- upvalues: transact (copy), scrollToEdgeMutation (copy), FFlagViewRecyclerReact08 (upval), ScrollAlignmentModule (upval), AutoScrollTargetModule (upval)
			return (transact(scrollToEdgeMutation, (if FFlagViewRecyclerReact08 then ScrollAlignmentModule else AutoScrollTargetModule).Start))
		end,
		scrollToEnd = function()
			-- upvalues: transact (copy), scrollToEdgeMutation (copy), FFlagViewRecyclerReact08 (upval), ScrollAlignmentModule (upval), AutoScrollTargetModule (upval)
			return (transact(scrollToEdgeMutation, (if FFlagViewRecyclerReact08 then ScrollAlignmentModule else AutoScrollTargetModule).End))
		end,
		scrollBy = function(p6)
			-- upvalues: transact (copy), scrollByMutation (copy)
			return (transact(scrollByMutation, p6))
		end,
		restoreScrollAnchorSnapshot = function(p6)
			-- upvalues: transact (copy), FFlagViewRecyclerReact08 (upval), Callback6 (ref), ScrollAnchorModuleResult (copy), ViewportModuleResult (copy), FinishProgrammaticScroll (ref)
			return (transact(function(p7)
				-- upvalues: FFlagViewRecyclerReact08 (upval), Callback6 (upval), ScrollAnchorModuleResult (upval), p6 (copy), ViewportModuleResult (upval), FinishProgrammaticScroll (upval)
				if FFlagViewRecyclerReact08 then
					Callback6(p7, ScrollAnchorModuleResult.snapshotOffset(p6))
					ScrollAnchorModuleResult.restore(p6, ViewportModuleResult.getScrollOffset())
					FinishProgrammaticScroll(p7, nil)
					
					return
				else
					ScrollAnchorModuleResult.restore(p6, ViewportModuleResult.scrollTo(ScrollAnchorModuleResult.snapshotOffset(p6)))
					p7.scrollPositionChanged = true
					p7.scrollPositionFollowsCorrection = false
					p7.scrollMoved = true
				end
			end))
		end,
		setViewportSize = function(p6, p7)
			-- upvalues: transact (copy), setViewportSizeMutation (copy)
			return (transact(setViewportSizeMutation, p6, p7))
		end,
		setPolicy = function(p6)
			-- upvalues: transact (copy), setPolicy (copy)
			return (transact(function()
				-- upvalues: setPolicy (upval), p6 (copy)
				setPolicy(p6)
			end))
		end,
		setDataSource = function(DataSource1)
			-- upvalues: transact (copy), DataSource (ref), SubscribeResult (ref), PinnedItemPlannerModule (copy), FFlagViewRecyclerReact08 (upval), ScrollAnchorModuleResult (copy), readKeys (copy), Layout (ref), DataSourceChangeTypeModule (upval), ViewportModuleResult (copy), ListRowsModuleResult (copy), v3 (ref)
			return (transact(function(p6)
				-- upvalues: DataSource1 (copy), DataSource (upval), SubscribeResult (upval), PinnedItemPlannerModule (upval), FFlagViewRecyclerReact08 (upval), ScrollAnchorModuleResult (upval), readKeys (upval), Layout (upval), DataSourceChangeTypeModule (upval), ViewportModuleResult (upval), ListRowsModuleResult (upval), v3 (upval)
				if DataSource1 ~= DataSource then
					if SubscribeResult ~= nil then
						SubscribeResult()
						SubscribeResult = nil
					end
					DataSource = DataSource1
				end
				PinnedItemPlannerModule.setItemSequence(DataSource)
				
				if FFlagViewRecyclerReact08 then
					ScrollAnchorModuleResult.dataSourceReplaced()
				else
					ScrollAnchorModuleResult.reset()
				end
				Layout.applyDataSourceChange({
					type = DataSourceChangeTypeModule.Reset,
					keys = readKeys()
				})
				ViewportModuleResult.refresh()
				ListRowsModuleResult.invalidateKeys()
				ListRowsModuleResult.invalidatePayloads()
				v3()
				p6.replaced = true
			end))
		end,
		setLayout = function(p6)
			-- upvalues: transact (copy), Layout (ref), ViewportModuleResult (copy), ListRowsModuleResult (copy), ScrollAnchorModuleResult (copy), readKeys (copy), DataSourceChangeTypeModule (upval)
			return (transact(function()
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
		setDataSourceAndLayout = function(DataSource1, p6)
			-- upvalues: transact (copy), DataSource (ref), SubscribeResult (ref), PinnedItemPlannerModule (copy), Layout (ref), ViewportModuleResult (copy), ListRowsModuleResult (copy), FFlagViewRecyclerReact08 (upval), ScrollAnchorModuleResult (copy), readKeys (copy), DataSourceChangeTypeModule (upval), v3 (ref)
			return (transact(function(p7)
				-- upvalues: DataSource1 (copy), DataSource (upval), SubscribeResult (upval), PinnedItemPlannerModule (upval), p6 (copy), Layout (upval), ViewportModuleResult (upval), ListRowsModuleResult (upval), FFlagViewRecyclerReact08 (upval), ScrollAnchorModuleResult (upval), readKeys (upval), DataSourceChangeTypeModule (upval), v3 (upval)
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
				
				if FFlagViewRecyclerReact08 then
					ScrollAnchorModuleResult.dataSourceReplaced()
				else
					ScrollAnchorModuleResult.reset()
				end
				Layout.applyDataSourceChange({
					type = DataSourceChangeTypeModule.Reset,
					keys = readKeys()
				})
				ViewportModuleResult.refresh()
				ListRowsModuleResult.invalidateKeys()
				ListRowsModuleResult.invalidatePayloads()
				v3()
				p7.replaced = true
			end))
		end,
		refresh = function()
			-- upvalues: transact (copy), ListRowsModuleResult (copy)
			return (transact(function()
				-- upvalues: ListRowsModuleResult (upval)
				ListRowsModuleResult.invalidateKeys()
				ListRowsModuleResult.invalidatePayloads()
			end))
		end,
		submitMeasurements = function(p6)
			-- upvalues: transact (copy), submitMeasurements (copy)
			return (transact(submitMeasurements, p6))
		end,
		getCurrent = function()
			-- upvalues: v2 (ref)
			return v2
		end,
		getItemLayout = function(FirstIndex)
			-- upvalues: Layout (ref)
			return Layout.getItemLayout(FirstIndex)
		end,
		getScrollOffsetForItem = function(p6, p7)
			-- upvalues: ViewportModuleResult (copy)
			return ViewportModuleResult.offsetForItem(p6, p7)
		end,
		captureScrollAnchorSnapshot = function()
			-- upvalues: v2 (ref), DataSource (ref), Layout (ref)
			local v7 = v2
			local VisibleRange = v7.visibleRange
			local ScrollOffset = v7.scrollState.scrollOffset
			
			if VisibleRange.firstIndex <= VisibleRange.lastIndex then
				local FirstIndex = VisibleRange.firstIndex
				
				return {
					anchorKey = DataSource.getItemKey(FirstIndex),
					anchorIndex = FirstIndex,
					offsetWithinItem = ScrollOffset - v7.contentStartOffset - Layout.getItemLayout(FirstIndex).startOffset,
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
		destroy = function()
			-- upvalues: Flag1 (ref), transact (copy), FFlagViewRecyclerReact08 (upval), SubscribeResult (ref), ListRowsModuleResult (copy), DataPrefetchControllerModuleResult (copy), PinnedItemPlannerModule (copy)
			if not Flag1 then
				transact(function(p6)
					-- upvalues: FFlagViewRecyclerReact08 (upval), SubscribeResult (upval), ListRowsModuleResult (upval), DataPrefetchControllerModuleResult (upval), PinnedItemPlannerModule (upval), Flag1 (upval)
					if FFlagViewRecyclerReact08 then
						p6.settlesScroll = false
					else
						p6.policyEligible = false
					end
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
		end,
		setScrollOffset = if FFlagViewRecyclerReact08 then nil else function(p6)
			-- upvalues: transact (copy), SetScrollOffsetMutation (ref)
			return (transact(SetScrollOffsetMutation, p6))
		end
	}
end
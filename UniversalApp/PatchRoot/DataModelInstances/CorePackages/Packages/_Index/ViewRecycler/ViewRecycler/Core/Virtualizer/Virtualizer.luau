local FFlagViewRecyclerReact084 = require(script:FindFirstAncestor("ViewRecycler").Flags).FFlagViewRecyclerReact084
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
local ScrollMotionModule = require(ViewRecycler.Core.Virtualizer.ScrollMotion)
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
local anchorConfig = nil
local paginationConfig = nil
local Callback2: ((any) -> any)? = nil
local Callback: ((any) -> any)? = nil
local Callback1: ((any) -> any)? = nil

if FFlagViewRecyclerReact084 then
	anchorConfig = function(p1)
		return {
			preserveScrollPositionOnChange = p1.preserveScrollPositionOnChange ~= false,
			initialScrollAlignment = p1.initialScrollAlignment,
			autoScrollOnChange = p1.autoScrollOnChange,
			autoScrollThreshold = p1.autoScrollThreshold
		}
	end
	
	paginationConfig = function(p1)
		return {
			startReachedThreshold = p1.startReachedThreshold,
			startReachedEnabled = p1.startReachedEnabled == true,
			endReachedEnabled = p1.endReachedEnabled == true
		}
	end
	
	Callback2 = function(PinnedEndItem)
		return if PinnedEndItem == nil then nil else {
			key = PinnedEndItem.key,
			estimatedLength = PinnedEndItem.estimatedLength
		}
	end
else
	anchorConfig = nil
	paginationConfig = nil
	Callback = nil
	
	if FFlagViewRecyclerReact08 then
		anchorConfig = function(p1)
			return {
				preserveScrollPositionOnChange = p1.preserveScrollPositionOnChange ~= false,
				initialScrollAlignment = p1.initialScrollAlignment,
				autoScrollOnChange = p1.autoScrollOnChange,
				autoScrollThreshold = p1.autoScrollThreshold
			}
		end
		
		paginationConfig = function(p1)
			return {
				startReachedThreshold = p1.startReachedThreshold,
				startReachedEnabled = p1.startReachedEnabled == true,
				endReachedEnabled = p1.endReachedEnabled == true
			}
		end
	else
		Callback = function(p1)
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
	Callback1 = function(PinnedEndItem)
		return if PinnedEndItem == nil then nil else { key = PinnedEndItem.key }
	end
end
return function(p1)
	-- upvalues: FFlagViewRecyclerReact084 (copy), FFlagViewRecyclerReact08 (copy), ViewportModule (copy), CreatePinnedItemPlannerModule (copy), Callback2 (ref), Callback1 (ref), DataPrefetchControllerModule (copy), ScrollAnchorModule (copy), anchorConfig (ref), PaginationEdgesModule (copy), paginationConfig (ref), ScrollPolicyModule (copy), Callback (ref), ListRowsModule (copy), SlotBinderModule (copy), PlacementTypesModule (copy), ScrollAlignmentModule (copy), DiagnosticsModule (copy), DataSourceChangeTypeModule (copy), Frozen (copy), DataPrefetchModule (copy), ScrollObservationKindModule (copy), ScrollMotionModule (copy), AutoScrollModule (copy), AutoScrollTargetModule (copy)
	local DataSource = p1.dataSource
	local Layout = p1.layout
	local IsItemStickyHeader = p1.isItemStickyHeader
	local PinnedStartItem = p1.pinnedStartItem
	local PinnedEndItem = p1.pinnedEndItem
	local IsPreserveScrollPositionOnChange = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else p1.preserveScrollPositionOnChange ~= false
	local DataPrefetch = p1.dataPrefetch
	local HasIsItemStickyHeader: boolean = IsItemStickyHeader ~= nil or PinnedStartItem ~= nil or PinnedEndItem ~= nil
	local ViewportModuleResult = ViewportModule({
		layout = Layout,
		overscan = p1.overscan,
		contentAlignment = p1.contentAlignment,
		endThreshold = p1.endThreshold
	})
	local Flag = nil
	local isLaidOut = nil
	
	if FFlagViewRecyclerReact084 then
		Flag = false
		
		isLaidOut = function(): boolean
			-- upvalues: Flag (ref), ViewportModuleResult (copy), DataSource (ref)
			return Flag and (ViewportModuleResult.getLength() > 0 and (DataSource.getItemCount() == 0 or ViewportModuleResult.getContentLength() > 0))
		end
	else
		Flag = nil
		isLaidOut = nil
		
		if FFlagViewRecyclerReact08 then
			Flag = false
			
			isLaidOut = function(): boolean
				-- upvalues: Flag (ref), ViewportModuleResult (copy), DataSource (ref)
				return Flag and (ViewportModuleResult.getLength() > 0 and (DataSource.getItemCount() == 0 or ViewportModuleResult.getContentLength() > 0))
			end
		end
	end
	local PinnedItemPlannerModule = CreatePinnedItemPlannerModule(DataSource, {
		isItemStickyKey = IsItemStickyHeader,
		pinnedStartItem = (if FFlagViewRecyclerReact084 then Callback2 else Callback1)(PinnedStartItem),
		pinnedEndItem = (if FFlagViewRecyclerReact084 then Callback2 else Callback1)(PinnedEndItem)
	})
	
	if FFlagViewRecyclerReact084 then
		local ContentInsets = PinnedItemPlannerModule.getContentInsets()
		ViewportModuleResult.setInsets(ContentInsets.start, ContentInsets.finish)
	end
	local DataPrefetchControllerModuleResult = DataPrefetchControllerModule(DataPrefetch)
	local ScrollAnchorModuleResult = ScrollAnchorModule({
		viewport = ViewportModuleResult,
		getItemSequence = function()
			-- upvalues: DataSource (ref)
			return DataSource
		end,
		isLaidOut = if FFlagViewRecyclerReact084 then isLaidOut elseif FFlagViewRecyclerReact08 then isLaidOut else nil,
		config = if FFlagViewRecyclerReact084 then anchorConfig(p1) elseif FFlagViewRecyclerReact08 then anchorConfig(p1) else nil,
		shouldPreserveUserPosition = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else function()
			-- upvalues: IsPreserveScrollPositionOnChange (ref)
			return IsPreserveScrollPositionOnChange
		end
	})
	local NewPaginationEdges = nil
	local PrepareDesiredAssignmentFunction = nil
	local v1 = nil
	
	if FFlagViewRecyclerReact084 then
		NewPaginationEdges = PaginationEdgesModule.create(paginationConfig(p1))
		PrepareDesiredAssignmentFunction = p1.prepareDesiredAssignment
	else
		NewPaginationEdges = nil
		PrepareDesiredAssignmentFunction = nil
		v1 = nil
		
		if FFlagViewRecyclerReact08 then
			NewPaginationEdges = PaginationEdgesModule.create(paginationConfig(p1))
			PrepareDesiredAssignmentFunction = p1.prepareDesiredAssignment
		else
			v1 = ScrollPolicyModule(Callback(p1))
		end
	end
	local ListRowsModuleResult = ListRowsModule({
		slotBinder = SlotBinderModule({
			recyclingScope = p1.recyclingScope,
			name = if FFlagViewRecyclerReact084 then "Virtualizer" elseif FFlagViewRecyclerReact08 then "Virtualizer" else nil,
			prepareDesiredAssignment = if FFlagViewRecyclerReact084 then if PrepareDesiredAssignmentFunction == nil then nil else function(p2)
				-- upvalues: PrepareDesiredAssignmentFunction (ref)
				return PrepareDesiredAssignmentFunction({ key = p2.key, value = p2.value })
			end elseif FFlagViewRecyclerReact08 then if PrepareDesiredAssignmentFunction == nil then nil else function(p2)
				-- upvalues: PrepareDesiredAssignmentFunction (ref)
				return PrepareDesiredAssignmentFunction({ key = p2.key, value = p2.value })
			end else p1.prepareDesiredAssignment
		}),
		getItemViewType = p1.getItemViewType,
		isReadyOnAssignment = if FFlagViewRecyclerReact084 then p1.isReadyOnAssignment else nil,
		getPinnedItem = function(Start)
			-- upvalues: PlacementTypesModule (upval), PinnedStartItem (ref), PinnedEndItem (ref)
			return if Start == PlacementTypesModule.PinnedPosition.Start then PinnedStartItem else PinnedEndItem
		end
	})
	
	if not FFlagViewRecyclerReact084 and not FFlagViewRecyclerReact08 then
		Flag = false
	end
	local ActiveMutation = true
	local Flag1 = false
	local Flag2 = false
	local SubscribeResult: (() -> ())? = nil
	local v2 = nil
	local StartResult = nil
	local v3 = nil
	local Callback5: ((any) -> any)? = nil
	local Callback3: (() -> any)? = nil
	local Callback7: (() -> ())? = nil
	
	if FFlagViewRecyclerReact084 then
		StartResult = nil
		v3 = nil
		
		Callback5 = function(p2)
			-- upvalues: DataSource (ref)
			local IndexHint = p2.indexHint
			
			if IndexHint <= DataSource.getItemCount() and DataSource.getItemKey(IndexHint) == p2.key then
				return IndexHint
			end
			for i = 1, DataSource.getItemCount() do
				if DataSource.getItemKey(i) == p2.key then
					p2.indexHint = i
					
					return i
				end
			end
			return nil
		end
		
		Callback3 = function()
			-- upvalues: v3 (ref), Callback5 (ref), ViewportModuleResult (copy), ScrollAlignmentModule (upval)
			local v4 = v3
			
			if v4 == nil then
				return nil
			elseif v4.kind == "index" then
				local CallbackResult = Callback5(v4)
				
				return if CallbackResult == nil then nil else ViewportModuleResult.offsetForItem(CallbackResult, v4.alignment)
			else
				return if v4.kind == "edge" then if v4.edge == ScrollAlignmentModule.Start then 0 else ViewportModuleResult.clamp(ViewportModuleResult.getContentLength() - ViewportModuleResult.getLength()) else ViewportModuleResult.clamp(v4.offset)
			end
		end
		
		Callback7 = function()
			-- upvalues: StartResult (ref), v3 (ref), ScrollAnchorModuleResult (copy)
			if StartResult ~= nil then
				StartResult = nil
				v3 = nil
				ScrollAnchorModuleResult.endMotion()
			end
		end
	end
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
	
	local moveTo = nil
	local Callback4: ((any, any) -> ())? = nil
	
	if FFlagViewRecyclerReact084 then
		moveTo = function(p2, ContentLengthDelta)
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
		moveTo = nil
		Callback4 = nil
		
		if FFlagViewRecyclerReact08 then
			moveTo = function(p2, p3)
				-- upvalues: ViewportModuleResult (copy), ScrollAnchorModuleResult (copy)
				local ScrollOffset = ViewportModuleResult.getScrollOffset()
				local ScrollToResult = ViewportModuleResult.scrollTo(p3)
				ScrollAnchorModuleResult.setViewport(ScrollToResult)
				
				if ScrollToResult ~= ScrollOffset then
					p2.scrollPositionChanged = true
					p2.scrollPositionFollowsCorrection = false
				end
			end
		else
			Callback4 = function(p2, ContentLengthChangedResult)
				-- upvalues: ScrollAnchorModuleResult (copy), ViewportModuleResult (copy)
				if ContentLengthChangedResult == nil or not ScrollAnchorModuleResult.allowsPolicyOffset() then return end
				if ViewportModuleResult.scrollTo(ContentLengthChangedResult) ~= ViewportModuleResult.getScrollOffset() then
					p2.scrollPositionChanged = true
					p2.scrollPositionFollowsCorrection = false
				end
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
	
	local ResolveItemEstimates = if FFlagViewRecyclerReact084 then function()
		-- upvalues: Layout (ref), DataSource (ref)
		local ResolveItemEstimatesFunction = Layout.resolveItemEstimates
		
		return ResolveItemEstimatesFunction ~= nil and ResolveItemEstimatesFunction(DataSource.getItem)
	end else nil
	
	local _ = function(Keys)
		-- upvalues: Layout (ref), DataSourceChangeTypeModule (upval), FFlagViewRecyclerReact084 (upval), ResolveItemEstimates (ref), ViewportModuleResult (copy)
		Layout.applyDataSourceChange({ type = DataSourceChangeTypeModule.Reset, keys = Keys })
		
		if FFlagViewRecyclerReact084 then
			ResolveItemEstimates()
		end
		ViewportModuleResult.refresh()
	end
	
	local v4 = nil
	
	local _ = function()
		-- upvalues: SubscribeResult (ref)
		if SubscribeResult ~= nil then
			SubscribeResult()
			SubscribeResult = nil
		end
	end
	
	local t = {}
	
	local function beginTransaction()
		-- upvalues: t (copy), FFlagViewRecyclerReact084 (upval), FFlagViewRecyclerReact08 (upval), ViewportModuleResult (copy), Frozen (upval)
		if FFlagViewRecyclerReact084 then
			t.settlesScroll = true
		elseif FFlagViewRecyclerReact08 then
			t.settlesScroll = true
		else
			t.policyEligible = true
		end
		t.dataChange = nil
		
		if not FFlagViewRecyclerReact084 and not FFlagViewRecyclerReact08 then
			t.before = nil
		end
		t.replaced = false
		t.viewportChanged = false
		t.scrollMoved = false
		
		if FFlagViewRecyclerReact084 then
			t.keptDistanceFromEnd = nil
		elseif FFlagViewRecyclerReact08 then
			t.keptDistanceFromEnd = nil
		end
		t.contentLengthBefore = ViewportModuleResult.getContentLength()
		t.scrollCorrection = 0
		t.scrollPositionChanged = false
		t.scrollPositionFollowsCorrection = false
		
		if FFlagViewRecyclerReact084 then
			t.animatedScrollTarget = nil
		end
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
		-- upvalues: FFlagViewRecyclerReact084 (upval), NewPaginationEdges (ref), isLaidOut (ref), ViewportModuleResult (copy), FFlagViewRecyclerReact08 (upval), v1 (ref), DataSource (ref)
		local CheckResult = nil
		local CheckResult2 = nil
		if FFlagViewRecyclerReact084 then
			if not NewPaginationEdges.isEnabled() or not isLaidOut() then return end
			CheckResult, CheckResult2 = NewPaginationEdges.check(ViewportModuleResult.scrollState(), HasStructuralChange)
		elseif FFlagViewRecyclerReact08 then
			if not NewPaginationEdges.isEnabled() or not isLaidOut() then return end
			CheckResult, CheckResult2 = NewPaginationEdges.check(ViewportModuleResult.scrollState(), HasStructuralChange)
		else
			CheckResult, CheckResult2 = v1.checkEdges(ViewportModuleResult.scrollState(), DataSource.getItemCount(), HasStructuralChange)
		end
		p2.startReached = p2.startReached or CheckResult
		p2.endReached = p2.endReached or CheckResult2
	end
	
	local moveSettled = nil
	local settleScroll = nil
	local policyContext = nil
	local Callback6: ((any) -> ())? = nil
	
	if FFlagViewRecyclerReact084 then
		moveSettled = function(p2)
			-- upvalues: moveTo (ref), t (copy)
			moveTo(t, p2)
		end
		
		settleScroll = function(p2)
			-- upvalues: ViewportModuleResult (copy), ScrollAnchorModuleResult (copy), moveSettled (ref), checkEdges (copy), PaginationEdgesModule (upval)
			p2.contentLengthChanged = ViewportModuleResult.getContentLength() ~= p2.contentLengthBefore
			ScrollAnchorModuleResult.settle(p2, moveSettled)
			local DataChange = p2.dataChange
			checkEdges(p2, DataChange ~= nil and PaginationEdgesModule.hasStructuralChange(DataChange))
		end
	else
		moveSettled = nil
		settleScroll = nil
		policyContext = nil
		Callback6 = nil
		
		if FFlagViewRecyclerReact08 then
			moveSettled = function(p2)
				-- upvalues: moveTo (ref), t (copy)
				moveTo(t, p2)
			end
			
			settleScroll = function(p2)
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
			
			Callback6 = function(p2)
				-- upvalues: ViewportModuleResult (copy), Callback4 (ref), v1 (ref), policyContext (ref), checkEdges (copy), PaginationEdgesModule (upval)
				if ViewportModuleResult.getContentLength() ~= p2.contentLengthBefore then
					p2.contentLengthChanged = true
					Callback4(p2, v1.contentLengthChanged(ViewportModuleResult.scrollState()))
				end
				local DataChange = p2.dataChange
				
				if DataChange ~= nil then
					Callback4(p2, v1.dataChanged(policyContext(), p2.before))
					checkEdges(p2, PaginationEdgesModule.hasStructuralChange(DataChange))
					
					return
				end
				if p2.replaced then
					Callback4(p2, v1.dataReplaced(policyContext()))
					v1.observe(ViewportModuleResult.scrollState())
				end
				if p2.viewportChanged then
					Callback4(p2, v1.viewportChanged(policyContext()))
					v1.observe(ViewportModuleResult.scrollState())
				elseif p2.scrollMoved then
					v1.observe(ViewportModuleResult.scrollState())
				end
				if v1.reachesEdges() then
					checkEdges(p2, false)
				end
			end
		end
	end
	local t1 = {}
	local t2 = {}
	
	local function settle(p2)
		-- upvalues: ViewportModuleResult (copy), FFlagViewRecyclerReact084 (upval), FFlagViewRecyclerReact08 (upval), settleScroll (ref), Callback6 (ref), p1 (copy), DiagnosticsModule (upval), Flag1 (ref), ActiveMutation (ref), t1 (copy), DataSource (ref), Layout (ref), HasIsItemStickyHeader (ref), PinnedItemPlannerModule (copy), ListRowsModuleResult (copy), t2 (copy), DataPrefetch (ref), DataPrefetchControllerModuleResult (copy)
		ViewportModuleResult.refresh()
		
		if if FFlagViewRecyclerReact084 then p2.settlesScroll elseif FFlagViewRecyclerReact08 then p2.settlesScroll else p2.policyEligible then
			if FFlagViewRecyclerReact084 then
				settleScroll(p2)
			elseif FFlagViewRecyclerReact08 then
				settleScroll(p2)
			else
				Callback6(p2)
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
			
			if FFlagViewRecyclerReact084 then
				t1.visibleRange = ViewportModuleResult.getVisibleRange()
			end
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
	
	local v5 = nil
	
	local _ = function(Tbl)
		return if table.isfrozen(Tbl) then Tbl else table.freeze(Tbl)
	end
	
	local function makeRecord(p2)
		-- upvalues: v2 (ref), ListRowsModuleResult (copy), ViewportModuleResult (copy), Layout (ref), ScrollAnchorModuleResult (copy), FFlagViewRecyclerReact084 (upval)
		local v6 = v2
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
			scrollState = ViewportModuleResult.scrollState(if v6 == nil then nil else v6.scrollState),
			contentStartOffset = ViewportModuleResult.getContentStartOffset(),
			contentLength = ViewportModuleResult.getContentLength(),
			requiresItemMeasurement = Layout.requiresItemMeasurement(),
			scrollCorrection = p2.scrollCorrection,
			scrollPositionChanged = p2.scrollPositionChanged,
			scrollPositionFollowsCorrection = p2.scrollPositionFollowsCorrection,
			scrollAnchor = ScrollAnchorModuleResult.getAnchoredItem(),
			animatedScrollTarget = if FFlagViewRecyclerReact084 then p2.animatedScrollTarget else nil,
			contentLengthChanged = p2.contentLengthChanged,
			startReached = p2.startReached,
			endReached = p2.endReached,
			dataPrefetchRequests = p2.dataPrefetchRequests,
			diagnostics = if table.isfrozen(Diagnostics) then Diagnostics else table.freeze(Diagnostics)
		}))
	end
	
	local mutateAndSettle = nil
	local transact = nil
	
	if FFlagViewRecyclerReact084 then
		mutateAndSettle = function(Callback: (any, any, any, any) -> (), p2, p3, p4, p5)
			-- upvalues: StartResult (ref), Callback3 (ref), Callback7 (ref), settle (copy)
			Callback(p2, p3, p4, p5)
			
			if StartResult ~= nil and Callback3() == nil then
				Callback7()
			end
			settle(p2)
			
			if StartResult ~= nil then
				p2.animatedScrollTarget = Callback3()
			end
		end
		
		transact = function(ScrollToEdgeMutation, End, p2, p3)
			-- upvalues: Flag2 (ref), Flag1 (ref), beginTransaction (copy), mutateAndSettle (ref), v2 (ref), makeRecord (copy), p1 (copy)
			assert(not Flag2, "Virtualizer: cannot mutate during a transaction")
			assert(not Flag1, "Virtualizer: cannot dispatch after destruction")
			Flag2 = true
			local BeginTransactionResult = beginTransaction()
			local Success, Result = pcall(mutateAndSettle, ScrollToEdgeMutation, BeginTransactionResult, End, p2, p3)
			Flag2 = false
			
			if not Success then
				error(Result, 0)
			end
			local v6 = v2
			local Record = makeRecord(BeginTransactionResult)
			v2 = Record
			
			if p1.diagnostics ~= nil then
				for _, diagnostic in Record.diagnostics do
					p1.diagnostics(diagnostic)
				end
			end
			if p1.onTransaction ~= nil then
				p1.onTransaction(v6, Record)
			end
			return Record
		end
	else
		mutateAndSettle = function(Callback: (any, any, any) -> (), p4, p5, p6)
			-- upvalues: settle (copy)
			Callback(p4, p5, p6)
			settle(p4)
		end
		
		transact = function(p4, p5, p6)
			-- upvalues: Flag2 (ref), Flag1 (ref), beginTransaction (copy), mutateAndSettle (ref), v2 (ref), makeRecord (copy), p1 (copy)
			assert(not Flag2, "Virtualizer: cannot mutate during a transaction")
			assert(not Flag1, "Virtualizer: cannot dispatch after destruction")
			Flag2 = true
			local BeginTransactionResult = beginTransaction()
			local Success, Result = pcall(mutateAndSettle, p4, BeginTransactionResult, p5, p6)
			Flag2 = false
			
			if not Success then
				error(Result, 0)
			end
			local v7 = v2
			local Record = makeRecord(BeginTransactionResult)
			v2 = Record
			
			if p1.diagnostics ~= nil then
				for _, diagnostic in Record.diagnostics do
					p1.diagnostics(diagnostic)
				end
			end
			if p1.onTransaction ~= nil then
				p1.onTransaction(v7, Record)
			end
			return Record
		end
	end
	local function applyDataChange(p4, DataChange)
		-- upvalues: FFlagViewRecyclerReact084 (upval), FFlagViewRecyclerReact08 (upval), ViewportModuleResult (copy), ListRowsModuleResult (copy), applyCorrection (copy), ScrollAnchorModuleResult (copy), DiagnosticsModule (upval), Layout (ref), ResolveItemEstimates (ref), PinnedItemPlannerModule (copy)
		if not FFlagViewRecyclerReact084 and not FFlagViewRecyclerReact08 then
			p4.before = ViewportModuleResult.scrollState()
		end
		p4.dataChange = DataChange
		ListRowsModuleResult.noteDataChange(DataChange)
		local ApplyDataSourceChangeResult = false
		applyCorrection(p4, ScrollAnchorModuleResult.preserve({
			source = DiagnosticsModule.ScrollCorrectionSource.Data,
			dataSourceChange = DataChange
		}, function()
			-- upvalues: DataChange (copy), ApplyDataSourceChangeResult (ref), Layout (upval), FFlagViewRecyclerReact084 (upval), ResolveItemEstimates (upval), PinnedItemPlannerModule (upval), ViewportModuleResult (upval)
			for _, change in DataChange.changes do
				ApplyDataSourceChangeResult = Layout.applyDataSourceChange(change) or ApplyDataSourceChangeResult
			end
			if FFlagViewRecyclerReact084 then
				ApplyDataSourceChangeResult = ResolveItemEstimates() or ApplyDataSourceChangeResult
			end
			PinnedItemPlannerModule.applyDataSourceChange(DataChange)
			ViewportModuleResult.refresh()
		end))
		
		if ApplyDataSourceChangeResult then
			ListRowsModuleResult.invalidateLayout()
		end
	end
	
	v5 = function(p5)
		-- upvalues: transact (ref), applyDataChange (copy)
		transact(applyDataChange, p5)
	end
	
	v4 = function()
		-- upvalues: SubscribeResult (ref), Flag (ref), Flag1 (ref), DataSource (ref), v5 (ref)
		if SubscribeResult == nil and Flag and not Flag1 then
			SubscribeResult = DataSource.subscribe(v5)
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
	
	local _ = function(p5)
		-- upvalues: Layout (ref), ViewportModuleResult (copy), ListRowsModuleResult (copy)
		Layout = p5
		ViewportModuleResult.setLayout(p5)
		local CrossAxisLength: number = ViewportModuleResult.getCrossAxisLength()
		
		if CrossAxisLength > 0 then
			p5.setViewportCrossAxisLength(CrossAxisLength)
		end
		ListRowsModuleResult.invalidateLayout()
	end
	
	local function resetData()
		-- upvalues: FFlagViewRecyclerReact084 (upval), ScrollAnchorModuleResult (copy), FFlagViewRecyclerReact08 (upval), readKeys (copy), Layout (ref), DataSourceChangeTypeModule (upval), ResolveItemEstimates (ref), ViewportModuleResult (copy), ListRowsModuleResult (copy), v4 (ref)
		if FFlagViewRecyclerReact084 then
			ScrollAnchorModuleResult.dataSourceReplaced()
		elseif FFlagViewRecyclerReact08 then
			ScrollAnchorModuleResult.dataSourceReplaced()
		else
			ScrollAnchorModuleResult.reset()
		end
		Layout.applyDataSourceChange({
			type = DataSourceChangeTypeModule.Reset,
			keys = readKeys()
		})
		
		if FFlagViewRecyclerReact084 then
			ResolveItemEstimates()
		end
		ViewportModuleResult.refresh()
		ListRowsModuleResult.invalidateKeys()
		ListRowsModuleResult.invalidatePayloads()
		v4()
	end
	
	local function submitMeasurements(p5, p6)
		-- upvalues: ListRowsModuleResult (copy), p1 (copy), DiagnosticsModule (upval), PinnedItemPlannerModule (copy), applyCorrection (copy), ScrollAnchorModuleResult (copy), Layout (ref), FFlagViewRecyclerReact084 (upval), ViewportModuleResult (copy)
		local ValidateResult, ValidateResult2 = ListRowsModuleResult.validate(p6)
		
		if #ValidateResult > 0 and p1.diagnostics ~= nil then
			local config1 = {
				kind = DiagnosticsModule.EventKind.MeasurementsProcessingStarted,
				submitted = #ValidateResult,
				boundaryDropped = ValidateResult2
			}
			
			if table.isfrozen(p5.diagnostics) then
				p5.diagnostics = {}
			end
			table.insert(p5.diagnostics, config1)
		end
		local Count = 0
		local Flag = false
		local v7 = nil
		local config = {
			preserveStartAnchor = true,
			startInsetDelta = 0,
			source = DiagnosticsModule.ScrollCorrectionSource.Measurement
		}
		local Start = PinnedItemPlannerModule.getContentInsets().start
		applyCorrection(p5, ScrollAnchorModuleResult.preserve(config, function()
			-- upvalues: ValidateResult (copy), Layout (upval), Count (ref), ValidateResult2 (ref), Flag (ref), FFlagViewRecyclerReact084 (upval), PinnedItemPlannerModule (upval), v7 (ref), config (copy), Start (copy), ViewportModuleResult (upval)
			for _, value in ValidateResult do
				local Index = value.index
				
				if Index == nil then
					if value.pinnedPosition == nil then
						ValidateResult2 += 1
						continue
					end
					local v8 = nil
					local UpdatePinnedMeasurementResult = nil
					
					if FFlagViewRecyclerReact084 then
						UpdatePinnedMeasurementResult, v171 = PinnedItemPlannerModule.updatePinnedMeasurement(value.pinnedPosition, value.key, value.pinnedRevision, value.length)
					else
						UpdatePinnedMeasurementResult = PinnedItemPlannerModule.updatePinnedMeasurement(value.pinnedPosition, value.key, value.pinnedRevision, value.length)
					end
					if if FFlagViewRecyclerReact084 then v8 else UpdatePinnedMeasurementResult == nil then
						if FFlagViewRecyclerReact084 then
							Count += 1
						else
							ValidateResult2 += 1
						end
					elseif FFlagViewRecyclerReact084 then
						ValidateResult2 += 1
					else
						Count += 1
						v7 = UpdatePinnedMeasurementResult
					end
					if FFlagViewRecyclerReact084 and UpdatePinnedMeasurementResult ~= nil then
						v7 = UpdatePinnedMeasurementResult
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
					continue
				end
			end
			if v7 ~= nil then
				config.startInsetDelta = v7.start - Start
				ViewportModuleResult.setInsets(v7.start, v7.finish)
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
			
			if table.isfrozen(p5.diagnostics) then
				p5.diagnostics = {}
			end
			table.insert(p5.diagnostics, config2)
		end
		if Flag then
			ListRowsModuleResult.invalidateLayout()
		end
	end
	
	local SetPolicy = nil
	SetPolicy = if FFlagViewRecyclerReact084 then function(p7, p8)
		-- upvalues: DataPrefetchModule (upval), ViewportModuleResult (copy), DataPrefetch (ref), ScrollAnchorModuleResult (copy), anchorConfig (upval), NewPaginationEdges (ref), paginationConfig (upval), PinnedItemPlannerModule (copy), Callback2 (upval), IsItemStickyHeader (ref), PinnedStartItem (ref), PinnedEndItem (ref), HasIsItemStickyHeader (ref), applyCorrection (copy), DiagnosticsModule (upval)
		DataPrefetchModule.resolve(p8.dataPrefetch)
		local PinnedItems = p8.pinnedItems
		ViewportModuleResult.setOverscan(p8.overscan)
		ViewportModuleResult.setContentAlignment(p8.contentAlignment)
		ViewportModuleResult.setEndThreshold(p8.endThreshold)
		DataPrefetch = p8.dataPrefetch
		ScrollAnchorModuleResult.configure(anchorConfig(p8))
		NewPaginationEdges.configure(paginationConfig(p8))
		local ContentInsets = PinnedItemPlannerModule.getContentInsets()
		PinnedItemPlannerModule.setOptions({
			isItemStickyKey = PinnedItems.isItemStickyHeader,
			pinnedStartItem = Callback2(PinnedItems.pinnedStartItem),
			pinnedEndItem = Callback2(PinnedItems.pinnedEndItem)
		})
		IsItemStickyHeader = PinnedItems.isItemStickyHeader
		PinnedStartItem = PinnedItems.pinnedStartItem
		PinnedEndItem = PinnedItems.pinnedEndItem
		HasIsItemStickyHeader = IsItemStickyHeader ~= nil or PinnedStartItem ~= nil or PinnedEndItem ~= nil
		local ContentInsets1 = PinnedItemPlannerModule.getContentInsets()
		
		if ContentInsets1.start ~= ContentInsets.start or ContentInsets1.finish ~= ContentInsets.finish then
			applyCorrection(p7, ScrollAnchorModuleResult.preserve({
				preserveStartAnchor = true,
				source = DiagnosticsModule.ScrollCorrectionSource.Policy,
				startInsetDelta = ContentInsets1.start - ContentInsets.start
			}, function()
				-- upvalues: ViewportModuleResult (upval), ContentInsets1 (copy)
				ViewportModuleResult.setInsets(ContentInsets1.start, ContentInsets1.finish)
			end))
		end
	end else function(p7)
		-- upvalues: DataPrefetchModule (upval), ViewportModuleResult (copy), FFlagViewRecyclerReact08 (upval), IsPreserveScrollPositionOnChange (ref), DataPrefetch (ref), IsItemStickyHeader (ref), PinnedStartItem (ref), PinnedEndItem (ref), PinnedItemPlannerModule (copy), Callback1 (upval), HasIsItemStickyHeader (ref), ScrollAnchorModuleResult (copy), anchorConfig (upval), NewPaginationEdges (ref), paginationConfig (upval), v1 (ref), Callback (upval)
		DataPrefetchModule.resolve(p7.dataPrefetch)
		local PinnedItems = p7.pinnedItems
		ViewportModuleResult.setOverscan(p7.overscan)
		ViewportModuleResult.setContentAlignment(p7.contentAlignment)
		ViewportModuleResult.setEndThreshold(p7.endThreshold)
		
		if not FFlagViewRecyclerReact08 then
			IsPreserveScrollPositionOnChange = p7.preserveScrollPositionOnChange ~= false
		end
		DataPrefetch = p7.dataPrefetch
		IsItemStickyHeader = PinnedItems.isItemStickyHeader
		PinnedStartItem = PinnedItems.pinnedStartItem
		PinnedEndItem = PinnedItems.pinnedEndItem
		
		if PinnedItemPlannerModule.setOptions({
			isItemStickyKey = IsItemStickyHeader,
			pinnedStartItem = Callback1(PinnedStartItem),
			pinnedEndItem = Callback1(PinnedEndItem)
		}) then
			local ContentInsets = PinnedItemPlannerModule.getContentInsets()
			ViewportModuleResult.setInsets(ContentInsets.start, ContentInsets.finish)
		end
		HasIsItemStickyHeader = IsItemStickyHeader ~= nil or PinnedStartItem ~= nil or PinnedEndItem ~= nil
		
		if FFlagViewRecyclerReact08 then
			ScrollAnchorModuleResult.configure(anchorConfig(p7))
			NewPaginationEdges.configure(paginationConfig(p7))
			
			return
		else
			v1.configure(Callback(p7))
		end
	end
	
	local function setActiveMutation(p7, Value)
		-- upvalues: FFlagViewRecyclerReact084 (upval), FFlagViewRecyclerReact08 (upval), ActiveMutation (ref), ListRowsModuleResult (copy)
		if FFlagViewRecyclerReact084 then
			p7.settlesScroll = false
		elseif FFlagViewRecyclerReact08 then
			p7.settlesScroll = false
		else
			p7.policyEligible = false
		end
		if Value and not ActiveMutation then
			ListRowsModuleResult.invalidatePayloads()
		end
		ActiveMutation = Value
	end
	
	local SetScrollOffsetMutation = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else function(_, p7)
		-- upvalues: ViewportModuleResult (copy), ScrollAnchorModuleResult (copy)
		if ViewportModuleResult.setScrollOffset(p7) then
			ScrollAnchorModuleResult.setViewport(p7)
		end
	end
	
	local function observeScrollOffsetMutation(p7, p8)
		-- upvalues: FFlagViewRecyclerReact084 (upval), ScrollObservationKindModule (upval), Callback7 (ref), ViewportModuleResult (copy), ScrollAnchorModuleResult (copy)
		if FFlagViewRecyclerReact084 and p8.kind == ScrollObservationKindModule.User then
			Callback7()
		end
		local SetScrollOffsetResult = ViewportModuleResult.setScrollOffset(p8.offset)
		
		if p8.kind == ScrollObservationKindModule.Programmatic then
			ScrollAnchorModuleResult.observeHost(p8.offset)
		elseif SetScrollOffsetResult then
			ScrollAnchorModuleResult.setViewport(p8.offset)
		end
		if p8.kind == ScrollObservationKindModule.User then
			p7.scrollMoved = true
		end
	end
	
	local finishProgrammaticScroll = nil
	local animate: ((any, any) -> boolean)? = nil
	local scrollToIndexMutation = nil
	local scrollToOffsetMutation = nil
	
	if FFlagViewRecyclerReact084 then
		finishProgrammaticScroll = function(p7, Edge)
			-- upvalues: ScrollAnchorModuleResult (copy)
			ScrollAnchorModuleResult.scrolledProgrammatically(Edge)
			p7.scrollPositionChanged = true
			p7.scrollPositionFollowsCorrection = false
			
			if Edge == nil then
				p7.scrollMoved = true
			end
		end
		
		animate = function(p7, p8): boolean
			-- upvalues: ScrollMotionModule (upval), StartResult (ref), Callback7 (ref), isLaidOut (ref), v3 (ref), Callback3 (ref), ViewportModuleResult (copy), ScrollAnchorModuleResult (copy)
			if p7 == nil or p7.animated ~= true then
				return false
			end
			ScrollMotionModule.validate(p7, "Virtualizer")
			local Velocity = if StartResult == nil then 0 else StartResult.velocity
			Callback7()
			
			if not isLaidOut() then
				return false
			end
			v3 = p8
			local CallbackResult = Callback3()
			local ScrollOffset = ViewportModuleResult.getScrollOffset()
			
			if CallbackResult == nil or ScrollMotionModule.isAtRest(ScrollOffset, CallbackResult, Velocity) then
				v3 = nil
				
				return false
			else
				StartResult = ScrollMotionModule.start(ScrollOffset, CallbackResult, ViewportModuleResult.getLength(), Velocity, ScrollMotionModule.resolve(p7))
				ScrollAnchorModuleResult.beginMotion()
				
				return true
			end
		end
		
		scrollToIndexMutation = function(p7, Value: number, Alignment, p8)
			-- upvalues: DataSource (ref), animate (ref), Callback7 (ref), moveTo (ref), ViewportModuleResult (copy), ScrollAnchorModuleResult (copy), finishProgrammaticScroll (ref)
			local ItemCount: number = DataSource.getItemCount()
			
			if ItemCount > 0 then
				local ClampedValue = math.clamp(Value, 1, ItemCount)
				
				if animate(p8, {
					kind = "index",
					key = DataSource.getItemKey(ClampedValue),
					indexHint = ClampedValue,
					alignment = Alignment
				}) then return end
			end
			Callback7()
			moveTo(p7, ViewportModuleResult.offsetForItem(Value, Alignment))
			ScrollAnchorModuleResult.setItemTarget(Value, Alignment)
			finishProgrammaticScroll(p7, nil)
		end
		
		scrollToOffsetMutation = function(p7, Offset, p8)
			-- upvalues: animate (ref), Callback7 (ref), moveTo (ref), finishProgrammaticScroll (ref)
			if not animate(p8, { kind = "offset", offset = Offset }) then
				Callback7()
				moveTo(p7, Offset)
				finishProgrammaticScroll(p7, nil)
				
				return
			end
		end
	else
		finishProgrammaticScroll = if FFlagViewRecyclerReact08 then function(p7, p8)
			-- upvalues: ScrollAnchorModuleResult (copy)
			ScrollAnchorModuleResult.scrolledProgrammatically(p8)
			p7.scrollPositionChanged = true
			p7.scrollPositionFollowsCorrection = false
			
			if p8 == nil then
				p7.scrollMoved = true
			end
		end else nil
		
		scrollToIndexMutation = function(p7, p8, p9)
			-- upvalues: FFlagViewRecyclerReact08 (upval), moveTo (ref), ViewportModuleResult (copy), ScrollAnchorModuleResult (copy), finishProgrammaticScroll (ref)
			if FFlagViewRecyclerReact08 then
				moveTo(p7, ViewportModuleResult.offsetForItem(p8, p9))
			end
			ScrollAnchorModuleResult.setItemTarget(p8, p9)
			
			if FFlagViewRecyclerReact08 then
				finishProgrammaticScroll(p7, nil)
				
				return
			else
				ViewportModuleResult.scrollTo(ViewportModuleResult.offsetForItem(p8, p9))
				p7.scrollPositionChanged = true
				p7.scrollPositionFollowsCorrection = false
				p7.scrollMoved = true
			end
		end
		
		scrollToOffsetMutation = function(p7, p8)
			-- upvalues: FFlagViewRecyclerReact08 (upval), moveTo (ref), finishProgrammaticScroll (ref), ScrollAnchorModuleResult (copy), ViewportModuleResult (copy)
			if FFlagViewRecyclerReact08 then
				moveTo(p7, p8)
				finishProgrammaticScroll(p7, nil)
				
				return
			else
				ScrollAnchorModuleResult.setViewport(ViewportModuleResult.scrollTo(p8))
				p7.scrollPositionChanged = true
				p7.scrollPositionFollowsCorrection = false
				p7.scrollMoved = true
			end
		end
	end
	local function scrollByMutation(p7, Value: number)
		-- upvalues: FFlagViewRecyclerReact084 (upval), Callback7 (ref), moveTo (ref), ViewportModuleResult (copy), finishProgrammaticScroll (ref), FFlagViewRecyclerReact08 (upval), ScrollAnchorModuleResult (copy)
		if FFlagViewRecyclerReact084 then
			assert(math.abs(Value) < 1e999, "Virtualizer: scroll delta must be finite")
			Callback7()
			moveTo(p7, ViewportModuleResult.getScrollOffset() + Value)
			finishProgrammaticScroll(p7, nil)
			
			return
		end
		if FFlagViewRecyclerReact08 then
			assert(math.abs(Value) < 1e999, "Virtualizer: scroll delta must be finite")
			moveTo(p7, ViewportModuleResult.getScrollOffset() + Value)
			finishProgrammaticScroll(p7, nil)
			
			return
		else
			ScrollAnchorModuleResult.setViewport(ViewportModuleResult.scrollBy(Value))
			p7.scrollPositionChanged = true
			p7.scrollPositionFollowsCorrection = false
			p7.scrollMoved = true
		end
	end
	
	local scrollToEdgeMutation = nil
	local landMotion = nil
	local StepAnimatedScrollMutation: ((any, any) -> ())? = nil
	
	if FFlagViewRecyclerReact084 then
		scrollToEdgeMutation = function(p7, Edge, p8)
			-- upvalues: animate (ref), Callback7 (ref), moveTo (ref), ScrollAlignmentModule (upval), ViewportModuleResult (copy), finishProgrammaticScroll (ref)
			if not animate(p8, { kind = "edge", edge = Edge }) then
				Callback7()
				moveTo(p7, if Edge == ScrollAlignmentModule.Start then 0 else ViewportModuleResult.getContentLength() - ViewportModuleResult.getLength())
				finishProgrammaticScroll(p7, Edge)
				
				return
			end
		end
		
		landMotion = function(p7)
			-- upvalues: v3 (ref), Callback7 (ref), Callback5 (ref), scrollToIndexMutation (ref), scrollToEdgeMutation (ref), scrollToOffsetMutation (ref)
			local v8 = v3
			Callback7()
			
			if v8.kind == "index" then
				local CallbackResult = Callback5(v8)
				
				if CallbackResult ~= nil then
					scrollToIndexMutation(p7, CallbackResult, v8.alignment, nil)
					
					return
				end
			elseif v8.kind == "edge" then
				scrollToEdgeMutation(p7, v8.edge, nil)
				
				return
			else
				scrollToOffsetMutation(p7, v8.offset, nil)
			end
		end
		
		StepAnimatedScrollMutation = function(p7, p8)
			-- upvalues: StartResult (ref), Callback3 (ref), Callback7 (ref), isLaidOut (ref), landMotion (ref), ScrollMotionModule (upval), ViewportModuleResult (copy), moveTo (ref)
			local StartResult1 = StartResult
			local CallbackResult = Callback3()
			
			if CallbackResult == nil then
				Callback7()
				
				return
			end
			if not isLaidOut() then
				landMotion(p7)
				
				return
			end
			local StepResult, StepResult2 = ScrollMotionModule.step(StartResult1, ViewportModuleResult.getScrollOffset(), CallbackResult, ViewportModuleResult.getLength(), p8)
			
			if StepResult2 then
				landMotion(p7)
				
				return
			else
				moveTo(p7, StepResult)
			end
		end
	else
		scrollToEdgeMutation = function(p7, Edge)
			-- upvalues: FFlagViewRecyclerReact08 (upval), moveTo (ref), ScrollAlignmentModule (upval), ViewportModuleResult (copy), finishProgrammaticScroll (ref), ScrollAnchorModuleResult (copy), AutoScrollModule (upval), v1 (ref)
			if FFlagViewRecyclerReact08 then
				moveTo(p7, if Edge == ScrollAlignmentModule.Start then 0 else ViewportModuleResult.getContentLength() - ViewportModuleResult.getLength())
				finishProgrammaticScroll(p7, Edge)
				
				return
			else
				ScrollAnchorModuleResult.setViewport(ViewportModuleResult.scrollTo(AutoScrollModule.getTargetOffset(Edge, ViewportModuleResult.getContentLength(), ViewportModuleResult.getLength())))
				v1.pin(Edge)
				p7.scrollPositionChanged = true
				p7.scrollPositionFollowsCorrection = false
			end
		end
	end
	local function setViewportSizeMutation(p7, Length, p8)
		-- upvalues: ViewportModuleResult (copy), Layout (ref), ListRowsModuleResult (copy), FFlagViewRecyclerReact084 (upval), FFlagViewRecyclerReact08 (upval), ScrollAlignmentModule (upval), ScrollAnchorModuleResult (copy)
		local Length1: number = ViewportModuleResult.getLength()
		local ContentLengthDelta = ViewportModuleResult.getContentLength() - Length1 - ViewportModuleResult.getScrollOffset()
		
		if ViewportModuleResult.setSize(Length, p8) then
			if Layout.setViewportCrossAxisLength(p8) then
				ListRowsModuleResult.invalidateLayout()
			end
			if (if FFlagViewRecyclerReact084 then Length1 > 0 elseif FFlagViewRecyclerReact08 then Length1 > 0 else Length1 > 0 and Length ~= Length1) and (if FFlagViewRecyclerReact084 then Length ~= Length1 elseif FFlagViewRecyclerReact08 then Length ~= Length1 else ViewportModuleResult.getContentAlignment() == ScrollAlignmentModule.End) and (if FFlagViewRecyclerReact084 then ViewportModuleResult.getContentAlignment() == ScrollAlignmentModule.End elseif FFlagViewRecyclerReact08 then ViewportModuleResult.getContentAlignment() == ScrollAlignmentModule.End else ScrollAnchorModuleResult.allowsPolicyOffset()) then
				if FFlagViewRecyclerReact084 then
					p7.keptDistanceFromEnd = math.max(0, ContentLengthDelta)
				elseif FFlagViewRecyclerReact08 then
					p7.keptDistanceFromEnd = math.max(0, ContentLengthDelta)
				else
					ViewportModuleResult.refresh()
					local ScrollToResult = ViewportModuleResult.scrollTo(ViewportModuleResult.getContentLength() - Length - math.max(0, ContentLengthDelta))
					
					if ScrollToResult ~= ViewportModuleResult.getScrollOffset() then
						ScrollAnchorModuleResult.setViewport(ScrollToResult)
						p7.scrollPositionChanged = true
						p7.scrollPositionFollowsCorrection = false
					end
				end
			end
		end
		p7.viewportChanged = true
	end
	
	v2 = makeRecord((beginTransaction()))
	
	return {
		activate = function()
			-- upvalues: transact (ref), Flag (ref), readKeys (copy), Layout (ref), DataSourceChangeTypeModule (upval), FFlagViewRecyclerReact084 (upval), ResolveItemEstimates (ref), ViewportModuleResult (copy), PinnedItemPlannerModule (copy), ListRowsModuleResult (copy), v4 (ref)
			return transact(function(p7)
				-- upvalues: Flag (upval), readKeys (upval), Layout (upval), DataSourceChangeTypeModule (upval), FFlagViewRecyclerReact084 (upval), ResolveItemEstimates (upval), ViewportModuleResult (upval), PinnedItemPlannerModule (upval), ListRowsModuleResult (upval), v4 (upval)
				if not Flag then
					Flag = true
					local Keys = readKeys()
					Layout.applyDataSourceChange({ type = DataSourceChangeTypeModule.Reset, keys = Keys })
					
					if FFlagViewRecyclerReact084 then
						ResolveItemEstimates()
					end
					ViewportModuleResult.refresh()
					PinnedItemPlannerModule.applyDataSourceChange({
						changes = { { type = DataSourceChangeTypeModule.Reset, keys = Keys } },
						previousItemCount = #Keys,
						itemCount = #Keys
					})
					ListRowsModuleResult.invalidateKeys()
					v4()
				end
				p7.viewportChanged = true
			end)
		end,
		setActive = function(p7)
			-- upvalues: transact (ref), setActiveMutation (copy)
			return transact(setActiveMutation, p7)
		end,
		observeScrollOffset = function(p7)
			-- upvalues: transact (ref), observeScrollOffsetMutation (copy)
			return transact(observeScrollOffsetMutation, p7)
		end,
		scrollToIndex = if FFlagViewRecyclerReact084 then function(p7, p8, p9)
			-- upvalues: transact (ref), scrollToIndexMutation (ref)
			return transact(scrollToIndexMutation, p7, p8, p9)
		end else function(p7, p8)
			-- upvalues: transact (ref), scrollToIndexMutation (ref)
			return transact(scrollToIndexMutation, p7, p8)
		end,
		scrollToOffset = if FFlagViewRecyclerReact084 then function(p7, p8)
			-- upvalues: transact (ref), scrollToOffsetMutation (ref)
			return transact(scrollToOffsetMutation, p7, p8)
		end else function(p7)
			-- upvalues: transact (ref), scrollToOffsetMutation (ref)
			return transact(scrollToOffsetMutation, p7)
		end,
		scrollToStart = if FFlagViewRecyclerReact084 then function(p7)
			-- upvalues: transact (ref), scrollToEdgeMutation (ref), ScrollAlignmentModule (upval)
			return transact(scrollToEdgeMutation, ScrollAlignmentModule.Start, p7)
		end else function()
			-- upvalues: transact (ref), scrollToEdgeMutation (ref), FFlagViewRecyclerReact08 (upval), ScrollAlignmentModule (upval), AutoScrollTargetModule (upval)
			return transact(scrollToEdgeMutation, (if FFlagViewRecyclerReact08 then ScrollAlignmentModule else AutoScrollTargetModule).Start)
		end,
		scrollToEnd = if FFlagViewRecyclerReact084 then function(p7)
			-- upvalues: transact (ref), scrollToEdgeMutation (ref), ScrollAlignmentModule (upval)
			return transact(scrollToEdgeMutation, ScrollAlignmentModule.End, p7)
		end else function()
			-- upvalues: transact (ref), scrollToEdgeMutation (ref), FFlagViewRecyclerReact08 (upval), ScrollAlignmentModule (upval), AutoScrollTargetModule (upval)
			return transact(scrollToEdgeMutation, (if FFlagViewRecyclerReact08 then ScrollAlignmentModule else AutoScrollTargetModule).End)
		end,
		scrollBy = function(p7)
			-- upvalues: transact (ref), scrollByMutation (copy)
			return transact(scrollByMutation, p7)
		end,
		stepAnimatedScroll = if FFlagViewRecyclerReact084 then function(p7)
			-- upvalues: StartResult (ref), v2 (ref), transact (ref), StepAnimatedScrollMutation (ref)
			return if StartResult == nil then v2 else transact(StepAnimatedScrollMutation, p7)
		end else nil,
		stopAnimatedScroll = if FFlagViewRecyclerReact084 then function()
			-- upvalues: StartResult (ref), v2 (ref), transact (ref), Callback7 (ref)
			return if StartResult == nil then v2 else transact(function()
				-- upvalues: Callback7 (upval)
				Callback7()
			end)
		end else nil,
		restoreScrollAnchorSnapshot = function(p7)
			-- upvalues: transact (ref), FFlagViewRecyclerReact084 (upval), Callback7 (ref), moveTo (ref), ScrollAnchorModuleResult (copy), ViewportModuleResult (copy), finishProgrammaticScroll (ref), FFlagViewRecyclerReact08 (upval)
			return transact(function(p8)
				-- upvalues: FFlagViewRecyclerReact084 (upval), Callback7 (upval), moveTo (upval), ScrollAnchorModuleResult (upval), p7 (copy), ViewportModuleResult (upval), finishProgrammaticScroll (upval), FFlagViewRecyclerReact08 (upval)
				if FFlagViewRecyclerReact084 then
					Callback7()
					moveTo(p8, ScrollAnchorModuleResult.snapshotOffset(p7))
					ScrollAnchorModuleResult.restore(p7, ViewportModuleResult.getScrollOffset())
					finishProgrammaticScroll(p8, nil)
					
					return
				end
				if FFlagViewRecyclerReact08 then
					moveTo(p8, ScrollAnchorModuleResult.snapshotOffset(p7))
					ScrollAnchorModuleResult.restore(p7, ViewportModuleResult.getScrollOffset())
					finishProgrammaticScroll(p8, nil)
					
					return
				else
					ScrollAnchorModuleResult.restore(p7, ViewportModuleResult.scrollTo(ScrollAnchorModuleResult.snapshotOffset(p7)))
					p8.scrollPositionChanged = true
					p8.scrollPositionFollowsCorrection = false
					p8.scrollMoved = true
				end
			end)
		end,
		setViewportSize = function(p7, p8)
			-- upvalues: transact (ref), setViewportSizeMutation (copy)
			return transact(setViewportSizeMutation, p7, p8)
		end,
		setPolicy = function(p7)
			-- upvalues: FFlagViewRecyclerReact084 (upval), transact (ref), SetPolicy (ref)
			return if FFlagViewRecyclerReact084 then transact(SetPolicy, p7) else transact(function()
				-- upvalues: SetPolicy (upval), p7 (copy)
				SetPolicy(p7)
			end)
		end,
		setDataSource = function(DataSource1)
			-- upvalues: transact (ref), FFlagViewRecyclerReact084 (upval), Callback7 (ref), DataSource (ref), SubscribeResult (ref), PinnedItemPlannerModule (copy), resetData (copy)
			return transact(function(p7)
				-- upvalues: FFlagViewRecyclerReact084 (upval), Callback7 (upval), DataSource1 (copy), DataSource (upval), SubscribeResult (upval), PinnedItemPlannerModule (upval), resetData (upval)
				if FFlagViewRecyclerReact084 then
					Callback7()
				end
				if DataSource1 ~= DataSource then
					if SubscribeResult ~= nil then
						SubscribeResult()
						SubscribeResult = nil
					end
					DataSource = DataSource1
				end
				PinnedItemPlannerModule.setItemSequence(DataSource)
				resetData()
				p7.replaced = true
			end)
		end,
		setLayout = function(p7)
			-- upvalues: transact (ref), FFlagViewRecyclerReact084 (upval), Callback7 (ref), Layout (ref), ViewportModuleResult (copy), ListRowsModuleResult (copy), ScrollAnchorModuleResult (copy), readKeys (copy), DataSourceChangeTypeModule (upval), ResolveItemEstimates (ref)
			return transact(function()
				-- upvalues: FFlagViewRecyclerReact084 (upval), Callback7 (upval), p7 (copy), Layout (upval), ViewportModuleResult (upval), ListRowsModuleResult (upval), ScrollAnchorModuleResult (upval), readKeys (upval), DataSourceChangeTypeModule (upval), ResolveItemEstimates (upval)
				if FFlagViewRecyclerReact084 then
					Callback7()
				end
				Layout = p7
				ViewportModuleResult.setLayout(p7)
				local CrossAxisLength: number = ViewportModuleResult.getCrossAxisLength()
				
				if CrossAxisLength > 0 then
					p7.setViewportCrossAxisLength(CrossAxisLength)
				end
				ListRowsModuleResult.invalidateLayout()
				ScrollAnchorModuleResult.reset()
				Layout.applyDataSourceChange({
					type = DataSourceChangeTypeModule.Reset,
					keys = readKeys()
				})
				
				if FFlagViewRecyclerReact084 then
					ResolveItemEstimates()
				end
				ViewportModuleResult.refresh()
			end)
		end,
		setDataSourceAndLayout = function(DataSource1, p7)
			-- upvalues: transact (ref), FFlagViewRecyclerReact084 (upval), Callback7 (ref), DataSource (ref), SubscribeResult (ref), PinnedItemPlannerModule (copy), Layout (ref), ViewportModuleResult (copy), ListRowsModuleResult (copy), resetData (copy)
			return transact(function(p8)
				-- upvalues: FFlagViewRecyclerReact084 (upval), Callback7 (upval), DataSource1 (copy), DataSource (upval), SubscribeResult (upval), PinnedItemPlannerModule (upval), p7 (copy), Layout (upval), ViewportModuleResult (upval), ListRowsModuleResult (upval), resetData (upval)
				if FFlagViewRecyclerReact084 then
					Callback7()
				end
				if DataSource1 ~= DataSource then
					if SubscribeResult ~= nil then
						SubscribeResult()
						SubscribeResult = nil
					end
					DataSource = DataSource1
				end
				PinnedItemPlannerModule.setItemSequence(DataSource)
				Layout = p7
				ViewportModuleResult.setLayout(p7)
				local CrossAxisLength: number = ViewportModuleResult.getCrossAxisLength()
				
				if CrossAxisLength > 0 then
					p7.setViewportCrossAxisLength(CrossAxisLength)
				end
				ListRowsModuleResult.invalidateLayout()
				resetData()
				p8.replaced = true
			end)
		end,
		refresh = function()
			-- upvalues: transact (ref), ListRowsModuleResult (copy)
			return transact(function()
				-- upvalues: ListRowsModuleResult (upval)
				ListRowsModuleResult.invalidateKeys()
				ListRowsModuleResult.invalidatePayloads()
			end)
		end,
		submitMeasurements = function(p7)
			-- upvalues: transact (ref), submitMeasurements (copy)
			return transact(submitMeasurements, p7)
		end,
		getCurrent = function()
			-- upvalues: v2 (ref)
			return v2
		end,
		getItemLayout = function(FirstIndex)
			-- upvalues: Layout (ref)
			return Layout.getItemLayout(FirstIndex)
		end,
		getScrollOffsetForItem = function(p7, p8)
			-- upvalues: ViewportModuleResult (copy)
			return ViewportModuleResult.offsetForItem(p7, p8)
		end,
		captureScrollAnchorSnapshot = function()
			-- upvalues: v2 (ref), DataSource (ref), Layout (ref)
			local v8 = v2
			local VisibleRange = v8.visibleRange
			local ScrollOffset = v8.scrollState.scrollOffset
			
			if VisibleRange.firstIndex <= VisibleRange.lastIndex then
				local FirstIndex = VisibleRange.firstIndex
				
				return {
					anchorKey = DataSource.getItemKey(FirstIndex),
					anchorIndex = FirstIndex,
					offsetWithinItem = ScrollOffset - v8.contentStartOffset - Layout.getItemLayout(FirstIndex).startOffset,
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
			-- upvalues: Flag1 (ref), transact (ref), FFlagViewRecyclerReact084 (upval), Callback7 (ref), FFlagViewRecyclerReact08 (upval), SubscribeResult (ref), ListRowsModuleResult (copy), DataPrefetchControllerModuleResult (copy), PinnedItemPlannerModule (copy)
			if not Flag1 then
				transact(function(p7)
					-- upvalues: FFlagViewRecyclerReact084 (upval), Callback7 (upval), FFlagViewRecyclerReact08 (upval), SubscribeResult (upval), ListRowsModuleResult (upval), DataPrefetchControllerModuleResult (upval), PinnedItemPlannerModule (upval), Flag1 (upval)
					if FFlagViewRecyclerReact084 then
						p7.settlesScroll = false
						Callback7()
					elseif FFlagViewRecyclerReact08 then
						p7.settlesScroll = false
					else
						p7.policyEligible = false
					end
					if SubscribeResult ~= nil then
						SubscribeResult()
						SubscribeResult = nil
					end
					p7.departed = ListRowsModuleResult.release()
					ListRowsModuleResult.destroy()
					DataPrefetchControllerModuleResult.destroy()
					PinnedItemPlannerModule.destroy()
					Flag1 = true
				end)
				
				return
			end
		end,
		setScrollOffset = if FFlagViewRecyclerReact084 then nil elseif FFlagViewRecyclerReact08 then nil else function(p7)
			-- upvalues: transact (ref), SetScrollOffsetMutation (ref)
			return transact(SetScrollOffsetMutation, p7)
		end
	}
end
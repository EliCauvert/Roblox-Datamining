local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Map = LuauPolyfillModule.Map
local Object = LuauPolyfillModule.Object
local Set = LuauPolyfillModule.Set
local Console = LuauPolyfillModule.console
local v1 = require(Parent1.SafeFlags).createGetFFlag("VirtualizedListStableCells")()

local function _(p1): boolean --[[ Line: 36 | Named "isIndexTruthy" ]]
	return p1 ~= nil and p1 ~= 1
end

local BatchinatorModule = require(Parent.Interaction.Batchinator)
local FillRateHelperModule = require(script.Parent.FillRateHelper)
local config = {
	findNodeHandle = function(_) --[[ Line: 47 ]]
		warn("ReactNative.findNodeHandle is not implemented")
	end
}
local RefreshControl = nil
local ScrollViewModule = require(Parent.Components.ScrollView.ScrollView)
local StyleSheetModule = require(Parent.StyleSheet.StyleSheet)
local ViewModule = require(Parent.Components.View.View)
local ViewabilityHelperModule = require(script.Parent.ViewabilityHelper)

local function v19(...) --[[ Line: 65 ]]
	return {}
end

local InfoLogModule = require(Parent.Utilities.infoLog)
local InvariantModule = require(Parent.jsUtils.invariant)
local VirtualizeUtilsModule = require(script.Parent.VirtualizeUtils)
local KeyExtractorFunction = VirtualizeUtilsModule.keyExtractor
local ComputeWindowedRenderLimitsFunction = VirtualizeUtilsModule.computeWindowedRenderLimits
local ReactModule = require(Parent1.React)
local _ = require(Parent.Components.ScrollView.ScrollView)
local VirtualizedListContextModule = require(script.Parent.VirtualizedListContext)
local VirtualizedListCellContextProvider = VirtualizedListContextModule.VirtualizedListCellContextProvider
local VirtualizedListContextProvider = VirtualizedListContextModule.VirtualizedListContextProvider
local Callback = nil
local CreateResult = nil
local CellRenderer = nil

RefreshControl = function(p1) --[[ Line: 105 | Named "RefreshControl" ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", { Name = "RCTRefreshControl" }, p1.children)
end

local Flag = false
local DisplayName = ""

local _ = function(p1) --[[ Line: 411 | Named "horizontalOrDefault" ]]
	return p1 ~= nil and p1
end

local _ = function(p1) --[[ Line: 416 | Named "initialNumToRenderOrDefault" ]]
	return if p1 == nil then 10 else p1
end

local _ = function(p1) --[[ Line: 421 | Named "maxToRenderPerBatchOrDefault" ]]
	return if p1 == nil then 10 else p1
end

local _ = function(p1) --[[ Line: 426 | Named "onEndReachedThresholdOrDefault" ]]
	return if p1 == nil then 2 else p1
end

local _ = function(p1) --[[ Line: 431 | Named "scrollEventThrottleOrDefault" ]]
	return if p1 == nil then 50 else p1
end

local _ = function(p1) --[[ Line: 436 | Named "windowSizeOrDefault" ]]
	return if p1 == nil then 21 else p1
end

local _ = function(p1) --[[ Line: 447 | Named "compareItemDataOrDefault" ]]
	return if p1 == nil then function(p2, p3): boolean --[[ Line: 449 ]]
		return p2 == p3
	end else p1
end

local VirtualizedList = ReactModule.PureComponent:extend("VirtualizedList")
VirtualizedList.contextType = VirtualizedListContextModule.VirtualizedListContext

function VirtualizedList.init(p1, Props) --[[ Line: 676 ]]
	-- upvalues: Map (copy), InvariantModule (copy), FillRateHelperModule (copy), Boolean (copy), ComputeWindowedRenderLimitsFunction (copy), BatchinatorModule (copy), Array (copy), ViewabilityHelperModule (copy), Object (copy), Set (copy), Console (copy), Callback (ref), ReactModule (copy), ViewModule (copy), ScrollViewModule (copy), RefreshControl (ref), v1 (copy), InfoLogModule (copy)
	p1.props = Props
	p1._viewabilityTuples = {}
	p1._averageCellLength = 0
	p1._cellKeysToChildListKeys = Map.new()
	p1._cellRefs = {}
	p1._cellLayoutHandlers = {}
	p1._cellRefHandlers = {}
	p1._frames = {}
	p1._footerLength = 0
	p1._hasDoneInitialScroll = false
	p1._hasInteracted = false
	p1._hasMore = false
	p1._hasWarned = {}
	p1._headerLength = 0
	p1._hiPriInProgress = false
	p1._highestMeasuredFrameIndex = 1
	p1._indicesToKeys = Map.new()
	p1._nestedChildLists = Map.new()
	p1._offsetFromParentVirtualizedList = 0
	p1._prevParentOffset = 0
	p1._scrollMetrics = {
		contentLength = 0,
		dOffset = 0,
		dt = 10,
		offset = 0,
		timestamp = 0,
		velocity = 0,
		visibleLength = 0
	}
	p1._scrollRef = nil
	p1._sentEndForContentLength = 0
	p1._totalCellLength = 0
	p1._totalCellsMeasured = 0
	p1._canvasPosition = Vector2.new(0, 0)
	p1._canvasSize = UDim2.new(0, 0, 0, 0)
	p1._invertedCanvasLength = if p1.props.getItemLayout then 0 else p1.props.invertedCanvasLength or 1000
	
	function p1._getFrameMetrics(Index) --[[ Line: 720 ]]
		-- upvalues: p1 (copy), InvariantModule (upval)
		local Data = p1.props.data
		local GetItemFunction = p1.props.getItem
		local GetItemLayoutFunction = p1.props.getItemLayout
		InvariantModule(Index <= p1.props.getItemCount(Data), "Tried to get frame for out of range index " .. tostring(Index))
		local Item = GetItemFunction(Data, Index)
		local Item1 = if Item == nil then Item else p1._frames[p1:_keyExtractor(Item, Index)]
		
		if (not Item1 or Item1.index ~= Index) and GetItemLayoutFunction then
			Item1 = GetItemLayoutFunction(Data, Index)
		end
		return Item1
	end
	
	local WindowSize = Props.windowSize
	InvariantModule((if WindowSize == nil then 21 else WindowSize) > 0, "VirtualizedList: The windowSize prop must be present and set to a value greater than 0.")
	p1._fillRateHelper = FillRateHelperModule.new(p1._getFrameMetrics)
	
	function p1._updateCellsToRender() --[[ Line: 758 ]]
		-- upvalues: p1 (copy), Boolean (upval), ComputeWindowedRenderLimitsFunction (upval)
		local Data = p1.props.data
		local GetItemCountFunction = p1.props.getItemCount
		local OnEndReachedThreshold = p1.props.onEndReachedThreshold
		local OnEndReachedThreshold1 = if OnEndReachedThreshold == nil then 2 else OnEndReachedThreshold
		local IsVirtualizationDisabled = p1:_isVirtualizationDisabled()
		p1:_updateViewableItems(Data)
		
		if Boolean.toJSBoolean(Data) then
			p1:setState(function(DerivedStateFromProps) --[[ Line: 767 ]]
				-- upvalues: p1 (upval), IsVirtualizationDisabled (copy), Boolean (upval), ComputeWindowedRenderLimitsFunction (upval), OnEndReachedThreshold1 (copy), GetItemCountFunction (copy), Data (copy)
				local DerivedStateFromProps1 = nil
				local ContentLength: number = p1._scrollMetrics.contentLength
				local Offset = p1._scrollMetrics.offset
				local VisibleLength: number = p1._scrollMetrics.visibleLength
				
				if IsVirtualizationDisabled then
					local MaxToRenderPerBatch1 = nil
					if ContentLength - VisibleLength - Offset < OnEndReachedThreshold1 * VisibleLength then
						local MaxToRenderPerBatch = p1.props.maxToRenderPerBatch
						MaxToRenderPerBatch1 = if MaxToRenderPerBatch == nil then 10 else MaxToRenderPerBatch
					else
						MaxToRenderPerBatch1 = 0
					end
					DerivedStateFromProps1 = {
						first = 1,
						last = math.min(DerivedStateFromProps.last + MaxToRenderPerBatch1, GetItemCountFunction(Data))
					}
				elseif VisibleLength > 0 and ContentLength > 0 then
					local InitialScrollIndex = p1.props.initialScrollIndex
					
					if InitialScrollIndex == nil or InitialScrollIndex == 1 or Boolean.toJSBoolean(p1._scrollMetrics.offset) then
						local MaxToRenderPerBatch = p1.props.maxToRenderPerBatch
						local WindowSize = p1.props.windowSize
						DerivedStateFromProps1 = ComputeWindowedRenderLimitsFunction(p1.props.data, p1.props.getItemCount, if MaxToRenderPerBatch == nil then 10 else MaxToRenderPerBatch, if WindowSize == nil then 21 else WindowSize, DerivedStateFromProps, p1._getFrameMetricsApprox, p1._scrollMetrics)
					end
				end
				if DerivedStateFromProps1 ~= nil and p1._nestedChildLists.size > 0 then
					local Last = DerivedStateFromProps1.last
					local First = DerivedStateFromProps1.first
					local Flag = nil
					while First <= Last do
						local GetResult = p1._indicesToKeys:get(First)
						local GetResult1 = if Boolean.toJSBoolean(GetResult) then p1._cellKeysToChildListKeys:get(GetResult) else GetResult
						
						if not Boolean.toJSBoolean(GetResult1) then continue end
						Flag = false
						
						for _, value in ipairs(GetResult1) do
							local GetResult2 = p1._nestedChildLists:get(value)
							
							if GetResult2 and GetResult2.ref and GetResult2.ref:hasMore() then
								Flag = true
								break
							end
						end
						if Flag then
							DerivedStateFromProps1.last = First
							break
						end
						First += 1
					end
				end
				if DerivedStateFromProps1 ~= nil and DerivedStateFromProps1.first == DerivedStateFromProps.first and DerivedStateFromProps1.last == DerivedStateFromProps.last then
					DerivedStateFromProps1 = nil
				end
				return DerivedStateFromProps1
			end)
			
			return
		end
	end
	
	p1._updateCellsToRenderBatcher = BatchinatorModule.new(p1._updateCellsToRender, if p1.props.updateCellsBatchingPeriod == nil then 50 else p1.props.updateCellsBatchingPeriod)
	
	if p1.props.viewabilityConfigCallbackPairs then
		p1._viewabilityTuples = Array.map(p1.props.viewabilityConfigCallbackPairs, function(p2) --[[ Line: 850 ]]
			-- upvalues: ViewabilityHelperModule (upval)
			return {
				viewabilityHelper = ViewabilityHelperModule.new(p2.viewabilityConfig),
				onViewableItemsChanged = p2.onViewableItemsChanged
			}
		end)
	else
		local OnViewableItemsChanged = p1.props.onViewableItemsChanged
		local ViewabilityConfig = p1.props.viewabilityConfig
		
		if OnViewableItemsChanged then
			table.insert(p1._viewabilityTuples, {
				viewabilityHelper = ViewabilityHelperModule.new(ViewabilityConfig),
				onViewableItemsChanged = OnViewableItemsChanged
			})
		end
	end
	local InitialScrollIndex = p1.props.initialScrollIndex
	local IsNotInitialScrollIndexMatch: boolean = InitialScrollIndex ~= nil and InitialScrollIndex ~= 1
	local InitialScrollIndex1 = p1.props.initialScrollIndex
	local IsNotInitialScrollIndexMatch1: boolean = InitialScrollIndex1 ~= nil and InitialScrollIndex1 ~= 1
	local InitialNumToRender = p1.props.initialNumToRender
	local State = {
		scrollPositionDelta = 0,
		first = if IsNotInitialScrollIndexMatch then p1.props.initialScrollIndex else 1,
		last = math.min(p1.props.getItemCount(p1.props.data) + 1, (if IsNotInitialScrollIndexMatch1 then p1.props.initialScrollIndex else 1) + (if InitialNumToRender == nil then 10 else InitialNumToRender)) - 1,
		firstItemTracked = if p1.props.data and p1.props.getItemCount(p1.props.data) > 0 then p1.props.getItem(p1.props.data, 1) else Object.None
	}
	
	if p1:_isNestedWithSameOrientation() then
		local NestedChildState = p1.context.getNestedChildState(p1:_getListKey())
		
		if Boolean.toJSBoolean(NestedChildState) then
			State = NestedChildState
			p1.state = NestedChildState
			p1._frames = NestedChildState.frames
		end
	end
	p1.state = State
	
	function p1._getScrollMetrics() --[[ Line: 891 ]]
		-- upvalues: p1 (copy)
		return p1._scrollMetrics
	end
	
	function p1._getOutermostParentListRef() --[[ Line: 895 ]]
		-- upvalues: p1 (copy)
		return if p1:_isNestedWithSameOrientation() then p1.context.getOutermostParentListRef() else p1
	end
	
	function p1._getNestedChildState(p2) --[[ Line: 903 ]]
		-- upvalues: p1 (copy)
		local GetResult = p1._nestedChildLists:get(p2)
		
		return if GetResult then GetResult.state else GetResult
	end
	
	function p1._registerAsNestedChild(p2) --[[ Line: 908 ]]
		-- upvalues: p1 (copy), Set (upval), Console (upval), Callback (upval), Object (upval), Boolean (upval)
		local GetResult = p1._cellKeysToChildListKeys:get(p2.cellKey) or Set.new()
		GetResult:add(p2.key)
		p1._cellKeysToChildListKeys:set(p2.cellKey, GetResult)
		local GetResult1 = p1._nestedChildLists:get(p2.key)
		
		if GetResult1 and GetResult1.ref ~= nil then
			Console.error("A VirtualizedList contains a cell which itself contains " .. "more than one VirtualizedList of the same orientation as the parent " .. "list. You must pass a unique listKey prop to each sibling list.\n\n" .. Callback(Object.assign({}, p2, {
				horizontal = Boolean.toJSBoolean(p2.ref.props.horizontal)
			})))
		end
		p1._nestedChildLists:set(p2.key, { state = nil, ref = p2.ref })
		
		if p1._hasInteracted then
			p2.ref:recordInteraction()
		end
		return nil
	end
	
	function p1._unregisterAsNestedChild(p2) --[[ Line: 940 ]]
		-- upvalues: p1 (copy)
		p1._nestedChildLists:set(p2.key, { ref = nil, state = p2.state })
	end
	
	function p1._onUpdateSeparators(p2, p3) --[[ Line: 947 ]]
		-- upvalues: Array (upval), p1 (copy), Boolean (upval)
		Array.forEach(p2, function(p4) --[[ Line: 948 ]]
			-- upvalues: p1 (upval), Boolean (upval), p3 (copy)
			local CellRef = p4 ~= nil and p1._cellRefs[tostring(p4)]
			
			if not Boolean.toJSBoolean(CellRef) then return end
			return CellRef:updateSeparatorProps(p3)
		end)
	end
	
	function p1._getSpacerKey(p2): string --[[ Line: 956 ]]
		return if p2 then "height" else "width"
	end
	
	function p1._captureScrollRef(_scrollRef) --[[ Line: 960 ]]
		-- upvalues: p1 (copy)
		p1._scrollRef = _scrollRef
	end
	
	function p1._defaultRenderScrollComponent(Tbl) --[[ Line: 964 ]]
		-- upvalues: p1 (copy), ReactModule (upval), ViewModule (upval), InvariantModule (upval), ScrollViewModule (upval), Object (upval), RefreshControl (upval)
		local OnRefresh = Tbl.onRefresh
		
		if p1:_isNestedWithSameOrientation() then
			return ReactModule.createElement(ViewModule, Tbl)
		elseif OnRefresh then
			InvariantModule(typeof(Tbl.refreshing) == "boolean", "`refreshing` prop must be set as a boolean in order to use `onRefresh`, but got `" .. (if Tbl.refreshing == nil then "undefined" else tostring(Tbl.refreshing) .. "`"))
			
			return ReactModule.createElement(ScrollViewModule, Object.assign(table.clone(Tbl), {
				refreshControl = if Tbl.refreshControl == nil then ReactModule.createElement(RefreshControl, {
					refreshing = Tbl.refreshing,
					onRefresh = OnRefresh,
					progressViewOffset = Tbl.progressViewOffset
				}) else Tbl.refreshControl
			}))
		else
			return ReactModule.createElement(ScrollViewModule, Tbl)
		end
	end
	
	function p1._onCellUnmount(p2) --[[ Line: 994 ]]
		-- upvalues: p1 (copy), Object (upval), v1 (upval)
		local Frame = p1._frames[p2]
		
		if Frame ~= nil then
			p1._frames[p2] = Object.assign({}, Frame, { inLayout = false })
		end
		if v1 then
			p1._cellLayoutHandlers[p2] = nil
			p1._cellRefHandlers[p2] = nil
		end
	end
	
	function p1._onLayout(Frame: Frame) --[[ Line: 1005 ]]
		-- upvalues: p1 (copy)
		if p1:_isNestedWithSameOrientation() then
			p1:measureLayoutRelativeToContainingList()
		else
			p1._scrollMetrics.visibleLength = p1:_selectLength({
				width = Frame.AbsoluteSize.X,
				height = Frame.AbsoluteSize.Y
			})
		end
		if p1.props.onLayout then
			p1.props.onLayout(Frame)
		end
		p1:_scheduleCellsToRenderUpdate()
		p1:_maybeCallOnEndReached()
	end
	
	function p1._onLayoutEmpty(p2) --[[ Line: 1023 ]]
		-- upvalues: p1 (copy)
		if p1.props.onLayout then
			p1.props.onLayout(p2)
		end
	end
	
	function p1._onLayoutFooter(Frame: Frame) --[[ Line: 1029 ]]
		-- upvalues: p1 (copy)
		p1:_triggerRemeasureForChildListsInCell(p1:_getFooterCellKey())
		p1._footerLength = p1:_selectLength({
			height = Frame.AbsoluteSize.Y,
			width = Frame.AbsoluteSize.X
		})
	end
	
	function p1._onLayoutHeader(Frame: Frame) --[[ Line: 1037 ]]
		-- upvalues: p1 (copy)
		p1._headerLength = p1:_selectLength({
			height = Frame.AbsoluteSize.Y,
			width = Frame.AbsoluteSize.X
		})
	end
	
	function p1._onContentSizeChange(Width: number, Height: number) --[[ Line: 1044 ]]
		-- upvalues: p1 (copy)
		if Width > 0 and Height > 0 and p1.props.initialScrollIndex ~= nil and p1.props.initialScrollIndex > 1 and not p1._hasDoneInitialScroll then
			if p1.props.contentOffset == nil then
				p1:scrollToIndex({ animated = false, index = p1.props.initialScrollIndex })
			end
			p1._hasDoneInitialScroll = true
		elseif p1.props.inverted and Width > 0 and Height > 0 and not p1._hasDoneInitialScroll then
			p1._hasDoneInitialScroll = true
			task.defer(function() --[[ Line: 1059 ]]
				-- upvalues: p1 (upval)
				while p1:getScrollRef() == nil do
					task.wait()
				end
				if p1.props.contentOffset == nil then
					local Current = p1:getScrollRef()._nativeRef.current
					
					if p1.props.horizontal then
						Current.CanvasPosition = Vector2.new(Current.AbsoluteCanvasSize.X, Current.CanvasPosition.Y)
						
						return
					end
					Current.CanvasPosition = Vector2.new(Current.CanvasPosition.X, Current.AbsoluteCanvasSize.Y)
				end
			end)
		end
		if p1.props.onContentSizeChange then
			p1.props.onContentSizeChange(Width, Height)
		end
		p1._scrollMetrics.contentLength = p1:_selectLength({ height = Height, width = Width })
		p1:_scheduleCellsToRenderUpdate()
		p1:_maybeCallOnEndReached()
	end
	
	function p1._convertParentScrollMetrics(_scrollMetrics) --[[ Line: 1087 ]]
		-- upvalues: p1 (copy)
		local OffsetDelta = _scrollMetrics.offset - p1._offsetFromParentVirtualizedList
		
		return {
			visibleLength = _scrollMetrics.visibleLength,
			contentLength = p1._scrollMetrics.contentLength,
			offset = OffsetDelta,
			dOffset = OffsetDelta - p1._scrollMetrics.offset
		}
	end
	
	function p1._onScroll(ScrollFrame) --[[ Line: 1106 ]]
		-- upvalues: p1 (copy), Boolean (upval), InfoLogModule (upval)
		p1._nestedChildLists:forEach(function(p2) --[[ Line: 1107 ]]
			-- upvalues: ScrollFrame (copy)
			if p2.ref then
				p2.ref._onScroll(ScrollFrame)
			end
		end)
		
		if p1.props.onScroll then
			p1.props.onScroll(ScrollFrame)
		end
		local ClockTime = os.clock()
		local Child = ScrollFrame:GetChildren()[1]
		local SelectLengthResult = p1:_selectLength({
			height = ScrollFrame.AbsoluteSize.Y,
			width = ScrollFrame.AbsoluteSize.X
		})
		local SelectLengthResult1 = p1:_selectLength({
			height = Child.AbsoluteSize.Y,
			width = Child.AbsoluteSize.X
		})
		local SelectOffsetResult = if p1.props.inverted then p1:_selectOffset({
			x = ScrollFrame.AbsoluteCanvasSize.X - ScrollFrame.CanvasPosition.X - SelectLengthResult,
			y = ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.CanvasPosition.Y - SelectLengthResult
		}) else p1:_selectOffset({
			x = ScrollFrame.CanvasPosition.X,
			y = ScrollFrame.CanvasPosition.Y
		})
		local SelectOffsetResultDelta = SelectOffsetResult - p1._scrollMetrics.offset
		
		if p1:_isNestedWithSameOrientation() then
			if p1._scrollMetrics.contentLength == 0 then return end
			local ConvertParentScrollMetricsResult = p1._convertParentScrollMetrics({ SelectLengthResult, SelectOffsetResult })
			SelectLengthResult = ConvertParentScrollMetricsResult.visibleLength
			SelectLengthResult1 = ConvertParentScrollMetricsResult.contentLength
			SelectOffsetResult = ConvertParentScrollMetricsResult.offset
			SelectOffsetResultDelta = ConvertParentScrollMetricsResult.dOffset
		end
		local Largest: number = if Boolean.toJSBoolean(p1._scrollMetrics.timestamp) then math.max(1, (ClockTime - p1._scrollMetrics.timestamp) * 1000) else 1
		local SelectOffsetResultDeltaRatio = SelectOffsetResultDelta / Largest
		
		if Largest > 500 and p1._scrollMetrics.dt > 500 and 5 * SelectLengthResult < SelectLengthResult1 and not p1._hasWarned.perf then
			InfoLogModule("VirtualizedList: You have a large list that is slow to update - make sure your renderItem function renders components that follow React performance best practices like PureComponent, shouldComponentUpdate, etc.", {
				dt = Largest,
				prevDt = p1._scrollMetrics.dt,
				contentLength = SelectLengthResult1
			})
			p1._hasWarned.perf = true
		end
		p1._scrollMetrics = {
			contentLength = SelectLengthResult1,
			dt = Largest,
			dOffset = SelectOffsetResultDelta,
			offset = SelectOffsetResult,
			timestamp = ClockTime,
			velocity = SelectOffsetResultDeltaRatio,
			visibleLength = SelectLengthResult
		}
		local ScrollPositionDelta: number = p1.state.scrollPositionDelta
		
		if ScrollPositionDelta > 0 then
			p1:setState(function(DerivedStateFromProps) --[[ Line: 1175 ]]
				-- upvalues: ScrollPositionDelta (copy)
				return {
					scrollPositionDelta = 0,
					first = DerivedStateFromProps.first + ScrollPositionDelta,
					last = DerivedStateFromProps.last + ScrollPositionDelta
				}
			end)
		end
		p1:_updateViewableItems(p1.props.data)
		
		if not p1.props then return end
		p1:_maybeCallOnEndReached()
		
		if SelectOffsetResultDeltaRatio ~= 0 then
			p1._fillRateHelper:activate()
		end
		p1:_computeBlankness()
		p1:_scheduleCellsToRenderUpdate()
	end
	
	function p1._onScrollBeginDrag(p2) --[[ Line: 1195 ]]
		-- upvalues: p1 (copy), Array (upval)
		p1._nestedChildLists:forEach(function(p3) --[[ Line: 1196 ]]
			-- upvalues: p2 (copy)
			if p3.ref then
				p3.ref._onScrollBeginDrag(p2)
			end
		end)
		Array.forEach(p1._viewabilityTuples, function(p3) --[[ Line: 1201 ]]
			p3.viewabilityHelper:recordInteraction()
		end)
		p1._hasInteracted = true
		
		if p1.props.onScrollBeginDrag then
			p1.props.onScrollBeginDrag(p2)
		end
	end
	
	function p1._onScrollEndDrag(p2) --[[ Line: 1210 ]]
		-- upvalues: p1 (copy), Boolean (upval)
		p1._nestedChildLists:forEach(function(p3) --[[ Line: 1211 ]]
			-- upvalues: p2 (copy)
			if p3.ref then
				p3.ref._onScrollEndDrag(p2)
			end
		end)
		
		if Boolean.toJSBoolean(nil) then
			p1._scrollMetrics.velocity = p1:_selectOffset(nil)
		end
		p1:_computeBlankness()
		
		if p1.props.onScrollEndDrag then
			p1.props.onScrollEndDrag(p2)
		end
	end
	
	function p1._onMomentumScrollBegin(p2) --[[ Line: 1229 ]]
		-- upvalues: p1 (copy)
		p1._nestedChildLists:forEach(function(p3) --[[ Line: 1230 ]]
			-- upvalues: p2 (copy)
			if p3.ref then
				p3.ref._onMomentumScrollBegin(p2)
			end
		end)
		
		if p1.props.onMomentumScrollBegin then
			p1.props.onMomentumScrollBegin(p2)
		end
	end
	
	function p1._onMomentumScrollEnd(p2) --[[ Line: 1240 ]]
		-- upvalues: p1 (copy)
		p1._nestedChildLists:forEach(function(p3) --[[ Line: 1241 ]]
			-- upvalues: p2 (copy)
			if p3.ref then
				p3.ref._onMomentumScrollEnd(p2)
			end
		end)
		p1._scrollMetrics.velocity = 0
		p1:_computeBlankness()
		
		if p1.props.onMomentumScrollEnd then
			p1.props.onMomentumScrollEnd(p2)
		end
	end
	
	function p1._createViewToken(Index, IsViewable) --[[ Line: 1253 ]]
		-- upvalues: p1 (copy)
		local Item = p1.props.getItem(p1.props.data, Index)
		
		return {
			index = Index,
			item = Item,
			key = p1:_keyExtractor(Item, Index),
			isViewable = IsViewable
		}
	end
	
	function p1._getFrameMetricsApprox(First: number) --[[ Line: 1268 ]]
		-- upvalues: p1 (copy), InvariantModule (upval)
		local FrameMetrics = p1._getFrameMetrics(First)
		
		if FrameMetrics == nil or FrameMetrics.index ~= First then
			InvariantModule(not p1.props.getItemLayout, "Should not have to estimate frames when a measurement metrics function is provided")
			
			return {
				length = p1._averageCellLength,
				offset = p1._averageCellLength * (First - 1)
			}
		else
			return FrameMetrics
		end
	end
end

function VirtualizedList.scrollToEnd(p2, p3) --[[ Line: 1289 ]]
	-- upvalues: Console (copy)
	local Animated = p3 == nil or p3.animated
	local FrameMetricsApprox = p2._getFrameMetricsApprox((p2.props.getItemCount(p2.props.data)))
	local Largest: number = if p2.props.inverted then 0 else math.max(0, FrameMetricsApprox.offset + FrameMetricsApprox.length + p2._footerLength - p2._scrollMetrics.visibleLength)
	
	if p2._scrollRef == nil then return end
	if p2._scrollRef.scrollTo == nil then
		Console.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.")
		
		return
	else
		local Horizontal = p2.props.horizontal
		local Horizontal1 = Horizontal ~= nil and Horizontal
		p2._scrollRef.scrollTo(if Horizontal1 then { x = Largest, animated = Animated } else { y = Largest, animated = Animated })
	end
end

function VirtualizedList.scrollToIndex(p2, AssignResult) --[[ Line: 1319 ]]
	-- upvalues: InvariantModule (copy), Boolean (copy), Console (copy)
	local Data = p2.props.data
	local Horizontal = p2.props.horizontal
	local GetItemCountFunction = p2.props.getItemCount
	local GetItemLayout = p2.props.getItemLayout
	local OnScrollToIndexFailedFunction: (any) -> () = p2.props.onScrollToIndexFailed
	local Animated = AssignResult.animated
	local Index: number = AssignResult.index
	local ViewOffset = AssignResult.viewOffset
	local ViewPosition = AssignResult.viewPosition
	InvariantModule(Index >= 1, ("scrollToIndex out of range: requested index %d but minimum is 1"):format(Index))
	InvariantModule(GetItemCountFunction(Data) >= 1, ("scrollToIndex out of range: item length %d but minimum is 1"):format(GetItemCountFunction(Data)))
	InvariantModule(Index <= GetItemCountFunction(Data), ("scrollToIndex out of range: requested index %d is out of 1 to %d"):format(Index, GetItemCountFunction(Data)))
	
	if not GetItemLayout and p2._highestMeasuredFrameIndex < Index then
		InvariantModule(Boolean.toJSBoolean(OnScrollToIndexFailedFunction), "scrollToIndex should be used in conjunction with getItemLayout or onScrollToIndexFailed, otherwise there is no way to know the location of offscreen indices or handle failures.")
		OnScrollToIndexFailedFunction({
			averageItemLength = p2._averageCellLength,
			highestMeasuredFrameIndex = p2._highestMeasuredFrameIndex,
			index = Index
		})
		
		return
	end
	local Current = if p2:getScrollRef() then p2:getScrollRef()._nativeRef.current else nil
	
	if Current == nil then return end
	local AbsoluteCanvasSize = Current.AbsoluteCanvasSize
	local AbsoluteSize = Current.AbsoluteSize
	local FrameMetricsApprox = p2._getFrameMetricsApprox(Index)
	local LargestDelta = math.max(0, if p2.props.inverted then (if Horizontal then AbsoluteCanvasSize.X else AbsoluteCanvasSize.Y) - (if Horizontal then AbsoluteSize.X else AbsoluteSize.Y) - FrameMetricsApprox.offset - (Boolean.toJSBoolean(ViewPosition) and ViewPosition or 0) * (p2._scrollMetrics.visibleLength - FrameMetricsApprox.length) else FrameMetricsApprox.offset - (Boolean.toJSBoolean(ViewPosition) and ViewPosition or 0) * (p2._scrollMetrics.visibleLength - FrameMetricsApprox.length)) - (Boolean.toJSBoolean(ViewOffset) and ViewOffset or 0)
	
	if p2._scrollRef == nil then return end
	if p2._scrollRef.scrollTo == nil then
		Console.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.")
		
		return
	else
		p2._scrollRef.scrollTo(if Horizontal then { x = LargestDelta, animated = Animated } else { y = LargestDelta, animated = Animated })
	end
end

function VirtualizedList.scrollToItem(p2, p3) --[[ Line: 1402 ]]
	-- upvalues: Object (copy)
	local Item = p3.item
	local Data = p2.props.data
	local GetItemFunction = p2.props.getItem
	local ItemCount = p2.props.getItemCount(Data)
	local Index = 1
	while Index <= ItemCount do
		if GetItemFunction(Data, Index) == Item then
			p2:scrollToIndex(Object.assign({}, p3, { index = Index }))
			break
		end
		Index += 1
	end
end

function VirtualizedList.scrollToOffset(p4, p5) --[[ Line: 1431 ]]
	-- upvalues: Console (copy)
	local Current = if p4:getScrollRef() then p4:getScrollRef()._nativeRef.current else nil
	
	if Current == nil then return end
	local Animated = p5.animated
	local Offset = p5.offset
	
	if p4._scrollRef == nil then return end
	if p4.props.inverted then
		local AbsoluteCanvasSize = Current.AbsoluteCanvasSize
		local AbsoluteSize = Current.AbsoluteSize
		Offset = (if p4.props.horizontal then AbsoluteCanvasSize.X else AbsoluteCanvasSize.Y) - Offset - (if p4.props.horizontal then AbsoluteSize.X else AbsoluteSize.Y)
	end
	if p4._scrollRef.scrollTo == nil then
		Console.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.")
		
		return
	else
		local Horizontal = p4.props.horizontal
		local Horizontal1 = Horizontal ~= nil and Horizontal
		p4._scrollRef.scrollTo(if Horizontal1 then { x = Offset, animated = Animated } else { y = Offset, animated = Animated })
	end
end

function VirtualizedList.recordInteraction(p4) --[[ Line: 1477 ]]
	-- upvalues: Array (copy)
	p4._nestedChildLists:forEach(function(p5) --[[ Line: 1478 ]]
		if p5.ref then
			p5.ref:recordInteraction()
		end
	end)
	Array.forEach(p4._viewabilityTuples, function(p5) --[[ Line: 1483 ]]
		p5.viewabilityHelper:recordInteraction()
	end)
	p4:_updateViewableItems(p4.props.data)
end

function VirtualizedList.flashScrollIndicators(p4) --[[ Line: 1489 ]]
	if p4._scrollRef ~= nil then
		p4._scrollRef:flashScrollIndicators()
		
		return
	end
end

function VirtualizedList.getScrollResponder(p4) --[[ Line: 1502 ]]
	return if p4._scrollRef and p4._scrollRef.getScrollResponder then p4._scrollRef:getScrollResponder() else nil
end

function VirtualizedList.getScrollableNode(p4) --[[ Line: 1510 ]]
	-- upvalues: config (copy)
	return if p4._scrollRef and p4._scrollRef.getScrollableNode then p4._scrollRef:getScrollableNode() else config.findNodeHandle(p4._scrollRef)
end

function VirtualizedList.getScrollRef(p4) --[[ Line: 1518 ]]
	return if p4._scrollRef and p4._scrollRef.getScrollRef then p4._scrollRef:getScrollRef() else p4._scrollRef
end

function VirtualizedList.setNativeProps(p4, p5) --[[ Line: 1526 ]]
	if p4._scrollRef then
		p4._scrollRef:setNativeProps(p5)
	end
end

function VirtualizedList._getCellKey(p4) --[[ Line: 1532 ]]
	return if p4.context and p4.context.cellKey then p4.context.cellKey else "rootList"
end

function VirtualizedList._getListKey(p4) --[[ Line: 1536 ]]
	-- upvalues: Boolean (copy)
	return if Boolean.toJSBoolean(p4.props.listKey) then p4.props.listKey else p4:_getCellKey()
end

function VirtualizedList._getDebugInfo(p4) --[[ Line: 1540 ]]
	local Horizontal = p4.props.horizontal
	
	return {
		listKey = p4:_getListKey(),
		cellKey = p4:_getCellKey(),
		horizontal = Horizontal ~= nil and Horizontal,
		parent = if p4.context then p4.context.debugInfo else nil
	}
end

function VirtualizedList.hasMore(p4) --[[ Line: 1549 ]]
	return p4._hasMore
end

function VirtualizedList.componentDidMount(Ref) --[[ Line: 1553 ]]
	if Ref:_isNestedWithSameOrientation() then
		Ref.context.registerAsNestedChild({
			cellKey = Ref:_getCellKey(),
			key = Ref:_getListKey(),
			ref = Ref,
			parentDebugInfo = Ref.context.debugInfo
		})
	end
end

function VirtualizedList.componentWillUnmount(p4) --[[ Line: 1568 ]]
	-- upvalues: Array (copy)
	if p4:_isNestedWithSameOrientation() then
		p4.context.unregisterAsNestedChild({
			key = p4:_getListKey(),
			state = {
				first = p4.state.first,
				last = p4.state.last,
				frames = p4._frames
			}
		})
	end
	p4:_updateViewableItems(nil)
	p4._updateCellsToRenderBatcher:dispose({ abort = true })
	Array.forEach(p4._viewabilityTuples, function(p5) --[[ Line: 1577 ]]
		p5.viewabilityHelper:dispose()
	end)
	p4._fillRateHelper:deactivateAndFlush()
end

function VirtualizedList.getDerivedStateFromProps(p4, DerivedStateFromProps) --[[ Line: 1583 ]]
	-- upvalues: Console (copy), Object (copy)
	local Data = p4.data
	local GetItemCountFunction = p4.getItemCount
	local FirstItemTracked = DerivedStateFromProps.firstItemTracked
	local ScrollPositionDelta = DerivedStateFromProps.scrollPositionDelta
	local CompareItemData = p4.compareItemData
	local Callback = if CompareItemData == nil then function(p5, p6): boolean --[[ Line: 449 ]]
		return p5 == p6
	end else CompareItemData
	local Item = if Data and GetItemCountFunction(Data) > 0 then p4.getItem(Data, 1) else nil
	
	local function findItem(p5, FirstItemTracked): number --[[ Line: 1590 ]]
		-- upvalues: Callback (copy)
		local v2: number? = nil
		
		for i = 1, #p5 do
			if not Callback(p5[i], FirstItemTracked) then
				continue
			end
			v2 = i
			break
		end
		return if v2 == nil then 1 else v2
	end
	
	if p4.maintainVisibleContentPosition and ScrollPositionDelta == 0 and FirstItemTracked ~= nil and Item ~= nil then
		ScrollPositionDelta = if Callback(FirstItemTracked, Item) then 0 else findItem(Data, FirstItemTracked) - 1
	end
	local ItemCount: number = GetItemCountFunction(Data)
	local MaxToRenderPerBatch = p4.maxToRenderPerBatch
	local Largest = math.max(1, (math.min(DerivedStateFromProps.first, ItemCount - (if MaxToRenderPerBatch == nil then 10 else MaxToRenderPerBatch))))
	
	if ItemCount > 0 and ItemCount < Largest + ScrollPositionDelta then
		ScrollPositionDelta = 0
		Console.warn("WARNING: maintainVisibleContentPosition failed because scrollPositionDelta was out of bounds. This could indicate that items in `data` are getting removed, items are getting added to the middle of `data`, or a different `data` array is getting passed in. Consider changing the `key` prop of the List if the `data` prop is significantly altered.")
	end
	if ScrollPositionDelta > 0 then
		for i = 1, math.min(ScrollPositionDelta, ItemCount) do
			p4.getItem(Data, i).shouldResizeOnMount = true
		end
	end
	return {
		first = Largest,
		last = math.max(1, (math.min(DerivedStateFromProps.last, ItemCount))),
		firstItemTracked = Item or Object.None,
		scrollPositionDelta = ScrollPositionDelta
	}
end

function VirtualizedList._pushCells(p6, List1, List, NewResult, Count, Count1: number, HorizontallyInverted) --[[ Line: 1646 ]]
	-- upvalues: ReactModule (copy), CellRenderer (ref), v1 (copy)
	local CellRendererComponent = p6.props.CellRendererComponent
	local ItemSeparatorComponent = p6.props.ItemSeparatorComponent
	local Data = p6.props.data
	local GetItemFunction = p6.props.getItem
	local Horizontal = p6.props.horizontal
	local v3: number = if p6.props.ListHeaderComponent then 1 else 0
	local ItemCount: number = p6.props.getItemCount(Data)
	local PrevCellKey = nil
	local Smallest = math.min(ItemCount, Count1)
	local Index: number = Count
	while Index <= Smallest do
		local Item = GetItemFunction(Data, Index)
		local KeyExtractorResult = p6:_keyExtractor(Item, Index)
		p6._indicesToKeys:set(Index, KeyExtractorResult)
		
		if NewResult:has(Index + v3) then
			table.insert(List, #List1)
		end
		local CreateElementFunction = ReactModule.createElement
		local CellRenderer1 = CellRenderer
		local config = {
			CellRendererComponent = CellRendererComponent,
			ItemSeparatorComponent = if Index < ItemCount then ItemSeparatorComponent else nil,
			cellKey = KeyExtractorResult,
			fillRateHelper = p6._fillRateHelper,
			horizontal = Horizontal
		}
		config.index = Index
		config.inversionStyle = HorizontallyInverted
		config.item = Item
		config.key = KeyExtractorResult
		config.prevCellKey = PrevCellKey
		config.onUpdateSeparators = p6._onUpdateSeparators
		config.onLayout = if v1 then p6:_getCellLayoutHandler(KeyExtractorResult, Index) else function(Frame) --[[ Line: 1696 ]]
			-- upvalues: p6 (copy), KeyExtractorResult (copy), Index (copy)
			return p6:_onCellLayout(Frame, KeyExtractorResult, Index)
		end
		config.onUnmount = p6._onCellUnmount
		config.parentProps = p6.props
		config.ref = if v1 then p6:_getCellRefHandler(KeyExtractorResult) else function(p7) --[[ Line: 1703 ]]
			-- upvalues: p6 (copy), KeyExtractorResult (copy)
			p6._cellRefs[tostring(KeyExtractorResult)] = p7
		end
		config.isSequentiallySelectable = p6.props.isSequentiallySelectable
		table.insert(List1, CreateElementFunction(CellRenderer1, config))
		PrevCellKey = KeyExtractorResult
		Index += 1
	end
end

function VirtualizedList._isVirtualizationDisabled(p7) --[[ Line: 1714 ]]
	return p7.props.disableVirtualization ~= nil and p7.props.disableVirtualization
end

function VirtualizedList._isNestedWithSameOrientation(p7): boolean --[[ Line: 1718 ]]
	-- upvalues: Boolean (copy)
	local Context = p7.context
	local IsJSBooleanMatch = false
	
	if Context ~= nil then
		local Horizontal = p7.props.horizontal
		IsJSBooleanMatch = Boolean.toJSBoolean(Context.horizontal) == (Horizontal ~= nil and Horizontal)
	end
	return IsJSBooleanMatch
end

function VirtualizedList._keyExtractor(p7, Item, Index) --[[ Line: 1724 ]]
	-- upvalues: KeyExtractorFunction (copy), Flag (ref), Boolean (copy), DisplayName (ref)
	if p7.props.keyExtractor ~= nil then
		return p7.props.keyExtractor(Item, Index)
	end
	local KeyExtractorResult = KeyExtractorFunction(Item, Index)
	
	if KeyExtractorResult == tostring(Index) then
		Flag = true
		
		if Item.type ~= nil and Boolean.toJSBoolean(Item.type.displayName) then
			DisplayName = Item.type.displayName
		end
	end
	return KeyExtractorResult
end

function VirtualizedList.render(p7) --[[ Line: 1739 ]]
	-- upvalues: v19 (copy), Console (copy), CreateResult (ref), Set (copy), ReactModule (copy), VirtualizedListCellContextProvider (copy), ViewModule (copy), StyleSheetModule (copy), Flag (ref), DisplayName (ref), Object (copy), VirtualizedListContextProvider (copy), ScrollViewModule (copy)
	if _G.__DEV__ then
		local v4 = v19(p7.props.contentContainerStyle)
		
		if v4 ~= nil and v4.flexWrap == "wrap" then
			Console.warn("`flexWrap: `wrap`` is not supported with the `VirtualizedList` components.Consider using `numColumns` with `FlatList` instead.")
		end
	end
	local ListEmptyComponent = p7.props.ListEmptyComponent
	local ListFooterComponent = p7.props.ListFooterComponent
	local ListHeaderComponent = p7.props.ListHeaderComponent
	local Data = p7.props.data
	local Horizontal = p7.props.horizontal
	local IsVirtualizationDisabled = p7:_isVirtualizationDisabled()
	local HorizontallyInverted = nil
	
	if p7.props.inverted then
		local Horizontal1 = p7.props.horizontal
		local Horizontal1_1 = Horizontal1 ~= nil and Horizontal1
		HorizontallyInverted = if Horizontal1_1 then CreateResult.horizontallyInverted else CreateResult.verticallyInverted
	else
		HorizontallyInverted = nil
	end
	local List = {}
	local NewSet = Set.new(p7.props.stickyHeaderIndices)
	local StickyHeaderIndices = {}
	
	if ListHeaderComponent then
		if NewSet:has(0) then
			table.insert(StickyHeaderIndices, 0)
		end
		table.insert(List, ReactModule.createElement(VirtualizedListCellContextProvider, {
			key = "$header",
			Name = "$header",
			cellKey = p7:_getCellKey() .. "-header"
		}, ReactModule.createElement(ViewModule, {
			Name = "ListHeaderComponent",
			onLayout = p7._onLayoutHeader,
			style = StyleSheetModule.compose(HorizontallyInverted, p7.props.ListHeaderComponentStyle),
			LayoutOrder = if p7.props.inverted then 999999998 else -999999998,
			AutomaticSize = if Horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
			Size = if Horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
		}, if ReactModule.isValidElement(ListHeaderComponent) then ListHeaderComponent else ReactModule.createElement(ListHeaderComponent, nil))))
	end
	local ItemCount: number = p7.props.getItemCount(Data)
	
	if ItemCount > 0 then
		Flag = false
		DisplayName = ""
		local SpacerKey = p7._getSpacerKey(not Horizontal)
		local InitialScrollIndex = p7.props.initialScrollIndex
		local v5 = nil
		
		if InitialScrollIndex ~= nil and InitialScrollIndex ~= 1 then
			v5 = -1
		else
			local InitialNumToRender = p7.props.initialNumToRender
			v5 = (if InitialNumToRender == nil then 10 else InitialNumToRender) - 1
		end
		local v6 = v5 + 1
		local First = p7.state.first
		local Last = p7.state.last
		local ScrollPositionDelta: number = p7.state.scrollPositionDelta
		
		if ScrollPositionDelta > 0 then
			First += ScrollPositionDelta
			Last += ScrollPositionDelta
		end
		p7:_pushCells(List, StickyHeaderIndices, NewSet, 1, v6, HorizontallyInverted)
		local Largest = math.max(v6 + 1, First)
		
		if not IsVirtualizationDisabled and v6 + 1 < First then
			local Flag1 = false
			
			if NewSet.size > 0 then
				local v7: number = if ListHeaderComponent then 1 else 0
				local LargestDelta = Largest - 1
				while v6 < LargestDelta do
					if not NewSet:has(LargestDelta + v7) then
						LargestDelta -= 1
						continue
					end
					local FrameMetricsApprox1 = p7._getFrameMetricsApprox(v6)
					local FrameMetricsApprox2 = p7._getFrameMetricsApprox(LargestDelta)
					local InitialScrollIndex1 = p7.props.initialScrollIndex
					local IsNotInitialScrollIndexMatch: boolean = InitialScrollIndex1 ~= nil and InitialScrollIndex1 ~= 1
					local OffsetDelta = FrameMetricsApprox2.offset - FrameMetricsApprox1.offset - (if IsNotInitialScrollIndexMatch then 0 else FrameMetricsApprox1.length)
					table.insert(List, ReactModule.createElement(ViewModule, {
						key = "$sticky_lead",
						Name = "$sticky_lead",
						style = {
							Size = if SpacerKey == "height" then UDim2.new(1, 0, 0, OffsetDelta) else UDim2.new(0, OffsetDelta, 1, 0)
						}
					}))
					p7:_pushCells(List, StickyHeaderIndices, NewSet, LargestDelta, LargestDelta, HorizontallyInverted)
					local NewOffset = p7._getFrameMetricsApprox(First).offset - FrameMetricsApprox2.offset + FrameMetricsApprox2.length
					table.insert(List, ReactModule.createElement(ViewModule, {
						key = "$sticky_trail",
						Name = "$sticky_trail",
						style = {
							Size = if SpacerKey == "height" then UDim2.new(1, 0, 0, NewOffset) else UDim2.new(0, NewOffset, 1, 0)
						}
					}))
					Flag1 = true
					break
				end
			end
			if not Flag1 then
				local FrameMetricsApprox3 = p7._getFrameMetricsApprox(v6)
				local OffsetDelta = p7._getFrameMetricsApprox(First).offset - (FrameMetricsApprox3.offset + FrameMetricsApprox3.length)
				table.insert(List, ReactModule.createElement(ViewModule, {
					key = "$lead_spacer",
					Name = "$lead_spacer",
					style = {
						Size = if SpacerKey == "height" then UDim2.new(1, 0, 0, OffsetDelta) else UDim2.new(0, OffsetDelta, 1, 0)
					},
					LayoutOrder = if p7.props.inverted then 999999999 else -999999999
				}))
			end
		end
		p7:_pushCells(List, StickyHeaderIndices, NewSet, Largest, Last, HorizontallyInverted)
		
		if not p7._hasWarned.keys and Flag then
			Console.warn("VirtualizedList: missing keys for items, make sure to specify a key or id property on each item or provide a custom keyExtractor.", DisplayName)
			p7._hasWarned.keys = true
		end
		if not IsVirtualizationDisabled and Last < ItemCount then
			local FrameMetricsApprox5 = p7._getFrameMetricsApprox(Last)
			local FrameMetricsApprox6 = p7._getFrameMetricsApprox(if p7.props.getItemLayout then ItemCount else math.min(ItemCount, p7._highestMeasuredFrameIndex))
			local OffsetDelta = FrameMetricsApprox6.offset + FrameMetricsApprox6.length - (FrameMetricsApprox5.offset + FrameMetricsApprox5.length)
			table.insert(List, ReactModule.createElement(ViewModule, {
				key = "$tail_spacer",
				Name = "$tail_spacer",
				style = {
					Size = if SpacerKey == "height" then UDim2.new(1, 0, 0, OffsetDelta) else UDim2.new(0, OffsetDelta, 1, 0)
				},
				LayoutOrder = if p7.props.inverted then -999999999 else 999999999
			}))
		end
	elseif ListEmptyComponent then
		local ListEmptyComponent1 = if ReactModule.isValidElement(ListEmptyComponent) then ListEmptyComponent else ReactModule.createElement(ListEmptyComponent, nil)
		table.insert(List, ReactModule.cloneElement(ListEmptyComponent1, {
			key = "$empty",
			Name = "$empty",
			onLayout = function(p8) --[[ Line: 1928 ]]
				-- upvalues: p7 (copy), ListEmptyComponent1 (copy)
				p7._onLayoutEmpty(p8)
				
				if ListEmptyComponent1.props.onLayout then
					ListEmptyComponent1.props.onLayout(p8)
				end
			end,
			style = StyleSheetModule.compose(HorizontallyInverted, ListEmptyComponent1.props.style)
		}))
	end
	if ListFooterComponent then
		table.insert(List, ReactModule.createElement(VirtualizedListCellContextProvider, {
			key = "$footer",
			Name = "$footer",
			cellKey = p7:_getFooterCellKey()
		}, ReactModule.createElement(ViewModule, {
			Name = "ListFooterComponent",
			onLayout = p7._onLayoutFooter,
			style = StyleSheetModule.compose(HorizontallyInverted, p7.props.ListFooterComponentStyle),
			LayoutOrder = if p7.props.inverted then -999999998 else 999999998,
			AutomaticSize = if Horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
			Size = if Horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
		}, if ReactModule.isValidElement(ListFooterComponent) then ListFooterComponent else ReactModule.createElement(ListFooterComponent, nil))))
	end
	if p7.props.inverted and not p7.props.getItemLayout then
		if p7:getScrollRef() == nil or p7:getScrollRef()._nativeRef.current == nil then
			p7._canvasPosition = if p7.props.horizontal then Vector2.new(p7._invertedCanvasLength, 0) else Vector2.new(0, p7._invertedCanvasLength)
			p7._canvasSize = if p7.props.horizontal then UDim2.new(0, p7._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, p7._invertedCanvasLength)
		else
			local Current = p7:getScrollRef()._nativeRef.current
			local CanvasPosition = Current.CanvasPosition
			local FrameMetricsApprox4 = p7._getFrameMetricsApprox((math.min(p7._highestMeasuredFrameIndex, ItemCount)))
			local NewOffset = FrameMetricsApprox4.offset + FrameMetricsApprox4.length
			local IsInvertedCanvasLengthBelow: boolean = if p7.props.optimizeInvertedCanvasResize then p7._invertedCanvasLength - p7._footerLength < NewOffset else NewOffset ~= p7._invertedCanvasLength - p7._footerLength
			
			if ItemCount <= p7._highestMeasuredFrameIndex and NewOffset ~= p7._invertedCanvasLength - p7._footerLength then
				local NewOffsetDelta = NewOffset + p7._footerLength - p7._invertedCanvasLength
				p7._invertedCanvasLength = NewOffset + p7._footerLength
				local _UDim2: UDim2 = if p7.props.horizontal then UDim2.new(0, p7._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, p7._invertedCanvasLength)
				Current.CanvasSize = _UDim2
				p7._canvasPosition = if p7.props.horizontal then Vector2.new(CanvasPosition.X + NewOffsetDelta, CanvasPosition.Y) else Vector2.new(CanvasPosition.X, CanvasPosition.Y + NewOffsetDelta)
				p7._canvasSize = _UDim2
			elseif IsInvertedCanvasLengthBelow and p7.state.scrollPositionDelta == 0 then
				local WindowSize = p7.props.windowSize
				local NewOffset1 = FrameMetricsApprox4.offset + p7._scrollMetrics.visibleLength + p7._scrollMetrics.visibleLength * (if WindowSize == nil then 21 else WindowSize) * 0.5
				local NewOffsetDelta = NewOffset1 - p7._invertedCanvasLength
				p7._invertedCanvasLength = NewOffset1
				local _UDim2: UDim2 = if p7.props.horizontal then UDim2.new(0, p7._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, p7._invertedCanvasLength)
				Current.CanvasSize = _UDim2
				Current.CanvasPosition = if p7.props.horizontal then Vector2.new(CanvasPosition.X + NewOffsetDelta, CanvasPosition.Y) else Vector2.new(CanvasPosition.X, CanvasPosition.Y + NewOffsetDelta)
				p7._canvasPosition = Current.CanvasPosition
				p7._canvasSize = _UDim2
			end
		end
	elseif p7.props.inverted and p7.props.getItemLayout then
		local FrameMetricsApprox = p7._getFrameMetricsApprox(ItemCount)
		
		if p7:getScrollRef() == nil or p7:getScrollRef()._nativeRef.current == nil then
			p7._invertedCanvasLength = FrameMetricsApprox.offset + FrameMetricsApprox.length
		else
			local Current = p7:getScrollRef()._nativeRef.current
			local CanvasPosition = Current.CanvasPosition
			local InvertedCanvasLength = p7._invertedCanvasLength
			p7._invertedCanvasLength = FrameMetricsApprox.offset + FrameMetricsApprox.length
			
			if InvertedCanvasLength ~= p7._invertedCanvasLength then
				local InvertedCanvasLengthDelta = p7._invertedCanvasLength - InvertedCanvasLength
				Current.CanvasPosition = if p7.props.horizontal then CanvasPosition + Vector2.new(InvertedCanvasLengthDelta, 0) else CanvasPosition + Vector2.new(0, InvertedCanvasLengthDelta)
			end
		end
	end
	local ScrollEventThrottle = p7.props.scrollEventThrottle
	local AssignResult = Object.assign(table.clone(p7.props), {
		onContentSizeChange = p7._onContentSizeChange,
		onLayout = p7._onLayout,
		onScroll = p7._onScroll,
		onScrollBeginDrag = p7._onScrollBeginDrag,
		onScrollEndDrag = p7._onScrollEndDrag,
		onMomentumScrollBegin = p7._onMomentumScrollBegin,
		onMomentumScrollEnd = p7._onMomentumScrollEnd,
		scrollEventThrottle = if ScrollEventThrottle == nil then 50 else ScrollEventThrottle,
		invertStickyHeaders = if p7.props.invertStickyHeaders == nil then p7.props.inverted else p7.props.invertStickyHeaders,
		stickyHeaderIndices = StickyHeaderIndices,
		style = p7.props.style,
		layoutStyle = HorizontallyInverted or nil,
		AutomaticCanvasSize = if p7.props.inverted and not p7.props.getItemLayout then Enum.AutomaticSize.None else nil,
		CanvasSize = if p7.props.inverted then p7._canvasSize else nil,
		CanvasPosition = if p7.props.inverted then p7._canvasPosition else nil
	})
	p7._hasMore = p7.state.last < p7.props.getItemCount(p7.props.data)
	local Horizontal2 = p7.props.horizontal
	local Element = ReactModule.createElement(VirtualizedListContextProvider, {
		value = {
			cellKey = nil,
			getScrollMetrics = p7._getScrollMetrics,
			horizontal = Horizontal2 ~= nil and Horizontal2,
			getOutermostParentListRef = p7._getOutermostParentListRef,
			getNestedChildState = p7._getNestedChildState,
			registerAsNestedChild = p7._registerAsNestedChild,
			unregisterAsNestedChild = p7._unregisterAsNestedChild,
			debugInfo = p7:_getDebugInfo()
		}
	}, ReactModule.cloneElement((if p7.props.renderScrollComponent then p7.props.renderScrollComponent else p7._defaultRenderScrollComponent)(AssignResult), { ref = p7._captureScrollRef }, List))
	local Element1 = if _G.__DEV__ then ReactModule.createElement(ScrollViewModule.Context.Consumer, nil, function(p8) --[[ Line: 2108 ]]
		-- upvalues: p7 (copy), Console (upval), Element (copy)
		if p8 ~= nil then
			local Horizontal = p7.props.horizontal
			
			if not p8.horizontal == not (Horizontal ~= nil and Horizontal) and not p7._hasWarned.nesting and p7.context == nil then
				Console.error("VirtualizedLists should never be nested inside plain ScrollViews with the same orientation because it can break windowing and other functionality - use another VirtualizedList-backed container instead.")
				p7._hasWarned.nesting = true
			end
		end
		return Element
	end) else Element
	
	return if p7.props.debug then ReactModule.createElement(ViewModule, { Name = "debug", style = CreateResult.debug }, Element1, p7:_renderDebugOverlay()) else Element1
end

function VirtualizedList.componentDidUpdate(p8, p9) --[[ Line: 2134 ]]
	-- upvalues: Array (copy)
	local ExtraData = p8.props.extraData
	
	if p8.props.data ~= p9.data or ExtraData ~= p9.extraData then
		Array.forEach(p8._viewabilityTuples, function(p10) --[[ Line: 2139 ]]
			p10.viewabilityHelper:resetViewableIndices()
		end)
	end
	local HiPriInProgress = p8._hiPriInProgress
	p8:_scheduleCellsToRenderUpdate()
	
	if HiPriInProgress then
		p8._hiPriInProgress = false
	end
end

function VirtualizedList._computeBlankness(p8) --[[ Line: 2158 ]]
	p8._fillRateHelper:computeBlankness(p8.props, p8.state, p8._scrollMetrics)
end

function VirtualizedList._getCellLayoutHandler(p8, KeyExtractorResult, Index) --[[ Line: 2164 ]]
	local CellLayoutHandler = p8._cellLayoutHandlers[KeyExtractorResult]
	
	if CellLayoutHandler == nil or CellLayoutHandler.index ~= Index then
		local function Handler(Frame) --[[ Line: 2170 ]]
			-- upvalues: p8 (copy), KeyExtractorResult (copy), Index (copy)
			return p8:_onCellLayout(Frame, KeyExtractorResult, Index)
		end
		
		p8._cellLayoutHandlers[KeyExtractorResult] = { index = Index, handler = Handler }
		
		return Handler
	else
		return CellLayoutHandler.handler
	end
end

function VirtualizedList._getCellRefHandler(p8, KeyExtractorResult) --[[ Line: 2177 ]]
	local CellRefHandler: (any) -> () = p8._cellRefHandlers[KeyExtractorResult]
	
	if CellRefHandler == nil then
		CellRefHandler = function(p9) --[[ Line: 2180 ]]
			-- upvalues: p8 (copy), KeyExtractorResult (copy)
			p8._cellRefs[tostring(KeyExtractorResult)] = p9
		end
		
		p8._cellRefHandlers[KeyExtractorResult] = CellRefHandler
	end
	return CellRefHandler
end

function VirtualizedList._onCellLayout(p8, Frame: Frame, KeyExtractorResult, Index: number) --[[ Line: 2188 ]]
	-- upvalues: Console (copy), Array (copy), Object (copy), Boolean (copy)
	local Current = if p8:getScrollRef() and p8:getScrollRef()._nativeRef.current then p8:getScrollRef()._nativeRef.current else Frame:FindFirstAncestorOfClass("ScrollingFrame")
	
	if Current ~= nil then
		local AbsolutePosition = Current.AbsolutePosition
		local CanvasPosition = Current.CanvasPosition
		local AbsoluteCanvasSize = Current.AbsoluteCanvasSize
		local AbsoluteSize = Frame.AbsoluteSize
		local AbsolutePosition1 = Frame.AbsolutePosition
		local config = {
			width = Frame.AbsoluteSize.X,
			height = Frame.AbsoluteSize.Y,
			x = if p8.props.inverted and p8.props.horizontal then AbsoluteCanvasSize.X - CanvasPosition.X - AbsolutePosition1.X - AbsoluteSize.X + AbsolutePosition.X else AbsolutePosition1.X - AbsolutePosition.X + CanvasPosition.X,
			y = if p8.props.inverted and not p8.props.horizontal then AbsoluteCanvasSize.Y - CanvasPosition.Y - AbsolutePosition1.Y - AbsoluteSize.Y + AbsolutePosition.Y else AbsolutePosition1.Y - AbsolutePosition.Y + CanvasPosition.Y
		}
		local config1 = {
			inLayout = true,
			offset = p8:_selectOffset(config),
			length = p8:_selectLength(config),
			index = Index
		}
		local Frame1 = p8._frames[KeyExtractorResult]
		
		if Frame1 and math.abs(config1.offset - Frame1.offset) <= 1 and config1.length == Frame1.length and Index == Frame1.index then
			p8._frames[KeyExtractorResult].inLayout = true
		else
			local Item = p8.props.getItem(p8.props.data, Index)
			
			if not Frame1 and not p8.props.getItemLayout and typeof(Item) == "table" and Item.shouldResizeOnMount then
				p8:recalculateFrames(p8:_selectLength(config), KeyExtractorResult, Index)
			end
			if Frame1 and not p8.props.getItemLayout and math.abs(config1.length - Frame1.length) >= 1 then
				if p8.props.UNSTABLE_forceSiblingLayoutUpdate then
					local Frame2 = Frame:FindFirstAncestorOfClass("Frame")
					local ItemCount = p8.props.getItemCount(p8.props.data)
					Array.forEach(if Frame2 then Frame2:GetChildren() else {}, function(Frame: Frame) --[[ Line: 2255 ]]
						-- upvalues: Index (copy), ItemCount (copy), p8 (copy)
						if not Frame:IsA("GuiObject") then return end
						local Magnitude = math.abs(Frame.LayoutOrder)
						
						if Magnitude <= Index or ItemCount < Magnitude then return end
						local Item = p8.props.getItem(p8.props.data, Magnitude)
						
						if Item ~= nil then
							p8:_onCellLayout(Frame, p8:_keyExtractor(Item, Magnitude), Magnitude)
							
							return
						end
					end)
				else
					Array.forEach(Object.keys(p8._frames), function(p9) --[[ Line: 2275 ]]
						-- upvalues: p8 (copy), Index (copy)
						if p8._frames[p9].index <= Index then return end
						local Ref = if p8._cellRefs[p9] then p8._cellRefs[p9]:getRef() else nil
						
						if Ref and Ref.current then
							p8:_onCellLayout(Ref.current, p9, p8._frames[p9].index)
						end
					end)
				end
			end
			p8._totalCellLength += config1.length - (if Boolean.toJSBoolean(Frame1) then Frame1.length else 0)
			p8._totalCellsMeasured += if Boolean.toJSBoolean(Frame1) then 0 else 1
			p8._averageCellLength = p8._totalCellLength / p8._totalCellsMeasured
			p8._frames[KeyExtractorResult] = config1
			p8._highestMeasuredFrameIndex = math.max(p8._highestMeasuredFrameIndex, Index)
			p8:_scheduleCellsToRenderUpdate()
			
			if p8.props.inverted and not p8.props.getItemLayout and p8.state.last == p8.props.getItemCount(p8.props.data) and p8._highestMeasuredFrameIndex == p8.state.last then
				p8:forceUpdate()
			end
		end
		p8:_triggerRemeasureForChildListsInCell(KeyExtractorResult)
		p8:_computeBlankness()
		p8:_updateViewableItems(p8.props.data)
		
		return
	elseif _G.__DEV__ then
		Console.warn("CellLayout failed for index " .. tostring(Index) .. ". this may cause layout issues")
	end
end

function VirtualizedList._triggerRemeasureForChildListsInCell(p8, FooterCellKey) --[[ Line: 2321 ]]
	local GetResult = p8._cellKeysToChildListKeys:get(FooterCellKey)
	
	if GetResult then
		GetResult:forEach(function(p9) --[[ Line: 2324 ]]
			-- upvalues: p8 (copy)
			local GetResult = p8._nestedChildLists:get(p9)
			
			if GetResult and GetResult.ref then
				GetResult.ref:measureLayoutRelativeToContainingList()
			end
		end)
	end
end

function VirtualizedList.recalculateFrames(p8, SelectLengthResult, p9, Index) --[[ Line: 2335 ]]
	-- upvalues: Array (copy), Object (copy)
	Array.forEach(Object.keys(p8._frames), function(p10) --[[ Line: 2336 ]]
		-- upvalues: p9 (copy), p8 (copy), Index (copy), SelectLengthResult (copy)
		if p10 ~= p9 or Index > p8._frames[p10].index then
			local Frame = p8._frames[p10]
			Frame.index += 1
			local Frame1 = p8._frames[p10]
			Frame1.offset += SelectLengthResult
			
			return
		end
	end)
	p8._highestMeasuredFrameIndex += 1
end

function VirtualizedList.measureLayoutRelativeToContainingList(p8) --[[ Line: 2347 ]]
	-- upvalues: Boolean (copy), Console (copy)
	local Success, Result = pcall(function() --[[ Line: 2351 ]]
		-- upvalues: Boolean (upval), p8 (copy), Console (upval)
		if Boolean.toJSBoolean(p8._scrollRef) then
			p8._scrollRef:measureLayout(p8.context.getOutermostParentListRef():getScrollRef(), function(p9, p10, Width, Height) --[[ Line: 2359 ]]
				-- upvalues: p8 (upval)
				p8._offsetFromParentVirtualizedList = p8:_selectOffset({ x = p9, y = p10 })
				p8._scrollMetrics.contentLength = p8:_selectLength({ width = Width, height = Height })
				local ConvertParentScrollMetricsResult = p8._convertParentScrollMetrics(p8.context.getScrollMetrics())
				
				if p8._scrollMetrics.visibleLength ~= ConvertParentScrollMetricsResult.visibleLength or p8._scrollMetrics.offset ~= ConvertParentScrollMetricsResult.offset then
					p8._scrollMetrics.visibleLength = ConvertParentScrollMetricsResult.visibleLength
					p8._scrollMetrics.offset = ConvertParentScrollMetricsResult.offset
					p8._cellKeysToChildListKeys:forEach(function(p11) --[[ Line: 2373 ]]
						-- upvalues: p8 (upval)
						if p11 then
							p11:forEach(function(p12) --[[ Line: 2375 ]]
								-- upvalues: p8 (upval)
								local GetResult = p8._nestedChildLists:get(p12)
								
								if GetResult and GetResult.ref then
									GetResult.ref:measureLayoutRelativeToContainingList()
								end
							end)
						end
					end)
				end
			end, function(_) --[[ Line: 2385 ]]
				-- upvalues: Console (upval)
				Console.warn("VirtualizedList: Encountered an error while measuring a list's offset from its containing VirtualizedList.")
			end)
			
			return nil
		else
			return nil
		end
	end)
	
	if not Success then
		Console.warn("measureLayoutRelativeToContainingList threw an error", Result.stack)
	end
end

function VirtualizedList._getFooterCellKey(p8): string --[[ Line: 2399 ]]
	return p8:_getCellKey() .. "-footer"
end

function VirtualizedList._renderDebugOverlay(p8) --[[ Line: 2403 ]]
	-- upvalues: Boolean (copy), ReactModule (copy), ViewModule (copy), CreateResult (ref), Array (copy)
	local VisibleLengthRatio = p8._scrollMetrics.visibleLength / (if Boolean.toJSBoolean(p8._scrollMetrics.contentLength) then p8._scrollMetrics.contentLength else 1)
	local FrameMetricsApproxes = {}
	local ItemCount = p8.props.getItemCount(p8.props.data)
	local Count = 1
	while Count <= ItemCount do
		local FrameMetricsApprox = p8._getFrameMetricsApprox(Count)
		
		if Boolean.toJSBoolean(FrameMetricsApprox.inLayout) then
			table.insert(FrameMetricsApproxes, FrameMetricsApprox)
		end
		Count += 1
	end
	local Offset = p8._getFrameMetricsApprox(p8.state.first).offset
	local FrameMetricsApprox1 = p8._getFrameMetricsApprox(p8.state.last)
	
	return ReactModule.createElement(ViewModule, {
		style = { CreateResult.debugOverlayBase, CreateResult.debugOverlay }
	}, Array.map(FrameMetricsApproxes, function(FrameMetricsApprox, p9) --[[ Line: 2428 ]]
		-- upvalues: ReactModule (upval), ViewModule (upval), CreateResult (upval), VisibleLengthRatio (copy)
		return ReactModule.createElement(ViewModule, {
			key = "f" .. tostring(p9),
			Name = "f" .. tostring(p9),
			style = {
				CreateResult.debugOverlayBase,
				CreateResult.debugOverlayFrame,
				{
					top = FrameMetricsApprox.offset * VisibleLengthRatio,
					height = FrameMetricsApprox.length * VisibleLengthRatio
				}
			}
		})
	end), ReactModule.createElement(ViewModule, {
		Name = "DebugOverlayLast",
		style = {
			CreateResult.debugOverlayBase,
			CreateResult.debugOverlayFrameLast,
			{
				top = Offset * VisibleLengthRatio,
				height = (FrameMetricsApprox1.offset + FrameMetricsApprox1.length - Offset) * VisibleLengthRatio
			}
		}
	}), ReactModule.createElement(ViewModule, {
		Name = "DebugOverlayVis",
		style = {
			CreateResult.debugOverlayBase,
			CreateResult.debugOverlayFrameVis,
			{
				top = p8._scrollMetrics.offset * VisibleLengthRatio,
				height = p8._scrollMetrics.visibleLength * VisibleLengthRatio
			}
		}
	}))
end

function VirtualizedList._selectLength(p9, p10) --[[ Line: 2458 ]]
	local Horizontal = p9.props.horizontal
	
	return if Horizontal ~= nil and Horizontal then p10.width else p10.height
end

function VirtualizedList._selectOffset(p9, Vector) --[[ Line: 2465 ]]
	local Horizontal = p9.props.horizontal
	
	return if Horizontal ~= nil and Horizontal then Vector.x else Vector.y
end

function VirtualizedList._maybeCallOnEndReached(p9) --[[ Line: 2472 ]]
	local Data = p9.props.data
	local GetItemCountFunction = p9.props.getItemCount
	local OnEndReachedFunction: (any) -> () = p9.props.onEndReached
	local OnEndReachedThreshold = p9.props.onEndReachedThreshold
	local VisibleLength = p9._scrollMetrics.visibleLength
	local ContentLengthDelta = p9._scrollMetrics.contentLength - VisibleLength - p9._scrollMetrics.offset
	local ScaledOnEndReachedThreshold = if OnEndReachedThreshold == nil then 2 else OnEndReachedThreshold * VisibleLength
	
	if OnEndReachedFunction and p9.state.last == GetItemCountFunction(Data) and ContentLengthDelta < ScaledOnEndReachedThreshold and p9._scrollMetrics.contentLength ~= p9._sentEndForContentLength then
		p9._sentEndForContentLength = p9._scrollMetrics.contentLength
		OnEndReachedFunction({ distanceFromEnd = ContentLengthDelta })
		
		return
	end
	if ScaledOnEndReachedThreshold < ContentLengthDelta then
		p9._sentEndForContentLength = 0
	end
end

function VirtualizedList._scheduleCellsToRenderUpdate(p9) --[[ Line: 2497 ]]
	-- upvalues: Boolean (copy)
	local First: number = p9.state.first
	local Last = p9.state.last
	
	if p9.state.scrollPositionDelta > 0 then return end
	local Offset = p9._scrollMetrics.offset
	local VisibleLength = p9._scrollMetrics.visibleLength
	local Velocity: number = p9._scrollMetrics.velocity
	local ItemCount = p9.props.getItemCount(p9.props.data)
	local v8 = false
	local OnEndReachedThreshold = p9.props.onEndReachedThreshold
	local VisibleLengthRatio = (if OnEndReachedThreshold == nil then 2 else OnEndReachedThreshold) * VisibleLength / 2
	
	if First > 1 then
		local OffsetDelta = Offset - p9._getFrameMetricsApprox(First).offset
		v8 = v8 or (OffsetDelta < 0 or Velocity < -2 and OffsetDelta < VisibleLengthRatio)
	end
	if Last < ItemCount then
		local OffsetDelta = p9._getFrameMetricsApprox(Last).offset - (Offset + VisibleLength)
		v8 = v8 or (OffsetDelta < 0 or Velocity > 2)
	end
	if v8 and (Boolean.toJSBoolean(p9._averageCellLength) or p9.props.getItemLayout) and not p9._hiPriInProgress then
		p9._hiPriInProgress = true
		p9._updateCellsToRenderBatcher:dispose({ abort = true })
		p9._updateCellsToRender()
		
		return
	else
		p9._updateCellsToRenderBatcher:schedule()
	end
end

function VirtualizedList._updateViewableItems(p9, p10) --[[ Line: 2544 ]]
	-- upvalues: Array (copy)
	local GetItemCountFunction = p9.props.getItemCount
	Array.forEach(p9._viewabilityTuples, function(p11) --[[ Line: 2546 ]]
		-- upvalues: GetItemCountFunction (copy), p10 (copy), p9 (copy)
		p11.viewabilityHelper:onUpdate(GetItemCountFunction(p10), p9._scrollMetrics.offset, p9._scrollMetrics.visibleLength, p9._getFrameMetrics, p9._createViewToken, p11.onViewableItemsChanged, p9.state)
	end)
end

CellRenderer = ReactModule.Component:extend("CellRenderer")

function CellRenderer.init(p9, Props) --[[ Line: 2607 ]]
	-- upvalues: ReactModule (copy)
	p9.props = Props
	p9.state = {
		separatorProps = { highlighted = false, leadingItem = p9.props.item }
	}
	p9._separators = {
		highlight = function() --[[ Line: 2619 ]]
			-- upvalues: p9 (copy)
			p9.props.onUpdateSeparators({ p9.props.cellKey, p9.props.prevCellKey }, { highlighted = true })
		end,
		unhighlight = function() --[[ Line: 2623 ]]
			-- upvalues: p9 (copy)
			p9.props.onUpdateSeparators({ p9.props.cellKey, p9.props.prevCellKey }, { highlighted = false })
		end,
		updateProps = function(p10, p11) --[[ Line: 2627 ]]
			-- upvalues: p9 (copy)
			local CellKey = p9.props.cellKey
			local PrevCellKey = p9.props.prevCellKey
			p9.props.onUpdateSeparators({ if p10 == "leading" then PrevCellKey else CellKey }, p11)
		end
	}
	p9._nativeRef = ReactModule.createRef()
end

function CellRenderer.getDerivedStateFromProps(p10, p11) --[[ Line: 2639 ]]
	-- upvalues: Object (copy)
	return {
		separatorProps = Object.assign({}, p11.separatorProps, { leadingItem = p10.item })
	}
end

function CellRenderer.updateSeparatorProps(p10, p11) --[[ Line: 2643 ]]
	-- upvalues: Object (copy)
	p10:setState(function(p12) --[[ Line: 2644 ]]
		-- upvalues: Object (upval), p11 (copy)
		return {
			separatorProps = Object.assign({}, p12.separatorProps, p11)
		}
	end)
end

local _ = function(List, List1): boolean --[[ Line: 2649 | Named "shallowEqual" ]]
	for i, value in List do
		if List1[i] ~= value then
			return false
		end
	end
	for i1 in List1 do
		if List[i1] == nil then
			return false
		end
	end
	return true
end

function CellRenderer.shouldComponentUpdate(p10, List, p11): boolean --[[ Line: 2663 ]]
	-- upvalues: v1 (copy)
	if not v1 then
		return true
	end
	local Props = p10.props
	local Flag = nil
	
	for i, prop in Props do
		if List[i] ~= prop then
			Flag = false
			local NoFlag = not Flag
			
			if not NoFlag then
				local SeparatorProps = p10.state.separatorProps
				local SeparatorProps1 = p11.separatorProps
				local Flag1 = nil
				
				for i2, separatorProp in SeparatorProps do
					if SeparatorProps1[i2] ~= separatorProp then
						Flag1 = false
						NoFlag = not Flag1
					else
						continue
					end
				end
				Flag1 = true
				
				for i3 in SeparatorProps1 do
					if SeparatorProps[i3] == nil then
						Flag1 = false
						break
					end
				end
			end
			return NoFlag
		end
	end
	Flag = true
	
	for i1 in List do
		if Props[i1] == nil then
			Flag = false
			break
		end
	end
end

function CellRenderer.componentWillUnmount(p12) --[[ Line: 2673 ]]
	p12.props.onUnmount(p12.props.cellKey)
end

function CellRenderer._renderElement(p12, Callback, ListItemComponent, Item, Index) --[[ Line: 2677 ]]
	-- upvalues: Boolean (copy), Console (copy), ReactModule (copy), InvariantModule (copy)
	if Boolean.toJSBoolean(Callback) and Boolean.toJSBoolean(ListItemComponent) then
		Console.warn("VirtualizedList: Both ListItemComponent and renderItem props are present. ListItemComponent will take precedence over renderItem.")
	end
	if Boolean.toJSBoolean(ListItemComponent) then
		return ReactModule.createElement(ListItemComponent, {
			item = Item,
			index = Index,
			separators = p12._separators
		})
	elseif Boolean.toJSBoolean(Callback) then
		return Callback({
			item = Item,
			index = Index,
			separators = p12._separators
		})
	else
		InvariantModule(false, "VirtualizedList: Either ListItemComponent or renderItem props are required but none were found.")
		
		return nil
	end
end

function CellRenderer.getRef(p12) --[[ Line: 2708 ]]
	return p12._nativeRef
end

function CellRenderer.render(p12) --[[ Line: 2713 ]]
	-- upvalues: ReactModule (copy), Object (copy), Boolean (copy), CreateResult (ref), ViewModule (copy), VirtualizedListCellContextProvider (copy)
	local CellRendererComponent = p12.props.CellRendererComponent
	local ItemSeparatorComponent = p12.props.ItemSeparatorComponent
	local FillRateHelper = p12.props.fillRateHelper
	local Horizontal = p12.props.horizontal
	local Index = p12.props.index
	local InversionStyle = p12.props.inversionStyle
	local ParentProps = p12.props.parentProps
	local RenderElementResult = p12:_renderElement(ParentProps.renderItem, ParentProps.ListItemComponent, p12.props.item, Index)
	local OnLayout = if ParentProps.getItemLayout and not ParentProps.debug and not FillRateHelper:enabled() then nil else p12.props.onLayout
	local Element = if ItemSeparatorComponent then ReactModule.createElement(ItemSeparatorComponent, Object.assign(p12.state.separatorProps, { LayoutOrder = if InversionStyle then -1 else 1 })) else ItemSeparatorComponent
	local List = if Boolean.toJSBoolean(InversionStyle) then if Horizontal then { CreateResult.rowReverse, InversionStyle } else { CreateResult.columnReverse, InversionStyle } elseif Horizontal then { CreateResult.row, InversionStyle } else InversionStyle
	
	return ReactModule.createElement(VirtualizedListCellContextProvider, { cellKey = p12.props.cellKey }, if Boolean.toJSBoolean(CellRendererComponent) then ReactModule.createElement(CellRendererComponent, Object.assign(table.clone(p12.props), {
		style = List,
		onLayout = OnLayout,
		nativeRef = p12._nativeRef
	}), if Element then ReactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = if Horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	}) else nil, RenderElementResult, Element) else ReactModule.createElement(ViewModule, {
		Name = "CellRendererView",
		style = List,
		onLayout = OnLayout,
		LayoutOrder = if InversionStyle then -Index else Index,
		AutomaticSize = if Horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
		nativeRef = p12._nativeRef,
		SelectionGroup = if p12.props.isSequentiallySelectable then true else nil,
		SelectionBehaviorLeft = if p12.props.isSequentiallySelectable then if p12.props.horizontal then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorRight = if p12.props.isSequentiallySelectable then if p12.props.horizontal then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorUp = if p12.props.isSequentiallySelectable then if p12.props.horizontal then Enum.SelectionBehavior.Stop else Enum.SelectionBehavior.Escape else nil,
		SelectionBehaviorDown = if p12.props.isSequentiallySelectable then if p12.props.horizontal then Enum.SelectionBehavior.Stop else Enum.SelectionBehavior.Escape else nil
	}, if Element then ReactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = if Horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	}) else nil, RenderElementResult, Element))
end

Callback = function(DebugInfo): string --[[ Line: 2798 | Named "describeNestedLists" ]]
	-- upvalues: Boolean (copy)
	local Text = "VirtualizedList trace:\n" .. ("  Child (%s):\n"):format(if Boolean.toJSBoolean(DebugInfo.horizontal) then "horizontal" else "vertical") .. ("    listKey: %s\n"):format(DebugInfo.key) .. ("    cellKey: %s"):format(DebugInfo.cellKey)
	local ParentDebugInfo = DebugInfo.parentDebugInfo
	while ParentDebugInfo do
		Text ..= ("\n  Parent (%s):\n"):format(if ParentDebugInfo.horizontal then "horizontal" else "vertical") .. ("    listKey: %s\n"):format(ParentDebugInfo.listKey) .. ("    cellKey: %s"):format(ParentDebugInfo.cellKey)
		ParentDebugInfo = ParentDebugInfo.parent
	end
	return Text
end

CreateResult = StyleSheetModule.create({
	verticallyInverted = {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Bottom
	},
	horizontallyInverted = {
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
		VerticalAlignment = Enum.VerticalAlignment.Center
	},
	row = {
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0)
	},
	column = { AutomaticSize = Enum.AutomaticSize.Y },
	rowReverse = {
		flexDirection = "row-reverse",
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0)
	},
	columnReverse = {
		flexDirection = "column-reverse",
		AutomaticSize = Enum.AutomaticSize.Y
	},
	debug = { flex = 1 },
	debugOverlayBase = { position = "absolute", top = 0, right = 0 },
	debugOverlay = {
		bottom = 0,
		width = 20,
		borderColor = "blue",
		borderWidth = 1
	},
	debugOverlayFrame = { left = 0, backgroundColor = "orange" },
	debugOverlayFrameLast = { left = 0, borderColor = "green", borderWidth = 2 },
	debugOverlayFrameVis = { left = 0, borderColor = "red", borderWidth = 2 }
})

return VirtualizedList
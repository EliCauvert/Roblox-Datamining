local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local console = luauPolyfillModule.console

local function _(p1)
	return p1 ~= nil and p1 ~= 1
end

local batchinatorModule = require(parent.Interaction.Batchinator)
local fillRateHelperModule = require(script.Parent.FillRateHelper)
local t = {
	findNodeHandle = function(_)
		warn("ReactNative.findNodeHandle is not implemented")
	end
}
local _ = nil
local scrollViewModule = require(parent.Components.ScrollView.ScrollView)
local styleSheetModule = require(parent.StyleSheet.StyleSheet)
local viewModule = require(parent.Components.View.View)
local viewabilityHelperModule = require(script.Parent.ViewabilityHelper)

local var1 = function(...)
	return {}
end

local infoLogModule = require(parent.Utilities.infoLog)
local invariantModule = require(parent.jsUtils.invariant)
local virtualizeUtilsModule = require(script.Parent.VirtualizeUtils)
local keyExtractor = virtualizeUtilsModule.keyExtractor
local computeWindowedRenderLimits = virtualizeUtilsModule.computeWindowedRenderLimits
local reactModule = require(parent_1.React)
local _ = require(parent.Components.ScrollView.ScrollView)
local virtualizedListContextModule = require(script.Parent.VirtualizedListContext)
local virtualizedListCellContextProvider = virtualizedListContextModule.VirtualizedListCellContextProvider
local virtualizedListContext = virtualizedListContextModule.VirtualizedListContext
local virtualizedListContextProvider = virtualizedListContextModule.VirtualizedListContextProvider
local describeNestedLists = nil
local var2 = nil
local cellRenderer = nil

local function RefreshControl(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", { Name = "RCTRefreshControl" }, p1.children)
end

local var3 = false
local var4 = ""

local _ = function(p1)
	return if p1 == nil then false else p1
end

local _ = function(p1)
	return if p1 == nil then 10 else p1
end

local _ = function(a)
	return if a == nil then 10 else a
end

local _ = function(p1)
	return if p1 == nil then 2 else p1
end

local _ = function(p1)
	return if p1 == nil then 50 else p1
end

local _ = function(p1)
	return if p1 == nil then 21 else p1
end

local _ = function(p1)
	return if p1 == nil then function(p2, p3)
		return p2 == p3
	end else p1
end

local virtualizedList = reactModule.PureComponent:extend("VirtualizedList")
virtualizedList.contextType = virtualizedListContext

function virtualizedList.init(p1, p2)
	-- upvalues: map (ref), invariantModule (ref), fillRateHelperModule (ref), boolean (ref), computeWindowedRenderLimits (ref), batchinatorModule (ref), array (ref), viewabilityHelperModule (ref), object (ref), set (ref), console (ref), describeNestedLists (write), reactModule (ref), viewModule (ref), scrollViewModule (ref), RefreshControl (write), infoLogModule (ref)
	p1.props = p2
	p1._viewabilityTuples = {}
	p1._averageCellLength = 0
	p1._cellKeysToChildListKeys = map.new()
	p1._cellRefs = {}
	p1._frames = {}
	p1._footerLength = 0
	p1._hasDoneInitialScroll = false
	p1._hasInteracted = false
	p1._hasMore = false
	p1._hasWarned = {}
	p1._headerLength = 0
	p1._hiPriInProgress = false
	p1._highestMeasuredFrameIndex = 1
	p1._indicesToKeys = map.new()
	p1._nestedChildLists = map.new()
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
	
	function p10._getFrameMetrics(p3)
		-- upvalues: p1 (ref), invariantModule (copy)
		local data = p1.props.data
		local getItem = p1.props.getItem
		local getItemLayout = p1.props.getItemLayout
		invariantModule(p3 <= p1.props.getItemCount(data), "Tried to get frame for out of range index " .. tostring(p3))
		local var5 = getItem(data, p3)
		local var6 = if var5 ~= nil then var5 else p1._frames[p1:_keyExtractor(var5, p3)]
		
		if (not var6 or var6.index ~= p3) and getItemLayout then
			var6 = getItemLayout(data, p3)
		end
		return var6
	end
	
	local windowSize = p2.windowSize
	invariantModule((if windowSize == nil then 21 else windowSize) > 0, "VirtualizedList: The windowSize prop must be present and set to a value greater than 0.")
	p1._fillRateHelper = fillRateHelperModule.new(p1._getFrameMetrics)
	
	function p10._updateCellsToRender()
		-- upvalues: p1 (ref), boolean (copy), computeWindowedRenderLimits (copy)
		local data = p1.props.data
		local getItemCount = p1.props.getItemCount
		local onEndReachedThreshold = p1.props.onEndReachedThreshold
		local var5 = if onEndReachedThreshold == nil then 2 else onEndReachedThreshold
		local var6 = p1:_isVirtualizationDisabled()
		p1:_updateViewableItems(data)
		
		if boolean.toJSBoolean(data) then
			p1:setState(function(p3)
				-- upvalues: p1 (copy), var6 (ref), boolean (copy), computeWindowedRenderLimits (copy), var5 (ref), getItemCount (ref), data (ref)
				local t = nil
				local contentLength = p1._scrollMetrics.contentLength
				local offset = p1._scrollMetrics.offset
				local visibleLength = p1._scrollMetrics.visibleLength
				
				if var6 then
					local var7
					if contentLength - visibleLength - offset < var5 * visibleLength then
						local maxToRenderPerBatch = p1.props.maxToRenderPerBatch
						var7 = if maxToRenderPerBatch == nil then 10 else maxToRenderPerBatch
					else
						var7 = 0
					end
					t = {
						first = 1,
						last = math.min(p3.last + var7, getItemCount(data))
					}
				elseif visibleLength > 0 and contentLength > 0 then
					local initialScrollIndex = p1.props.initialScrollIndex
					
					if not (initialScrollIndex ~= nil and initialScrollIndex ~= 1) or boolean.toJSBoolean(p1._scrollMetrics.offset) then
						local data_1 = p1.props.data
						local getItemCount_1 = p1.props.getItemCount
						local maxToRenderPerBatch = p1.props.maxToRenderPerBatch
						local windowSize = p1.props.windowSize
						t = computeWindowedRenderLimits(data_1, getItemCount_1, if maxToRenderPerBatch == nil then 10 else maxToRenderPerBatch, if windowSize == nil then 21 else windowSize, p3, p1._getFrameMetricsApprox, p1._scrollMetrics)
					end
				end
				if t ~= nil and p1._nestedChildLists.size > 0 then
					local var8
					local last = t.last
					local first = t.first
					while first <= last do
						local var9 = p1._indicesToKeys:get(first)
						var8 = if boolean.toJSBoolean(var9) then p1._cellKeysToChildListKeys:get(var9) else var9
						
						if not boolean.toJSBoolean(var8) then continue end
						local var10 = false
						
						for i, v in ipairs(var8) do
							local var11 = p1._nestedChildLists:get(v)
							
							if var11 and var11.ref and var11.ref:hasMore() then
								var10 = true
								break
							end
						end
						if var10 then
							t.last = first
							break
						end
						first += 1
					end
				end
				if t ~= nil and t.first == p3.first and t.last == p3.last then
					t = nil
				end
				return t
			end)
			
			return
		end
	end
	
	p1._updateCellsToRenderBatcher = batchinatorModule.new(p1._updateCellsToRender, if p1.props.updateCellsBatchingPeriod == nil then 50 else p1.props.updateCellsBatchingPeriod)
	
	if p1.props.viewabilityConfigCallbackPairs then
		p1._viewabilityTuples = array.map(p1.props.viewabilityConfigCallbackPairs, function(p3)
			-- upvalues: viewabilityHelperModule (copy)
			return {
				viewabilityHelper = viewabilityHelperModule.new(p3.viewabilityConfig),
				onViewableItemsChanged = p3.onViewableItemsChanged
			}
		end)
	else
		local onViewableItemsChanged = p1.props.onViewableItemsChanged
		local viewabilityConfig = p1.props.viewabilityConfig
		
		if onViewableItemsChanged then
			table.insert(p1._viewabilityTuples, {
				viewabilityHelper = viewabilityHelperModule.new(viewabilityConfig),
				onViewableItemsChanged = onViewableItemsChanged
			})
		end
	end
	local t = { scrollPositionDelta = 0 }
	local initialScrollIndex = p1.props.initialScrollIndex
	t.first = if initialScrollIndex ~= nil and initialScrollIndex ~= 1 then p1.props.initialScrollIndex else 1
	local var7 = p1.props.getItemCount(p1.props.data) + 1
	local initialScrollIndex_1 = p1.props.initialScrollIndex
	local var8 = initialScrollIndex_1 ~= nil and initialScrollIndex_1 ~= 1
	local initialNumToRender = p1.props.initialNumToRender
	t.last = math.min(var7, (if var8 then p1.props.initialScrollIndex else 1) + (if initialNumToRender == nil then 10 else initialNumToRender)) - 1
	t.firstItemTracked = if p1.props.data and p1.props.getItemCount(p1.props.data) > 0 then p1.props.getItem(p1.props.data, 1) else object.None
	
	if p1:_isNestedWithSameOrientation() then
		local nestedChildState = p1.context.getNestedChildState(p1:_getListKey())
		
		if boolean.toJSBoolean(nestedChildState) then
			t = nestedChildState
			p1.state = nestedChildState
			p1._frames = nestedChildState.frames
		end
	end
	p1.state = t
	
	function p10._getScrollMetrics()
		-- upvalues: p1 (ref)
		return p1._scrollMetrics
	end
	
	function p10._getOutermostParentListRef()
		-- upvalues: p1 (ref)
		return if p1:_isNestedWithSameOrientation() then p1.context.getOutermostParentListRef() else p1
	end
	
	function p10._getNestedChildState(p3)
		-- upvalues: p1 (ref)
		local var9 = p1._nestedChildLists:get(p3)
		
		return var9 and var9.state
	end
	
	function p10._registerAsNestedChild(p3)
		-- upvalues: p1 (ref), set (copy), console (copy), describeNestedLists (copy), object (copy), boolean (copy)
		local cellKey = p1._cellKeysToChildListKeys:get(p3.cellKey) or set.new()
		cellKey:add(p3.key)
		p1._cellKeysToChildListKeys:set(p3.cellKey, cellKey)
		local key = p1._nestedChildLists:get(p3.key)
		
		if key and key.ref ~= nil then
			console.error("A VirtualizedList contains a cell which itself contains " .. "more than one VirtualizedList of the same orientation as the parent " .. "list. You must pass a unique listKey prop to each sibling list.\n\n" .. describeNestedLists(object.assign({}, p3, {
				horizontal = boolean.toJSBoolean(p3.ref.props.horizontal)
			})))
		end
		p1._nestedChildLists:set(p3.key, { state = nil, ref = p3.ref })
		
		if p1._hasInteracted then
			p3.ref:recordInteraction()
		end
		return nil
	end
	
	function p10._unregisterAsNestedChild(p3)
		-- upvalues: p1 (ref)
		p1._nestedChildLists:set(p3.key, { ref = nil, state = p3.state })
	end
	
	function p10._onUpdateSeparators(p3, p4)
		-- upvalues: array (copy), p1 (ref), boolean (copy)
		array.forEach(p3, function(p5)
			-- upvalues: p1 (copy), boolean (copy), p4 (ref)
			local var9 = p5 ~= nil and p1._cellRefs[tostring(p5)]
			
			if boolean.toJSBoolean(var9) then
				return var9:updateSeparatorProps(p4)
			end
		end)
	end
	
	function p10._getSpacerKey(p3)
		return if p3 then "height" else "width"
	end
	
	function p10._captureScrollRef(p3)
		-- upvalues: p1 (ref)
		p1._scrollRef = p3
	end
	
	function p10._defaultRenderScrollComponent(p3)
		-- upvalues: p1 (ref), reactModule (copy), viewModule (copy), invariantModule (copy), scrollViewModule (copy), object (copy), RefreshControl (copy)
		local onRefresh = p3.onRefresh
		
		if p1:_isNestedWithSameOrientation() then
			return reactModule.createElement(viewModule, p3)
		elseif onRefresh then
			invariantModule(typeof(p3.refreshing) == "boolean", "`refreshing` prop must be set as a boolean in order to use `onRefresh`, but got `" .. (if p3.refreshing == nil then "undefined" else tostring(p3.refreshing) .. "`"))
			
			return reactModule.createElement(scrollViewModule, object.assign(table.clone(p3), {
				refreshControl = if p3.refreshControl == nil then reactModule.createElement(RefreshControl, {
					refreshing = p3.refreshing,
					onRefresh = onRefresh,
					progressViewOffset = p3.progressViewOffset
				}) else p3.refreshControl
			}))
		end
		return reactModule.createElement(scrollViewModule, p3)
	end
	
	function p10._onCellUnmount(p3)
		-- upvalues: p1 (ref), object (copy)
		local var9 = p1._frames[p3]
		
		if var9 ~= nil then
			p1._frames[p3] = object.assign({}, var9, { inLayout = false })
		end
	end
	
	function p10._onLayout(p3)
		-- upvalues: p1 (ref)
		if p1:_isNestedWithSameOrientation() then
			p1:measureLayoutRelativeToContainingList()
		else
			p1._scrollMetrics.visibleLength = p1:_selectLength({ width = p3.AbsoluteSize.X, height = p3.AbsoluteSize.Y })
		end
		if p1.props.onLayout then
			p1.props.onLayout(p3)
		end
		p1:_scheduleCellsToRenderUpdate()
		p1:_maybeCallOnEndReached()
	end
	
	function p10._onLayoutEmpty(p3)
		-- upvalues: p1 (ref)
		if p1.props.onLayout then
			p1.props.onLayout(p3)
		end
	end
	
	function p10._onLayoutFooter(p3)
		-- upvalues: p1 (ref)
		p1:_triggerRemeasureForChildListsInCell(p1:_getFooterCellKey())
		p1._footerLength = p1:_selectLength({ height = p3.AbsoluteSize.Y, width = p3.AbsoluteSize.X })
	end
	
	function p10._onLayoutHeader(p3)
		-- upvalues: p1 (ref)
		p1._headerLength = p1:_selectLength({ height = p3.AbsoluteSize.Y, width = p3.AbsoluteSize.X })
	end
	
	function p10._onContentSizeChange(p3, p4)
		-- upvalues: p1 (ref)
		if p3 > 0 and p4 > 0 and (p1.props.initialScrollIndex ~= nil and p1.props.initialScrollIndex > 1) and not p1._hasDoneInitialScroll then
			if p1.props.contentOffset == nil then
				p1:scrollToIndex({ animated = false, index = p1.props.initialScrollIndex })
			end
			p1._hasDoneInitialScroll = true
		elseif p1.props.inverted and p3 > 0 and (p4 > 0 and not p1._hasDoneInitialScroll) then
			p1._hasDoneInitialScroll = true
			task.defer(function()
				-- upvalues: p1 (copy)
				while p1:getScrollRef() == nil do
					task.wait()
				end
				if p1.props.contentOffset == nil then
					local current = p1:getScrollRef()._nativeRef.current
					
					if p1.props.horizontal then
						current.CanvasPosition = Vector2.new(current.AbsoluteCanvasSize.X, current.CanvasPosition.Y)
						
						return
					end
					current.CanvasPosition = Vector2.new(current.CanvasPosition.X, current.AbsoluteCanvasSize.Y)
				end
			end)
		end
		if p1.props.onContentSizeChange then
			p1.props.onContentSizeChange(p3, p4)
		end
		p1._scrollMetrics.contentLength = p1:_selectLength({ height = p4, width = p3 })
		p1:_scheduleCellsToRenderUpdate()
		p1:_maybeCallOnEndReached()
	end
	
	function p10._convertParentScrollMetrics(p5)
		-- upvalues: p1 (ref)
		local var9 = p5.offset - p1._offsetFromParentVirtualizedList
		
		return {
			visibleLength = p5.visibleLength,
			contentLength = p1._scrollMetrics.contentLength,
			offset = var9,
			dOffset = var9 - p1._scrollMetrics.offset
		}
	end
	
	function p10._onScroll(p5)
		-- upvalues: p1 (ref), boolean (copy), infoLogModule (copy)
		p1._nestedChildLists:forEach(function(p6)
			-- upvalues: p5 (ref)
			if p6.ref then
				p6.ref._onScroll(p5)
			end
		end)
		
		if p1.props.onScroll then
			p1.props.onScroll(p5)
		end
		local processTime = os.clock()
		local var9 = p5:GetChildren()[1]
		local var10 = p1:_selectLength({ height = p5.AbsoluteSize.Y, width = p5.AbsoluteSize.X })
		local var11 = p1:_selectLength({
			height = var9.AbsoluteSize.Y,
			width = var9.AbsoluteSize.X
		})
		local var12 = if p1.props.inverted then p1:_selectOffset({
			x = p5.AbsoluteCanvasSize.X - p5.CanvasPosition.X - var10,
			y = p5.AbsoluteCanvasSize.Y - p5.CanvasPosition.Y - var10
		}) else p1:_selectOffset({ x = p5.CanvasPosition.X, y = p5.CanvasPosition.Y })
		local var13 = var12 - p1._scrollMetrics.offset
		
		if p1:_isNestedWithSameOrientation() then
			if p1._scrollMetrics.contentLength == 0 then return end
			local var14 = p1._convertParentScrollMetrics({ var10, var12 })
			var10 = var14.visibleLength
			var11 = var14.contentLength
			var12 = var14.offset
			var13 = var14.dOffset
		end
		local var15 = if boolean.toJSBoolean(p1._scrollMetrics.timestamp) then math.max(1, (processTime - p1._scrollMetrics.timestamp) * 1000) else 1
		local var16 = var13 / var15
		
		if var15 > 500 and p1._scrollMetrics.dt > 500 and (5 * var10 < var11 and not p1._hasWarned.perf) then
			infoLogModule("VirtualizedList: You have a large list that is slow to update - make sure your renderItem function renders components that follow React performance best practices like PureComponent, shouldComponentUpdate, etc.", {
				dt = var15,
				prevDt = p1._scrollMetrics.dt,
				contentLength = var11
			})
			p1._hasWarned.perf = true
		end
		p1._scrollMetrics = {
			contentLength = var11,
			dt = var15,
			dOffset = var13,
			offset = var12,
			timestamp = processTime,
			velocity = var16,
			visibleLength = var10
		}
		local scrollPositionDelta = p1.state.scrollPositionDelta
		
		if scrollPositionDelta > 0 then
			p1:setState(function(p6)
				-- upvalues: scrollPositionDelta (ref)
				return {
					scrollPositionDelta = 0,
					first = p6.first + scrollPositionDelta,
					last = p6.last + scrollPositionDelta
				}
			end)
		end
		p1:_updateViewableItems(p1.props.data)
		
		if not p1.props then return end
		p1:_maybeCallOnEndReached()
		
		if var16 ~= 0 then
			p1._fillRateHelper:activate()
		end
		p1:_computeBlankness()
		p1:_scheduleCellsToRenderUpdate()
	end
	
	function p10._onScrollBeginDrag(p5)
		-- upvalues: p1 (ref), array (copy)
		p1._nestedChildLists:forEach(function(p6)
			-- upvalues: p5 (ref)
			if p6.ref then
				p6.ref._onScrollBeginDrag(p5)
			end
		end)
		array.forEach(p1._viewabilityTuples, function(p6)
			p6.viewabilityHelper:recordInteraction()
		end)
		p1._hasInteracted = true
		
		if p1.props.onScrollBeginDrag then
			p1.props.onScrollBeginDrag(p5)
		end
	end
	
	function p10._onScrollEndDrag(p5)
		-- upvalues: p1 (ref), boolean (copy)
		p1._nestedChildLists:forEach(function(p6)
			-- upvalues: p5 (ref)
			if p6.ref then
				p6.ref._onScrollEndDrag(p5)
			end
		end)
		
		if boolean.toJSBoolean(nil) then
			p1._scrollMetrics.velocity = p1:_selectOffset(nil)
		end
		p1:_computeBlankness()
		
		if p1.props.onScrollEndDrag then
			p1.props.onScrollEndDrag(p5)
		end
	end
	
	function p10._onMomentumScrollBegin(p5)
		-- upvalues: p1 (ref)
		p1._nestedChildLists:forEach(function(p6)
			-- upvalues: p5 (ref)
			if p6.ref then
				p6.ref._onMomentumScrollBegin(p5)
			end
		end)
		
		if p1.props.onMomentumScrollBegin then
			p1.props.onMomentumScrollBegin(p5)
		end
	end
	
	function p10._onMomentumScrollEnd(p5)
		-- upvalues: p1 (ref)
		p1._nestedChildLists:forEach(function(p6)
			-- upvalues: p5 (ref)
			if p6.ref then
				p6.ref._onMomentumScrollEnd(p5)
			end
		end)
		p1._scrollMetrics.velocity = 0
		p1:_computeBlankness()
		
		if p1.props.onMomentumScrollEnd then
			p1.props.onMomentumScrollEnd(p5)
		end
	end
	
	function p10._createViewToken(p5, p6)
		-- upvalues: p1 (ref)
		local item = p1.props.getItem(p1.props.data, p5)
		
		return {
			index = p5,
			item = item,
			key = p1:_keyExtractor(item, p5),
			isViewable = p6
		}
	end
	
	function p10._getFrameMetricsApprox(p5)
		-- upvalues: p1 (ref), invariantModule (copy)
		local frameMetrics = p1._getFrameMetrics(p5)
		
		if frameMetrics == nil or frameMetrics.index ~= p5 then
			invariantModule(not p1.props.getItemLayout, "Should not have to estimate frames when a measurement metrics function is provided")
			
			return {
				length = p1._averageCellLength,
				offset = p1._averageCellLength * (p5 - 1)
			}
		end
		return frameMetrics
	end
end

function virtualizedList.scrollToEnd(p3, p4)
	-- upvalues: console (ref)
	local var9 = p4 ~= nil or p4.animated
	local frameMetricsApprox = p3._getFrameMetricsApprox(p3.props.getItemCount(p3.props.data))
	local var10 = if p3.props.inverted then 0 else math.max(0, frameMetricsApprox.offset + frameMetricsApprox.length + p3._footerLength - p3._scrollMetrics.visibleLength)
	
	if p3._scrollRef == nil then return end
	if p3._scrollRef.scrollTo == nil then
		console.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.")
		
		return
	end
	local horizontal = p3.props.horizontal
	p3._scrollRef.scrollTo(if if horizontal == nil then false else horizontal then { x = var10, animated = var9 } else { y = var10, animated = var9 })
end

function virtualizedList.scrollToIndex(p3, p4)
	-- upvalues: invariantModule (ref), boolean (ref), console (ref)
	local data = p3.props.data
	local horizontal = p3.props.horizontal
	local getItemCount = p3.props.getItemCount
	local getItemLayout = p3.props.getItemLayout
	local onScrollToIndexFailed = p3.props.onScrollToIndexFailed
	local animated = p4.animated
	local index = p4.index
	local viewOffset = p4.viewOffset
	local viewPosition = p4.viewPosition
	invariantModule(index >= 1, ("scrollToIndex out of range: requested index %d but minimum is 1"):format(index))
	invariantModule(getItemCount(data) >= 1, ("scrollToIndex out of range: item length %d but minimum is 1"):format(getItemCount(data)))
	invariantModule(index <= getItemCount(data), ("scrollToIndex out of range: requested index %d is out of 1 to %d"):format(index, getItemCount(data)))
	
	if not getItemLayout and p3._highestMeasuredFrameIndex < index then
		invariantModule(boolean.toJSBoolean(onScrollToIndexFailed), "scrollToIndex should be used in conjunction with getItemLayout or onScrollToIndexFailed, otherwise there is no way to know the location of offscreen indices or handle failures.")
		onScrollToIndexFailed({
			averageItemLength = p3._averageCellLength,
			highestMeasuredFrameIndex = p3._highestMeasuredFrameIndex,
			index = index
		})
		
		return
	end
	local var9 = if p3:getScrollRef() then p3:getScrollRef()._nativeRef.current else nil
	
	if var9 == nil then return end
	local absoluteCanvasSize = var9.AbsoluteCanvasSize
	local absoluteSize = var9.AbsoluteSize
	local frameMetricsApprox = p3._getFrameMetricsApprox(index)
	local var10 = math.max(0, if p3.props.inverted then (if horizontal then absoluteCanvasSize.X else absoluteCanvasSize.Y) - (if horizontal then absoluteSize.X else absoluteSize.Y) - frameMetricsApprox.offset - (if boolean.toJSBoolean(viewPosition) then viewPosition else 0) * (p3._scrollMetrics.visibleLength - frameMetricsApprox.length) else frameMetricsApprox.offset - (if boolean.toJSBoolean(viewPosition) then viewPosition else 0) * (p3._scrollMetrics.visibleLength - frameMetricsApprox.length)) - (if boolean.toJSBoolean(viewOffset) then viewOffset else 0)
	
	if p3._scrollRef == nil then return end
	if p3._scrollRef.scrollTo == nil then
		console.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.")
		
		return
	end
	p3._scrollRef.scrollTo(if horizontal then { x = var10, animated = animated } else { y = var10, animated = animated })
end

function virtualizedList.scrollToItem(p3, p4)
	-- upvalues: object (ref)
	local item = p4.item
	local data = p3.props.data
	local getItem = p3.props.getItem
	local itemCount = p3.props.getItemCount(data)
	local var9 = 1
	while var9 <= itemCount do
		if getItem(data, var9) ~= item then
			var9 += 1
			continue
		end
		p3:scrollToIndex(object.assign({}, p4, { index = var9 }))
		
		return
	end
end

function virtualizedList.scrollToOffset(value, p5)
	-- upvalues: console (ref)
	local var10 = if value:getScrollRef() then value:getScrollRef()._nativeRef.current else nil
	
	if var10 == nil then return end
	local animated = p5.animated
	local offset = p5.offset
	
	if value._scrollRef == nil then return end
	if value.props.inverted then
		local absoluteCanvasSize = var10.AbsoluteCanvasSize
		local absoluteSize = var10.AbsoluteSize
		offset = (if value.props.horizontal then absoluteCanvasSize.X else absoluteCanvasSize.Y) - offset - (if value.props.horizontal then absoluteSize.X else absoluteSize.Y)
	end
	if value._scrollRef.scrollTo == nil then
		console.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.")
		
		return
	end
	local horizontal = value.props.horizontal
	value._scrollRef.scrollTo(if if horizontal == nil then false else horizontal then { x = offset, animated = animated } else { y = offset, animated = animated })
end

function virtualizedList.recordInteraction(p5)
	-- upvalues: array (ref)
	p5._nestedChildLists:forEach(function(p6)
		if p6.ref then
			p6.ref:recordInteraction()
		end
	end)
	array.forEach(p5._viewabilityTuples, function(p6)
		p6.viewabilityHelper:recordInteraction()
	end)
	p5:_updateViewableItems(p5.props.data)
end

function virtualizedList.flashScrollIndicators(p5)
	if p5._scrollRef == nil then
		return
	end
	p5._scrollRef:flashScrollIndicators()
end

function virtualizedList.getScrollResponder(p5)
	return if p5._scrollRef and p5._scrollRef.getScrollResponder then p5._scrollRef:getScrollResponder() else nil
end

function virtualizedList.getScrollableNode(p5)
	-- upvalues: t (ref)
	return if p5._scrollRef and p5._scrollRef.getScrollableNode then p5._scrollRef:getScrollableNode() else t.findNodeHandle(p5._scrollRef)
end

function virtualizedList.getScrollRef(p5)
	return if p5._scrollRef and p5._scrollRef.getScrollRef then p5._scrollRef:getScrollRef() else p5._scrollRef
end

function virtualizedList.setNativeProps(value, p5)
	if value._scrollRef then
		value._scrollRef:setNativeProps(p5)
	end
end

function virtualizedList._getCellKey(p5)
	return if p5.context and p5.context.cellKey then p5.context.cellKey else "rootList"
end

function virtualizedList._getListKey(p5)
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(p5.props.listKey) then p5.props.listKey else p5:_getCellKey()
end

function virtualizedList._getDebugInfo(p5)
	local t = { listKey = p5:_getListKey(), cellKey = p5:_getCellKey() }
	local horizontal = p5.props.horizontal
	t.horizontal = if horizontal == nil then false else horizontal
	t.parent = if p5.context then p5.context.debugInfo else nil
	
	return t
end

function virtualizedList.hasMore(p5)
	return p5._hasMore
end

function virtualizedList.componentDidMount(p5)
	if p5:_isNestedWithSameOrientation() then
		p5.context.registerAsNestedChild({
			cellKey = p5:_getCellKey(),
			key = p5:_getListKey(),
			ref = p5,
			parentDebugInfo = p5.context.debugInfo
		})
	end
end

function virtualizedList.componentWillUnmount(p5)
	-- upvalues: array (ref)
	if p5:_isNestedWithSameOrientation() then
		p5.context.unregisterAsNestedChild({
			key = p5:_getListKey(),
			state = {
				first = p5.state.first,
				last = p5.state.last,
				frames = p5._frames
			}
		})
	end
	p5:_updateViewableItems(nil)
	p5._updateCellsToRenderBatcher:dispose({ abort = true })
	array.forEach(p5._viewabilityTuples, function(p6)
		p6.viewabilityHelper:dispose()
	end)
	p5._fillRateHelper:deactivateAndFlush()
end

function virtualizedList.getDerivedStateFromProps(p5, p6)
	-- upvalues: console (ref), object (ref)
	local data = p5.data
	local getItemCount = p5.getItemCount
	local maintainVisibleContentPosition = p5.maintainVisibleContentPosition
	local firstItemTracked = p6.firstItemTracked
	local scrollPositionDelta = p6.scrollPositionDelta
	local compareItemData = p5.compareItemData
	local var10 = if compareItemData == nil then function(p7, p8)
		return p7 == p8
	end else compareItemData
	local var11 = if data and getItemCount(data) > 0 then p5.getItem(data, 1) else nil
	
	local function findItem(p7, p8)
		-- upvalues: var10 (ref)
		local var12 = nil
		
		for i = 1, #p7 do
			if not var10(p7[i], p8) then
				continue
			end
			var12 = i
			break
		end
		return if var12 == nil then 1 else var12
	end
	
	if maintainVisibleContentPosition and scrollPositionDelta == 0 and (firstItemTracked ~= nil and var11 ~= nil) then
		scrollPositionDelta = if var10(firstItemTracked, var11) then 0 else findItem(data, firstItemTracked) - 1
	end
	local var13 = getItemCount(data)
	local maxToRenderPerBatch = p5.maxToRenderPerBatch
	maxToRenderPerBatch = math.max(1, math.min(p6.first, var13 - (if maxToRenderPerBatch == nil then 10 else maxToRenderPerBatch)))
	
	if var13 > 0 and var13 < maxToRenderPerBatch + scrollPositionDelta then
		scrollPositionDelta = 0
		console.warn("WARNING: maintainVisibleContentPosition failed because scrollPositionDelta was out of bounds. This could indicate that items in `data` are getting removed, items are getting added to the middle of `data`, or a different `data` array is getting passed in. Consider changing the `key` prop of the List if the `data` prop is significantly altered.")
	end
	if scrollPositionDelta > 0 then
		for i = 1, math.min(scrollPositionDelta, var13) do
			p5.getItem(data, i).shouldResizeOnMount = true
		end
	end
	return {
		first = maxToRenderPerBatch,
		last = math.max(1, math.min(p6.last, var13)),
		firstItemTracked = var11 or object.None,
		scrollPositionDelta = scrollPositionDelta
	}
end

function virtualizedList._pushCells(p9, p10, p11, p12, p13, p14, p15)
	-- upvalues: reactModule (ref), cellRenderer (write)
	local cellRendererComponent = p9.props.CellRendererComponent
	local itemSeparatorComponent = p9.props.ItemSeparatorComponent
	local data = p9.props.data
	local getItem = p9.props.getItem
	local getItemCount = p9.props.getItemCount
	local horizontal = p9.props.horizontal
	local var14 = if p9.props.ListHeaderComponent then 1 else 0
	local var15 = getItemCount(data)
	local var16 = nil
	local minValue = math.min(var15, p14)
	minValue = p13
	while minValue <= minValue do
		local var17 = getItem(data, minValue)
		local var18 = p9:_keyExtractor(var17, minValue)
		p9._indicesToKeys:set(minValue, var18)
		
		if p12:has(minValue + var14) then
			table.insert(p11, #p10)
		end
		local var19 = minValue
		table.insert(p10, reactModule.createElement(cellRenderer, {
			CellRendererComponent = cellRendererComponent,
			ItemSeparatorComponent = if minValue < var15 then itemSeparatorComponent else nil,
			cellKey = var18,
			fillRateHelper = p9._fillRateHelper,
			horizontal = horizontal,
			index = minValue,
			inversionStyle = p15,
			item = var17,
			key = var18,
			prevCellKey = var16,
			onUpdateSeparators = p9._onUpdateSeparators,
			onLayout = function(p16)
				-- upvalues: p9 (ref), var18 (ref), var19 (ref)
				return p9:_onCellLayout(p16, var18, var19)
			end,
			onUnmount = p9._onCellUnmount,
			parentProps = p9.props,
			ref = function(p16)
				-- upvalues: p9 (ref), var18 (ref)
				p9._cellRefs[tostring(var18)] = p16
			end,
			isSequentiallySelectable = p9.props.isSequentiallySelectable
		}))
		var16 = var18
		minValue += 1
	end
end

function virtualizedList._isVirtualizationDisabled(p16)
	return if p16.props.disableVirtualization == nil then false else p16.props.disableVirtualization
end

function virtualizedList._isNestedWithSameOrientation(p16)
	-- upvalues: boolean (ref)
	local context = p16.context
	local var20 = false
	
	if context ~= nil then
		local horizontal = p16.props.horizontal
		var20 = boolean.toJSBoolean(context.horizontal) == (if horizontal == nil then false else horizontal)
	end
	return var20
end

function virtualizedList._keyExtractor(p16, p17, p18)
	-- upvalues: keyExtractor (ref), var3 (write), boolean (ref), var4 (write)
	if p16.props.keyExtractor ~= nil then
		return p16.props.keyExtractor(p17, p18)
	end
	local var20 = keyExtractor(p17, p18)
	
	if var20 == tostring(p18) then
		var3 = true
		
		if p17.type ~= nil and boolean.toJSBoolean(p17.type.displayName) then
			var4 = p17.type.displayName
		end
	end
	return var20
end

function virtualizedList.render(p16)
	-- upvalues: var1 (ref), console (ref), var2 (write), set (ref), reactModule (ref), virtualizedListCellContextProvider (ref), viewModule (ref), styleSheetModule (ref), var3 (write), var4 (write), object (ref), virtualizedListContextProvider (ref), scrollViewModule (ref)
	if _G.__DEV__ then
		local var20 = var1(p16.props.contentContainerStyle)
		
		if var20 ~= nil and var20.flexWrap == "wrap" then
			console.warn("`flexWrap: `wrap`` is not supported with the `VirtualizedList` components.Consider using `numColumns` with `FlatList` instead.")
		end
	end
	local var21
	local listEmptyComponent = p16.props.ListEmptyComponent
	local listFooterComponent = p16.props.ListFooterComponent
	local listHeaderComponent = p16.props.ListHeaderComponent
	local data = p16.props.data
	local horizontal = p16.props.horizontal
	local var22 = p16:_isVirtualizationDisabled()
	
	if p16.props.inverted then
		local horizontal_1 = p16.props.horizontal
		var21 = if if horizontal_1 == nil then false else horizontal_1 then var2.horizontallyInverted else var2.verticallyInverted
	else
		var21 = nil
	end
	local t = {}
	local var23 = set.new(p16.props.stickyHeaderIndices)
	local t_1 = {}
	
	if listHeaderComponent then
		if var23:has(0) then
			table.insert(t_1, 0)
		end
		table.insert(t, reactModule.createElement(virtualizedListCellContextProvider, {
			key = "$header",
			Name = "$header",
			cellKey = p16:_getCellKey() .. "-header"
		}, reactModule.createElement(viewModule, {
			Name = "ListHeaderComponent",
			onLayout = p16._onLayoutHeader,
			style = styleSheetModule.compose(var21, p16.props.ListHeaderComponentStyle),
			LayoutOrder = if p16.props.inverted then 999999998 else -999999998,
			AutomaticSize = if horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
			Size = if horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
		}, if reactModule.isValidElement(listHeaderComponent) then listHeaderComponent else reactModule.createElement(listHeaderComponent, nil))))
	end
	local itemCount = p16.props.getItemCount(data)
	
	if itemCount > 0 then
		local var24
		var3 = false
		var4 = ""
		local spacerKey = p16._getSpacerKey(not horizontal)
		local initialScrollIndex = p16.props.initialScrollIndex
		
		if initialScrollIndex ~= nil and initialScrollIndex ~= 1 then
			var24 = -1
		else
			local initialNumToRender = p16.props.initialNumToRender
			var24 = (if initialNumToRender == nil then 10 else initialNumToRender) - 1
		end
		local var25 = var24 + 1
		local first = p16.state.first
		local last = p16.state.last
		local scrollPositionDelta = p16.state.scrollPositionDelta
		
		if scrollPositionDelta > 0 then
			first += scrollPositionDelta
			last += scrollPositionDelta
		end
		p16:_pushCells(t, t_1, var23, 1, var25, var21)
		local maxValue = math.max(var25 + 1, first)
		
		if not var22 and var25 + 1 < first then
			local var26 = false
			
			if var23.size > 0 then
				local var27 = if listHeaderComponent then 1 else 0
				local var28 = maxValue - 1
				while var25 < var28 do
					if not var23:has(var28 + var27) then
						var28 -= 1
						continue
					end
					local frameMetricsApprox = p16._getFrameMetricsApprox(var25)
					local frameMetricsApprox_1 = p16._getFrameMetricsApprox(var28)
					local initialScrollIndex_1 = p16.props.initialScrollIndex
					local var29 = frameMetricsApprox_1.offset - frameMetricsApprox.offset - (if initialScrollIndex_1 ~= nil and initialScrollIndex_1 ~= 1 then 0 else frameMetricsApprox.length)
					table.insert(t, reactModule.createElement(viewModule, {
						key = "$sticky_lead",
						Name = "$sticky_lead",
						style = {
							Size = if spacerKey == "height" then UDim2.new(1, 0, 0, var29) else UDim2.new(0, var29, 1, 0)
						}
					}))
					p16:_pushCells(t, t_1, var23, var28, var28, var21)
					local var30 = p16._getFrameMetricsApprox(first).offset - frameMetricsApprox_1.offset + frameMetricsApprox_1.length
					table.insert(t, reactModule.createElement(viewModule, {
						key = "$sticky_trail",
						Name = "$sticky_trail",
						style = {
							Size = if spacerKey == "height" then UDim2.new(1, 0, 0, var30) else UDim2.new(0, var30, 1, 0)
						}
					}))
					var26 = true
					break
				end
			end
			if not var26 then
				local frameMetricsApprox = p16._getFrameMetricsApprox(var25)
				local var31 = p16._getFrameMetricsApprox(first).offset - (frameMetricsApprox.offset + frameMetricsApprox.length)
				table.insert(t, reactModule.createElement(viewModule, {
					key = "$lead_spacer",
					Name = "$lead_spacer",
					style = {
						Size = if spacerKey == "height" then UDim2.new(1, 0, 0, var31) else UDim2.new(0, var31, 1, 0)
					},
					LayoutOrder = if p16.props.inverted then 999999999 else -999999999
				}))
			end
		end
		p16:_pushCells(t, t_1, var23, maxValue, last, var21)
		if not var22 and last < itemCount then
			local frameMetricsApprox = p16._getFrameMetricsApprox(last)
			local frameMetricsApprox_1 = p16._getFrameMetricsApprox(if p16.props.getItemLayout then itemCount else math.min(itemCount, p16._highestMeasuredFrameIndex))
			local var32 = frameMetricsApprox_1.offset + frameMetricsApprox_1.length - (frameMetricsApprox.offset + frameMetricsApprox.length)
			table.insert(t, reactModule.createElement(viewModule, {
				key = "$tail_spacer",
				Name = "$tail_spacer",
				style = {
					Size = if spacerKey == "height" then UDim2.new(1, 0, 0, var32) else UDim2.new(0, var32, 1, 0)
				},
				LayoutOrder = if p16.props.inverted then -999999999 else 999999999
			}))
		end
	elseif listEmptyComponent then
		local var33 = if reactModule.isValidElement(listEmptyComponent) then listEmptyComponent else reactModule.createElement(listEmptyComponent, nil)
		table.insert(t, reactModule.cloneElement(var33, {
			key = "$empty",
			Name = "$empty",
			onLayout = function(p17)
				-- upvalues: p16 (ref), var33 (ref)
				p16._onLayoutEmpty(p17)
				
				if var33.props.onLayout then
					var33.props.onLayout(p17)
				end
			end,
			style = styleSheetModule.compose(var21, var33.props.style)
		}))
	end
	if listFooterComponent then
		table.insert(t, reactModule.createElement(virtualizedListCellContextProvider, {
			key = "$footer",
			Name = "$footer",
			cellKey = p16:_getFooterCellKey()
		}, reactModule.createElement(viewModule, {
			Name = "ListFooterComponent",
			onLayout = p16._onLayoutFooter,
			style = styleSheetModule.compose(var21, p16.props.ListFooterComponentStyle),
			LayoutOrder = if p16.props.inverted then -999999998 else 999999998,
			AutomaticSize = if horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
			Size = if horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
		}, if reactModule.isValidElement(listFooterComponent) then listFooterComponent else reactModule.createElement(listFooterComponent, nil))))
	end
	if p16.props.inverted and not p16.props.getItemLayout then
		if p16:getScrollRef() == nil or p16:getScrollRef()._nativeRef.current == nil then
			p16._canvasPosition = if p16.props.horizontal then Vector2.new(p16._invertedCanvasLength, 0) else Vector2.new(0, p16._invertedCanvasLength)
			p16._canvasSize = if p16.props.horizontal then UDim2.new(0, p16._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, p16._invertedCanvasLength)
		else
			local var34
			local current = p16:getScrollRef()._nativeRef.current
			local canvasPosition = current.CanvasPosition
			local frameMetricsApprox = p16._getFrameMetricsApprox(math.min(p16._highestMeasuredFrameIndex, itemCount))
			local var35 = frameMetricsApprox.offset + frameMetricsApprox.length
			
			if p16.props.optimizeInvertedCanvasResize then
				var34 = p16._invertedCanvasLength - p16._footerLength < var35
				var34 = nil
			else
				var34 = var35 ~= p16._invertedCanvasLength - p16._footerLength
			end
			if itemCount <= p16._highestMeasuredFrameIndex and var35 ~= p16._invertedCanvasLength - p16._footerLength then
				local var36 = var35 + p16._footerLength - p16._invertedCanvasLength
				p16._invertedCanvasLength = var35 + p16._footerLength
				local var37 = if p16.props.horizontal then UDim2.new(0, p16._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, p16._invertedCanvasLength)
				current.CanvasSize = var37
				p16._canvasPosition = if p16.props.horizontal then Vector2.new(canvasPosition.X + var36, canvasPosition.Y) else Vector2.new(canvasPosition.X, canvasPosition.Y + var36)
				p16._canvasSize = var37
			elseif var34 and p16.state.scrollPositionDelta == 0 then
				local invertedCanvasLength = p16._invertedCanvasLength
				local windowSize = p16.props.windowSize
				local var38 = frameMetricsApprox.offset + p16._scrollMetrics.visibleLength + p16._scrollMetrics.visibleLength * (if windowSize == nil then 21 else windowSize) * 0.5
				local var39 = var38 - invertedCanvasLength
				p16._invertedCanvasLength = var38
				local var40 = if p16.props.horizontal then UDim2.new(0, p16._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, p16._invertedCanvasLength)
				current.CanvasSize = var40
				current.CanvasPosition = if p16.props.horizontal then Vector2.new(canvasPosition.X + var39, canvasPosition.Y) else Vector2.new(canvasPosition.X, canvasPosition.Y + var39)
				p16._canvasPosition = current.CanvasPosition
				p16._canvasSize = var40
			end
		end
	elseif p16.props.inverted and p16.props.getItemLayout then
		local frameMetricsApprox = p16._getFrameMetricsApprox(itemCount)
		
		if p16:getScrollRef() == nil or p16:getScrollRef()._nativeRef.current == nil then
			p16._invertedCanvasLength = frameMetricsApprox.offset + frameMetricsApprox.length
		else
			local current = p16:getScrollRef()._nativeRef.current
			local canvasPosition = current.CanvasPosition
			local invertedCanvasLength = p16._invertedCanvasLength
			p16._invertedCanvasLength = frameMetricsApprox.offset + frameMetricsApprox.length
			
			if invertedCanvasLength ~= p16._invertedCanvasLength then
				local var41 = p16._invertedCanvasLength - invertedCanvasLength
				current.CanvasPosition = if p16.props.horizontal then canvasPosition + Vector2.new(var41, 0) else canvasPosition + Vector2.new(0, var41)
			end
		end
	end
	local assign = object.assign
	local cloned = table.clone(p16.props)
	local t_2 = {
		onContentSizeChange = p16._onContentSizeChange,
		onLayout = p16._onLayout,
		onScroll = p16._onScroll,
		onScrollBeginDrag = p16._onScrollBeginDrag,
		onScrollEndDrag = p16._onScrollEndDrag,
		onMomentumScrollBegin = p16._onMomentumScrollBegin,
		onMomentumScrollEnd = p16._onMomentumScrollEnd
	}
	local scrollEventThrottle = p16.props.scrollEventThrottle
	t_2.scrollEventThrottle = if scrollEventThrottle == nil then 50 else scrollEventThrottle
	t_2.invertStickyHeaders = if p16.props.invertStickyHeaders ~= nil then p16.props.inverted else p16.props.invertStickyHeaders
	t_2.stickyHeaderIndices = t_1
	t_2.style = p16.props.style
	t_2.layoutStyle = var21 or nil
	t_2.AutomaticCanvasSize = if p16.props.inverted and not p16.props.getItemLayout then Enum.AutomaticSize.None else nil
	t_2.CanvasSize = if p16.props.inverted then p16._canvasSize else nil
	t_2.CanvasPosition = if p16.props.inverted then p16._canvasPosition else nil
	assign = assign(cloned, t_2)
	p16._hasMore = p16.state.last < p16.props.getItemCount(p16.props.data)
	local createElement = reactModule.createElement
	local t_3 = {}
	local t_4 = { cellKey = nil, getScrollMetrics = p16._getScrollMetrics }
	local horizontal_1 = p16.props.horizontal
	t_4.horizontal = if horizontal_1 == nil then false else horizontal_1
	t_4.getOutermostParentListRef = p16._getOutermostParentListRef
	t_4.getNestedChildState = p16._getNestedChildState
	t_4.registerAsNestedChild = p16._registerAsNestedChild
	t_4.unregisterAsNestedChild = p16._unregisterAsNestedChild
	t_4.debugInfo = p16:_getDebugInfo()
	t_3.value = t_4
	createElement = createElement(virtualizedListContextProvider, t_3, reactModule.cloneElement((if p16.props.renderScrollComponent then p16.props.renderScrollComponent else p16._defaultRenderScrollComponent)(assign), { ref = p16._captureScrollRef }, t))
	local var42 = if _G.__DEV__ then reactModule.createElement(scrollViewModule.Context.Consumer, nil, function(p17)
		-- upvalues: p16 (ref), console (copy), createElement (ref)
		if p17 ~= nil then
			local horizontal = p16.props.horizontal
			
			if not p17.horizontal == not (if horizontal == nil then false else horizontal) and not p16._hasWarned.nesting and p16.context == nil then
				console.error("VirtualizedLists should never be nested inside plain ScrollViews with the same orientation because it can break windowing and other functionality - use another VirtualizedList-backed container instead.")
				p16._hasWarned.nesting = true
			end
		end
		return createElement
	end) else createElement
	
	return if p16.props.debug then reactModule.createElement(viewModule, { Name = "debug", style = var2.debug }, var42, p16:_renderDebugOverlay()) else var42
end

function virtualizedList.componentDidUpdate(p17, p18)
	-- upvalues: array (ref)
	if p17.props.data ~= p18.data or p17.props.extraData ~= p18.extraData then
		array.forEach(p17._viewabilityTuples, function(p19)
			p19.viewabilityHelper:resetViewableIndices()
		end)
	end
	local hiPriInProgress = p17._hiPriInProgress
	p17:_scheduleCellsToRenderUpdate()
	
	if hiPriInProgress then
		p17._hiPriInProgress = false
	end
end

function virtualizedList._computeBlankness(p17)
	p17._fillRateHelper:computeBlankness(p17.props, p17.state, p17._scrollMetrics)
end

function virtualizedList._onCellLayout(p17, p18, p19, p20)
	-- upvalues: console (ref), array (ref), object (ref), boolean (ref)
	local var43 = if p17:getScrollRef() and p17:getScrollRef()._nativeRef.current then p17:getScrollRef()._nativeRef.current else p18:FindFirstAncestorOfClass("ScrollingFrame")
	
	if var43 == nil then
		if _G.__DEV__ then
			console.warn("CellLayout failed for index " .. tostring(p20) .. ". this may cause layout issues")
		end
		return
	else
		local absolutePosition = var43.AbsolutePosition
		local canvasPosition = var43.CanvasPosition
		local absoluteCanvasSize = var43.AbsoluteCanvasSize
		local absoluteSize = p18.AbsoluteSize
		local absolutePosition_1 = p18.AbsolutePosition
		local t = {
			width = p18.AbsoluteSize.X,
			height = p18.AbsoluteSize.Y,
			x = if p17.props.inverted and p17.props.horizontal then absoluteCanvasSize.X - canvasPosition.X - absolutePosition_1.X - absoluteSize.X + absolutePosition.X else absolutePosition_1.X - absolutePosition.X + canvasPosition.X,
			y = if p17.props.inverted and not p17.props.horizontal then absoluteCanvasSize.Y - canvasPosition.Y - absolutePosition_1.Y - absoluteSize.Y + absolutePosition.Y else absolutePosition_1.Y - absolutePosition.Y + canvasPosition.Y
		}
		local t_1 = {
			inLayout = true,
			offset = p17:_selectOffset(t),
			length = p17:_selectLength(t),
			index = p20
		}
		local var44 = p17._frames[p19]
		
		if var44 and math.abs(t_1.offset - var44.offset) <= 1 and (t_1.length == var44.length and p20 == var44.index) then
			p17._frames[p19].inLayout = true
		else
			local item = p17.props.getItem(p17.props.data, p20)
			
			if not var44 and not p17.props.getItemLayout and (typeof(item) == "table" and item.shouldResizeOnMount) then
				p17:recalculateFrames(p17:_selectLength(t), p19, p20)
			end
			if var44 and not p17.props.getItemLayout and math.abs(t_1.length - var44.length) >= 1 then
				if p17.props.UNSTABLE_forceSiblingLayoutUpdate then
					local frame = p18:FindFirstAncestorOfClass("Frame")
					local itemCount = p17.props.getItemCount(p17.props.data)
					array.forEach(if frame then frame:GetChildren() else {}, function(p21)
						-- upvalues: p20 (ref), itemCount (ref), p17 (ref)
						if not p21:IsA("GuiObject") then return end
						local absValue = math.abs(p21.LayoutOrder)
						
						if absValue <= p20 or itemCount < absValue then return end
						local item = p17.props.getItem(p17.props.data, absValue)
						
						if item == nil then
							return
						end
						p17:_onCellLayout(p21, p17:_keyExtractor(item, absValue), absValue)
					end)
				else
					array.forEach(object.keys(p17._frames), function(p21)
						-- upvalues: p17 (ref), p20 (ref)
						if p17._frames[p21].index <= p20 then return end
						local var45 = if p17._cellRefs[p21] then p17._cellRefs[p21]:getRef() else nil
						
						if var45 and var45.current then
							p17:_onCellLayout(var45.current, p21, p17._frames[p21].index)
						end
					end)
				end
			end
			p17._totalCellLength += t_1.length - (if boolean.toJSBoolean(var44) then var44.length else 0)
			p17._totalCellsMeasured += if boolean.toJSBoolean(var44) then 0 else 1
			p17._averageCellLength = p17._totalCellLength / p17._totalCellsMeasured
			p17._frames[p19] = t_1
			p17._highestMeasuredFrameIndex = math.max(p17._highestMeasuredFrameIndex, p20)
			p17:_scheduleCellsToRenderUpdate()
			
			if p17.props.inverted and not p17.props.getItemLayout and (p17.state.last == p17.props.getItemCount(p17.props.data) and p17._highestMeasuredFrameIndex == p17.state.last) then
				p17:forceUpdate()
			end
		end
		p17:_triggerRemeasureForChildListsInCell(p19)
		p17:_computeBlankness()
		p17:_updateViewableItems(p17.props.data)
	end
end

function virtualizedList._triggerRemeasureForChildListsInCell(p17, p18)
	local var43 = p17._cellKeysToChildListKeys:get(p18)
	
	if var43 then
		var43:forEach(function(p19)
			-- upvalues: p17 (ref)
			local var44 = p17._nestedChildLists:get(p19)
			
			if var44 and var44.ref then
				var44.ref:measureLayoutRelativeToContainingList()
			end
		end)
	end
end

function virtualizedList.recalculateFrames(p17, p18, p19, p20)
	-- upvalues: array (ref), object (ref)
	array.forEach(object.keys(p17._frames), function(p21)
		-- upvalues: p19 (ref), p17 (ref), p20 (ref), p18 (ref)
		if p21 == p19 and p20 <= p17._frames[p21].index then
			return
		end
		p17._frames[p21].index += 1
		p17._frames[p21].offset += p18
	end)
	p17._highestMeasuredFrameIndex += 1
end

function virtualizedList.measureLayoutRelativeToContainingList(p17)
	-- upvalues: boolean (ref), console (ref)
	local ok, status = pcall(function()
		-- upvalues: boolean (copy), p17 (ref), console (copy)
		if boolean.toJSBoolean(p17._scrollRef) then
			p17._scrollRef:measureLayout(p17.context.getOutermostParentListRef():getScrollRef(), function(p18, p19, p20, p21)
				-- upvalues: p17 (copy)
				p17._offsetFromParentVirtualizedList = p17:_selectOffset({ x = p18, y = p19 })
				p17._scrollMetrics.contentLength = p17:_selectLength({ width = p20, height = p21 })
				local var43 = p17._convertParentScrollMetrics(p17.context.getScrollMetrics())
				
				if if p17._scrollMetrics.visibleLength == var43.visibleLength then p17._scrollMetrics.offset ~= var43.offset else true then
					p17._scrollMetrics.visibleLength = var43.visibleLength
					p17._scrollMetrics.offset = var43.offset
					p17._cellKeysToChildListKeys:forEach(function(p22)
						-- upvalues: p17 (copy)
						if p22 then
							p22:forEach(function(p23)
								-- upvalues: p17 (copy)
								local var44 = p17._nestedChildLists:get(p23)
								
								if var44 and var44.ref then
									var44.ref:measureLayoutRelativeToContainingList()
								end
							end)
						end
					end)
				end
			end, function(_)
				-- upvalues: console (copy)
				console.warn("VirtualizedList: Encountered an error while measuring a list's offset from its containing VirtualizedList.")
			end)
			
			return nil
		end
		return nil
	end)
	
	if not ok then
		console.warn("measureLayoutRelativeToContainingList threw an error", status.stack)
	end
end

function virtualizedList._getFooterCellKey(p17)
	return p17:_getCellKey() .. "-footer"
end

function virtualizedList._renderDebugOverlay(p17)
	-- upvalues: boolean (ref), reactModule (ref), viewModule (ref), var2 (write), array (ref)
	local var43 = p17._scrollMetrics.visibleLength / (if boolean.toJSBoolean(p17._scrollMetrics.contentLength) then p17._scrollMetrics.contentLength else 1)
	local t = {}
	local itemCount = p17.props.getItemCount(p17.props.data)
	local var44 = 1
	while var44 <= itemCount do
		local frameMetricsApprox = p17._getFrameMetricsApprox(var44)
		
		if boolean.toJSBoolean(frameMetricsApprox.inLayout) then
			table.insert(t, frameMetricsApprox)
		end
		var44 += 1
	end
	local offset = p17._getFrameMetricsApprox(p17.state.first).offset
	local frameMetricsApprox = p17._getFrameMetricsApprox(p17.state.last)
	
	return reactModule.createElement(viewModule, { style = { var2.debugOverlayBase, var2.debugOverlay } }, array.map(t, function(p18, p19)
		-- upvalues: reactModule (copy), viewModule (copy), var2 (copy), var43 (ref)
		return reactModule.createElement(viewModule, {
			key = "f" .. tostring(p19),
			Name = "f" .. tostring(p19),
			style = {
				var2.debugOverlayBase,
				var2.debugOverlayFrame,
				{
					top = p18.offset * var43,
					height = p18.length * var43
				}
			}
		})
	end), reactModule.createElement(viewModule, {
		Name = "DebugOverlayLast",
		style = {
			var2.debugOverlayBase,
			var2.debugOverlayFrameLast,
			{
				top = offset * var43,
				height = (frameMetricsApprox.offset + frameMetricsApprox.length - offset) * var43
			}
		}
	}), reactModule.createElement(viewModule, {
		Name = "DebugOverlayVis",
		style = {
			var2.debugOverlayBase,
			var2.debugOverlayFrameVis,
			{
				top = p17._scrollMetrics.offset * var43,
				height = p17._scrollMetrics.visibleLength * var43
			}
		}
	}))
end

function virtualizedList._selectLength(p18, p19)
	local horizontal = p18.props.horizontal
	
	return if if horizontal == nil then false else horizontal then p19.width else p19.height
end

function virtualizedList._selectOffset(value, p18)
	local horizontal = value.props.horizontal
	
	return if if horizontal == nil then false else horizontal then p18.x else p18.y
end

function virtualizedList._maybeCallOnEndReached(p18)
	local data = p18.props.data
	local getItemCount = p18.props.getItemCount
	local onEndReached = p18.props.onEndReached
	local onEndReachedThreshold = p18.props.onEndReachedThreshold
	local visibleLength = p18._scrollMetrics.visibleLength
	local var45 = p18._scrollMetrics.contentLength - visibleLength - p18._scrollMetrics.offset
	local var46 = if onEndReachedThreshold ~= nil then 2 else onEndReachedThreshold * visibleLength
	
	if onEndReached and p18.state.last == getItemCount(data) and (var45 < var46 and p18._scrollMetrics.contentLength ~= p18._sentEndForContentLength) then
		p18._sentEndForContentLength = p18._scrollMetrics.contentLength
		onEndReached({ distanceFromEnd = var45 })
		
		return
	elseif var46 < var45 then
		p18._sentEndForContentLength = 0
	end
end

function virtualizedList._scheduleCellsToRenderUpdate(p18)
	-- upvalues: boolean (ref)
	local first = p18.state.first
	local last = p18.state.last
	
	if p18.state.scrollPositionDelta > 0 then return end
	local offset = p18._scrollMetrics.offset
	local visibleLength = p18._scrollMetrics.visibleLength
	local velocity = p18._scrollMetrics.velocity
	local itemCount = p18.props.getItemCount(p18.props.data)
	local var45 = false
	local onEndReachedThreshold = p18.props.onEndReachedThreshold
	onEndReachedThreshold = (if onEndReachedThreshold == nil then 2 else onEndReachedThreshold) * visibleLength / 2
	
	if first > 1 then
		local var46 = offset - p18._getFrameMetricsApprox(first).offset
		var45 = var45 or (if var46 >= 0 then velocity < -2 and var46 < onEndReachedThreshold else true)
	end
	if last < itemCount then
		var45 = var45 or (if p18._getFrameMetricsApprox(last).offset - (offset + visibleLength) >= 0 then velocity > 2 else true)
	end
	if var45 and (boolean.toJSBoolean(p18._averageCellLength) or p18.props.getItemLayout) and not p18._hiPriInProgress then
		p18._hiPriInProgress = true
		p18._updateCellsToRenderBatcher:dispose({ abort = true })
		p18._updateCellsToRender()
		
		return
	end
	p18._updateCellsToRenderBatcher:schedule()
end

function virtualizedList._updateViewableItems(p18, p19)
	-- upvalues: array (ref)
	local getItemCount = p18.props.getItemCount
	array.forEach(p18._viewabilityTuples, function(p20)
		-- upvalues: getItemCount (ref), p19 (ref), p18 (ref)
		p20.viewabilityHelper:onUpdate(getItemCount(p19), p18._scrollMetrics.offset, p18._scrollMetrics.visibleLength, p18._getFrameMetrics, p18._createViewToken, p20.onViewableItemsChanged, p18.state)
	end)
end

cellRenderer = reactModule.Component:extend("CellRenderer")

function cellRenderer.init(p18, p19)
	-- upvalues: reactModule (ref)
	p18.props = p19
	p18.state = {
		separatorProps = { highlighted = false, leadingItem = p18.props.item }
	}
	p18._separators = {
		highlight = function()
			-- upvalues: p18 (ref)
			p18.props.onUpdateSeparators({ p18.props.cellKey, p18.props.prevCellKey }, { highlighted = true })
		end,
		unhighlight = function()
			-- upvalues: p18 (ref)
			p18.props.onUpdateSeparators({ p18.props.cellKey, p18.props.prevCellKey }, { highlighted = false })
		end,
		updateProps = function(p20, p21)
			-- upvalues: p18 (ref)
			p18.props.onUpdateSeparators({
				if p20 == "leading" then p18.props.prevCellKey else p18.props.cellKey
			}, p21)
		end
	}
	p18._nativeRef = reactModule.createRef()
end

function cellRenderer.getDerivedStateFromProps(p20, p21)
	-- upvalues: object (ref)
	return {
		separatorProps = object.assign({}, p21.separatorProps, { leadingItem = p20.item })
	}
end

function cellRenderer.updateSeparatorProps(p20, p21)
	-- upvalues: object (ref)
	p20:setState(function(p22)
		-- upvalues: object (copy), p21 (ref)
		return {
			separatorProps = object.assign({}, p22.separatorProps, p21)
		}
	end)
end

function cellRenderer.componentWillUnmount(p20)
	p20.props.onUnmount(p20.props.cellKey)
end

function cellRenderer._renderElement(p20, p21, p22, p23, p24)
	-- upvalues: boolean (ref), console (ref), reactModule (ref), invariantModule (ref)
	if boolean.toJSBoolean(p21) and boolean.toJSBoolean(p22) then
		console.warn("VirtualizedList: Both ListItemComponent and renderItem props are present. ListItemComponent will take precedence over renderItem.")
	end
	if boolean.toJSBoolean(p22) then
		return reactModule.createElement(p22, { item = p23, index = p24, separators = p20._separators })
	elseif boolean.toJSBoolean(p21) then
		return p21({ item = p23, index = p24, separators = p20._separators })
	end
	invariantModule(false, "VirtualizedList: Either ListItemComponent or renderItem props are required but none were found.")
	
	return nil
end

function cellRenderer.getRef(p20)
	return p20._nativeRef
end

function cellRenderer.render(p20)
	-- upvalues: reactModule (ref), object (ref), boolean (ref), var2 (write), viewModule (ref), virtualizedListCellContextProvider (ref)
	local cellRendererComponent = p20.props.CellRendererComponent
	local itemSeparatorComponent = p20.props.ItemSeparatorComponent
	local fillRateHelper = p20.props.fillRateHelper
	local horizontal = p20.props.horizontal
	local item = p20.props.item
	local index = p20.props.index
	local inversionStyle = p20.props.inversionStyle
	local parentProps = p20.props.parentProps
	local renderItem = p20:_renderElement(parentProps.renderItem, parentProps.ListItemComponent, item, index)
	local var45 = if parentProps.getItemLayout and not parentProps.debug and not fillRateHelper:enabled() then nil else p20.props.onLayout
	local var46 = itemSeparatorComponent and reactModule.createElement(itemSeparatorComponent, object.assign(p20.state.separatorProps, { LayoutOrder = if inversionStyle then -1 else 1 }))
	local var47 = if boolean.toJSBoolean(inversionStyle) then if horizontal then { var2.rowReverse, inversionStyle } else { var2.columnReverse, inversionStyle } elseif horizontal then { var2.row, inversionStyle } else inversionStyle
	
	return reactModule.createElement(virtualizedListCellContextProvider, { cellKey = p20.props.cellKey }, if not boolean.toJSBoolean(cellRendererComponent) then reactModule.createElement(viewModule, {
		Name = "CellRendererView",
		style = var47,
		onLayout = var45,
		LayoutOrder = if inversionStyle then -index else index,
		AutomaticSize = if horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
		nativeRef = p20._nativeRef,
		SelectionGroup = if p20.props.isSequentiallySelectable then true else nil,
		SelectionBehaviorLeft = if p20.props.isSequentiallySelectable then if p20.props.horizontal then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorRight = if p20.props.isSequentiallySelectable then if p20.props.horizontal then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorUp = if p20.props.isSequentiallySelectable then if p20.props.horizontal then Enum.SelectionBehavior.Stop else Enum.SelectionBehavior.Escape else nil,
		SelectionBehaviorDown = if p20.props.isSequentiallySelectable then if p20.props.horizontal then Enum.SelectionBehavior.Stop else Enum.SelectionBehavior.Escape else nil
	}, if var46 then reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = if horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	}) else nil, renderItem, var46) else reactModule.createElement(cellRendererComponent, object.assign(table.clone(p20.props), {
		style = var47,
		onLayout = var45,
		nativeRef = p20._nativeRef
	}), if var46 then reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = if horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	}) else nil, renderItem, var46))
end

describeNestedLists = function(p20)
	-- upvalues: boolean (ref)
	local text = "VirtualizedList trace:\n" .. ("  Child (%s):\n"):format(if boolean.toJSBoolean(p20.horizontal) then "horizontal" else "vertical") .. ("    listKey: %s\n"):format(p20.key) .. ("    cellKey: %s"):format(p20.cellKey)
	local parentDebugInfo = p20.parentDebugInfo
	while parentDebugInfo do
		text ..= ("\n  Parent (%s):\n"):format(if parentDebugInfo.horizontal then "horizontal" else "vertical") .. ("    listKey: %s\n"):format(parentDebugInfo.listKey) .. ("    cellKey: %s"):format(parentDebugInfo.cellKey)
		parentDebugInfo = parentDebugInfo.parent
	end
	return text
end

var2 = styleSheetModule.create({
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

return virtualizedList
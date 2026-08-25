local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local map = luauPolyfillModule.Map
local object = luauPolyfillModule.Object
local set = luauPolyfillModule.Set
local console = luauPolyfillModule.console

local function _(p0)
	return p0 ~= nil and p0 ~= 1
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

local var8 = function(...)
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
local var15 = nil
local cellRenderer = nil

local function RefreshControl(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", { Name = "RCTRefreshControl" }, p1.children)
end

local var18 = false
local var19 = ""

local _ = function(p2)
	return if p2 == nil then false else p2
end

local _ = function(p3)
	return if p3 == nil then 10 else p3
end

local _ = function(a)
	return if a == nil then 10 else a
end

local _ = function(p4)
	return if p4 == nil then 2 else p4
end

local _ = function(p5)
	return if p5 == nil then 50 else p5
end

local _ = function(p6)
	return if p6 == nil then 21 else p6
end

local _ = function(p7)
	return if p7 == nil then function(p8, p9)
		return p8 == p9
	end else p7
end

local virtualizedList = reactModule.PureComponent:extend("VirtualizedList")
virtualizedList.contextType = virtualizedListContext

function virtualizedList.init(p10, p11)
	-- upvalues: map (ref), invariantModule (ref), fillRateHelperModule (ref), boolean (ref), computeWindowedRenderLimits (ref), batchinatorModule (ref), array (ref), viewabilityHelperModule (ref), object (ref), set (ref), console (ref), describeNestedLists (write), reactModule (ref), viewModule (ref), scrollViewModule (ref), RefreshControl (write), infoLogModule (ref)
	p10.props = p11
	p10._viewabilityTuples = {}
	p10._averageCellLength = 0
	p10._cellKeysToChildListKeys = map.new()
	p10._cellRefs = {}
	p10._frames = {}
	p10._footerLength = 0
	p10._hasDoneInitialScroll = false
	p10._hasInteracted = false
	p10._hasMore = false
	p10._hasWarned = {}
	p10._headerLength = 0
	p10._hiPriInProgress = false
	p10._highestMeasuredFrameIndex = 1
	p10._indicesToKeys = map.new()
	p10._nestedChildLists = map.new()
	p10._offsetFromParentVirtualizedList = 0
	p10._prevParentOffset = 0
	p10._scrollMetrics = {
		contentLength = 0,
		dOffset = 0,
		dt = 10,
		offset = 0,
		timestamp = 0,
		velocity = 0,
		visibleLength = 0
	}
	p10._scrollRef = nil
	p10._sentEndForContentLength = 0
	p10._totalCellLength = 0
	p10._totalCellsMeasured = 0
	p10._canvasPosition = Vector2.new(0, 0)
	p10._canvasSize = UDim2.new(0, 0, 0, 0)
	p10._invertedCanvasLength = if p10.props.getItemLayout then 0 else p10.props.invertedCanvasLength or 1000
	
	function p10._getFrameMetrics(p12)
		-- upvalues: p10 (ref), invariantModule (copy)
		local data = p10.props.data
		local getItem = p10.props.getItem
		local getItemLayout = p10.props.getItemLayout
		invariantModule(p12 <= p10.props.getItemCount(data), "Tried to get frame for out of range index " .. tostring(p12))
		local var25 = getItem(data, p12)
		local var26 = if var25 ~= nil then var25 else p10._frames[p10:_keyExtractor(var25, p12)]
		
		if (not var26 or var26.index ~= p12) and getItemLayout then
			var26 = getItemLayout(data, p12)
		end
		return var26
	end
	
	local windowSize = p11.windowSize
	invariantModule((if windowSize == nil then 21 else windowSize) > 0, "VirtualizedList: The windowSize prop must be present and set to a value greater than 0.")
	p10._fillRateHelper = fillRateHelperModule.new(p10._getFrameMetrics)
	
	function p10._updateCellsToRender()
		-- upvalues: p10 (ref), boolean (copy), computeWindowedRenderLimits (copy)
		local data = p10.props.data
		local getItemCount = p10.props.getItemCount
		local onEndReachedThreshold = p10.props.onEndReachedThreshold
		local var27 = if onEndReachedThreshold == nil then 2 else onEndReachedThreshold
		local var28 = p10:_isVirtualizationDisabled()
		p10:_updateViewableItems(data)
		
		if boolean.toJSBoolean(data) then
			p10:setState(function(p13)
				-- upvalues: p10 (copy), var28 (ref), boolean (copy), computeWindowedRenderLimits (copy), var27 (ref), getItemCount (ref), data (ref)
				local t = nil
				local contentLength = p10._scrollMetrics.contentLength
				local offset = p10._scrollMetrics.offset
				local visibleLength = p10._scrollMetrics.visibleLength
				
				if var28 then
					local var30
					if contentLength - visibleLength - offset < var27 * visibleLength then
						local maxToRenderPerBatch = p10.props.maxToRenderPerBatch
						var30 = if maxToRenderPerBatch == nil then 10 else maxToRenderPerBatch
					else
						var30 = 0
					end
					t = {
						first = 1,
						last = math.min(p13.last + var30, getItemCount(data))
					}
				elseif visibleLength > 0 and contentLength > 0 then
					local initialScrollIndex = p10.props.initialScrollIndex
					
					if not (initialScrollIndex ~= nil and initialScrollIndex ~= 1) or boolean.toJSBoolean(p10._scrollMetrics.offset) then
						local data_1 = p10.props.data
						local getItemCount_1 = p10.props.getItemCount
						local maxToRenderPerBatch = p10.props.maxToRenderPerBatch
						local windowSize = p10.props.windowSize
						t = computeWindowedRenderLimits(data_1, getItemCount_1, if maxToRenderPerBatch == nil then 10 else maxToRenderPerBatch, if windowSize == nil then 21 else windowSize, p13, p10._getFrameMetricsApprox, p10._scrollMetrics)
					end
				end
				if t ~= nil and p10._nestedChildLists.size > 0 then
					local var32
					local last = t.last
					local first = t.first
					while first <= last do
						local var31 = p10._indicesToKeys:get(first)
						var32 = if boolean.toJSBoolean(var31) then p10._cellKeysToChildListKeys:get(var31) else var31
						
						if not boolean.toJSBoolean(var32) then continue end
						local var33 = false
						
						for i, v in ipairs(var32) do
							local var34 = p10._nestedChildLists:get(v)
							
							if var34 and var34.ref and var34.ref:hasMore() then
								var33 = true
								break
							end
						end
						if var33 then
							t.last = first
							break
						end
						first += 1
					end
				end
				if t ~= nil and t.first == p13.first and t.last == p13.last then
					t = nil
				end
				return t
			end)
			
			return
		end
	end
	
	p10._updateCellsToRenderBatcher = batchinatorModule.new(p10._updateCellsToRender, if p10.props.updateCellsBatchingPeriod == nil then 50 else p10.props.updateCellsBatchingPeriod)
	
	if p10.props.viewabilityConfigCallbackPairs then
		p10._viewabilityTuples = array.map(p10.props.viewabilityConfigCallbackPairs, function(p14)
			-- upvalues: viewabilityHelperModule (copy)
			return {
				viewabilityHelper = viewabilityHelperModule.new(p14.viewabilityConfig),
				onViewableItemsChanged = p14.onViewableItemsChanged
			}
		end)
	else
		local onViewableItemsChanged = p10.props.onViewableItemsChanged
		local viewabilityConfig = p10.props.viewabilityConfig
		
		if onViewableItemsChanged then
			table.insert(p10._viewabilityTuples, {
				viewabilityHelper = viewabilityHelperModule.new(viewabilityConfig),
				onViewableItemsChanged = onViewableItemsChanged
			})
		end
	end
	local t = { scrollPositionDelta = 0 }
	local initialScrollIndex = p10.props.initialScrollIndex
	t.first = if initialScrollIndex ~= nil and initialScrollIndex ~= 1 then p10.props.initialScrollIndex else 1
	local var22 = p10.props.getItemCount(p10.props.data) + 1
	local initialScrollIndex_1 = p10.props.initialScrollIndex
	local var23 = initialScrollIndex_1 ~= nil and initialScrollIndex_1 ~= 1
	local initialNumToRender = p10.props.initialNumToRender
	t.last = math.min(var22, (if var23 then p10.props.initialScrollIndex else 1) + (if initialNumToRender == nil then 10 else initialNumToRender)) - 1
	t.firstItemTracked = if p10.props.data and p10.props.getItemCount(p10.props.data) > 0 then p10.props.getItem(p10.props.data, 1) else object.None
	
	if p10:_isNestedWithSameOrientation() then
		local nestedChildState = p10.context.getNestedChildState(p10:_getListKey())
		
		if boolean.toJSBoolean(nestedChildState) then
			t = nestedChildState
			p10.state = nestedChildState
			p10._frames = nestedChildState.frames
		end
	end
	p10.state = t
	
	function p10._getScrollMetrics()
		-- upvalues: p10 (ref)
		return p10._scrollMetrics
	end
	
	function p10._getOutermostParentListRef()
		-- upvalues: p10 (ref)
		return if p10:_isNestedWithSameOrientation() then p10.context.getOutermostParentListRef() else p10
	end
	
	function p10._getNestedChildState(p15)
		-- upvalues: p10 (ref)
		local var35 = p10._nestedChildLists:get(p15)
		
		return var35 and var35.state
	end
	
	function p10._registerAsNestedChild(p16)
		-- upvalues: p10 (ref), set (copy), console (copy), describeNestedLists (copy), object (copy), boolean (copy)
		local cellKey = p10._cellKeysToChildListKeys:get(p16.cellKey) or set.new()
		cellKey:add(p16.key)
		p10._cellKeysToChildListKeys:set(p16.cellKey, cellKey)
		local key = p10._nestedChildLists:get(p16.key)
		
		if key and key.ref ~= nil then
			console.error("A VirtualizedList contains a cell which itself contains " .. "more than one VirtualizedList of the same orientation as the parent " .. "list. You must pass a unique listKey prop to each sibling list.\n\n" .. describeNestedLists(object.assign({}, p16, {
				horizontal = boolean.toJSBoolean(p16.ref.props.horizontal)
			})))
		end
		p10._nestedChildLists:set(p16.key, { state = nil, ref = p16.ref })
		
		if p10._hasInteracted then
			p16.ref:recordInteraction()
		end
		return nil
	end
	
	function p10._unregisterAsNestedChild(p17)
		-- upvalues: p10 (ref)
		p10._nestedChildLists:set(p17.key, { ref = nil, state = p17.state })
	end
	
	function p10._onUpdateSeparators(p18, p19)
		-- upvalues: array (copy), p10 (ref), boolean (copy)
		array.forEach(p18, function(p20)
			-- upvalues: p10 (copy), boolean (copy), p19 (ref)
			local var38 = p20 ~= nil and p10._cellRefs[tostring(p20)]
			
			if boolean.toJSBoolean(var38) then
				return var38:updateSeparatorProps(p19)
			end
		end)
	end
	
	function p10._getSpacerKey(p21)
		return if p21 then "height" else "width"
	end
	
	function p10._captureScrollRef(p22)
		-- upvalues: p10 (ref)
		p10._scrollRef = p22
	end
	
	function p10._defaultRenderScrollComponent(p23)
		-- upvalues: p10 (ref), reactModule (copy), viewModule (copy), invariantModule (copy), scrollViewModule (copy), object (copy), RefreshControl (copy)
		local onRefresh = p23.onRefresh
		
		if p10:_isNestedWithSameOrientation() then
			return reactModule.createElement(viewModule, p23)
		elseif onRefresh then
			invariantModule(typeof(p23.refreshing) == "boolean", "`refreshing` prop must be set as a boolean in order to use `onRefresh`, but got `" .. (if p23.refreshing == nil then "undefined" else tostring(p23.refreshing) .. "`"))
			
			return reactModule.createElement(scrollViewModule, object.assign(table.clone(p23), {
				refreshControl = if p23.refreshControl == nil then reactModule.createElement(RefreshControl, {
					refreshing = p23.refreshing,
					onRefresh = onRefresh,
					progressViewOffset = p23.progressViewOffset
				}) else p23.refreshControl
			}))
		end
		return reactModule.createElement(scrollViewModule, p23)
	end
	
	function p10._onCellUnmount(p24)
		-- upvalues: p10 (ref), object (copy)
		local var39 = p10._frames[p24]
		
		if var39 ~= nil then
			p10._frames[p24] = object.assign({}, var39, { inLayout = false })
		end
	end
	
	function p10._onLayout(p25)
		-- upvalues: p10 (ref)
		if p10:_isNestedWithSameOrientation() then
			p10:measureLayoutRelativeToContainingList()
		else
			p10._scrollMetrics.visibleLength = p10:_selectLength({ width = p25.AbsoluteSize.X, height = p25.AbsoluteSize.Y })
		end
		if p10.props.onLayout then
			p10.props.onLayout(p25)
		end
		p10:_scheduleCellsToRenderUpdate()
		p10:_maybeCallOnEndReached()
	end
	
	function p10._onLayoutEmpty(p26)
		-- upvalues: p10 (ref)
		if p10.props.onLayout then
			p10.props.onLayout(p26)
		end
	end
	
	function p10._onLayoutFooter(p27)
		-- upvalues: p10 (ref)
		p10:_triggerRemeasureForChildListsInCell(p10:_getFooterCellKey())
		p10._footerLength = p10:_selectLength({ height = p27.AbsoluteSize.Y, width = p27.AbsoluteSize.X })
	end
	
	function p10._onLayoutHeader(p28)
		-- upvalues: p10 (ref)
		p10._headerLength = p10:_selectLength({ height = p28.AbsoluteSize.Y, width = p28.AbsoluteSize.X })
	end
	
	function p10._onContentSizeChange(p29, p30)
		-- upvalues: p10 (ref)
		if p29 > 0 and p30 > 0 and (p10.props.initialScrollIndex ~= nil and p10.props.initialScrollIndex > 1) and not p10._hasDoneInitialScroll then
			if p10.props.contentOffset == nil then
				p10:scrollToIndex({ animated = false, index = p10.props.initialScrollIndex })
			end
			p10._hasDoneInitialScroll = true
		elseif p10.props.inverted and p29 > 0 and (p30 > 0 and not p10._hasDoneInitialScroll) then
			p10._hasDoneInitialScroll = true
			task.defer(function()
				-- upvalues: p10 (copy)
				while p10:getScrollRef() == nil do
					task.wait()
				end
				if p10.props.contentOffset == nil then
					local current = p10:getScrollRef()._nativeRef.current
					
					if p10.props.horizontal then
						current.CanvasPosition = Vector2.new(current.AbsoluteCanvasSize.X, current.CanvasPosition.Y)
						
						return
					end
					current.CanvasPosition = Vector2.new(current.CanvasPosition.X, current.AbsoluteCanvasSize.Y)
				end
			end)
		end
		if p10.props.onContentSizeChange then
			p10.props.onContentSizeChange(p29, p30)
		end
		p10._scrollMetrics.contentLength = p10:_selectLength({ height = p30, width = p29 })
		p10:_scheduleCellsToRenderUpdate()
		p10:_maybeCallOnEndReached()
	end
	
	function p10._convertParentScrollMetrics(p31)
		-- upvalues: p10 (ref)
		local var40 = p31.offset - p10._offsetFromParentVirtualizedList
		
		return {
			visibleLength = p31.visibleLength,
			contentLength = p10._scrollMetrics.contentLength,
			offset = var40,
			dOffset = var40 - p10._scrollMetrics.offset
		}
	end
	
	function p10._onScroll(p32)
		-- upvalues: p10 (ref), boolean (copy), infoLogModule (copy)
		p10._nestedChildLists:forEach(function(p33)
			-- upvalues: p32 (ref)
			if p33.ref then
				p33.ref._onScroll(p32)
			end
		end)
		
		if p10.props.onScroll then
			p10.props.onScroll(p32)
		end
		local processTime = os.clock()
		local var42 = p32:GetChildren()[1]
		local var43 = p10:_selectLength({ height = p32.AbsoluteSize.Y, width = p32.AbsoluteSize.X })
		local var44 = p10:_selectLength({
			height = var42.AbsoluteSize.Y,
			width = var42.AbsoluteSize.X
		})
		local var45 = if p10.props.inverted then p10:_selectOffset({
			x = p32.AbsoluteCanvasSize.X - p32.CanvasPosition.X - var43,
			y = p32.AbsoluteCanvasSize.Y - p32.CanvasPosition.Y - var43
		}) else p10:_selectOffset({ x = p32.CanvasPosition.X, y = p32.CanvasPosition.Y })
		local var46 = var45 - p10._scrollMetrics.offset
		
		if p10:_isNestedWithSameOrientation() then
			if p10._scrollMetrics.contentLength == 0 then return end
			local var47 = p10._convertParentScrollMetrics({ var43, var45 })
			var43 = var47.visibleLength
			var44 = var47.contentLength
			var45 = var47.offset
			var46 = var47.dOffset
		end
		local var48 = if boolean.toJSBoolean(p10._scrollMetrics.timestamp) then math.max(1, (processTime - p10._scrollMetrics.timestamp) * 1000) else 1
		local var49 = var46 / var48
		
		if var48 > 500 and p10._scrollMetrics.dt > 500 and (5 * var43 < var44 and not p10._hasWarned.perf) then
			infoLogModule("VirtualizedList: You have a large list that is slow to update - make sure your renderItem function renders components that follow React performance best practices like PureComponent, shouldComponentUpdate, etc.", {
				dt = var48,
				prevDt = p10._scrollMetrics.dt,
				contentLength = var44
			})
			p10._hasWarned.perf = true
		end
		p10._scrollMetrics = {
			contentLength = var44,
			dt = var48,
			dOffset = var46,
			offset = var45,
			timestamp = processTime,
			velocity = var49,
			visibleLength = var43
		}
		local scrollPositionDelta = p10.state.scrollPositionDelta
		
		if scrollPositionDelta > 0 then
			p10:setState(function(p34)
				-- upvalues: scrollPositionDelta (ref)
				return {
					scrollPositionDelta = 0,
					first = p34.first + scrollPositionDelta,
					last = p34.last + scrollPositionDelta
				}
			end)
		end
		p10:_updateViewableItems(p10.props.data)
		
		if not p10.props then return end
		p10:_maybeCallOnEndReached()
		
		if var49 ~= 0 then
			p10._fillRateHelper:activate()
		end
		p10:_computeBlankness()
		p10:_scheduleCellsToRenderUpdate()
	end
	
	function p10._onScrollBeginDrag(p35)
		-- upvalues: p10 (ref), array (copy)
		p10._nestedChildLists:forEach(function(p36)
			-- upvalues: p35 (ref)
			if p36.ref then
				p36.ref._onScrollBeginDrag(p35)
			end
		end)
		array.forEach(p10._viewabilityTuples, function(p37)
			p37.viewabilityHelper:recordInteraction()
		end)
		p10._hasInteracted = true
		
		if p10.props.onScrollBeginDrag then
			p10.props.onScrollBeginDrag(p35)
		end
	end
	
	function p10._onScrollEndDrag(p38)
		-- upvalues: p10 (ref), boolean (copy)
		p10._nestedChildLists:forEach(function(p39)
			-- upvalues: p38 (ref)
			if p39.ref then
				p39.ref._onScrollEndDrag(p38)
			end
		end)
		
		if boolean.toJSBoolean(nil) then
			p10._scrollMetrics.velocity = p10:_selectOffset(nil)
		end
		p10:_computeBlankness()
		
		if p10.props.onScrollEndDrag then
			p10.props.onScrollEndDrag(p38)
		end
	end
	
	function p10._onMomentumScrollBegin(p40)
		-- upvalues: p10 (ref)
		p10._nestedChildLists:forEach(function(p41)
			-- upvalues: p40 (ref)
			if p41.ref then
				p41.ref._onMomentumScrollBegin(p40)
			end
		end)
		
		if p10.props.onMomentumScrollBegin then
			p10.props.onMomentumScrollBegin(p40)
		end
	end
	
	function p10._onMomentumScrollEnd(p42)
		-- upvalues: p10 (ref)
		p10._nestedChildLists:forEach(function(p43)
			-- upvalues: p42 (ref)
			if p43.ref then
				p43.ref._onMomentumScrollEnd(p42)
			end
		end)
		p10._scrollMetrics.velocity = 0
		p10:_computeBlankness()
		
		if p10.props.onMomentumScrollEnd then
			p10.props.onMomentumScrollEnd(p42)
		end
	end
	
	function p10._createViewToken(p44, p45)
		-- upvalues: p10 (ref)
		local item = p10.props.getItem(p10.props.data, p44)
		
		return {
			index = p44,
			item = item,
			key = p10:_keyExtractor(item, p44),
			isViewable = p45
		}
	end
	
	function p10._getFrameMetricsApprox(p46)
		-- upvalues: p10 (ref), invariantModule (copy)
		local frameMetrics = p10._getFrameMetrics(p46)
		
		if frameMetrics == nil or frameMetrics.index ~= p46 then
			invariantModule(not p10.props.getItemLayout, "Should not have to estimate frames when a measurement metrics function is provided")
			
			return {
				length = p10._averageCellLength,
				offset = p10._averageCellLength * (p46 - 1)
			}
		end
		return frameMetrics
	end
end

function virtualizedList.scrollToEnd(p47, p48)
	-- upvalues: console (ref)
	local var52 = p48 ~= nil or p48.animated
	local frameMetricsApprox = p47._getFrameMetricsApprox(p47.props.getItemCount(p47.props.data))
	local var54 = if p47.props.inverted then 0 else math.max(0, frameMetricsApprox.offset + frameMetricsApprox.length + p47._footerLength - p47._scrollMetrics.visibleLength)
	
	if p47._scrollRef == nil then return end
	if p47._scrollRef.scrollTo == nil then
		console.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.")
		
		return
	end
	local horizontal = p47.props.horizontal
	p47._scrollRef.scrollTo(if if horizontal == nil then false else horizontal then { x = var54, animated = var52 } else { y = var54, animated = var52 })
end

function virtualizedList.scrollToIndex(p49, p50)
	-- upvalues: invariantModule (ref), boolean (ref), console (ref)
	local data = p49.props.data
	local horizontal = p49.props.horizontal
	local getItemCount = p49.props.getItemCount
	local getItemLayout = p49.props.getItemLayout
	local onScrollToIndexFailed = p49.props.onScrollToIndexFailed
	local animated = p50.animated
	local index = p50.index
	local viewOffset = p50.viewOffset
	local viewPosition = p50.viewPosition
	invariantModule(index >= 1, ("scrollToIndex out of range: requested index %d but minimum is 1"):format(index))
	invariantModule(getItemCount(data) >= 1, ("scrollToIndex out of range: item length %d but minimum is 1"):format(getItemCount(data)))
	invariantModule(index <= getItemCount(data), ("scrollToIndex out of range: requested index %d is out of 1 to %d"):format(index, getItemCount(data)))
	
	if not getItemLayout and p49._highestMeasuredFrameIndex < index then
		invariantModule(boolean.toJSBoolean(onScrollToIndexFailed), "scrollToIndex should be used in conjunction with getItemLayout or onScrollToIndexFailed, otherwise there is no way to know the location of offscreen indices or handle failures.")
		onScrollToIndexFailed({
			averageItemLength = p49._averageCellLength,
			highestMeasuredFrameIndex = p49._highestMeasuredFrameIndex,
			index = index
		})
		
		return
	end
	local var55 = if p49:getScrollRef() then p49:getScrollRef()._nativeRef.current else nil
	
	if var55 == nil then return end
	local absoluteCanvasSize = var55.AbsoluteCanvasSize
	local absoluteSize = var55.AbsoluteSize
	local frameMetricsApprox = p49._getFrameMetricsApprox(index)
	local var57 = math.max(0, if p49.props.inverted then (if horizontal then absoluteCanvasSize.X else absoluteCanvasSize.Y) - (if horizontal then absoluteSize.X else absoluteSize.Y) - frameMetricsApprox.offset - (if boolean.toJSBoolean(viewPosition) then viewPosition else 0) * (p49._scrollMetrics.visibleLength - frameMetricsApprox.length) else frameMetricsApprox.offset - (if boolean.toJSBoolean(viewPosition) then viewPosition else 0) * (p49._scrollMetrics.visibleLength - frameMetricsApprox.length)) - (if boolean.toJSBoolean(viewOffset) then viewOffset else 0)
	
	if p49._scrollRef == nil then return end
	if p49._scrollRef.scrollTo == nil then
		console.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.")
		
		return
	end
	p49._scrollRef.scrollTo(if horizontal then { x = var57, animated = animated } else { y = var57, animated = animated })
end

function virtualizedList.scrollToItem(p51, p52)
	-- upvalues: object (ref)
	local item = p52.item
	local data = p51.props.data
	local getItem = p51.props.getItem
	local itemCount = p51.props.getItemCount(data)
	local var59 = 1
	while var59 <= itemCount do
		if getItem(data, var59) ~= item then
			var59 += 1
			continue
		end
		p51:scrollToIndex(object.assign({}, p52, { index = var59 }))
		
		return
	end
end

function virtualizedList.scrollToOffset(value, p53)
	-- upvalues: console (ref)
	local var60 = if value:getScrollRef() then value:getScrollRef()._nativeRef.current else nil
	
	if var60 == nil then return end
	local animated = p53.animated
	local offset = p53.offset
	
	if value._scrollRef == nil then return end
	if value.props.inverted then
		local absoluteCanvasSize = var60.AbsoluteCanvasSize
		local absoluteSize = var60.AbsoluteSize
		offset = (if value.props.horizontal then absoluteCanvasSize.X else absoluteCanvasSize.Y) - offset - (if value.props.horizontal then absoluteSize.X else absoluteSize.Y)
	end
	if value._scrollRef.scrollTo == nil then
		console.warn("No scrollTo method provided. This may be because you have two nested VirtualizedLists with the same orientation, or because you are using a custom component that does not implement scrollTo.")
		
		return
	end
	local horizontal = value.props.horizontal
	value._scrollRef.scrollTo(if if horizontal == nil then false else horizontal then { x = offset, animated = animated } else { y = offset, animated = animated })
end

function virtualizedList.recordInteraction(p54)
	-- upvalues: array (ref)
	p54._nestedChildLists:forEach(function(p55)
		if p55.ref then
			p55.ref:recordInteraction()
		end
	end)
	array.forEach(p54._viewabilityTuples, function(p56)
		p56.viewabilityHelper:recordInteraction()
	end)
	p54:_updateViewableItems(p54.props.data)
end

function virtualizedList.flashScrollIndicators(p57)
	if p57._scrollRef == nil then
		return
	end
	p57._scrollRef:flashScrollIndicators()
end

function virtualizedList.getScrollResponder(p58)
	return if p58._scrollRef and p58._scrollRef.getScrollResponder then p58._scrollRef:getScrollResponder() else nil
end

function virtualizedList.getScrollableNode(p59)
	-- upvalues: t (ref)
	return if p59._scrollRef and p59._scrollRef.getScrollableNode then p59._scrollRef:getScrollableNode() else t.findNodeHandle(p59._scrollRef)
end

function virtualizedList.getScrollRef(p60)
	return if p60._scrollRef and p60._scrollRef.getScrollRef then p60._scrollRef:getScrollRef() else p60._scrollRef
end

function virtualizedList.setNativeProps(value, p61)
	if value._scrollRef then
		value._scrollRef:setNativeProps(p61)
	end
end

function virtualizedList._getCellKey(p62)
	return if p62.context and p62.context.cellKey then p62.context.cellKey else "rootList"
end

function virtualizedList._getListKey(p63)
	-- upvalues: boolean (ref)
	return if boolean.toJSBoolean(p63.props.listKey) then p63.props.listKey else p63:_getCellKey()
end

function virtualizedList._getDebugInfo(p64)
	local t = { listKey = p64:_getListKey(), cellKey = p64:_getCellKey() }
	local horizontal = p64.props.horizontal
	t.horizontal = if horizontal == nil then false else horizontal
	t.parent = if p64.context then p64.context.debugInfo else nil
	
	return t
end

function virtualizedList.hasMore(p65)
	return p65._hasMore
end

function virtualizedList.componentDidMount(p66)
	if p66:_isNestedWithSameOrientation() then
		p66.context.registerAsNestedChild({
			cellKey = p66:_getCellKey(),
			key = p66:_getListKey(),
			ref = p66,
			parentDebugInfo = p66.context.debugInfo
		})
	end
end

function virtualizedList.componentWillUnmount(p67)
	-- upvalues: array (ref)
	if p67:_isNestedWithSameOrientation() then
		p67.context.unregisterAsNestedChild({
			key = p67:_getListKey(),
			state = {
				first = p67.state.first,
				last = p67.state.last,
				frames = p67._frames
			}
		})
	end
	p67:_updateViewableItems(nil)
	p67._updateCellsToRenderBatcher:dispose({ abort = true })
	array.forEach(p67._viewabilityTuples, function(p68)
		p68.viewabilityHelper:dispose()
	end)
	p67._fillRateHelper:deactivateAndFlush()
end

function virtualizedList.getDerivedStateFromProps(p69, p70)
	-- upvalues: console (ref), object (ref)
	local data = p69.data
	local getItemCount = p69.getItemCount
	local maintainVisibleContentPosition = p69.maintainVisibleContentPosition
	local firstItemTracked = p70.firstItemTracked
	local scrollPositionDelta = p70.scrollPositionDelta
	local compareItemData = p69.compareItemData
	local var62 = if compareItemData == nil then function(p71, p72)
		return p71 == p72
	end else compareItemData
	local var63 = if data and getItemCount(data) > 0 then p69.getItem(data, 1) else nil
	
	local function findItem(p73, p74)
		-- upvalues: var62 (ref)
		local var66 = nil
		
		for i = 1, #p73 do
			if not var62(p73[i], p74) then
				continue
			end
			var66 = i
			break
		end
		return if var66 == nil then 1 else var66
	end
	
	if maintainVisibleContentPosition and scrollPositionDelta == 0 and (firstItemTracked ~= nil and var63 ~= nil) then
		scrollPositionDelta = if var62(firstItemTracked, var63) then 0 else findItem(data, firstItemTracked) - 1
	end
	local var65 = getItemCount(data)
	local maxToRenderPerBatch = p69.maxToRenderPerBatch
	maxToRenderPerBatch = math.max(1, math.min(p70.first, var65 - (if maxToRenderPerBatch == nil then 10 else maxToRenderPerBatch)))
	
	if var65 > 0 and var65 < maxToRenderPerBatch + scrollPositionDelta then
		scrollPositionDelta = 0
		console.warn("WARNING: maintainVisibleContentPosition failed because scrollPositionDelta was out of bounds. This could indicate that items in `data` are getting removed, items are getting added to the middle of `data`, or a different `data` array is getting passed in. Consider changing the `key` prop of the List if the `data` prop is significantly altered.")
	end
	if scrollPositionDelta > 0 then
		for i = 1, math.min(scrollPositionDelta, var65) do
			p69.getItem(data, i).shouldResizeOnMount = true
		end
	end
	return {
		first = maxToRenderPerBatch,
		last = math.max(1, math.min(p70.last, var65)),
		firstItemTracked = var63 or object.None,
		scrollPositionDelta = scrollPositionDelta
	}
end

function virtualizedList._pushCells(p75, p76, p77, p78, p79, p80, p81)
	-- upvalues: reactModule (ref), cellRenderer (write)
	local cellRendererComponent = p75.props.CellRendererComponent
	local itemSeparatorComponent = p75.props.ItemSeparatorComponent
	local data = p75.props.data
	local getItem = p75.props.getItem
	local getItemCount = p75.props.getItemCount
	local horizontal = p75.props.horizontal
	local var67 = if p75.props.ListHeaderComponent then 1 else 0
	local var68 = getItemCount(data)
	local var69 = nil
	local minValue = math.min(var68, p80)
	minValue = p79
	while minValue <= minValue do
		local var71 = getItem(data, minValue)
		local var72 = p75:_keyExtractor(var71, minValue)
		p75._indicesToKeys:set(minValue, var72)
		
		if p78:has(minValue + var67) then
			table.insert(p77, #p76)
		end
		local var73 = minValue
		table.insert(p76, reactModule.createElement(cellRenderer, {
			CellRendererComponent = cellRendererComponent,
			ItemSeparatorComponent = if minValue < var68 then itemSeparatorComponent else nil,
			cellKey = var72,
			fillRateHelper = p75._fillRateHelper,
			horizontal = horizontal,
			index = minValue,
			inversionStyle = p81,
			item = var71,
			key = var72,
			prevCellKey = var69,
			onUpdateSeparators = p75._onUpdateSeparators,
			onLayout = function(p82)
				-- upvalues: p75 (ref), var72 (ref), var73 (ref)
				return p75:_onCellLayout(p82, var72, var73)
			end,
			onUnmount = p75._onCellUnmount,
			parentProps = p75.props,
			ref = function(p83)
				-- upvalues: p75 (ref), var72 (ref)
				p75._cellRefs[tostring(var72)] = p83
			end,
			isSequentiallySelectable = p75.props.isSequentiallySelectable
		}))
		var69 = var72
		minValue += 1
	end
end

function virtualizedList._isVirtualizationDisabled(p84)
	return if p84.props.disableVirtualization == nil then false else p84.props.disableVirtualization
end

function virtualizedList._isNestedWithSameOrientation(p85)
	-- upvalues: boolean (ref)
	local context = p85.context
	local var74 = false
	
	if context ~= nil then
		local horizontal = p85.props.horizontal
		var74 = boolean.toJSBoolean(context.horizontal) == (if horizontal == nil then false else horizontal)
	end
	return var74
end

function virtualizedList._keyExtractor(p86, p87, p88)
	-- upvalues: keyExtractor (ref), var18 (write), boolean (ref), var19 (write)
	if p86.props.keyExtractor ~= nil then
		return p86.props.keyExtractor(p87, p88)
	end
	local var75 = keyExtractor(p87, p88)
	
	if var75 == tostring(p88) then
		var18 = true
		
		if p87.type ~= nil and boolean.toJSBoolean(p87.type.displayName) then
			var19 = p87.type.displayName
		end
	end
	return var75
end

function virtualizedList.render(p89)
	-- upvalues: var8 (ref), console (ref), var15 (write), set (ref), reactModule (ref), virtualizedListCellContextProvider (ref), viewModule (ref), styleSheetModule (ref), var18 (write), var19 (write), object (ref), virtualizedListContextProvider (ref), scrollViewModule (ref)
	if _G.__DEV__ then
		local var76 = var8(p89.props.contentContainerStyle)
		
		if var76 ~= nil and var76.flexWrap == "wrap" then
			console.warn("`flexWrap: `wrap`` is not supported with the `VirtualizedList` components.Consider using `numColumns` with `FlatList` instead.")
		end
	end
	local var78
	local listEmptyComponent = p89.props.ListEmptyComponent
	local listFooterComponent = p89.props.ListFooterComponent
	local listHeaderComponent = p89.props.ListHeaderComponent
	local data = p89.props.data
	local horizontal = p89.props.horizontal
	local var77 = p89:_isVirtualizationDisabled()
	
	if p89.props.inverted then
		local horizontal_1 = p89.props.horizontal
		var78 = if if horizontal_1 == nil then false else horizontal_1 then var15.horizontallyInverted else var15.verticallyInverted
	else
		var78 = nil
	end
	local t = {}
	local var80 = set.new(p89.props.stickyHeaderIndices)
	local t_1 = {}
	
	if listHeaderComponent then
		if var80:has(0) then
			table.insert(t_1, 0)
		end
		table.insert(t, reactModule.createElement(virtualizedListCellContextProvider, {
			key = "$header",
			Name = "$header",
			cellKey = p89:_getCellKey() .. "-header"
		}, reactModule.createElement(viewModule, {
			Name = "ListHeaderComponent",
			onLayout = p89._onLayoutHeader,
			style = styleSheetModule.compose(var78, p89.props.ListHeaderComponentStyle),
			LayoutOrder = if p89.props.inverted then 999999998 else -999999998,
			AutomaticSize = if horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
			Size = if horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
		}, if reactModule.isValidElement(listHeaderComponent) then listHeaderComponent else reactModule.createElement(listHeaderComponent, nil))))
	end
	local itemCount = p89.props.getItemCount(data)
	
	if itemCount > 0 then
		local var84
		var18 = false
		var19 = ""
		local spacerKey = p89._getSpacerKey(not horizontal)
		local initialScrollIndex = p89.props.initialScrollIndex
		
		if initialScrollIndex ~= nil and initialScrollIndex ~= 1 then
			var84 = -1
		else
			local initialNumToRender = p89.props.initialNumToRender
			var84 = (if initialNumToRender == nil then 10 else initialNumToRender) - 1
		end
		local var85 = var84 + 1
		local first = p89.state.first
		local last = p89.state.last
		local scrollPositionDelta = p89.state.scrollPositionDelta
		
		if scrollPositionDelta > 0 then
			first += scrollPositionDelta
			last += scrollPositionDelta
		end
		p89:_pushCells(t, t_1, var80, 1, var85, var78)
		local maxValue = math.max(var85 + 1, first)
		
		if not var77 and var85 + 1 < first then
			local var87 = false
			
			if var80.size > 0 then
				local var88 = if listHeaderComponent then 1 else 0
				local var89 = maxValue - 1
				while var85 < var89 do
					if not var80:has(var89 + var88) then
						var89 -= 1
						continue
					end
					local frameMetricsApprox = p89._getFrameMetricsApprox(var85)
					local frameMetricsApprox_1 = p89._getFrameMetricsApprox(var89)
					local initialScrollIndex_1 = p89.props.initialScrollIndex
					local var92 = frameMetricsApprox_1.offset - frameMetricsApprox.offset - (if initialScrollIndex_1 ~= nil and initialScrollIndex_1 ~= 1 then 0 else frameMetricsApprox.length)
					table.insert(t, reactModule.createElement(viewModule, {
						key = "$sticky_lead",
						Name = "$sticky_lead",
						style = {
							Size = if spacerKey == "height" then UDim2.new(1, 0, 0, var92) else UDim2.new(0, var92, 1, 0)
						}
					}))
					p89:_pushCells(t, t_1, var80, var89, var89, var78)
					local var93 = p89._getFrameMetricsApprox(first).offset - frameMetricsApprox_1.offset + frameMetricsApprox_1.length
					table.insert(t, reactModule.createElement(viewModule, {
						key = "$sticky_trail",
						Name = "$sticky_trail",
						style = {
							Size = if spacerKey == "height" then UDim2.new(1, 0, 0, var93) else UDim2.new(0, var93, 1, 0)
						}
					}))
					var87 = true
					break
				end
			end
			if not var87 then
				local frameMetricsApprox = p89._getFrameMetricsApprox(var85)
				local var95 = p89._getFrameMetricsApprox(first).offset - (frameMetricsApprox.offset + frameMetricsApprox.length)
				table.insert(t, reactModule.createElement(viewModule, {
					key = "$lead_spacer",
					Name = "$lead_spacer",
					style = {
						Size = if spacerKey == "height" then UDim2.new(1, 0, 0, var95) else UDim2.new(0, var95, 1, 0)
					},
					LayoutOrder = if p89.props.inverted then 999999999 else -999999999
				}))
			end
		end
		p89:_pushCells(t, t_1, var80, maxValue, last, var78)
		if not var77 and last < itemCount then
			local frameMetricsApprox = p89._getFrameMetricsApprox(last)
			local frameMetricsApprox_1 = p89._getFrameMetricsApprox(if p89.props.getItemLayout then itemCount else math.min(itemCount, p89._highestMeasuredFrameIndex))
			local var98 = frameMetricsApprox_1.offset + frameMetricsApprox_1.length - (frameMetricsApprox.offset + frameMetricsApprox.length)
			table.insert(t, reactModule.createElement(viewModule, {
				key = "$tail_spacer",
				Name = "$tail_spacer",
				style = {
					Size = if spacerKey == "height" then UDim2.new(1, 0, 0, var98) else UDim2.new(0, var98, 1, 0)
				},
				LayoutOrder = if p89.props.inverted then -999999999 else 999999999
			}))
		end
	elseif listEmptyComponent then
		local var99 = if reactModule.isValidElement(listEmptyComponent) then listEmptyComponent else reactModule.createElement(listEmptyComponent, nil)
		table.insert(t, reactModule.cloneElement(var99, {
			key = "$empty",
			Name = "$empty",
			onLayout = function(p90)
				-- upvalues: p89 (ref), var99 (ref)
				p89._onLayoutEmpty(p90)
				
				if var99.props.onLayout then
					var99.props.onLayout(p90)
				end
			end,
			style = styleSheetModule.compose(var78, var99.props.style)
		}))
	end
	if listFooterComponent then
		table.insert(t, reactModule.createElement(virtualizedListCellContextProvider, {
			key = "$footer",
			Name = "$footer",
			cellKey = p89:_getFooterCellKey()
		}, reactModule.createElement(viewModule, {
			Name = "ListFooterComponent",
			onLayout = p89._onLayoutFooter,
			style = styleSheetModule.compose(var78, p89.props.ListFooterComponentStyle),
			LayoutOrder = if p89.props.inverted then -999999998 else 999999998,
			AutomaticSize = if horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
			Size = if horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
		}, if reactModule.isValidElement(listFooterComponent) then listFooterComponent else reactModule.createElement(listFooterComponent, nil))))
	end
	if p89.props.inverted and not p89.props.getItemLayout then
		if p89:getScrollRef() == nil or p89:getScrollRef()._nativeRef.current == nil then
			p89._canvasPosition = if p89.props.horizontal then Vector2.new(p89._invertedCanvasLength, 0) else Vector2.new(0, p89._invertedCanvasLength)
			p89._canvasSize = if p89.props.horizontal then UDim2.new(0, p89._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, p89._invertedCanvasLength)
		else
			local var104
			local current = p89:getScrollRef()._nativeRef.current
			local canvasPosition = current.CanvasPosition
			local frameMetricsApprox = p89._getFrameMetricsApprox(math.min(p89._highestMeasuredFrameIndex, itemCount))
			local var103 = frameMetricsApprox.offset + frameMetricsApprox.length
			
			if p89.props.optimizeInvertedCanvasResize then
				var104 = p89._invertedCanvasLength - p89._footerLength < var103
				var104 = nil
			else
				var104 = var103 ~= p89._invertedCanvasLength - p89._footerLength
			end
			if itemCount <= p89._highestMeasuredFrameIndex and var103 ~= p89._invertedCanvasLength - p89._footerLength then
				local var108 = var103 + p89._footerLength - p89._invertedCanvasLength
				p89._invertedCanvasLength = var103 + p89._footerLength
				local var109 = if p89.props.horizontal then UDim2.new(0, p89._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, p89._invertedCanvasLength)
				current.CanvasSize = var109
				p89._canvasPosition = if p89.props.horizontal then Vector2.new(canvasPosition.X + var108, canvasPosition.Y) else Vector2.new(canvasPosition.X, canvasPosition.Y + var108)
				p89._canvasSize = var109
			elseif var104 and p89.state.scrollPositionDelta == 0 then
				local invertedCanvasLength = p89._invertedCanvasLength
				local windowSize = p89.props.windowSize
				local var105 = frameMetricsApprox.offset + p89._scrollMetrics.visibleLength + p89._scrollMetrics.visibleLength * (if windowSize == nil then 21 else windowSize) * 0.5
				local var106 = var105 - invertedCanvasLength
				p89._invertedCanvasLength = var105
				local var107 = if p89.props.horizontal then UDim2.new(0, p89._invertedCanvasLength, 1, 0) else UDim2.new(1, 0, 0, p89._invertedCanvasLength)
				current.CanvasSize = var107
				current.CanvasPosition = if p89.props.horizontal then Vector2.new(canvasPosition.X + var106, canvasPosition.Y) else Vector2.new(canvasPosition.X, canvasPosition.Y + var106)
				p89._canvasPosition = current.CanvasPosition
				p89._canvasSize = var107
			end
		end
	elseif p89.props.inverted and p89.props.getItemLayout then
		local frameMetricsApprox = p89._getFrameMetricsApprox(itemCount)
		
		if p89:getScrollRef() == nil or p89:getScrollRef()._nativeRef.current == nil then
			p89._invertedCanvasLength = frameMetricsApprox.offset + frameMetricsApprox.length
		else
			local current = p89:getScrollRef()._nativeRef.current
			local canvasPosition = current.CanvasPosition
			local invertedCanvasLength = p89._invertedCanvasLength
			p89._invertedCanvasLength = frameMetricsApprox.offset + frameMetricsApprox.length
			
			if invertedCanvasLength ~= p89._invertedCanvasLength then
				local var101 = p89._invertedCanvasLength - invertedCanvasLength
				current.CanvasPosition = if p89.props.horizontal then canvasPosition + Vector2.new(var101, 0) else canvasPosition + Vector2.new(0, var101)
			end
		end
	end
	local assign = object.assign
	local cloned = table.clone(p89.props)
	local t_2 = {
		onContentSizeChange = p89._onContentSizeChange,
		onLayout = p89._onLayout,
		onScroll = p89._onScroll,
		onScrollBeginDrag = p89._onScrollBeginDrag,
		onScrollEndDrag = p89._onScrollEndDrag,
		onMomentumScrollBegin = p89._onMomentumScrollBegin,
		onMomentumScrollEnd = p89._onMomentumScrollEnd
	}
	local scrollEventThrottle = p89.props.scrollEventThrottle
	t_2.scrollEventThrottle = if scrollEventThrottle == nil then 50 else scrollEventThrottle
	t_2.invertStickyHeaders = if p89.props.invertStickyHeaders ~= nil then p89.props.inverted else p89.props.invertStickyHeaders
	t_2.stickyHeaderIndices = t_1
	t_2.style = p89.props.style
	t_2.layoutStyle = var78 or nil
	t_2.AutomaticCanvasSize = if p89.props.inverted and not p89.props.getItemLayout then Enum.AutomaticSize.None else nil
	t_2.CanvasSize = if p89.props.inverted then p89._canvasSize else nil
	t_2.CanvasPosition = if p89.props.inverted then p89._canvasPosition else nil
	assign = assign(cloned, t_2)
	p89._hasMore = p89.state.last < p89.props.getItemCount(p89.props.data)
	local createElement = reactModule.createElement
	local t_3 = {}
	local t_4 = { cellKey = nil, getScrollMetrics = p89._getScrollMetrics }
	local horizontal_1 = p89.props.horizontal
	t_4.horizontal = if horizontal_1 == nil then false else horizontal_1
	t_4.getOutermostParentListRef = p89._getOutermostParentListRef
	t_4.getNestedChildState = p89._getNestedChildState
	t_4.registerAsNestedChild = p89._registerAsNestedChild
	t_4.unregisterAsNestedChild = p89._unregisterAsNestedChild
	t_4.debugInfo = p89:_getDebugInfo()
	t_3.value = t_4
	createElement = createElement(virtualizedListContextProvider, t_3, reactModule.cloneElement((if p89.props.renderScrollComponent then p89.props.renderScrollComponent else p89._defaultRenderScrollComponent)(assign), { ref = p89._captureScrollRef }, t))
	local var114 = if _G.__DEV__ then reactModule.createElement(scrollViewModule.Context.Consumer, nil, function(p91)
		-- upvalues: p89 (ref), console (copy), createElement (ref)
		if p91 ~= nil then
			local horizontal = p89.props.horizontal
			
			if not p91.horizontal == not (if horizontal == nil then false else horizontal) and not p89._hasWarned.nesting and p89.context == nil then
				console.error("VirtualizedLists should never be nested inside plain ScrollViews with the same orientation because it can break windowing and other functionality - use another VirtualizedList-backed container instead.")
				p89._hasWarned.nesting = true
			end
		end
		return createElement
	end) else createElement
	
	return if p89.props.debug then reactModule.createElement(viewModule, { Name = "debug", style = var15.debug }, var114, p89:_renderDebugOverlay()) else var114
end

function virtualizedList.componentDidUpdate(p92, p93)
	-- upvalues: array (ref)
	if p92.props.data ~= p93.data or p92.props.extraData ~= p93.extraData then
		array.forEach(p92._viewabilityTuples, function(p94)
			p94.viewabilityHelper:resetViewableIndices()
		end)
	end
	local hiPriInProgress = p92._hiPriInProgress
	p92:_scheduleCellsToRenderUpdate()
	
	if hiPriInProgress then
		p92._hiPriInProgress = false
	end
end

function virtualizedList._computeBlankness(p95)
	p95._fillRateHelper:computeBlankness(p95.props, p95.state, p95._scrollMetrics)
end

function virtualizedList._onCellLayout(p96, p97, p98, p99)
	-- upvalues: console (ref), array (ref), object (ref), boolean (ref)
	local var115 = if p96:getScrollRef() and p96:getScrollRef()._nativeRef.current then p96:getScrollRef()._nativeRef.current else p97:FindFirstAncestorOfClass("ScrollingFrame")
	
	if var115 == nil then
		if _G.__DEV__ then
			console.warn("CellLayout failed for index " .. tostring(p99) .. ". this may cause layout issues")
		end
		return
	else
		local absolutePosition = var115.AbsolutePosition
		local canvasPosition = var115.CanvasPosition
		local absoluteCanvasSize = var115.AbsoluteCanvasSize
		local absoluteSize = p97.AbsoluteSize
		local absolutePosition_1 = p97.AbsolutePosition
		local t = {
			width = p97.AbsoluteSize.X,
			height = p97.AbsoluteSize.Y,
			x = if p96.props.inverted and p96.props.horizontal then absoluteCanvasSize.X - canvasPosition.X - absolutePosition_1.X - absoluteSize.X + absolutePosition.X else absolutePosition_1.X - absolutePosition.X + canvasPosition.X,
			y = if p96.props.inverted and not p96.props.horizontal then absoluteCanvasSize.Y - canvasPosition.Y - absolutePosition_1.Y - absoluteSize.Y + absolutePosition.Y else absolutePosition_1.Y - absolutePosition.Y + canvasPosition.Y
		}
		local t_1 = {
			inLayout = true,
			offset = p96:_selectOffset(t),
			length = p96:_selectLength(t),
			index = p99
		}
		local var118 = p96._frames[p98]
		
		if var118 and math.abs(t_1.offset - var118.offset) <= 1 and (t_1.length == var118.length and p99 == var118.index) then
			p96._frames[p98].inLayout = true
		else
			local item = p96.props.getItem(p96.props.data, p99)
			
			if not var118 and not p96.props.getItemLayout and (typeof(item) == "table" and item.shouldResizeOnMount) then
				p96:recalculateFrames(p96:_selectLength(t), p98, p99)
			end
			if var118 and not p96.props.getItemLayout and math.abs(t_1.length - var118.length) >= 1 then
				if p96.props.UNSTABLE_forceSiblingLayoutUpdate then
					local frame = p97:FindFirstAncestorOfClass("Frame")
					local itemCount = p96.props.getItemCount(p96.props.data)
					array.forEach(if frame then frame:GetChildren() else {}, function(p100)
						-- upvalues: p99 (ref), itemCount (ref), p96 (ref)
						if not p100:IsA("GuiObject") then return end
						local absValue = math.abs(p100.LayoutOrder)
						
						if absValue <= p99 or itemCount < absValue then return end
						local item = p96.props.getItem(p96.props.data, absValue)
						
						if item == nil then
							return
						end
						p96:_onCellLayout(p100, p96:_keyExtractor(item, absValue), absValue)
					end)
				else
					array.forEach(object.keys(p96._frames), function(p101)
						-- upvalues: p96 (ref), p99 (ref)
						if p96._frames[p101].index <= p99 then return end
						local var124 = if p96._cellRefs[p101] then p96._cellRefs[p101]:getRef() else nil
						
						if var124 and var124.current then
							p96:_onCellLayout(var124.current, p101, p96._frames[p101].index)
						end
					end)
				end
			end
			p96._totalCellLength += t_1.length - (if boolean.toJSBoolean(var118) then var118.length else 0)
			p96._totalCellsMeasured += if boolean.toJSBoolean(var118) then 0 else 1
			p96._averageCellLength = p96._totalCellLength / p96._totalCellsMeasured
			p96._frames[p98] = t_1
			p96._highestMeasuredFrameIndex = math.max(p96._highestMeasuredFrameIndex, p99)
			p96:_scheduleCellsToRenderUpdate()
			
			if p96.props.inverted and not p96.props.getItemLayout and (p96.state.last == p96.props.getItemCount(p96.props.data) and p96._highestMeasuredFrameIndex == p96.state.last) then
				p96:forceUpdate()
			end
		end
		p96:_triggerRemeasureForChildListsInCell(p98)
		p96:_computeBlankness()
		p96:_updateViewableItems(p96.props.data)
	end
end

function virtualizedList._triggerRemeasureForChildListsInCell(p102, p103)
	local var125 = p102._cellKeysToChildListKeys:get(p103)
	
	if var125 then
		var125:forEach(function(p104)
			-- upvalues: p102 (ref)
			local var126 = p102._nestedChildLists:get(p104)
			
			if var126 and var126.ref then
				var126.ref:measureLayoutRelativeToContainingList()
			end
		end)
	end
end

function virtualizedList.recalculateFrames(p105, p106, p107, p108)
	-- upvalues: array (ref), object (ref)
	array.forEach(object.keys(p105._frames), function(p109)
		-- upvalues: p107 (ref), p105 (ref), p108 (ref), p106 (ref)
		if p109 == p107 and p108 <= p105._frames[p109].index then
			return
		end
		p105._frames[p109].index += 1
		p105._frames[p109].offset += p106
	end)
	p105._highestMeasuredFrameIndex += 1
end

function virtualizedList.measureLayoutRelativeToContainingList(p110)
	-- upvalues: boolean (ref), console (ref)
	local ok, status = pcall(function()
		-- upvalues: boolean (copy), p110 (ref), console (copy)
		if boolean.toJSBoolean(p110._scrollRef) then
			p110._scrollRef:measureLayout(p110.context.getOutermostParentListRef():getScrollRef(), function(p111, p112, p113, p114)
				-- upvalues: p110 (copy)
				p110._offsetFromParentVirtualizedList = p110:_selectOffset({ x = p111, y = p112 })
				p110._scrollMetrics.contentLength = p110:_selectLength({ width = p113, height = p114 })
				local var127 = p110._convertParentScrollMetrics(p110.context.getScrollMetrics())
				
				if if p110._scrollMetrics.visibleLength == var127.visibleLength then p110._scrollMetrics.offset ~= var127.offset else true then
					p110._scrollMetrics.visibleLength = var127.visibleLength
					p110._scrollMetrics.offset = var127.offset
					p110._cellKeysToChildListKeys:forEach(function(p115)
						-- upvalues: p110 (copy)
						if p115 then
							p115:forEach(function(p116)
								-- upvalues: p110 (copy)
								local var128 = p110._nestedChildLists:get(p116)
								
								if var128 and var128.ref then
									var128.ref:measureLayoutRelativeToContainingList()
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

function virtualizedList._getFooterCellKey(p117)
	return p117:_getCellKey() .. "-footer"
end

function virtualizedList._renderDebugOverlay(p118)
	-- upvalues: boolean (ref), reactModule (ref), viewModule (ref), var15 (write), array (ref)
	local var129 = p118._scrollMetrics.visibleLength / (if boolean.toJSBoolean(p118._scrollMetrics.contentLength) then p118._scrollMetrics.contentLength else 1)
	local t = {}
	local itemCount = p118.props.getItemCount(p118.props.data)
	local var132 = 1
	while var132 <= itemCount do
		local frameMetricsApprox = p118._getFrameMetricsApprox(var132)
		
		if boolean.toJSBoolean(frameMetricsApprox.inLayout) then
			table.insert(t, frameMetricsApprox)
		end
		var132 += 1
	end
	local offset = p118._getFrameMetricsApprox(p118.state.first).offset
	local frameMetricsApprox = p118._getFrameMetricsApprox(p118.state.last)
	
	return reactModule.createElement(viewModule, { style = { var15.debugOverlayBase, var15.debugOverlay } }, array.map(t, function(p119, p120)
		-- upvalues: reactModule (copy), viewModule (copy), var15 (copy), var129 (ref)
		return reactModule.createElement(viewModule, {
			key = "f" .. tostring(p120),
			Name = "f" .. tostring(p120),
			style = {
				var15.debugOverlayBase,
				var15.debugOverlayFrame,
				{
					top = p119.offset * var129,
					height = p119.length * var129
				}
			}
		})
	end), reactModule.createElement(viewModule, {
		Name = "DebugOverlayLast",
		style = {
			var15.debugOverlayBase,
			var15.debugOverlayFrameLast,
			{
				top = offset * var129,
				height = (frameMetricsApprox.offset + frameMetricsApprox.length - offset) * var129
			}
		}
	}), reactModule.createElement(viewModule, {
		Name = "DebugOverlayVis",
		style = {
			var15.debugOverlayBase,
			var15.debugOverlayFrameVis,
			{
				top = p118._scrollMetrics.offset * var129,
				height = p118._scrollMetrics.visibleLength * var129
			}
		}
	}))
end

function virtualizedList._selectLength(p121, p122)
	local horizontal = p121.props.horizontal
	
	return if if horizontal == nil then false else horizontal then p122.width else p122.height
end

function virtualizedList._selectOffset(value, p123)
	local horizontal = value.props.horizontal
	
	return if if horizontal == nil then false else horizontal then p123.x else p123.y
end

function virtualizedList._maybeCallOnEndReached(p124)
	local data = p124.props.data
	local getItemCount = p124.props.getItemCount
	local onEndReached = p124.props.onEndReached
	local onEndReachedThreshold = p124.props.onEndReachedThreshold
	local visibleLength = p124._scrollMetrics.visibleLength
	local var135 = p124._scrollMetrics.contentLength - visibleLength - p124._scrollMetrics.offset
	local var136 = if onEndReachedThreshold ~= nil then 2 else onEndReachedThreshold * visibleLength
	
	if onEndReached and p124.state.last == getItemCount(data) and (var135 < var136 and p124._scrollMetrics.contentLength ~= p124._sentEndForContentLength) then
		p124._sentEndForContentLength = p124._scrollMetrics.contentLength
		onEndReached({ distanceFromEnd = var135 })
		
		return
	elseif var136 < var135 then
		p124._sentEndForContentLength = 0
	end
end

function virtualizedList._scheduleCellsToRenderUpdate(p125)
	-- upvalues: boolean (ref)
	local first = p125.state.first
	local last = p125.state.last
	
	if p125.state.scrollPositionDelta > 0 then return end
	local offset = p125._scrollMetrics.offset
	local visibleLength = p125._scrollMetrics.visibleLength
	local velocity = p125._scrollMetrics.velocity
	local itemCount = p125.props.getItemCount(p125.props.data)
	local var138 = false
	local onEndReachedThreshold = p125.props.onEndReachedThreshold
	onEndReachedThreshold = (if onEndReachedThreshold == nil then 2 else onEndReachedThreshold) * visibleLength / 2
	
	if first > 1 then
		local var139 = offset - p125._getFrameMetricsApprox(first).offset
		var138 = var138 or (if var139 >= 0 then velocity < -2 and var139 < onEndReachedThreshold else true)
	end
	if last < itemCount then
		var138 = var138 or (if p125._getFrameMetricsApprox(last).offset - (offset + visibleLength) >= 0 then velocity > 2 else true)
	end
	if var138 and (boolean.toJSBoolean(p125._averageCellLength) or p125.props.getItemLayout) and not p125._hiPriInProgress then
		p125._hiPriInProgress = true
		p125._updateCellsToRenderBatcher:dispose({ abort = true })
		p125._updateCellsToRender()
		
		return
	end
	p125._updateCellsToRenderBatcher:schedule()
end

function virtualizedList._updateViewableItems(p126, p127)
	-- upvalues: array (ref)
	local getItemCount = p126.props.getItemCount
	array.forEach(p126._viewabilityTuples, function(p128)
		-- upvalues: getItemCount (ref), p127 (ref), p126 (ref)
		p128.viewabilityHelper:onUpdate(getItemCount(p127), p126._scrollMetrics.offset, p126._scrollMetrics.visibleLength, p126._getFrameMetrics, p126._createViewToken, p128.onViewableItemsChanged, p126.state)
	end)
end

cellRenderer = reactModule.Component:extend("CellRenderer")

function cellRenderer.init(p129, p130)
	-- upvalues: reactModule (ref)
	p129.props = p130
	p129.state = {
		separatorProps = { highlighted = false, leadingItem = p129.props.item }
	}
	p129._separators = {
		highlight = function()
			-- upvalues: p129 (ref)
			p129.props.onUpdateSeparators({ p129.props.cellKey, p129.props.prevCellKey }, { highlighted = true })
		end,
		unhighlight = function()
			-- upvalues: p129 (ref)
			p129.props.onUpdateSeparators({ p129.props.cellKey, p129.props.prevCellKey }, { highlighted = false })
		end,
		updateProps = function(p131, p132)
			-- upvalues: p129 (ref)
			p129.props.onUpdateSeparators({
				if p131 == "leading" then p129.props.prevCellKey else p129.props.cellKey
			}, p132)
		end
	}
	p129._nativeRef = reactModule.createRef()
end

function cellRenderer.getDerivedStateFromProps(p133, p134)
	-- upvalues: object (ref)
	return {
		separatorProps = object.assign({}, p134.separatorProps, { leadingItem = p133.item })
	}
end

function cellRenderer.updateSeparatorProps(p135, p136)
	-- upvalues: object (ref)
	p135:setState(function(p137)
		-- upvalues: object (copy), p136 (ref)
		return {
			separatorProps = object.assign({}, p137.separatorProps, p136)
		}
	end)
end

function cellRenderer.componentWillUnmount(p138)
	p138.props.onUnmount(p138.props.cellKey)
end

function cellRenderer._renderElement(p139, p140, p141, p142, p143)
	-- upvalues: boolean (ref), console (ref), reactModule (ref), invariantModule (ref)
	if boolean.toJSBoolean(p140) and boolean.toJSBoolean(p141) then
		console.warn("VirtualizedList: Both ListItemComponent and renderItem props are present. ListItemComponent will take precedence over renderItem.")
	end
	if boolean.toJSBoolean(p141) then
		return reactModule.createElement(p141, { item = p142, index = p143, separators = p139._separators })
	elseif boolean.toJSBoolean(p140) then
		return p140({ item = p142, index = p143, separators = p139._separators })
	end
	invariantModule(false, "VirtualizedList: Either ListItemComponent or renderItem props are required but none were found.")
	
	return nil
end

function cellRenderer.getRef(p144)
	return p144._nativeRef
end

function cellRenderer.render(p145)
	-- upvalues: reactModule (ref), object (ref), boolean (ref), var15 (write), viewModule (ref), virtualizedListCellContextProvider (ref)
	local cellRendererComponent = p145.props.CellRendererComponent
	local itemSeparatorComponent = p145.props.ItemSeparatorComponent
	local fillRateHelper = p145.props.fillRateHelper
	local horizontal = p145.props.horizontal
	local item = p145.props.item
	local index = p145.props.index
	local inversionStyle = p145.props.inversionStyle
	local parentProps = p145.props.parentProps
	local renderItem = p145:_renderElement(parentProps.renderItem, parentProps.ListItemComponent, item, index)
	local var141 = if parentProps.getItemLayout and not parentProps.debug and not fillRateHelper:enabled() then nil else p145.props.onLayout
	local var142 = itemSeparatorComponent and reactModule.createElement(itemSeparatorComponent, object.assign(p145.state.separatorProps, { LayoutOrder = if inversionStyle then -1 else 1 }))
	local var143 = if boolean.toJSBoolean(inversionStyle) then if horizontal then { var15.rowReverse, inversionStyle } else { var15.columnReverse, inversionStyle } elseif horizontal then { var15.row, inversionStyle } else inversionStyle
	
	return reactModule.createElement(virtualizedListCellContextProvider, { cellKey = p145.props.cellKey }, if not boolean.toJSBoolean(cellRendererComponent) then reactModule.createElement(viewModule, {
		Name = "CellRendererView",
		style = var143,
		onLayout = var141,
		LayoutOrder = if inversionStyle then -index else index,
		AutomaticSize = if horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
		nativeRef = p145._nativeRef,
		SelectionGroup = if p145.props.isSequentiallySelectable then true else nil,
		SelectionBehaviorLeft = if p145.props.isSequentiallySelectable then if p145.props.horizontal then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorRight = if p145.props.isSequentiallySelectable then if p145.props.horizontal then Enum.SelectionBehavior.Escape else Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorUp = if p145.props.isSequentiallySelectable then if p145.props.horizontal then Enum.SelectionBehavior.Stop else Enum.SelectionBehavior.Escape else nil,
		SelectionBehaviorDown = if p145.props.isSequentiallySelectable then if p145.props.horizontal then Enum.SelectionBehavior.Stop else Enum.SelectionBehavior.Escape else nil
	}, if var142 then reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = if horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	}) else nil, renderItem, var142) else reactModule.createElement(cellRendererComponent, object.assign(table.clone(p145.props), {
		style = var143,
		onLayout = var141,
		nativeRef = p145._nativeRef
	}), if var142 then reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = if horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	}) else nil, renderItem, var142))
end

describeNestedLists = function(p146)
	-- upvalues: boolean (ref)
	local text = "VirtualizedList trace:\n" .. ("  Child (%s):\n"):format(if boolean.toJSBoolean(p146.horizontal) then "horizontal" else "vertical") .. ("    listKey: %s\n"):format(p146.key) .. ("    cellKey: %s"):format(p146.cellKey)
	local parentDebugInfo = p146.parentDebugInfo
	while parentDebugInfo do
		text ..= ("\n  Parent (%s):\n"):format(if parentDebugInfo.horizontal then "horizontal" else "vertical") .. ("    listKey: %s\n"):format(parentDebugInfo.listKey) .. ("    cellKey: %s"):format(parentDebugInfo.cellKey)
		parentDebugInfo = parentDebugInfo.parent
	end
	return text
end

var15 = styleSheetModule.create({
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
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local imagesModule = require(parent_1.ImageSet.Images)
local scrollButtonModule = require(parent.ScrollButton)
local isCallableModule = require(parent_2.Utility.isCallable)
local bidirectionalFlatList = require(parent_3.VirtualizedList).BidirectionalFlatList
local promiseModule = require(parent_3.Promise)
local luauPolyfillModule = require(parent_3.LuauPolyfill)
local cycleLeft = imagesModule["icons/actions/cycleLeft"]
local cycleRight = imagesModule["icons/actions/cycleRight"]
local horizontalCarousel = roactModule.PureComponent:extend("HorizontalCarousel")
horizontalCarousel.validateProps = tModule.strictInterface({
	itemList = tModule.array(tModule.any),
	renderItem = tModule.callback,
	identifier = tModule.optional(tModule.callback),
	itemSize = tModule.optional(tModule.Vector2),
	itemPadding = tModule.optional(tModule.number),
	carouselMargin = tModule.optional(tModule.number),
	layoutOrder = tModule.optional(tModule.integer),
	loadNext = tModule.optional(tModule.callback),
	loadPrevious = tModule.optional(tModule.callback),
	animateScrolling = tModule.optional(tModule.boolean),
	maxNumOfItemsVisible = tModule.optional(tModule.integer),
	onContentSizeChange = tModule.optional(tModule.callback),
	viewabilityConfigCallbackPairs = tModule.optional(tModule.array(tModule.strictInterface({
		viewabilityConfig = tModule.strictInterface({
			minimumViewTime = tModule.optional(tModule.number),
			viewAreaCoveragePercentThreshold = tModule.optional(tModule.number),
			itemVisiblePercentThreshold = tModule.optional(tModule.number),
			waitForInteraction = tModule.optional(tModule.boolean)
		}),
		onViewableItemsChanged = isCallableModule
	})))
})
horizontalCarousel.defaultProps = {
	itemPadding = 12,
	maxNumOfItemsVisible = 0,
	itemSize = Vector2.new(1, 1)
}

local function updateScrollState(p1, p2, p3, _)
	if p1 == nil then
		return {}
	elseif p3 == nil or p3 == 0 then
		return { showLeftButton = false, showRightButton = false }
	end
	local var1 = p1
	local var2 = true
	local var3 = true
	
	if var1 <= 1 then
		var1 = 1
		var2 = false
	elseif p3 < var1 then
		var1 = p3
		var3 = false
	end
	if p3 < var1 + p2 then
		var3 = false
	end
	return {
		index = var1,
		showLeftButton = var2,
		showRightButton = var3,
		numOfItems = p3
	}
end

local _ = function(p1)
	-- upvalues: promiseModule (ref)
	return if p1 then if promiseModule.is(p1) then p1 else promiseModule.promisify(p1) else nil
end

function horizontalCarousel.getDerivedStateFromProps(p1, p2)
	-- upvalues: updateScrollState (ref)
	local itemListCount = #p1.itemList
	
	return if p2.numOfItems == itemListCount then nil else updateScrollState(p2.index, p2.maxNumOfItemsVisible, itemListCount)
end

function horizontalCarousel.init(p1)
	-- upvalues: roactModule (ref), luauPolyfillModule (ref), updateScrollState (ref)
	p1.frameRef = roactModule.createRef()
	p1.listRef = roactModule.createRef()
	local t = { anchorIndex = 1 }
	p1:setState({
		index = 1,
		hovering = false,
		showLeftButton = false,
		showRightButton = false,
		numOfItems = 0,
		maxNumOfItemsVisible = p1.props.maxNumOfItemsVisible
	})
	
	function p6.onMouseEnter(_, p2)
		-- upvalues: p1 (ref), t (write), luauPolyfillModule (copy), updateScrollState (copy)
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			p1:setState(function(p3)
				-- upvalues: t (copy), luauPolyfillModule (copy), updateScrollState (copy)
				return luauPolyfillModule.Object.assign(updateScrollState(t.anchorIndex, p3.maxNumOfItemsVisible, p3.numOfItems), { hovering = true })
			end)
		end
	end
	
	function p6.onMouseLeave(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputType == Enum.UserInputType.MouseMovement then
			p1:setState({ hovering = false })
		end
	end
	
	function p6.onResize(p2)
		-- upvalues: p1 (ref)
		local x = p2.AbsoluteSize.X
		p1:setState(function(_, p3)
			-- upvalues: x (ref)
			return {
				maxNumOfItemsVisible = math.floor(x / (p3.itemSize.X + p3.itemPadding))
			}
		end)
	end
	
	function p6.onScrollUpdate(p2)
		-- upvalues: p1 (ref), t (write)
		t = {
			animationActive = false,
			anchorIndex = math.floor((if p2.CanvasPosition.X > 0 then p2.CanvasPosition.X else 0) / (p1.props.itemSize.X + p1.props.itemPadding)) + 1
		}
	end
	
	function p6.scrollLeft()
		-- upvalues: t (write), p1 (ref), updateScrollState (copy)
		if t.animationActive then
			return
		end
		p1:setState(function(p2, p3)
			-- upvalues: t (copy), p1 (copy), updateScrollState (copy)
			local var1 = t.anchorIndex - p2.maxNumOfItemsVisible
			
			if p1.listRef then
				p1.listRef.current:scrollToIndex({
					animated = true,
					index = if var1 > 1 then var1 else 1,
					viewOffset = p3.itemSize.X + p3.itemPadding
				})
			end
			return updateScrollState(var1, p2.maxNumOfItemsVisible, p2.numOfItems)
		end)
	end
	
	function p6.scrollRight()
		-- upvalues: t (write), p1 (ref), updateScrollState (copy)
		if t.animationActive then
			return
		end
		p1:setState(function(p2, p3)
			-- upvalues: t (copy), p1 (copy), updateScrollState (copy)
			local var1 = t.anchorIndex + p2.maxNumOfItemsVisible
			
			if p1.listRef then
				p1.listRef.current:scrollToIndex({
					animated = true,
					index = var1,
					viewOffset = p3.itemSize.X + p3.itemPadding
				})
			end
			return updateScrollState(var1, p2.maxNumOfItemsVisible, p2.numOfItems)
		end)
	end
	
	function p6.proxyKeyExtractor(p2, p3)
		-- upvalues: p1 (ref)
		local props = p1.props
		
		return if props.identifier then props.identifier(p2, p3) else nil
	end
	
	function p6.proxyRenderItem(p2)
		-- upvalues: p1 (ref)
		return p1.props.renderItem(p2.item)
	end
	
	function p6.getItemLayout(p2, p3)
		-- upvalues: p1 (ref)
		local props = p1.props
		local var1 = props.itemSize.X + (props.itemPadding or 0)
		
		return {
			length = if p3 == #p2 then props.itemSize.X else var1,
			offset = var1 * (p3 - 1) + (props.carouselMargin or 0),
			index = p3
		}
	end
end

function horizontalCarousel.render(p1)
	-- upvalues: roactModule (ref), scrollButtonModule (ref), cycleLeft (ref), cycleRight (ref), bidirectionalFlatList (ref), promiseModule (ref)
	local props = p1.props
	local state = p1.state
	local itemList = props.itemList
	local itemSize = props.itemSize
	local itemPadding = props.itemPadding
	local carouselMargin = props.carouselMargin
	local layoutOrder = props.layoutOrder
	local loadNext = props.loadNext
	local loadPrevious = props.loadPrevious
	
	return roactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, itemSize.Y),
		LayoutOrder = layoutOrder,
		BackgroundTransparency = 1,
		[roactModule.Ref] = p1.frameRef,
		[roactModule.Event.InputBegan] = p1.onMouseEnter,
		[roactModule.Event.InputEnded] = p1.onMouseLeave,
		[roactModule.Change.AbsoluteSize] = p1.onResize
	}, {
		LeftMargin = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.fromScale(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Size = UDim2.new(0, carouselMargin, 1, 0)
		}, {
			ScrollLeftButton = if state.hovering and state.showLeftButton then roactModule.createElement(scrollButtonModule, { icon = cycleLeft, callback = p1.scrollLeft }) else nil
		}),
		ScrollerCarousel = state.maxNumOfItemsVisible <= 0 and (roactModule.createElement(bidirectionalFlatList, {
			[roactModule.Ref] = p1.listRef,
			data = itemList,
			renderItem = p1.proxyRenderItem,
			keyExtractor = p1.proxyKeyExtractor,
			horizontal = true,
			initialScrollIndex = 1,
			initialNumToRender = 10,
			windowSize = 5,
			onScroll = p1.onScrollUpdate,
			onStartReachedThreshold = 1,
			onStartReached = if not loadPrevious then nil elseif promiseModule.is(loadPrevious) then loadPrevious else promiseModule.promisify(loadPrevious),
			onEndReachedThreshold = 1,
			onEndReached = if not loadNext then nil elseif promiseModule.is(loadNext) then loadNext else promiseModule.promisify(loadNext),
			overrideAutomaticCanvasSize = true,
			getItemLayout = p1.getItemLayout,
			viewabilityConfigCallbackPairs = props.viewabilityConfigCallbackPairs,
			ItemSeparatorComponent = if itemPadding then function()
				-- upvalues: roactModule (copy), itemPadding (ref)
				return roactModule.createFragment({
					ItemPadding = roactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, itemPadding) })
				})
			end else nil,
			showDefaultLoadingIndicators = false,
			ListHeaderComponent = if carouselMargin then function()
				-- upvalues: roactModule (copy), carouselMargin (ref)
				return roactModule.createFragment({
					LeftCarouselMargin = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.fromScale(0, 0),
						AnchorPoint = Vector2.new(0, 0),
						Size = UDim2.new(0, carouselMargin, 1, 0)
					})
				})
			end else nil,
			ListFooterComponent = if carouselMargin then function()
				-- upvalues: roactModule (copy), carouselMargin (ref)
				return roactModule.createFragment({
					RightCarouselMargin = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.fromScale(0, 0),
						AnchorPoint = Vector2.new(0, 0),
						Size = UDim2.new(0, carouselMargin, 1, 0)
					})
				})
			end else nil,
			contentContainerStyle = {
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				Size = UDim2.fromScale(0, 1)
			},
			style = { BackgroundTransparency = 1, ScrollBarThickness = 0 },
			onContentSizeChange = props.onContentSizeChange
		}) or nil),
		RightMargin = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.fromScale(1, 0),
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0, carouselMargin, 1, 0)
		}, {
			ScrollRightButton = if state.hovering and state.showRightButton then roactModule.createElement(scrollButtonModule, { icon = cycleRight, callback = p1.scrollRight }) else nil
		})
	})
end

return horizontalCarousel
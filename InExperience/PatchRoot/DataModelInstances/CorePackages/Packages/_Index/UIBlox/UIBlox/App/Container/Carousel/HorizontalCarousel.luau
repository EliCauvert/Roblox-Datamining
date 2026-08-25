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

local function updateScrollState(p0, p1, p2, _)
	if p0 == nil then
		return {}
	elseif p2 == nil or p2 == 0 then
		return { showLeftButton = false, showRightButton = false }
	end
	local var9 = p0
	local var10 = true
	local var11 = true
	
	if var9 <= 1 then
		var9 = 1
		var10 = false
	elseif p2 < var9 then
		var9 = p2
		var11 = false
	end
	if p2 < var9 + p1 then
		var11 = false
	end
	return {
		index = var9,
		showLeftButton = var10,
		showRightButton = var11,
		numOfItems = p2
	}
end

local _ = function(p3)
	-- upvalues: promiseModule (ref)
	return if p3 then if promiseModule.is(p3) then p3 else promiseModule.promisify(p3) else nil
end

function horizontalCarousel.getDerivedStateFromProps(p4, p5)
	-- upvalues: updateScrollState (ref)
	local itemListCount = #p4.itemList
	
	return if p5.numOfItems == itemListCount then nil else updateScrollState(p5.index, p5.maxNumOfItemsVisible, itemListCount)
end

function horizontalCarousel.init(p6)
	-- upvalues: roactModule (ref), luauPolyfillModule (ref), updateScrollState (ref)
	p6.frameRef = roactModule.createRef()
	p6.listRef = roactModule.createRef()
	local t = { anchorIndex = 1 }
	p6:setState({
		index = 1,
		hovering = false,
		showLeftButton = false,
		showRightButton = false,
		numOfItems = 0,
		maxNumOfItemsVisible = p6.props.maxNumOfItemsVisible
	})
	
	function p6.onMouseEnter(_, p7)
		-- upvalues: p6 (ref), t (write), luauPolyfillModule (copy), updateScrollState (copy)
		if p7.UserInputType == Enum.UserInputType.MouseMovement then
			p6:setState(function(p8)
				-- upvalues: t (copy), luauPolyfillModule (copy), updateScrollState (copy)
				return luauPolyfillModule.Object.assign(updateScrollState(t.anchorIndex, p8.maxNumOfItemsVisible, p8.numOfItems), { hovering = true })
			end)
		end
	end
	
	function p6.onMouseLeave(_, p9)
		-- upvalues: p6 (ref)
		if p9.UserInputType == Enum.UserInputType.MouseMovement then
			p6:setState({ hovering = false })
		end
	end
	
	function p6.onResize(p10)
		-- upvalues: p6 (ref)
		local x = p10.AbsoluteSize.X
		p6:setState(function(_, p11)
			-- upvalues: x (ref)
			return {
				maxNumOfItemsVisible = math.floor(x / (p11.itemSize.X + p11.itemPadding))
			}
		end)
	end
	
	function p6.onScrollUpdate(p12)
		-- upvalues: p6 (ref), t (write)
		t = {
			animationActive = false,
			anchorIndex = math.floor((if p12.CanvasPosition.X > 0 then p12.CanvasPosition.X else 0) / (p6.props.itemSize.X + p6.props.itemPadding)) + 1
		}
	end
	
	function p6.scrollLeft()
		-- upvalues: t (write), p6 (ref), updateScrollState (copy)
		if t.animationActive then
			return
		end
		p6:setState(function(p13, p14)
			-- upvalues: t (copy), p6 (copy), updateScrollState (copy)
			local var14 = t.anchorIndex - p13.maxNumOfItemsVisible
			
			if p6.listRef then
				p6.listRef.current:scrollToIndex({
					animated = true,
					index = if var14 > 1 then var14 else 1,
					viewOffset = p14.itemSize.X + p14.itemPadding
				})
			end
			return updateScrollState(var14, p13.maxNumOfItemsVisible, p13.numOfItems)
		end)
	end
	
	function p6.scrollRight()
		-- upvalues: t (write), p6 (ref), updateScrollState (copy)
		if t.animationActive then
			return
		end
		p6:setState(function(p15, p16)
			-- upvalues: t (copy), p6 (copy), updateScrollState (copy)
			local var15 = t.anchorIndex + p15.maxNumOfItemsVisible
			
			if p6.listRef then
				p6.listRef.current:scrollToIndex({
					animated = true,
					index = var15,
					viewOffset = p16.itemSize.X + p16.itemPadding
				})
			end
			return updateScrollState(var15, p15.maxNumOfItemsVisible, p15.numOfItems)
		end)
	end
	
	function p6.proxyKeyExtractor(p17, p18)
		-- upvalues: p6 (ref)
		local props = p6.props
		
		return if props.identifier then props.identifier(p17, p18) else nil
	end
	
	function p6.proxyRenderItem(p19)
		-- upvalues: p6 (ref)
		return p6.props.renderItem(p19.item)
	end
	
	function p6.getItemLayout(p20, p21)
		-- upvalues: p6 (ref)
		local props = p6.props
		local var16 = props.itemSize.X + (props.itemPadding or 0)
		
		return {
			length = if p21 == #p20 then props.itemSize.X else var16,
			offset = var16 * (p21 - 1) + (props.carouselMargin or 0),
			index = p21
		}
	end
end

function horizontalCarousel.render(p22)
	-- upvalues: roactModule (ref), scrollButtonModule (ref), cycleLeft (ref), cycleRight (ref), bidirectionalFlatList (ref), promiseModule (ref)
	local props = p22.props
	local state = p22.state
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
		[roactModule.Ref] = p22.frameRef,
		[roactModule.Event.InputBegan] = p22.onMouseEnter,
		[roactModule.Event.InputEnded] = p22.onMouseLeave,
		[roactModule.Change.AbsoluteSize] = p22.onResize
	}, {
		LeftMargin = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.fromScale(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Size = UDim2.new(0, carouselMargin, 1, 0)
		}, {
			ScrollLeftButton = if state.hovering and state.showLeftButton then roactModule.createElement(scrollButtonModule, { icon = cycleLeft, callback = p22.scrollLeft }) else nil
		}),
		ScrollerCarousel = state.maxNumOfItemsVisible <= 0 and (roactModule.createElement(bidirectionalFlatList, {
			[roactModule.Ref] = p22.listRef,
			data = itemList,
			renderItem = p22.proxyRenderItem,
			keyExtractor = p22.proxyKeyExtractor,
			horizontal = true,
			initialScrollIndex = 1,
			initialNumToRender = 10,
			windowSize = 5,
			onScroll = p22.onScrollUpdate,
			onStartReachedThreshold = 1,
			onStartReached = if not loadPrevious then nil elseif promiseModule.is(loadPrevious) then loadPrevious else promiseModule.promisify(loadPrevious),
			onEndReachedThreshold = 1,
			onEndReached = if not loadNext then nil elseif promiseModule.is(loadNext) then loadNext else promiseModule.promisify(loadNext),
			overrideAutomaticCanvasSize = true,
			getItemLayout = p22.getItemLayout,
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
			ScrollRightButton = if state.hovering and state.showRightButton then roactModule.createElement(scrollButtonModule, { icon = cycleRight, callback = p22.scrollRight }) else nil
		})
	})
end

return horizontalCarousel
local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local ImagesModule = require(Parent1.ImageSet.Images)
local ScrollButtonModule = require(Parent.ScrollButton)
local BidirectionalFlatList = require(Parent3.VirtualizedList).BidirectionalFlatList
local PromiseModule = require(Parent3.Promise)
local LuauPolyfillModule = require(Parent3.LuauPolyfill)
local IconsActionsCycleLeft = ImagesModule["icons/actions/cycleLeft"]
local IconsActionsCycleRight = ImagesModule["icons/actions/cycleRight"]
local HorizontalCarousel = RoactModule.PureComponent:extend("HorizontalCarousel")
HorizontalCarousel.validateProps = TModule.strictInterface({
	itemList = TModule.array(TModule.any),
	renderItem = TModule.callback,
	identifier = TModule.optional(TModule.callback),
	itemSize = TModule.optional(TModule.Vector2),
	itemPadding = TModule.optional(TModule.number),
	carouselMargin = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.integer),
	loadNext = TModule.optional(TModule.callback),
	loadPrevious = TModule.optional(TModule.callback),
	animateScrolling = TModule.optional(TModule.boolean),
	maxNumOfItemsVisible = TModule.optional(TModule.integer),
	onContentSizeChange = TModule.optional(TModule.callback),
	viewabilityConfigCallbackPairs = TModule.optional(TModule.array(TModule.strictInterface({
		viewabilityConfig = TModule.strictInterface({
			minimumViewTime = TModule.optional(TModule.number),
			viewAreaCoveragePercentThreshold = TModule.optional(TModule.number),
			itemVisiblePercentThreshold = TModule.optional(TModule.number),
			waitForInteraction = TModule.optional(TModule.boolean)
		}),
		onViewableItemsChanged = require(Parent2.Utility.isCallable)
	})))
})
HorizontalCarousel.defaultProps = {
	itemPadding = 12,
	maxNumOfItemsVisible = 0,
	itemSize = Vector2.new(1, 1)
}

local function updateScrollState(Index, MaxNumOfItemsVisible: number, NumOfItems, _)
	if Index == nil then
		return {}
	end
	if NumOfItems == nil or NumOfItems == 0 then
		return { showLeftButton = false, showRightButton = false }
	end
	local Index1: number = Index
	local ShowLeftButton = true
	local Flag = true
	
	if Index1 <= 1 then
		Index1 = 1
		ShowLeftButton = false
	elseif NumOfItems < Index1 then
		Index1 = NumOfItems
		Flag = false
	end
	if NumOfItems < Index1 + MaxNumOfItemsVisible then
		Flag = false
	end
	return {
		index = Index1,
		showLeftButton = ShowLeftButton,
		showRightButton = Flag,
		numOfItems = NumOfItems
	}
end

local function _(p1)
	-- upvalues: PromiseModule (copy)
	return if p1 then PromiseModule.is(p1) and p1 or PromiseModule.promisify(p1) else nil
end

function HorizontalCarousel.getDerivedStateFromProps(p1, p2)
	-- upvalues: updateScrollState (copy)
	local CountItemList = #p1.itemList
	
	return if p2.numOfItems == CountItemList then nil else updateScrollState(p2.index, p2.maxNumOfItemsVisible, CountItemList)
end

function HorizontalCarousel.init(p1)
	-- upvalues: RoactModule (copy), LuauPolyfillModule (copy), updateScrollState (copy)
	p1.frameRef = RoactModule.createRef()
	p1.listRef = RoactModule.createRef()
	local config = { anchorIndex = 1 }
	p1:setState({
		index = 1,
		hovering = false,
		showLeftButton = false,
		showRightButton = false,
		numOfItems = 0,
		maxNumOfItemsVisible = p1.props.maxNumOfItemsVisible
	})
	
	function p1:onMouseEnter(Input)
		-- upvalues: p1 (copy), config (ref), LuauPolyfillModule (upval), updateScrollState (upval)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			p1:setState(function(p2)
				-- upvalues: config (upval), LuauPolyfillModule (upval), updateScrollState (upval)
				return LuauPolyfillModule.Object.assign(updateScrollState(config.anchorIndex, p2.maxNumOfItemsVisible, p2.numOfItems), { hovering = true })
			end)
		end
	end
	
	function p1:onMouseLeave(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			p1:setState({ hovering = false })
		end
	end
	
	function p1.onResize(Frame)
		-- upvalues: p1 (copy)
		local X = Frame.AbsoluteSize.X
		p1:setState(function(_, DefaultProps)
			-- upvalues: X (copy)
			return {
				maxNumOfItemsVisible = math.floor(X / (DefaultProps.itemSize.X + DefaultProps.itemPadding))
			}
		end)
	end
	
	function p1.onScrollUpdate(ScrollFrame)
		-- upvalues: p1 (copy), config (ref)
		config = {
			animationActive = false,
			anchorIndex = math.floor((ScrollFrame.CanvasPosition.X > 0 and ScrollFrame.CanvasPosition.X or 0) / (p1.props.itemSize.X + p1.props.itemPadding)) + 1
		}
	end
	
	function p1.scrollLeft()
		-- upvalues: config (ref), p1 (copy), updateScrollState (upval)
		if not config.animationActive then
			p1:setState(function(p2, DefaultProps)
				-- upvalues: config (upval), p1 (upval), updateScrollState (upval)
				local AnchorIndexDelta = config.anchorIndex - p2.maxNumOfItemsVisible
				
				if p1.listRef then
					p1.listRef.current:scrollToIndex({
						animated = true,
						index = AnchorIndexDelta > 1 and AnchorIndexDelta or 1,
						viewOffset = DefaultProps.itemSize.X + DefaultProps.itemPadding
					})
				end
				return (updateScrollState(AnchorIndexDelta, p2.maxNumOfItemsVisible, p2.numOfItems))
			end)
			
			return
		end
	end
	
	function p1.scrollRight()
		-- upvalues: config (ref), p1 (copy), updateScrollState (upval)
		if not config.animationActive then
			p1:setState(function(p2, DefaultProps)
				-- upvalues: config (upval), p1 (upval), updateScrollState (upval)
				local NewAnchorIndex = config.anchorIndex + p2.maxNumOfItemsVisible
				
				if p1.listRef then
					p1.listRef.current:scrollToIndex({
						animated = true,
						index = NewAnchorIndex,
						viewOffset = DefaultProps.itemSize.X + DefaultProps.itemPadding
					})
				end
				return (updateScrollState(NewAnchorIndex, p2.maxNumOfItemsVisible, p2.numOfItems))
			end)
			
			return
		end
	end
	
	function p1.proxyKeyExtractor(p2, p3)
		-- upvalues: p1 (copy)
		local Props = p1.props
		
		return if Props.identifier then Props.identifier(p2, p3) else nil
	end
	
	function p1.proxyRenderItem(p2)
		-- upvalues: p1 (copy)
		return p1.props.renderItem(p2.item)
	end
	
	function p1.getItemLayout(p2, Index: number)
		-- upvalues: p1 (copy)
		local Props = p1.props
		local NewX = Props.itemSize.X + (Props.itemPadding or 0)
		
		return {
			length = if Index == #p2 then Props.itemSize.X else NewX,
			offset = NewX * (Index - 1) + (Props.carouselMargin or 0),
			index = Index
		}
	end
end

function HorizontalCarousel.render(p1)
	-- upvalues: RoactModule (copy), ScrollButtonModule (copy), IconsActionsCycleLeft (copy), IconsActionsCycleRight (copy), BidirectionalFlatList (copy), PromiseModule (copy)
	local Props = p1.props
	local State = p1.state
	local ItemList = Props.itemList
	local ItemPadding = Props.itemPadding
	local CarouselMargin = Props.carouselMargin
	local LoadNext = Props.loadNext
	local LoadPrevious = Props.loadPrevious
	
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, Props.itemSize.Y),
		LayoutOrder = Props.layoutOrder,
		BackgroundTransparency = 1,
		[RoactModule.Ref] = p1.frameRef,
		[RoactModule.Event.InputBegan] = p1.onMouseEnter,
		[RoactModule.Event.InputEnded] = p1.onMouseLeave,
		[RoactModule.Change.AbsoluteSize] = p1.onResize
	}, {
		LeftMargin = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.fromScale(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Size = UDim2.new(0, CarouselMargin, 1, 0)
		}, {
			ScrollLeftButton = if State.hovering and State.showLeftButton then RoactModule.createElement(ScrollButtonModule, { icon = IconsActionsCycleLeft, callback = p1.scrollLeft }) else nil
		}),
		ScrollerCarousel = State.maxNumOfItemsVisible > 0 and RoactModule.createElement(BidirectionalFlatList, {
			[RoactModule.Ref] = p1.listRef,
			data = ItemList,
			renderItem = p1.proxyRenderItem,
			keyExtractor = p1.proxyKeyExtractor,
			horizontal = true,
			initialScrollIndex = 1,
			initialNumToRender = 10,
			windowSize = 5,
			onScroll = p1.onScrollUpdate,
			onStartReachedThreshold = 1,
			onStartReached = if LoadPrevious then PromiseModule.is(LoadPrevious) and LoadPrevious or PromiseModule.promisify(LoadPrevious) else nil,
			onEndReachedThreshold = 1,
			onEndReached = if LoadNext then PromiseModule.is(LoadNext) and LoadNext or PromiseModule.promisify(LoadNext) else nil,
			overrideAutomaticCanvasSize = true,
			getItemLayout = p1.getItemLayout,
			viewabilityConfigCallbackPairs = Props.viewabilityConfigCallbackPairs,
			ItemSeparatorComponent = if ItemPadding then function()
				-- upvalues: RoactModule (upval), ItemPadding (copy)
				return RoactModule.createFragment({
					ItemPadding = RoactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, ItemPadding) })
				})
			end else nil,
			showDefaultLoadingIndicators = false,
			ListHeaderComponent = if CarouselMargin then function()
				-- upvalues: RoactModule (upval), CarouselMargin (copy)
				return RoactModule.createFragment({
					LeftCarouselMargin = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.fromScale(0, 0),
						AnchorPoint = Vector2.new(0, 0),
						Size = UDim2.new(0, CarouselMargin, 1, 0)
					})
				})
			end else nil,
			ListFooterComponent = if CarouselMargin then function()
				-- upvalues: RoactModule (upval), CarouselMargin (copy)
				return RoactModule.createFragment({
					RightCarouselMargin = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Position = UDim2.fromScale(0, 0),
						AnchorPoint = Vector2.new(0, 0),
						Size = UDim2.new(0, CarouselMargin, 1, 0)
					})
				})
			end else nil,
			contentContainerStyle = {
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				Size = UDim2.fromScale(0, 1)
			},
			style = { BackgroundTransparency = 1, ScrollBarThickness = 0 },
			onContentSizeChange = Props.onContentSizeChange
		}) or nil,
		RightMargin = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.fromScale(1, 0),
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0, CarouselMargin, 1, 0)
		}, {
			ScrollRightButton = if State.hovering and State.showRightButton then RoactModule.createElement(ScrollButtonModule, {
				icon = IconsActionsCycleRight,
				callback = p1.scrollRight
			}) else nil
		})
	})
end

return HorizontalCarousel
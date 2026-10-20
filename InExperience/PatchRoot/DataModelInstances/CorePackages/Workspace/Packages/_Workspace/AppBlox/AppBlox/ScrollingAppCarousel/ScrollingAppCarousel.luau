local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("AppBlox").Parent
local RoactModule = require(Parent.Roact)
local OtterModule = require(Parent.Otter)
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local ArgCheckModule = require(Parent.ArgCheck)
local AppCarouselModule = require(script.Parent.AppCarousel)
local ScrollButtonModule = require(script.Parent.ScrollButton)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local AXFixScrollingCarouselShowRightButton = game:DefineFastFlag("AXFixScrollingCarouselShowRightButton", false)
local IconsActionsCycleLeft = Images["icons/actions/cycleLeft"]
local IconsActionsCycleRight = Images["icons/actions/cycleRight"]
local config = {
	frequency = 2,
	dampingRatio = 0.9,
	restingPositionLimit = 0.5,
	restingVelocityLimit = 0.1
}
local ScrollingAppCarousel = RoactModule.PureComponent:extend("ScrollingAppCarousel")
ScrollingAppCarousel.defaultProps = { carouselMargin = 0 }
ScrollingAppCarousel.validateProps = TModule.strictInterface({
	items = TModule.table,
	index = TModule.numberMin(1),
	itemCount = TModule.number,
	itemWidth = TModule.numberMin(1),
	itemPadding = TModule.number,
	carouselMargin = TModule.number,
	carouselHeight = TModule.number,
	canvasWidth = TModule.number,
	styleProps = TModule.optional(TModule.table),
	isScrollingDisabled = TModule.optional(TModule.boolean),
	onChangeCanvasPosition = TModule.callback,
	onRefCallback = TModule.optional(TModule.callback),
	shouldExpandToFitContentHeight = TModule.optional(TModule.boolean)
})

function ScrollingAppCarousel.getScrollState(ItemWidth, ItemPadding, XDelta)
	return {
		maxNumOfItemsVisible = math.floor((XDelta + ItemPadding) / (ItemWidth + ItemPadding))
	}
end

function ScrollingAppCarousel.handleMouseEvent(p1, Input, HoveringCarousel)
	if Input.UserInputType == Enum.UserInputType.MouseMovement then
		p1:setState({ hoveringCarousel = HoveringCarousel })
	end
end

function ScrollingAppCarousel.handleScroll(p1, p2)
	if not p1.state.animationActive then
		local Index = p1.props.index
		local MaxNumOfItemsVisible = p1.state.maxNumOfItemsVisible
		p1:scrollToIndex(Index, Index + (p2 and MaxNumOfItemsVisible or -MaxNumOfItemsVisible))
		
		return
	end
end

function ScrollingAppCarousel.handleResize(p1, Frame: Frame)
	-- upvalues: CryoModule (copy)
	if p1._isMounted then
		local XDelta = Frame.AbsoluteSize.X - 2 * p1.props.carouselMargin
		p1:setState(CryoModule.Dictionary.join({
			absoluteWidth = Frame.AbsoluteSize.X,
			carouselWidth = XDelta
		}, p1.getScrollState(p1.props.itemWidth, p1.props.itemPadding, XDelta)))
	end
end

function ScrollingAppCarousel.scrollToIndex(p1, Index: number, Index1: number)
	-- upvalues: ArgCheckModule (copy), UserGameSettings (copy), OtterModule (copy), config (copy)
	ArgCheckModule.assert(not p1.props.isScrollingDisabled, "scrolling should be disabled")
	local NewItemWidth = p1.props.itemWidth + p1.props.itemPadding
	local ScaledIndex = (Index - 1) * NewItemWidth
	local ScaledLargest = (math.max(math.min(Index1, p1.props.itemCount - p1.state.maxNumOfItemsVisible + 1), 1) - 1) * NewItemWidth
	p1:destroyMotor()
	p1:createMotor(ScaledIndex)
	
	if UserGameSettings.ReducedMotion then
		p1.carouselMotor:setGoal(OtterModule.instant(ScaledLargest))
		
		return
	else
		p1.carouselMotor:setGoal(OtterModule.spring(ScaledLargest, config))
	end
end

function ScrollingAppCarousel.createMotor(p1, p2)
	-- upvalues: OtterModule (copy)
	p1.carouselMotor = OtterModule.createSingleMotor(p2)
	p1.carouselMotor:onStep(function(X)
		-- upvalues: p1 (copy)
		p1:setState({
			animationActive = true,
			canvasPosition = Vector2.new(X, 0)
		})
	end)
	p1.carouselMotor:onComplete(function()
		-- upvalues: p1 (copy)
		p1:destroyMotor()
		p1:setState({ animationActive = false })
	end)
end

function ScrollingAppCarousel.destroyMotor(p1)
	if p1.carouselMotor then
		p1.carouselMotor:destroy()
		p1.carouselMotor = nil
	end
end

function ScrollingAppCarousel.init(p1)
	-- upvalues: RoactModule (copy)
	p1:setState({
		carouselWidth = 0,
		hoveringCarousel = false,
		animationActive = false,
		maxNumOfItemsVisible = 0,
		absoluteWidth = 0,
		canvasPosition = Vector2.new(0, 0)
	})
	p1.carouselMotor = nil
	
	function p1:onMouseEnter(Input)
		-- upvalues: p1 (copy)
		if p1._isMounted then
			p1:handleMouseEvent(Input, true)
		end
	end
	
	function p1:onMouseLeave(Input)
		-- upvalues: p1 (copy)
		if p1._isMounted then
			p1:handleMouseEvent(Input, false)
		end
	end
	
	p1.frameRef = RoactModule.createRef()
	
	function p1.onResize(Frame)
		-- upvalues: p1 (copy)
		if p1._isMounted then
			p1:handleResize(Frame)
			
			if p1.props.onResize then
				p1.props.onResize(Frame)
			end
		end
	end
	
	function p1.scrollLeft()
		-- upvalues: p1 (copy)
		if p1._isMounted then
			p1:handleScroll(false)
		end
	end
	
	function p1.scrollRight()
		-- upvalues: p1 (copy)
		if p1._isMounted then
			p1:handleScroll(true)
		end
	end
end

function ScrollingAppCarousel.getDerivedStateFromProps(p1, p2)
	-- upvalues: CryoModule (copy), ScrollingAppCarousel (copy)
	local Largest = math.max(0, p2.absoluteWidth - 2 * p1.carouselMargin)
	
	return CryoModule.Dictionary.join({ carouselWidth = Largest }, ScrollingAppCarousel.getScrollState(p1.itemWidth, p1.itemPadding, Largest))
end

function ScrollingAppCarousel.didMount(p1)
	p1._isMounted = true
	p1:handleResize((p1.frameRef:getValue()))
end

function ScrollingAppCarousel.didUpdate(p1, p2, p3)
	local IsItemCountBelow = p1.props.itemCount < p2.itemCount
	local IsNotItemWidthMatch = p1.props.itemWidth ~= p2.itemWidth
	local IsNotItemPaddingMatch = p1.props.itemPadding ~= p2.itemPadding
	local IsNotMaxNumOfItemsVisibleMatch = p1.state.maxNumOfItemsVisible ~= p3.maxNumOfItemsVisible
	
	if not p1.props.isScrollingDisabled and (IsItemCountBelow or (IsNotItemWidthMatch or (IsNotItemPaddingMatch or IsNotMaxNumOfItemsVisibleMatch))) then
		p1:scrollToIndex(p1.props.index, p2.index)
	end
end

function ScrollingAppCarousel.willUnmount(p1)
	p1._isMounted = false
	p1:destroyMotor()
end

function ScrollingAppCarousel.render(p1)
	-- upvalues: AXFixScrollingCarouselShowRightButton (copy), RoactModule (copy), ScrollButtonModule (copy), IconsActionsCycleLeft (copy), IconsActionsCycleRight (copy), AppCarouselModule (copy)
	local CarouselMargin: number = p1.props.carouselMargin
	local CarouselHeight = p1.props.carouselHeight
	local Element = nil
	local Element1 = nil
	
	if p1.state.hoveringCarousel then
		local IsScrollingDisabled = p1.props.isScrollingDisabled
		local NoIsScrollingDisabled: boolean = if AXFixScrollingCarouselShowRightButton then p1.props.index + p1.state.maxNumOfItemsVisible < p1.props.itemCount and not IsScrollingDisabled else p1.props.index + p1.state.maxNumOfItemsVisible < p1.props.itemCount
		
		if p1.props.index > 1 and not IsScrollingDisabled then
			Element = RoactModule.createElement(ScrollButtonModule, { icon = IconsActionsCycleLeft, callback = p1.scrollLeft })
		end
		if NoIsScrollingDisabled then
			Element1 = RoactModule.createElement(ScrollButtonModule, {
				icon = IconsActionsCycleRight,
				callback = p1.scrollRight
			})
		end
	end
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(1, CarouselMargin, 0, CarouselHeight),
		AutomaticSize = if p1.props.shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
		Position = UDim2.fromOffset(-CarouselMargin, 0),
		BackgroundTransparency = 1,
		[RoactModule.Event.InputBegan] = p1.onMouseEnter,
		[RoactModule.Event.InputEnded] = p1.onMouseLeave,
		[RoactModule.Change.AbsoluteSize] = p1.onResize,
		[RoactModule.Ref] = p1.frameRef
	}, {
		LeftMargin = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = if p1.props.styleProps and p1.props.styleProps.leftPosition then UDim2.new(0, p1.props.styleProps.leftPosition, 0, 0) else UDim2.fromScale(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Size = UDim2.new(0, CarouselMargin, 1, 0)
		}, { ScrollLeftButton = Element }),
		Carousel = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -2 * CarouselMargin, 1, 0),
			AutomaticSize = if p1.props.shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
			Position = UDim2.fromOffset(CarouselMargin, 0)
		}, {
			InnerCarouselContent = RoactModule.createElement(AppCarouselModule, {
				carouselHeight = CarouselHeight,
				canvasWidth = p1.props.canvasWidth,
				items = p1.props.items,
				onChangeCanvasPosition = p1.props.onChangeCanvasPosition,
				onRefCallback = p1.props.onRefCallback,
				canvasPosition = p1.state.canvasPosition,
				scrollingAnimationActive = if p1.props.isScrollingDisabled then true else p1.state.animationActive,
				shouldExpandToFitContentHeight = p1.props.shouldExpandToFitContentHeight
			})
		}),
		RightMargin = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = if p1.props.styleProps and p1.props.styleProps.rightPosition then UDim2.new(1, p1.props.styleProps.rightPosition, 0, 0) else UDim2.fromScale(1, 0),
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0, CarouselMargin, 1, 0)
		}, { ScrollRightButton = Element1 })
	})
end

return ScrollingAppCarousel
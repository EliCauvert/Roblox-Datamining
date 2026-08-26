local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local parent = script:FindFirstAncestor("AppBlox").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local otterModule = require(parent.Otter)
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local argCheckModule = require(parent.ArgCheck)
local appCarouselModule = require(script.Parent.AppCarousel)
local scrollButtonModule = require(script.Parent.ScrollButton)
local images = UIBloxModule.App.ImageSet.Images
local fFlagAXScrollingCarouselWidgetIndexBugfix = require(parent.SharedFlags).FFlagAXScrollingCarouselWidgetIndexBugfix
local AXFixScrollingCarouselShowRightButton = game:DefineFastFlag("AXFixScrollingCarouselShowRightButton", false)
local cycleLeft = images["icons/actions/cycleLeft"]
local cycleRight = images["icons/actions/cycleRight"]
local t = {
	frequency = 2,
	dampingRatio = 0.9,
	restingPositionLimit = 0.5,
	restingVelocityLimit = 0.1
}
local scrollingAppCarousel = roactModule.PureComponent:extend("ScrollingAppCarousel")
scrollingAppCarousel.defaultProps = { carouselMargin = 0 }
scrollingAppCarousel.validateProps = tModule.strictInterface({
	items = tModule.table,
	index = tModule.numberMin(1),
	itemCount = tModule.number,
	itemWidth = tModule.numberMin(1),
	itemPadding = tModule.number,
	carouselMargin = tModule.number,
	carouselHeight = tModule.number,
	canvasWidth = tModule.number,
	styleProps = tModule.optional(tModule.table),
	isScrollingDisabled = tModule.optional(tModule.boolean),
	onChangeCanvasPosition = tModule.callback,
	onRefCallback = tModule.optional(tModule.callback),
	shouldExpandToFitContentHeight = tModule.optional(tModule.boolean)
})

function scrollingAppCarousel.getScrollState(p1, p2, p3)
	return { maxNumOfItemsVisible = math.floor((p3 + p2) / (p1 + p2)) }
end

function scrollingAppCarousel.handleMouseEvent(p1, p2, p3)
	if p2.UserInputType == Enum.UserInputType.MouseMovement then
		p1:setState({ hoveringCarousel = p3 })
	end
end

function scrollingAppCarousel.handleScroll(p1, p2)
	if p1.state.animationActive then
		return
	end
	local index = p1.props.index
	local maxNumOfItemsVisible = p1.state.maxNumOfItemsVisible
	p1:scrollToIndex(index, index + (if p2 then maxNumOfItemsVisible else -maxNumOfItemsVisible))
end

function scrollingAppCarousel.handleResize(p1, p2)
	-- upvalues: cryoModule (ref)
	if p1._isMounted then
		local var1 = p2.AbsoluteSize.X - 2 * p1.props.carouselMargin
		p1:setState(cryoModule.Dictionary.join({ absoluteWidth = p2.AbsoluteSize.X, carouselWidth = var1 }, p1.getScrollState(p1.props.itemWidth, p1.props.itemPadding, var1)))
	end
end

function scrollingAppCarousel.scrollToIndex(p1, p2, p3)
	-- upvalues: argCheckModule (ref), userGameSettingsService (ref), otterModule (ref), t (ref)
	argCheckModule.assert(not p1.props.isScrollingDisabled, "scrolling should be disabled")
	local itemCount = p1.props.itemCount
	local var1 = p1.props.itemWidth + p1.props.itemPadding
	local var2 = (p2 - 1) * var1
	local var3 = (math.max(math.min(p3, itemCount - p1.state.maxNumOfItemsVisible + 1), 1) - 1) * var1
	p1:destroyMotor()
	p1:createMotor(var2)
	
	if userGameSettingsService.ReducedMotion then
		p1.carouselMotor:setGoal(otterModule.instant(var3))
		
		return
	end
	p1.carouselMotor:setGoal(otterModule.spring(var3, t))
end

function scrollingAppCarousel.createMotor(p1, p2)
	-- upvalues: otterModule (ref)
	p1.carouselMotor = otterModule.createSingleMotor(p2)
	p1.carouselMotor:onStep(function(p3)
		-- upvalues: p1 (ref)
		p1:setState({
			animationActive = true,
			canvasPosition = Vector2.new(p3, 0)
		})
	end)
	p1.carouselMotor:onComplete(function()
		-- upvalues: p1 (ref)
		p1:destroyMotor()
		p1:setState({ animationActive = false })
	end)
end

function scrollingAppCarousel.destroyMotor(p1)
	if p1.carouselMotor then
		p1.carouselMotor:destroy()
		p1.carouselMotor = nil
	end
end

function scrollingAppCarousel.init(p1)
	-- upvalues: roactModule (ref)
	p1:setState({
		carouselWidth = 0,
		hoveringCarousel = false,
		animationActive = false,
		maxNumOfItemsVisible = 0,
		absoluteWidth = 0,
		canvasPosition = Vector2.new(0, 0)
	})
	p1.carouselMotor = nil
	
	function p17.onMouseEnter(_, p2)
		-- upvalues: p1 (ref)
		if p1._isMounted then
			p1:handleMouseEvent(p2, true)
		end
	end
	
	function p17.onMouseLeave(_, p2)
		-- upvalues: p1 (ref)
		if p1._isMounted then
			p1:handleMouseEvent(p2, false)
		end
	end
	
	p1.frameRef = roactModule.createRef()
	
	function p17.onResize(p2)
		-- upvalues: p1 (ref)
		if p1._isMounted then
			p1:handleResize(p2)
			
			if p1.props.onResize then
				p1.props.onResize(p2)
			end
		end
	end
	
	function p17.scrollLeft()
		-- upvalues: p1 (ref)
		if p1._isMounted then
			p1:handleScroll(false)
		end
	end
	
	function p17.scrollRight()
		-- upvalues: p1 (ref)
		if p1._isMounted then
			p1:handleScroll(true)
		end
	end
end

function scrollingAppCarousel.getDerivedStateFromProps(p1, p2)
	-- upvalues: cryoModule (ref), scrollingAppCarousel (ref)
	local maxValue = math.max(0, p2.absoluteWidth - 2 * p1.carouselMargin)
	
	return cryoModule.Dictionary.join({ carouselWidth = maxValue }, scrollingAppCarousel.getScrollState(p1.itemWidth, p1.itemPadding, maxValue))
end

function scrollingAppCarousel.didMount(p1)
	p1._isMounted = true
	p1:handleResize(p1.frameRef:getValue())
end

function scrollingAppCarousel.didUpdate(p1, p2, p3)
	if not p1.props.isScrollingDisabled and (p1.props.itemCount < p2.itemCount or (p1.props.itemWidth ~= p2.itemWidth or (p1.props.itemPadding ~= p2.itemPadding or p1.state.maxNumOfItemsVisible ~= p3.maxNumOfItemsVisible))) then
		p1:scrollToIndex(p1.props.index, p2.index)
	end
end

function scrollingAppCarousel.willUnmount(p1)
	p1._isMounted = false
	p1:destroyMotor()
end

function scrollingAppCarousel.render(p1)
	-- upvalues: AXFixScrollingCarouselShowRightButton (ref), fFlagAXScrollingCarouselWidgetIndexBugfix (ref), roactModule (ref), scrollButtonModule (ref), cycleLeft (ref), cycleRight (ref), appCarouselModule (ref)
	local carouselMargin = p1.props.carouselMargin
	local carouselHeight = p1.props.carouselHeight
	local var1 = nil
	local var2 = nil
	
	if p1.state.hoveringCarousel then
		local var3
		local isScrollingDisabled = p1.props.isScrollingDisabled
		local var4 = p1.props.index > 1 and not isScrollingDisabled
		local _ = nil
		
		if AXFixScrollingCarouselShowRightButton then
			local var5
			if fFlagAXScrollingCarouselWidgetIndexBugfix then
				var5 = p1.props.index + p1.state.maxNumOfItemsVisible < p1.props.itemCount
				var5 = nil
			else
				var5 = p1.props.index + p1.state.maxNumOfItemsVisible <= p1.props.itemCount
			end
			var3 = var5 and not isScrollingDisabled
		elseif fFlagAXScrollingCarouselWidgetIndexBugfix then
			var3 = p1.props.index + p1.state.maxNumOfItemsVisible < p1.props.itemCount
			var3 = nil
		else
			var3 = p1.props.index + p1.state.maxNumOfItemsVisible <= p1.props.itemCount and not isScrollingDisabled
		end
		if var4 then
			var1 = roactModule.createElement(scrollButtonModule, { icon = cycleLeft, callback = p1.scrollLeft })
		end
		if var3 then
			var2 = roactModule.createElement(scrollButtonModule, { icon = cycleRight, callback = p1.scrollRight })
		end
	end
	return roactModule.createElement("Frame", {
		Size = UDim2.new(1, carouselMargin, 0, carouselHeight),
		AutomaticSize = if p1.props.shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
		Position = UDim2.fromOffset(-carouselMargin, 0),
		BackgroundTransparency = 1,
		[roactModule.Event.InputBegan] = p1.onMouseEnter,
		[roactModule.Event.InputEnded] = p1.onMouseLeave,
		[roactModule.Change.AbsoluteSize] = p1.onResize,
		[roactModule.Ref] = p1.frameRef
	}, {
		LeftMargin = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = if p1.props.styleProps and p1.props.styleProps.leftPosition then UDim2.new(0, p1.props.styleProps.leftPosition, 0, 0) else UDim2.fromScale(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Size = UDim2.new(0, carouselMargin, 1, 0)
		}, { ScrollLeftButton = var1 }),
		Carousel = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -2 * carouselMargin, 1, 0),
			AutomaticSize = if p1.props.shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
			Position = UDim2.fromOffset(carouselMargin, 0)
		}, {
			InnerCarouselContent = roactModule.createElement(appCarouselModule, {
				carouselHeight = carouselHeight,
				canvasWidth = p1.props.canvasWidth,
				items = p1.props.items,
				onChangeCanvasPosition = p1.props.onChangeCanvasPosition,
				onRefCallback = p1.props.onRefCallback,
				canvasPosition = p1.state.canvasPosition,
				scrollingAnimationActive = if p1.props.isScrollingDisabled then true else p1.state.animationActive,
				shouldExpandToFitContentHeight = p1.props.shouldExpandToFitContentHeight
			})
		}),
		RightMargin = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = if p1.props.styleProps and p1.props.styleProps.rightPosition then UDim2.new(1, p1.props.styleProps.rightPosition, 0, 0) else UDim2.fromScale(1, 0),
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0, carouselMargin, 1, 0)
		}, { ScrollRightButton = var2 })
	})
end

return scrollingAppCarousel
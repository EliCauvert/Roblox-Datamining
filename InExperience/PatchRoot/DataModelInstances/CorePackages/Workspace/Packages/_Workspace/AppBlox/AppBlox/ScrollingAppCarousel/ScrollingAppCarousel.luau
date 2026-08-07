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

function scrollingAppCarousel.getScrollState(p0, p1, p2) --[[ line: 78 ]]
	return { maxNumOfItemsVisible = math.floor((p2 + p1) / (p0 + p1)) }
end

function scrollingAppCarousel.handleMouseEvent(p3, p4, p5) --[[ line: 87 ]]
	if p4.UserInputType == Enum.UserInputType.MouseMovement then
		p3:setState({ hoveringCarousel = p5 })
	end
end

function scrollingAppCarousel.handleScroll(p6, p7) --[[ line: 95 ]]
	if p6.state.animationActive then
		return
	end
	local index = p6.props.index
	local maxNumOfItemsVisible = p6.state.maxNumOfItemsVisible
	p6:scrollToIndex(index, index + (if p7 then maxNumOfItemsVisible else -maxNumOfItemsVisible))
end

function scrollingAppCarousel.handleResize(p8, p9) --[[ line: 106 ]]
	-- upvalues: cryoModule (ref)
	if p8._isMounted then
		local var12 = p9.AbsoluteSize.X - 2 * p8.props.carouselMargin
		p8:setState(cryoModule.Dictionary.join({ absoluteWidth = p9.AbsoluteSize.X, carouselWidth = var12 }, p8.getScrollState(p8.props.itemWidth, p8.props.itemPadding, var12)))
	end
end

function scrollingAppCarousel.scrollToIndex(p10, p11, p12) --[[ line: 117 ]]
	-- upvalues: argCheckModule (ref), userGameSettingsService (ref), otterModule (ref), t (ref)
	argCheckModule.assert(not p10.props.isScrollingDisabled, "scrolling should be disabled")
	local itemCount = p10.props.itemCount
	local var13 = p10.props.itemWidth + p10.props.itemPadding
	local var14 = (p11 - 1) * var13
	local var15 = (math.max(math.min(p12, itemCount - p10.state.maxNumOfItemsVisible + 1), 1) - 1) * var13
	p10:destroyMotor()
	p10:createMotor(var14)
	
	if userGameSettingsService.ReducedMotion then
		p10.carouselMotor:setGoal(otterModule.instant(var15))
		
		return
	end
	p10.carouselMotor:setGoal(otterModule.spring(var15, t))
end

function scrollingAppCarousel.createMotor(p13, p14) --[[ line: 139 ]]
	-- upvalues: otterModule (ref)
	p13.carouselMotor = otterModule.createSingleMotor(p14)
	p13.carouselMotor:onStep(function(p15) --[[ line: 141 ]]
		-- upvalues: p13 (ref)
		p13:setState({
			animationActive = true,
			canvasPosition = Vector2.new(p15, 0)
		})
	end)
	p13.carouselMotor:onComplete(function() --[[ line: 147 ]]
		-- upvalues: p13 (ref)
		p13:destroyMotor()
		p13:setState({ animationActive = false })
	end)
end

function scrollingAppCarousel.destroyMotor(p16) --[[ line: 155 ]]
	if p16.carouselMotor then
		p16.carouselMotor:destroy()
		p16.carouselMotor = nil
	end
end

function scrollingAppCarousel.init(p17) --[[ line: 162 ]]
	-- upvalues: roactModule (ref)
	p17:setState({
		carouselWidth = 0,
		hoveringCarousel = false,
		animationActive = false,
		maxNumOfItemsVisible = 0,
		absoluteWidth = 0,
		canvasPosition = Vector2.new(0, 0)
	})
	p17.carouselMotor = nil
	
	function p17.onMouseEnter(_, p18) --[[ line: 174 ]]
		-- upvalues: p17 (ref)
		if p17._isMounted then
			p17:handleMouseEvent(p18, true)
		end
	end
	
	function p17.onMouseLeave(_, p19) --[[ line: 180 ]]
		-- upvalues: p17 (ref)
		if p17._isMounted then
			p17:handleMouseEvent(p19, false)
		end
	end
	
	p17.frameRef = roactModule.createRef()
	
	function p17.onResize(p20) --[[ line: 188 ]]
		-- upvalues: p17 (ref)
		if p17._isMounted then
			p17:handleResize(p20)
			
			if p17.props.onResize then
				p17.props.onResize(p20)
			end
		end
	end
	
	function p17.scrollLeft() --[[ line: 197 ]]
		-- upvalues: p17 (ref)
		if p17._isMounted then
			p17:handleScroll(false)
		end
	end
	
	function p17.scrollRight() --[[ line: 203 ]]
		-- upvalues: p17 (ref)
		if p17._isMounted then
			p17:handleScroll(true)
		end
	end
end

function scrollingAppCarousel.getDerivedStateFromProps(p21, p22) --[[ line: 210 ]]
	-- upvalues: cryoModule (ref), scrollingAppCarousel (ref)
	local maxValue = math.max(0, p22.absoluteWidth - 2 * p21.carouselMargin)
	
	return cryoModule.Dictionary.join({ carouselWidth = maxValue }, scrollingAppCarousel.getScrollState(p21.itemWidth, p21.itemPadding, maxValue))
end

function scrollingAppCarousel.didMount(p23) --[[ line: 217 ]]
	p23._isMounted = true
	p23:handleResize(p23.frameRef:getValue())
end

function scrollingAppCarousel.didUpdate(p24, p25, p26) --[[ line: 223 ]]
	if not p24.props.isScrollingDisabled and (p24.props.itemCount < p25.itemCount or (p24.props.itemWidth ~= p25.itemWidth or (p24.props.itemPadding ~= p25.itemPadding or p24.state.maxNumOfItemsVisible ~= p26.maxNumOfItemsVisible))) then
		p24:scrollToIndex(p24.props.index, p25.index)
	end
end

function scrollingAppCarousel.willUnmount(p27) --[[ line: 235 ]]
	p27._isMounted = false
	p27:destroyMotor()
end

function scrollingAppCarousel.render(p28) --[[ line: 240 ]]
	-- upvalues: AXFixScrollingCarouselShowRightButton (ref), fFlagAXScrollingCarouselWidgetIndexBugfix (ref), roactModule (ref), scrollButtonModule (ref), cycleLeft (ref), cycleRight (ref), appCarouselModule (ref)
	local carouselMargin = p28.props.carouselMargin
	local carouselHeight = p28.props.carouselHeight
	local var17 = nil
	local var18 = nil
	
	if p28.state.hoveringCarousel then
		local var20
		local isScrollingDisabled = p28.props.isScrollingDisabled
		local var19 = p28.props.index > 1 and not isScrollingDisabled
		local _ = nil
		
		if AXFixScrollingCarouselShowRightButton then
			local var21
			if fFlagAXScrollingCarouselWidgetIndexBugfix then
				var21 = p28.props.index + p28.state.maxNumOfItemsVisible < p28.props.itemCount
				var21 = nil
			else
				var21 = p28.props.index + p28.state.maxNumOfItemsVisible <= p28.props.itemCount
			end
			var20 = var21 and not isScrollingDisabled
		elseif fFlagAXScrollingCarouselWidgetIndexBugfix then
			var20 = p28.props.index + p28.state.maxNumOfItemsVisible < p28.props.itemCount
			var20 = nil
		else
			var20 = p28.props.index + p28.state.maxNumOfItemsVisible <= p28.props.itemCount and not isScrollingDisabled
		end
		if var19 then
			var17 = roactModule.createElement(scrollButtonModule, { icon = cycleLeft, callback = p28.scrollLeft })
		end
		if var20 then
			var18 = roactModule.createElement(scrollButtonModule, { icon = cycleRight, callback = p28.scrollRight })
		end
	end
	return roactModule.createElement("Frame", {
		Size = UDim2.new(1, carouselMargin, 0, carouselHeight),
		AutomaticSize = if p28.props.shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
		Position = UDim2.fromOffset(-carouselMargin, 0),
		BackgroundTransparency = 1,
		[roactModule.Event.InputBegan] = p28.onMouseEnter,
		[roactModule.Event.InputEnded] = p28.onMouseLeave,
		[roactModule.Change.AbsoluteSize] = p28.onResize,
		[roactModule.Ref] = p28.frameRef
	}, {
		LeftMargin = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = if p28.props.styleProps and p28.props.styleProps.leftPosition then UDim2.new(0, p28.props.styleProps.leftPosition, 0, 0) else UDim2.fromScale(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Size = UDim2.new(0, carouselMargin, 1, 0)
		}, { ScrollLeftButton = var17 }),
		Carousel = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -2 * carouselMargin, 1, 0),
			AutomaticSize = if p28.props.shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
			Position = UDim2.fromOffset(carouselMargin, 0)
		}, {
			InnerCarouselContent = roactModule.createElement(appCarouselModule, {
				carouselHeight = carouselHeight,
				canvasWidth = p28.props.canvasWidth,
				items = p28.props.items,
				onChangeCanvasPosition = p28.props.onChangeCanvasPosition,
				onRefCallback = p28.props.onRefCallback,
				canvasPosition = p28.state.canvasPosition,
				scrollingAnimationActive = if p28.props.isScrollingDisabled then true else p28.state.animationActive,
				shouldExpandToFitContentHeight = p28.props.shouldExpandToFitContentHeight
			})
		}),
		RightMargin = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = if p28.props.styleProps and p28.props.styleProps.rightPosition then UDim2.new(1, p28.props.styleProps.rightPosition, 0, 0) else UDim2.fromScale(1, 0),
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0, carouselMargin, 1, 0)
		}, { ScrollRightButton = var18 })
	})
end

return scrollingAppCarousel
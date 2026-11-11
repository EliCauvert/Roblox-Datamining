local RoactModule = require(script:FindFirstAncestor("AppBlox").Parent.Roact)
local AppCarousel = RoactModule.PureComponent:extend("AppCarousel")

function AppCarousel.render(p1)
	-- upvalues: RoactModule (copy)
	local CarouselHeight = p1.props.carouselHeight
	local ShouldExpandToFitContentHeight = p1.props.shouldExpandToFitContentHeight
	
	return RoactModule.createElement("ScrollingFrame", {
		Size = UDim2.new(1, 0, 0, CarouselHeight),
		AutomaticSize = if ShouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		CanvasSize = UDim2.new(0, p1.props.canvasWidth, 0, CarouselHeight),
		AutomaticCanvasSize = if ShouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
		CanvasPosition = p1.props.canvasPosition,
		ScrollingEnabled = not p1.props.scrollingAnimationActive,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		Selectable = false,
		[RoactModule.Change.CanvasPosition] = p1.props.onChangeCanvasPosition,
		[RoactModule.Ref] = p1.props.onRefCallback
	}, p1.props.items)
end

return AppCarousel
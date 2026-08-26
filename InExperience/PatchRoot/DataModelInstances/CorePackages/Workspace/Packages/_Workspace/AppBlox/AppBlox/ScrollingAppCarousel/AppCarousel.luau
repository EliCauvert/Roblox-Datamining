local roactModule = require(script:FindFirstAncestor("AppBlox").Parent.Roact)
local appCarousel = roactModule.PureComponent:extend("AppCarousel")

function appCarousel.render(p1)
	-- upvalues: roactModule (ref)
	local carouselHeight = p1.props.carouselHeight
	local shouldExpandToFitContentHeight = p1.props.shouldExpandToFitContentHeight
	
	return roactModule.createElement("ScrollingFrame", {
		Size = UDim2.new(1, 0, 0, carouselHeight),
		AutomaticSize = if shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		CanvasSize = UDim2.new(0, p1.props.canvasWidth, 0, carouselHeight),
		AutomaticCanvasSize = if shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
		CanvasPosition = p1.props.canvasPosition,
		ScrollingEnabled = not p1.props.scrollingAnimationActive,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		Selectable = false,
		[roactModule.Change.CanvasPosition] = p1.props.onChangeCanvasPosition,
		[roactModule.Ref] = p1.props.onRefCallback
	}, p1.props.items)
end

return appCarousel
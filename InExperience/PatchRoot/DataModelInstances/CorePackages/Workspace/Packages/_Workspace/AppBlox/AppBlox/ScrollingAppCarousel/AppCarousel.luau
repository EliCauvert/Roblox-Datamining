local roactModule = require(script:FindFirstAncestor("AppBlox").Parent.Roact)
local appCarousel = roactModule.PureComponent:extend("AppCarousel")

function appCarousel.render(p0) --[[ line: 9 ]]
	-- upvalues: roactModule (ref)
	local carouselHeight = p0.props.carouselHeight
	local shouldExpandToFitContentHeight = p0.props.shouldExpandToFitContentHeight
	
	return roactModule.createElement("ScrollingFrame", {
		Size = UDim2.new(1, 0, 0, carouselHeight),
		AutomaticSize = if shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		CanvasSize = UDim2.new(0, p0.props.canvasWidth, 0, carouselHeight),
		AutomaticCanvasSize = if shouldExpandToFitContentHeight then Enum.AutomaticSize.Y else nil,
		CanvasPosition = p0.props.canvasPosition,
		ScrollingEnabled = not p0.props.scrollingAnimationActive,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ElasticBehavior = Enum.ElasticBehavior.Always,
		Selectable = false,
		[roactModule.Change.CanvasPosition] = p0.props.onChangeCanvasPosition,
		[roactModule.Ref] = p0.props.onRefCallback
	}, p0.props.items)
end

return appCarousel
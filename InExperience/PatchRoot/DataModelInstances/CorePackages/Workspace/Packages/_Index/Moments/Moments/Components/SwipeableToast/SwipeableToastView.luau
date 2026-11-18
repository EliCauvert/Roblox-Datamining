local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("ScrollingFrame", {
		[ReactModule.Tag] = "data-testid=SwipeableToastView",
		ref = p1.scrollerRef,
		Position = p1.scrollerPosition,
		Size = p1.scrollerSize,
		CanvasSize = p1.canvasSize,
		ScrollingEnabled = p1.scrollingEnabled,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ElasticBehavior = Enum.ElasticBehavior.Never,
		ScrollBarThickness = 0,
		ClipsDescendants = false,
		Selectable = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = p1.ZIndex,
		[ReactModule.Change.CanvasPosition] = p1.onCanvasPositionChanged
	}, {
		Card = ReactModule.createElement("Frame", {
			[ReactModule.Tag] = "data-testid=SwipeableToastCard",
			Position = p1.cardPosition,
			Size = UDim2.fromOffset(p1.cardWidth, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Visible = p1.cardVisible,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			[ReactModule.Change.AbsoluteSize] = p1.onCardSizeChanged
		}, { Content = p1.card })
	})
end
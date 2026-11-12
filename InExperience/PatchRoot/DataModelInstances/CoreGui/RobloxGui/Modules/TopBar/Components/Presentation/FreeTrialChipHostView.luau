local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	return (ReactModule.createElement("Frame", {
		AnchorPoint = Vector2.new(1, 0),
		BackgroundTransparency = 1,
		Position = p1.position,
		Size = p1.size,
		Visible = p1.visible,
		ZIndex = p1.zIndex,
		[ReactModule.Tag] = "data-testid=FreeTrialChipHost",
		[ReactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
	}, {
		Align = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.fromScale(1, 0),
			Size = UDim2.fromOffset(0, 0)
		}, {
			Slot = ReactModule.createElement(p1.slot, {
				onActivated = p1.onActivated,
				maxWidth = p1.maxWidth,
				hostVisible = p1.visible
			})
		})
	}))
end
local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 0)
		}),
		prefixSpacer = ReactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			RichText = true,
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			TextWrapped = false,
			Active = false,
			AutoButtonColor = false,
			Selectable = false,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p1.prefixText .. " ",
			FontFace = p1.fontFace,
			TextSize = p1.textSize
		}),
		icon = ReactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/translateIcon.png",
			HoverImage = "rbxasset://textures/translateIconDark.png",
			PressedImage = "rbxasset://textures/translateIconDark.png",
			Size = UDim2.fromOffset(p1.textSize - 2, p1.textSize - 2),
			AutoButtonColor = false,
			Selectable = false,
			LayoutOrder = 2,
			[ReactModule.Event.Activated] = p1.onActivated
		})
	})
end)
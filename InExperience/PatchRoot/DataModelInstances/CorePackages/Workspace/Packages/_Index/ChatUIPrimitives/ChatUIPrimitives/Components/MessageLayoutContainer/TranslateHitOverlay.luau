local reactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 0)
		}),
		prefixSpacer = reactModule.createElement("TextButton", {
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
		icon = reactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/translateIcon.png",
			HoverImage = "rbxasset://textures/translateIconDark.png",
			PressedImage = "rbxasset://textures/translateIconDark.png",
			Size = UDim2.fromOffset(p1.textSize - 2, p1.textSize - 2),
			AutoButtonColor = false,
			Selectable = false,
			LayoutOrder = 2,
			[reactModule.Event.Activated] = p1.onActivated
		})
	})
end)
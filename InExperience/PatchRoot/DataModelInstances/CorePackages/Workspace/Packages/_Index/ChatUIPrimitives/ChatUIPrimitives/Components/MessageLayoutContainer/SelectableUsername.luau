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
		username = reactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			RichText = true,
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			TextWrapped = false,
			AutoButtonColor = false,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p1.prefixText,
			FontFace = p1.fontFace,
			TextSize = p1.textSize,
			SelectionImageObject = p1.selectionCursor,
			ref = p1.buttonRef
		})
	})
end)
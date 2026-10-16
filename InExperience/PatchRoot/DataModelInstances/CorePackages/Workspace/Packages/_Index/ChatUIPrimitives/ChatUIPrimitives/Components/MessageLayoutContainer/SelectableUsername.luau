local ReactModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.React)

return ReactModule.memo(function(p1) --[[ Line: 23 | Named "SelectableUsername" ]]
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
		username = ReactModule.createElement("TextButton", {
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
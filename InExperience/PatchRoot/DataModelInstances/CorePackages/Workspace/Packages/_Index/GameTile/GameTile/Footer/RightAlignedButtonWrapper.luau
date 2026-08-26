local reactModule = require(script:FindFirstAncestor("GameTile").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	return if p1.Button then reactModule.createElement(reactModule.Fragment, nil, {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = p1.Padding
		}),
		FooterContentWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }),
			Content = p1.Content
		}),
		Button = p1.Button
	}) else p1.Content
end
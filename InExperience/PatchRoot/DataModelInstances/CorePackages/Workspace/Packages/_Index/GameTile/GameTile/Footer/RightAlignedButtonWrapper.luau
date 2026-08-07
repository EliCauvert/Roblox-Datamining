local reactModule = require(script:FindFirstAncestor("GameTile").Parent.React)

return function(p0) --[[ line: 12 ]]
	-- upvalues: reactModule (ref)
	return if p0.Button then reactModule.createElement(reactModule.Fragment, nil, {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = p0.Padding
		}),
		FooterContentWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }),
			Content = p0.Content
		}),
		Button = p0.Button
	}) else p0.Content
end
local ReactModule = require(script:FindFirstAncestor("GameTile").Parent.React)

return function(p1) --[[ Line: 12 ]]
	-- upvalues: ReactModule (copy)
	return if p1.Button then ReactModule.createElement(ReactModule.Fragment, nil, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = p1.Padding
		}),
		FooterContentWrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = -1,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }),
			Content = p1.Content
		}),
		Button = p1.Button
	}) else p1.Content
end
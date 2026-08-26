local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("UIListLayout", {
		HorizontalAlignment = p1.HorizontalAlignment,
		FillDirection = p1.FillDirection,
		VerticalAlignment = p1.VerticalAlignment,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
end
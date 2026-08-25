local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("UIListLayout", {
		HorizontalAlignment = p0.HorizontalAlignment,
		FillDirection = p0.FillDirection,
		VerticalAlignment = p0.VerticalAlignment,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
end
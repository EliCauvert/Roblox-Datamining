local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("UIListLayout", {
		HorizontalAlignment = p1.HorizontalAlignment,
		FillDirection = p1.FillDirection,
		VerticalAlignment = p1.VerticalAlignment,
		SortOrder = Enum.SortOrder.LayoutOrder
	})
end
local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("UIListLayout", {
		FillDirection = p1.FillDirection,
		HorizontalAlignment = p1.HorizontalAlignment,
		Padding = p1.Padding,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = p1.VerticalAlignment,
		ref = p1.Ref
	})
end
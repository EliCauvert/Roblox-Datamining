local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return function(p0) --[[ line: 12 | named "UIListLayout" ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("UIListLayout", {
		FillDirection = p0.FillDirection,
		HorizontalAlignment = p0.HorizontalAlignment,
		Padding = p0.Padding,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = p0.VerticalAlignment,
		ref = p0.Ref
	})
end
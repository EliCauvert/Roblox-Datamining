local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AutomaticSize = p1.AutomaticSize or Enum.AutomaticSize.XY,
		BackgroundColor3 = p1.BackgroundColor3,
		BackgroundTransparency = p1.BackgroundTransparency or 1,
		LayoutOrder = p1.LayoutOrder,
		Position = p1.Position,
		Size = p1.Size or UDim2.fromScale(1, 1),
		ZIndex = p1.ZIndex,
		children = p1.children,
		ref = p2
	})
end)
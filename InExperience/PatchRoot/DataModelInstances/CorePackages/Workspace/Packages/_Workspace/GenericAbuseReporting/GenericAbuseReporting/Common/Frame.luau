local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return reactModule.forwardRef(function(p0, p1) --[[ line: 15 ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AutomaticSize = p0.AutomaticSize or Enum.AutomaticSize.XY,
		BackgroundColor3 = p0.BackgroundColor3,
		BackgroundTransparency = p0.BackgroundTransparency or 1,
		LayoutOrder = p0.LayoutOrder,
		Position = p0.Position,
		Size = p0.Size or UDim2.fromScale(1, 1),
		ZIndex = p0.ZIndex,
		children = p0.children,
		ref = p1
	})
end)
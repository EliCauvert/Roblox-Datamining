local reactModule = require(script:FindFirstAncestor("Utils").Parent.Parent.React)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		key = tostring(p3),
		LayoutOrder = p3,
		Size = UDim2.fromOffset(p2, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, { Element = p1 })
end
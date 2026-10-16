local ReactModule = require(script:FindFirstAncestor("Utils").Parent.Parent.React)

return function(Element, XOffset, LayoutOrder) --[[ Line: 8 | Named "renderInMeasuredFrame" ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		key = tostring(LayoutOrder),
		LayoutOrder = LayoutOrder,
		Size = UDim2.fromOffset(XOffset, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, { Element = Element })
end
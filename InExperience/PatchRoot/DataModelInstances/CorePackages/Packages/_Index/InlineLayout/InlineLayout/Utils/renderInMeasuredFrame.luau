local Parent = script:FindFirstAncestor("Utils").Parent.Parent
local ReactModule = require(Parent.React)
local Flags = require(Parent.MarkdownCore).Flags

return function(Element, XOffset, LayoutOrder)
	-- upvalues: ReactModule (copy), Flags (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		key = tostring(LayoutOrder),
		LayoutOrder = LayoutOrder,
		Size = UDim2.fromOffset(XOffset, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, if Flags.FFlagMarkdownTables or Flags.FFlagMarkdownTagFallbacks then Element else { Element = Element })
end
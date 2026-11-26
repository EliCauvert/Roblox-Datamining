local ReactModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.React)
local _ = require(script.Parent.useRecycledFeedRowViewModel)

return function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Name = p1.name,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		ref = p1.frameRef
	}, { Row = p1.content })
end
local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function(Frame: Frame)
	-- upvalues: ReactModule (copy)
	local HeightOffset = Frame.heightOffset or 0
	
	return ReactModule.createElement("Frame", {
		Position = UDim2.new(0, 0, 0, HeightOffset),
		Size = UDim2.new(1, 0, 1, -HeightOffset),
		ZIndex = Frame.ZIndex,
		BackgroundColor3 = Frame.BackgroundColor3,
		BackgroundTransparency = Frame.BackgroundTransparency or 1,
		BorderSizePixel = Frame.BorderSizePixel or 0,
		ClipsDescendants = Frame.ClipsDescendants
	}, Frame.children)
end
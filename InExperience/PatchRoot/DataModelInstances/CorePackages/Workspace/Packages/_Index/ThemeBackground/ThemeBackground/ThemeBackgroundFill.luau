local Parent = script.Parent
local ReactModule = require(Parent.Parent.React)
local ThemeBackgroundImageModule = require(Parent.ThemeBackgroundImage)

return function(p1)
	-- upvalues: ReactModule (copy), ThemeBackgroundImageModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundColor3 = p1.baseColor,
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Position = p1.Position,
		Size = p1.Size or UDim2.fromScale(1, 1),
		ZIndex = 0,
		ref = p1.onPageChanged,
		[ReactModule.Change.AbsolutePosition] = p1.onPageChanged,
		[ReactModule.Change.AbsoluteSize] = p1.onPageChanged
	}, {
		Image = ReactModule.createElement(ThemeBackgroundImageModule, { image = p1.image })
	})
end
local ReactModule = require(script.Parent.Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 0,
		Image = p1.image,
		Position = p1.Position,
		ScaleType = Enum.ScaleType.Crop,
		Size = p1.Size or UDim2.fromScale(1, 1)
	})
end
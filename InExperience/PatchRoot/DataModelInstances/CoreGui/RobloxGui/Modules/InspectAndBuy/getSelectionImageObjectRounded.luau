local colorsModule = require(script.Parent.Colors)

return function()
	-- upvalues: colorsModule (ref)
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Image = "rbxasset://textures/ui/InspectMenu/selection_rounded.png"
	imageLabel.ImageColor3 = colorsModule.White
	imageLabel.ScaleType = Enum.ScaleType.Slice
	imageLabel.SliceCenter = Rect.new(5, 5, 120, 20)
	imageLabel.BackgroundTransparency = 1
	imageLabel.Size = UDim2.new(1, 0, 1, 0)
	
	return imageLabel
end
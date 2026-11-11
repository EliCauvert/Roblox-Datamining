local ColorsModule = require(script.Parent.Colors)

return function()
	-- upvalues: ColorsModule (copy)
	local Image = Instance.new("ImageLabel")
	Image.Image = "rbxasset://textures/ui/InspectMenu/selection_rounded.png"
	Image.ImageColor3 = ColorsModule.White
	Image.ScaleType = Enum.ScaleType.Slice
	Image.SliceCenter = Rect.new(5, 5, 120, 20)
	Image.BackgroundTransparency = 1
	Image.Size = UDim2.new(1, 0, 1, 0)
	
	return Image
end
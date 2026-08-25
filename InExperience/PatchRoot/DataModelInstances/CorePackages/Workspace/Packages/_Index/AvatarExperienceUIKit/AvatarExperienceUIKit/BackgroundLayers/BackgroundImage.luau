local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local t = {
	resourceIdentifier = "",
	anchorPoint = Vector2.new(0.5, 0.5),
	color = Color3.fromRGB(255, 255, 255),
	position = UDim2.fromScale(0.5, 0.5),
	scaleType = Enum.ScaleType.Fit
}

return function(value)
	-- upvalues: dashModule (ref), t (ref), reactModule (ref)
	local var3 = dashModule.join(t, value)
	
	return reactModule.createElement("ImageLabel", {
		AnchorPoint = var3.anchorPoint,
		Position = var3.position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = var3.resourceIdentifier,
		ImageColor3 = var3.color,
		ImageTransparency = var3.transparency,
		ScaleType = var3.scaleType,
		Size = UDim2.fromScale(1, 1),
		ZIndex = var3.ZIndex,
		[reactModule.Tag] = var3.tag
	}, {
		CornerRadius = reactModule.createElement("UICorner", { CornerRadius = var3.cornerRadius })
	})
end
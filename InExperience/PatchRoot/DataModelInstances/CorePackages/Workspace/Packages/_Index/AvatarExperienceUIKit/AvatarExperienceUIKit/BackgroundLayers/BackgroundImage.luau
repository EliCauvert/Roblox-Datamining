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
	local var1 = dashModule.join(t, value)
	
	return reactModule.createElement("ImageLabel", {
		AnchorPoint = var1.anchorPoint,
		Position = var1.position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = var1.resourceIdentifier,
		ImageColor3 = var1.color,
		ImageTransparency = var1.transparency,
		ScaleType = var1.scaleType,
		Size = UDim2.fromScale(1, 1),
		ZIndex = var1.ZIndex,
		[reactModule.Tag] = var1.tag
	}, {
		CornerRadius = reactModule.createElement("UICorner", { CornerRadius = var1.cornerRadius })
	})
end
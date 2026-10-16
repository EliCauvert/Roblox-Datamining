local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local config = {
	resourceIdentifier = "",
	anchorPoint = Vector2.new(0.5, 0.5),
	color = Color3.fromRGB(255, 255, 255),
	position = UDim2.fromScale(0.5, 0.5),
	scaleType = Enum.ScaleType.Fit
}

return function(p1) --[[ Line: 27 | Named "BackgroundImage" ]]
	-- upvalues: DashModule (copy), config (copy), ReactModule (copy)
	local JoinResult = DashModule.join(config, p1)
	
	return ReactModule.createElement("ImageLabel", {
		AnchorPoint = JoinResult.anchorPoint,
		Position = JoinResult.position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = JoinResult.resourceIdentifier,
		ImageColor3 = JoinResult.color,
		ImageTransparency = JoinResult.transparency,
		ScaleType = JoinResult.scaleType,
		Size = UDim2.fromScale(1, 1),
		ZIndex = JoinResult.ZIndex,
		[ReactModule.Tag] = JoinResult.tag
	}, {
		CornerRadius = ReactModule.createElement("UICorner", { CornerRadius = JoinResult.cornerRadius })
	})
end
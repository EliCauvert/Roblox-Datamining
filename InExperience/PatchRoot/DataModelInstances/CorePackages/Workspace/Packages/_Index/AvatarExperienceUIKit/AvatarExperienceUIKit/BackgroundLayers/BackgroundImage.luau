local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local fFlagAXHeroWidget = avatarExperienceFlagsModule.FFlagAXHeroWidget
local t = {
	resourceIdentifier = "",
	anchorPoint = Vector2.new(0.5, 0.5),
	color = Color3.fromRGB(255, 255, 255),
	position = UDim2.fromScale(0.5, 0.5),
	scaleType = if fFlagAXHeroWidget then Enum.ScaleType.Fit else nil
}

return function(value) --[[ line: 31 | named "BackgroundImage" ]]
	-- upvalues: dashModule (ref), t (ref), reactModule (ref), fFlagAXHeroWidget (ref)
	local var4 = dashModule.join(t, value)
	
	return reactModule.createElement("ImageLabel", {
		AnchorPoint = var4.anchorPoint,
		Position = var4.position,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Image = var4.resourceIdentifier,
		ImageColor3 = var4.color,
		ImageTransparency = var4.transparency,
		ScaleType = if fFlagAXHeroWidget then var4.scaleType else Enum.ScaleType.Fit,
		Size = UDim2.fromScale(1, 1),
		ZIndex = var4.ZIndex,
		[reactModule.Tag] = var4.tag
	}, {
		CornerRadius = reactModule.createElement("UICorner", { CornerRadius = var4.cornerRadius })
	})
end
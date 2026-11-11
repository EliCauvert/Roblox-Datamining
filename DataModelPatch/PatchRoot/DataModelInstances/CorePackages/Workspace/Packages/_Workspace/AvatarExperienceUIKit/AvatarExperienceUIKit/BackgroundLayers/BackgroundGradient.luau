local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local config = {
	rotation = 90,
	offset = Vector2.new(),
	transparency = NumberSequence.new(0)
}

return function(p1)
	-- upvalues: DashModule (copy), config (copy), ReactModule (copy)
	local JoinResult = DashModule.join(config, p1)
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0,
		ZIndex = JoinResult.ZIndex,
		[ReactModule.Tag] = JoinResult.tag
	}, {
		CornerRadius = ReactModule.createElement("UICorner", { CornerRadius = JoinResult.cornerRadius }),
		UIGradient = ReactModule.createElement("UIGradient", {
			Color = JoinResult.colorSequence,
			Offset = JoinResult.offset,
			Rotation = JoinResult.rotation,
			Transparency = JoinResult.transparency
		})
	})
end
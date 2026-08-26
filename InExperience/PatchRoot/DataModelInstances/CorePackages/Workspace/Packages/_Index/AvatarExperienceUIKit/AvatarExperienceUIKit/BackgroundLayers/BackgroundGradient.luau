local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local t = {
	rotation = 90,
	offset = Vector2.new(),
	transparency = NumberSequence.new(0)
}

return function(value)
	-- upvalues: dashModule (ref), t (ref), reactModule (ref)
	local var1 = dashModule.join(t, value)
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0,
		ZIndex = var1.ZIndex,
		[reactModule.Tag] = var1.tag
	}, {
		CornerRadius = reactModule.createElement("UICorner", { CornerRadius = var1.cornerRadius }),
		UIGradient = reactModule.createElement("UIGradient", {
			Color = var1.colorSequence,
			Offset = var1.offset,
			Rotation = var1.rotation,
			Transparency = var1.transparency
		})
	})
end
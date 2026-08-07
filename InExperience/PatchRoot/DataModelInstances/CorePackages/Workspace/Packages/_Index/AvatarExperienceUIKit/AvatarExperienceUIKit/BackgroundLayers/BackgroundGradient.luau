local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local t = {
	rotation = 90,
	offset = Vector2.new(),
	transparency = NumberSequence.new(0)
}

return function(value) --[[ line: 22 | named "BackgroundGradient" ]]
	-- upvalues: dashModule (ref), t (ref), reactModule (ref)
	local var3 = dashModule.join(t, value)
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0,
		ZIndex = var3.ZIndex,
		[reactModule.Tag] = var3.tag
	}, {
		CornerRadius = reactModule.createElement("UICorner", { CornerRadius = var3.cornerRadius }),
		UIGradient = reactModule.createElement("UIGradient", {
			Color = var3.colorSequence,
			Offset = var3.offset,
			Rotation = var3.rotation,
			Transparency = var3.transparency
		})
	})
end
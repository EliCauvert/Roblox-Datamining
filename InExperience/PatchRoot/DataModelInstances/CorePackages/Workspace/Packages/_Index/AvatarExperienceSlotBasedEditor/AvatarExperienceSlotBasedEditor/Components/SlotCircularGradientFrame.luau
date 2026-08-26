local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local colorGradientCircle = require(parent.AXCommon).Components.ColorGradientCircle
local reactModule = require(parent.React)

return function(p1)
	-- upvalues: reactModule (ref), colorGradientCircle (ref)
	return reactModule.createElement(colorGradientCircle, {
		hasBorder = true,
		Colors = p1.Colors,
		Size = UDim2.fromScale(0.4, 0.4),
		Position = UDim2.fromScale(0.5, 0.5),
		Rotation = p1.Rotation,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Transparency = p1.Transparency,
		Offset = p1.Offset
	})
end
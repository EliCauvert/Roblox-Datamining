local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local colorGradientCircle = require(parent.AXCommon).Components.ColorGradientCircle
local reactModule = require(parent.React)

return function(p0) --[[ line: 18 | named "SlotCircularGradientFrame" ]]
	-- upvalues: reactModule (ref), colorGradientCircle (ref)
	return reactModule.createElement(colorGradientCircle, {
		hasBorder = true,
		Colors = p0.Colors,
		Size = UDim2.fromScale(0.4, 0.4),
		Position = UDim2.fromScale(0.5, 0.5),
		Rotation = p0.Rotation,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Transparency = p0.Transparency,
		Offset = p0.Offset
	})
end
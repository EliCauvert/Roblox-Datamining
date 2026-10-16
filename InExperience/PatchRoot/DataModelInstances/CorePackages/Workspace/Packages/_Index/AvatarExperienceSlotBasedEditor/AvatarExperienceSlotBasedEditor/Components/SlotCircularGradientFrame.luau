local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local ColorGradientCircle = require(Parent.AXCommon).Components.ColorGradientCircle
local ReactModule = require(Parent.React)

return function(p1) --[[ Line: 18 | Named "SlotCircularGradientFrame" ]]
	-- upvalues: ReactModule (copy), ColorGradientCircle (copy)
	return ReactModule.createElement(ColorGradientCircle, {
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
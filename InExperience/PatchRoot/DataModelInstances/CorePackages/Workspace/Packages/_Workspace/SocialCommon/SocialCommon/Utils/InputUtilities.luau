return {
	isActivationInput = function(p0)
		return if p0.UserInputType ~= Enum.UserInputType.MouseButton1 then p0.UserInputType == Enum.UserInputType.Touch else true
	end,
	isPointerInput = function(p1)
		return if p1.UserInputType ~= Enum.UserInputType.MouseMovement then p1.UserInputType == Enum.UserInputType.Touch else true
	end,
	isTouchInput = function(p2)
		return p2.UserInputType == Enum.UserInputType.Touch
	end
}
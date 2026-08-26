return {
	isActivationInput = function(p1)
		return if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then p1.UserInputType == Enum.UserInputType.Touch else true
	end,
	isPointerInput = function(p1)
		return if p1.UserInputType ~= Enum.UserInputType.MouseMovement then p1.UserInputType == Enum.UserInputType.Touch else true
	end,
	isTouchInput = function(p1)
		return p1.UserInputType == Enum.UserInputType.Touch
	end
}
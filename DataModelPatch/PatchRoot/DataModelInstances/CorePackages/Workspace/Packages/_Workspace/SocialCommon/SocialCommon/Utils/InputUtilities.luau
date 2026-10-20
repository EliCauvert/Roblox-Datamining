return {
	isActivationInput = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
	end,
	isPointerInput = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch
	end,
	isTouchInput = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.Touch
	end
}
return {
	isActivationInput = function(Input): boolean --[[ Line: 3 ]]
		return Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
	end,
	isPointerInput = function(Input): boolean --[[ Line: 8 ]]
		return Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch
	end,
	isTouchInput = function(Input): boolean --[[ Line: 13 ]]
		return Input.UserInputType == Enum.UserInputType.Touch
	end
}
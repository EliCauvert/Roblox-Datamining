return {
	isMouseWheel = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseWheel
	end,
	isPrimaryPointer = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseButton1
	end,
	isPanPointer = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseButton2 or Input.UserInputType == Enum.UserInputType.MouseButton3
	end,
	isMouseMovement = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseMovement
	end,
	isTouch = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.Touch
	end
}
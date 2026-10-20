local UserInputService = game:GetService("UserInputService")

return {
	isMouseWheel = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseWheel
	end,
	isPrimaryPointerBegan = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseButton1
	end,
	isPrimaryPointerEnded = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseButton1
	end,
	isMouseMovement = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseMovement
	end,
	isTouch = function(Input): boolean
		return Input.UserInputType == Enum.UserInputType.Touch
	end,
	isTouchEnabled = function()
		-- upvalues: UserInputService (copy)
		return UserInputService.TouchEnabled
	end
}
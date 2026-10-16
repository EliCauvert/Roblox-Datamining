local UserInputService = game:GetService("UserInputService")

return {
	isMouseWheel = function(Input): boolean --[[ Line: 8 ]]
		return Input.UserInputType == Enum.UserInputType.MouseWheel
	end,
	isPrimaryPointerBegan = function(Input): boolean --[[ Line: 12 ]]
		return Input.UserInputType == Enum.UserInputType.MouseButton1
	end,
	isPrimaryPointerEnded = function(Input): boolean --[[ Line: 16 ]]
		return Input.UserInputType == Enum.UserInputType.MouseButton1
	end,
	isMouseMovement = function(Input): boolean --[[ Line: 20 ]]
		return Input.UserInputType == Enum.UserInputType.MouseMovement
	end,
	isTouch = function(Input): boolean --[[ Line: 24 ]]
		return Input.UserInputType == Enum.UserInputType.Touch
	end,
	isTouchEnabled = function() --[[ Line: 28 ]]
		-- upvalues: UserInputService (copy)
		return UserInputService.TouchEnabled
	end
}
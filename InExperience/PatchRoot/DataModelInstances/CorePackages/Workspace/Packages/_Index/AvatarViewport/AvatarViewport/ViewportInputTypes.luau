local userInputService = game:GetService("UserInputService")

return {
	isMouseWheel = function(p1)
		return p1.UserInputType == Enum.UserInputType.MouseWheel
	end,
	isPrimaryPointerBegan = function(p1)
		return p1.UserInputType == Enum.UserInputType.MouseButton1
	end,
	isPrimaryPointerEnded = function(p1)
		return p1.UserInputType == Enum.UserInputType.MouseButton1
	end,
	isMouseMovement = function(p1)
		return p1.UserInputType == Enum.UserInputType.MouseMovement
	end,
	isTouch = function(p1)
		return p1.UserInputType == Enum.UserInputType.Touch
	end,
	isTouchEnabled = function()
		-- upvalues: userInputService (ref)
		return userInputService.TouchEnabled
	end
}
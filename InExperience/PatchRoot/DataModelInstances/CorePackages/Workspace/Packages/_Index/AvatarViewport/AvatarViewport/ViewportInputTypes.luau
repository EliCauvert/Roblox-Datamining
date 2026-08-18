local userInputService = game:GetService("UserInputService")

return {
	isMouseWheel = function(p0) --[[ line: 9 ]]
		return p0.UserInputType == Enum.UserInputType.MouseWheel
	end,
	isPrimaryPointerBegan = function(p1) --[[ line: 13 ]]
		return p1.UserInputType == Enum.UserInputType.MouseButton1
	end,
	isPrimaryPointerEnded = function(p2) --[[ line: 17 ]]
		return p2.UserInputType == Enum.UserInputType.MouseButton1
	end,
	isMouseMovement = function(p3) --[[ line: 21 ]]
		return p3.UserInputType == Enum.UserInputType.MouseMovement
	end,
	isTouch = function(p4) --[[ line: 25 ]]
		return p4.UserInputType == Enum.UserInputType.Touch
	end,
	isTouchEnabled = function() --[[ line: 29 ]]
		-- upvalues: userInputService (ref)
		return userInputService.TouchEnabled
	end
}
local UserInputService = game:GetService("UserInputService")

return function(GamepadKeyCodes, GamepadNum): boolean
	-- upvalues: UserInputService (copy)
	for _, gamepadKeyCode in GamepadKeyCodes do
		if not UserInputService:GamepadSupports(GamepadNum, gamepadKeyCode) then
			return false
		end
	end
	return true
end
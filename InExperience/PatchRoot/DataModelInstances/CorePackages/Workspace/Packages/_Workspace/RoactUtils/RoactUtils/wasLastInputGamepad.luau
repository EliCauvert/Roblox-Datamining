local UserInputService = game:GetService("UserInputService")
local IsGamepadInputModule = require(script.Parent.isGamepadInput)

return function()
	-- upvalues: UserInputService (copy), IsGamepadInputModule (copy)
	return IsGamepadInputModule((UserInputService:GetLastInputType()))
end
local UserInputService = game:GetService("UserInputService")
local IsGamepadInputModule = require(script.Parent.isGamepadInput)

return function() --[[ Line: 5 | Named "wasLastInputGamepad" ]]
	-- upvalues: UserInputService (copy), IsGamepadInputModule (copy)
	return IsGamepadInputModule((UserInputService:GetLastInputType()))
end
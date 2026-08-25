local userInputService = game:GetService("UserInputService")
local isGamepadInputModule = require(script.Parent.isGamepadInput)

return function()
	-- upvalues: userInputService (ref), isGamepadInputModule (ref)
	return isGamepadInputModule(userInputService:GetLastInputType())
end
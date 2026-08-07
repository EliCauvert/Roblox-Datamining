local userInputService = game:GetService("UserInputService")
local isGamepadInputModule = require(script.Parent.isGamepadInput)

return function() --[[ line: 5 | named "wasLastInputGamepad" ]]
	-- upvalues: userInputService (ref), isGamepadInputModule (ref)
	return isGamepadInputModule(userInputService:GetLastInputType())
end
local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local _ = require(foundation.Utility.Input.InputMode)
local getInputModeModule = require(foundation.Utility.Input.getInputMode)

local function getLastInputMode()
	-- upvalues: getInputModeModule (ref), userInputService (ref)
	return getInputModeModule(userInputService:GetLastInputType())
end

return function()
	-- upvalues: reactModule (ref), getLastInputMode (ref), useEventConnection (ref), userInputService (ref)
	local var1, var2 = reactModule.useState(getLastInputMode)
	useEventConnection(userInputService.LastInputTypeChanged, function()
		-- upvalues: var2 (ref), getLastInputMode (copy)
		var2(getLastInputMode())
	end)
	
	return var1
end
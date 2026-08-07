local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local _ = require(foundation.Utility.Input.InputMode)
local getInputModeModule = require(foundation.Utility.Input.getInputMode)

local function getLastInputMode() --[[ line: 16 ]]
	-- upvalues: getInputModeModule (ref), userInputService (ref)
	return getInputModeModule(userInputService:GetLastInputType())
end

return function() --[[ line: 20 | named "useLastInputMode" ]]
	-- upvalues: reactModule (ref), getLastInputMode (ref), useEventConnection (ref), userInputService (ref)
	local var5, var6 = reactModule.useState(getLastInputMode)
	useEventConnection(userInputService.LastInputTypeChanged, function() --[[ line: 23 ]]
		-- upvalues: var6 (ref), getLastInputMode (copy)
		var6(getLastInputMode())
	end)
	
	return var5
end
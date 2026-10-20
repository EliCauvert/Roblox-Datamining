local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local _ = require(Foundation.Utility.Input.InputMode)
local GetInputModeModule = require(Foundation.Utility.Input.getInputMode)

local function getLastInputMode()
	-- upvalues: GetInputModeModule (copy), UserInputService (copy)
	return GetInputModeModule(UserInputService:GetLastInputType())
end

return function()
	-- upvalues: ReactModule (copy), getLastInputMode (copy), UseEventConnectionFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(getLastInputMode)
	UseEventConnectionFunction(UserInputService.LastInputTypeChanged, function()
		-- upvalues: UseStateResult2 (copy), getLastInputMode (upval)
		UseStateResult2(getLastInputMode())
	end)
	
	return UseStateResult
end
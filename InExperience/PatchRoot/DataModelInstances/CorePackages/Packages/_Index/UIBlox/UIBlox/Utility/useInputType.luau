local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local InputTypeModule = require(Parent.Enums.InputType)
local ReactModule = require(Parent1.React)
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local config = {
	[Enum.UserInputType.Gamepad1] = InputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad2] = InputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad3] = InputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad4] = InputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad5] = InputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad6] = InputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad7] = InputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad8] = InputTypeModule.Gamepad,
	[Enum.UserInputType.MouseButton1] = InputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseButton2] = InputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseButton3] = InputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseWheel] = InputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseMovement] = InputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.Keyboard] = InputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.TextInput] = InputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.Touch] = InputTypeModule.Touch
}

return function(p1) --[[ Line: 47 | Named "useInputType" ]]
	-- upvalues: UserInputService (copy), config (copy), ReactModule (copy), UseEventConnectionFunction (copy)
	local P0 = p1 or UserInputService
	
	local function _() --[[ Line: 50 | Named "getLastInputType" ]]
		-- upvalues: P0 (copy), config (upval)
		return config[P0:GetLastInputType()]
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(config[P0:GetLastInputType()])
	UseEventConnectionFunction(P0.LastInputTypeChanged, (ReactModule.useCallback(function(p2) --[[ Line: 58 ]]
		-- upvalues: config (upval), UseStateResult2 (copy)
		local Entry = config[p2]
		
		if Entry ~= nil then
			UseStateResult2(Entry)
		end
	end)))
	ReactModule.useEffect(function() --[[ Line: 69 ]]
		-- upvalues: UseStateResult2 (copy), P0 (copy), config (upval)
		UseStateResult2(config[P0:GetLastInputType()])
	end, {})
	
	return UseStateResult
end
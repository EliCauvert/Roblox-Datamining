local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local inputTypeModule = require(parent.Enums.InputType)
local reactModule = require(parent_1.React)
local useEventConnection = require(parent_1.ReactUtils).useEventConnection
local t = {
	[Enum.UserInputType.Gamepad1] = inputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad2] = inputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad3] = inputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad4] = inputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad5] = inputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad6] = inputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad7] = inputTypeModule.Gamepad,
	[Enum.UserInputType.Gamepad8] = inputTypeModule.Gamepad,
	[Enum.UserInputType.MouseButton1] = inputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseButton2] = inputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseButton3] = inputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseWheel] = inputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseMovement] = inputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.Keyboard] = inputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.TextInput] = inputTypeModule.MouseAndKeyboard,
	[Enum.UserInputType.Touch] = inputTypeModule.Touch
}

return function(p1)
	-- upvalues: userInputService (ref), t (ref), reactModule (ref), useEventConnection (ref)
	p1 = p1 or userInputService
	
	local function _()
		-- upvalues: p1 (ref), t (copy)
		return t[p1:GetLastInputType()]
	end
	
	local var1, var2 = reactModule.useState(t[p1:GetLastInputType()])
	useEventConnection(p1.LastInputTypeChanged, reactModule.useCallback(function(p2)
		-- upvalues: t (copy), var2 (ref)
		local var3 = t[p2]
		
		if var3 ~= nil then
			var2(var3)
		end
	end))
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), t (copy)
		var2(t[p1:GetLastInputType()])
	end, {})
	
	return var1
end
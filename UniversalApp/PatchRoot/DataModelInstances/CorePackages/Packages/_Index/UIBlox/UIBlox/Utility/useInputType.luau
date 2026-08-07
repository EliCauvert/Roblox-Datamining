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

return function(p0) --[[ line: 47 | named "useInputType" ]]
	-- upvalues: userInputService (ref), t (ref), reactModule (ref), useEventConnection (ref)
	p0 = p0 or userInputService
	
	local function _() --[[ line: 50 | named "getLastInputType" ]]
		-- upvalues: p0 (ref), t (copy)
		return t[p0:GetLastInputType()]
	end
	
	local var5, var6 = reactModule.useState(t[p0:GetLastInputType()])
	useEventConnection(p0.LastInputTypeChanged, reactModule.useCallback(function(p1) --[[ line: 58 ]]
		-- upvalues: t (copy), var6 (ref)
		local var7 = t[p1]
		
		if var7 ~= nil then
			var6(var7)
		end
	end))
	reactModule.useEffect(function() --[[ line: 69 ]]
		-- upvalues: var6 (ref), p0 (ref), t (copy)
		var6(t[p0:GetLastInputType()])
	end, {})
	
	return var5
end
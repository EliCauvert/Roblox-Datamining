-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local inputModeModule = require(script:FindFirstAncestor("Foundation").Utility.Input.InputMode)
local t = {
	[Enum.UserInputType.MouseButton1] = inputModeModule.Pointer,
	[Enum.UserInputType.MouseButton2] = inputModeModule.Pointer,
	[Enum.UserInputType.MouseButton3] = inputModeModule.Pointer,
	[Enum.UserInputType.MouseMovement] = inputModeModule.Pointer,
	[Enum.UserInputType.MouseWheel] = inputModeModule.Pointer,
	[Enum.UserInputType.None] = inputModeModule.Pointer,
	[Enum.UserInputType.TextInput] = inputModeModule.Pointer,
	[Enum.UserInputType.Gamepad1] = inputModeModule.Directional,
	[Enum.UserInputType.Gamepad2] = inputModeModule.Directional,
	[Enum.UserInputType.Gamepad3] = inputModeModule.Directional,
	[Enum.UserInputType.Gamepad4] = inputModeModule.Directional,
	[Enum.UserInputType.Gamepad5] = inputModeModule.Directional,
	[Enum.UserInputType.Gamepad6] = inputModeModule.Directional,
	[Enum.UserInputType.Gamepad7] = inputModeModule.Directional,
	[Enum.UserInputType.Gamepad8] = inputModeModule.Directional,
	[Enum.UserInputType.Keyboard] = inputModeModule.Directional,
	[Enum.UserInputType.Touch] = inputModeModule.Touch
}

return function(p0) --[[ line: 28 | named "getInputMode" ]]
	-- upvalues: t (ref)
	return t[p0]
end
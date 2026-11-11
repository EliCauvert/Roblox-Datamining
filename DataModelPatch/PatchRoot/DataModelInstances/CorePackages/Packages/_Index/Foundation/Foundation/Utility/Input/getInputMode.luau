local InputModeModule = require(script:FindFirstAncestor("Foundation").Utility.Input.InputMode)
local config = {
	[Enum.UserInputType.MouseButton1] = InputModeModule.Pointer,
	[Enum.UserInputType.MouseButton2] = InputModeModule.Pointer,
	[Enum.UserInputType.MouseButton3] = InputModeModule.Pointer,
	[Enum.UserInputType.MouseMovement] = InputModeModule.Pointer,
	[Enum.UserInputType.MouseWheel] = InputModeModule.Pointer,
	[Enum.UserInputType.None] = InputModeModule.Pointer,
	[Enum.UserInputType.TextInput] = InputModeModule.Pointer,
	[Enum.UserInputType.Gamepad1] = InputModeModule.Directional,
	[Enum.UserInputType.Gamepad2] = InputModeModule.Directional,
	[Enum.UserInputType.Gamepad3] = InputModeModule.Directional,
	[Enum.UserInputType.Gamepad4] = InputModeModule.Directional,
	[Enum.UserInputType.Gamepad5] = InputModeModule.Directional,
	[Enum.UserInputType.Gamepad6] = InputModeModule.Directional,
	[Enum.UserInputType.Gamepad7] = InputModeModule.Directional,
	[Enum.UserInputType.Gamepad8] = InputModeModule.Directional,
	[Enum.UserInputType.Keyboard] = InputModeModule.Directional,
	[Enum.UserInputType.Touch] = InputModeModule.Touch
}

return function(p1)
	-- upvalues: config (copy)
	return config[p1]
end
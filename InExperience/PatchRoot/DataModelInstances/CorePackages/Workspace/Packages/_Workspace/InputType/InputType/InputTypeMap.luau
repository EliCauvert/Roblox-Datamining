local inputTypeConstantsModule = require(script.Parent.InputTypeConstants)

return {
	[Enum.UserInputType.MouseButton1] = inputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseButton2] = inputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseButton3] = inputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseWheel] = inputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseMovement] = inputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.Keyboard] = inputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.TextInput] = inputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.Gamepad1] = inputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad2] = inputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad3] = inputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad4] = inputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad5] = inputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad6] = inputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad7] = inputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad8] = inputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Touch] = inputTypeConstantsModule.Touch,
	[Enum.UserInputType.None] = inputTypeConstantsModule.None
}
local InputTypeConstantsModule = require(script.Parent.InputTypeConstants)

return {
	[Enum.UserInputType.MouseButton1] = InputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseButton2] = InputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseButton3] = InputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseWheel] = InputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.MouseMovement] = InputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.Keyboard] = InputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.TextInput] = InputTypeConstantsModule.MouseAndKeyboard,
	[Enum.UserInputType.Gamepad1] = InputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad2] = InputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad3] = InputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad4] = InputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad5] = InputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad6] = InputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad7] = InputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Gamepad8] = InputTypeConstantsModule.Gamepad,
	[Enum.UserInputType.Touch] = InputTypeConstantsModule.Touch,
	[Enum.UserInputType.None] = InputTypeConstantsModule.None
}
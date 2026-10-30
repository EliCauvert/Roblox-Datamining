local config = {
	[Enum.UserInputType.MouseWheel] = true,
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.Touch] = true
}
local config1 = {
	[Enum.UserInputType.Gamepad1] = true,
	[Enum.UserInputType.Gamepad2] = true,
	[Enum.UserInputType.Gamepad3] = true,
	[Enum.UserInputType.Gamepad4] = true,
	[Enum.UserInputType.Gamepad5] = true,
	[Enum.UserInputType.Gamepad6] = true,
	[Enum.UserInputType.Gamepad7] = true,
	[Enum.UserInputType.Gamepad8] = true
}
local config2 = {
	[Enum.KeyCode.Thumbstick1] = true,
	[Enum.KeyCode.Thumbstick2] = true
}

return function(Input, p1): boolean
	-- upvalues: config (copy), config1 (copy), config2 (copy)
	return if config[Input.UserInputType] then true elseif config1[Input.UserInputType] then not p1 or config2[Input.KeyCode] == true and Input.Position.Magnitude > 0.2 else false
end
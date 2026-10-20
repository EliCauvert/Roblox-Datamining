local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script.Parent.Parent.React)
local config = {
	[Enum.UserInputType.MouseButton1] = "Mouse",
	[Enum.UserInputType.MouseButton2] = "Mouse",
	[Enum.UserInputType.MouseButton3] = "Mouse",
	[Enum.UserInputType.MouseWheel] = "Mouse",
	[Enum.UserInputType.MouseMovement] = "Mouse",
	[Enum.UserInputType.Touch] = "Touch",
	[Enum.UserInputType.Keyboard] = "Keyboard",
	[Enum.UserInputType.Focus] = nil,
	[Enum.UserInputType.Accelerometer] = nil,
	[Enum.UserInputType.Gyro] = nil,
	[Enum.UserInputType.Gamepad1] = "Gamepad",
	[Enum.UserInputType.Gamepad2] = "Gamepad",
	[Enum.UserInputType.Gamepad3] = "Gamepad",
	[Enum.UserInputType.Gamepad4] = "Gamepad",
	[Enum.UserInputType.Gamepad5] = "Gamepad",
	[Enum.UserInputType.Gamepad6] = "Gamepad",
	[Enum.UserInputType.Gamepad7] = "Gamepad",
	[Enum.UserInputType.Gamepad8] = "Gamepad",
	[Enum.UserInputType.TextInput] = nil,
	[Enum.UserInputType.InputMethod] = nil,
	[Enum.UserInputType.None] = nil
}

return function()
	-- upvalues: config (copy), UserInputService (copy), ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(config[UserInputService:GetLastInputType()] or "None")
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), config (upval), UseStateResult2 (copy)
		local LastInputTypeChangedConnection = UserInputService.LastInputTypeChanged:Connect(function(LastInputType)
			-- upvalues: config (upval), UseStateResult2 (upval)
			local Entry = config[LastInputType]
			
			if Entry then
				UseStateResult2(Entry)
			end
		end)
		
		return function()
			-- upvalues: LastInputTypeChangedConnection (copy)
			LastInputTypeChangedConnection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end
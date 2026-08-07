local userInputService = game:GetService("UserInputService")
local reactModule = require(script.Parent.Parent.React)
local t = {
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

return function() --[[ line: 43 | named "useLastInputMethod" ]]
	-- upvalues: t (ref), userInputService (ref), reactModule (ref)
	local var3, var4 = reactModule.useState(t[userInputService:GetLastInputType()] or "None")
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: userInputService (copy), t (copy), var4 (ref)
		local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p0) --[[ line: 47 ]]
			-- upvalues: t (copy), var4 (copy)
			local var6 = t[p0]
			
			if var6 then
				var4(var6)
			end
		end)
		
		return function() --[[ line: 54 ]]
			-- upvalues: lastInputTypeChangedConnection (ref)
			lastInputTypeChangedConnection:Disconnect()
		end
	end, {})
	
	return var3
end
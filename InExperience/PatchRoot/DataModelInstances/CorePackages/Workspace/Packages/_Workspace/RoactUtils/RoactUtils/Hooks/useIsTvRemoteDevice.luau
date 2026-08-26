local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local var1 = if game:GetEngineFeature("EnableMicroGamepadKeycodes") then Enum.KeyCode.ButtonCenter else Enum.KeyCode.Return

return function()
	-- upvalues: reactModule (ref), userInputService (ref), var1 (ref)
	local var2 = reactModule.useCallback(function()
		-- upvalues: userInputService (copy), var1 (copy)
		if userInputService.PreferredInput ~= Enum.PreferredInput.Gamepad then
			return false
		end
		for i, v in ipairs(userInputService:GetConnectedGamepads()) do
			if userInputService:GamepadSupports(v, var1) then
				return true
			end
		end
		return false
	end, {})
	local var3, var4 = reactModule.useState(function()
		-- upvalues: var2 (ref)
		return var2()
	end)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var4 (ref), var2 (ref)
		local gamepadConnectedConnection = userInputService.GamepadConnected:Connect(function()
			-- upvalues: var4 (copy), var2 (copy)
			var4(var2())
		end)
		local var5 = userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: var4 (copy), var2 (copy)
			var4(var2())
		end)
		var4(var2())
		
		return function()
			-- upvalues: gamepadConnectedConnection (ref), var5 (ref)
			gamepadConnectedConnection:Disconnect()
			var5:Disconnect()
		end
	end, { var2 })
	
	return var3
end
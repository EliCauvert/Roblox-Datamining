local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local var2 = if game:GetEngineFeature("EnableMicroGamepadKeycodes") then Enum.KeyCode.ButtonCenter else Enum.KeyCode.Return

return function() --[[ line: 27 | named "useIsTvRemoteDevice" ]]
	-- upvalues: reactModule (ref), userInputService (ref), var2 (ref)
	local var3 = reactModule.useCallback(function() --[[ line: 28 ]]
		-- upvalues: userInputService (copy), var2 (copy)
		if userInputService.PreferredInput ~= Enum.PreferredInput.Gamepad then
			return false
		end
		for i, v in ipairs(userInputService:GetConnectedGamepads()) do
			if userInputService:GamepadSupports(v, var2) then
				return true
			end
		end
		return false
	end, {})
	local var4, var5 = reactModule.useState(function() --[[ line: 42 ]]
		-- upvalues: var3 (ref)
		return var3()
	end)
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: userInputService (copy), var5 (ref), var3 (ref)
		local gamepadConnectedConnection = userInputService.GamepadConnected:Connect(function() --[[ line: 47 ]]
			-- upvalues: var5 (copy), var3 (copy)
			var5(var3())
		end)
		local var7 = userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ line: 51 ]]
			-- upvalues: var5 (copy), var3 (copy)
			var5(var3())
		end)
		var5(var3())
		
		return function() --[[ line: 57 ]]
			-- upvalues: gamepadConnectedConnection (ref), var7 (ref)
			gamepadConnectedConnection:Disconnect()
			var7:Disconnect()
		end
	end, { var3 })
	
	return var4
end
local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function() --[[ line: 20 | named "useIsTvRemoteDevice" ]]
	-- upvalues: reactModule (ref), userInputService (ref)
	local var2 = reactModule.useCallback(function() --[[ line: 21 ]]
		-- upvalues: userInputService (copy)
		if userInputService.PreferredInput ~= Enum.PreferredInput.Gamepad then
			return false
		end
		for i, v in ipairs(userInputService:GetConnectedGamepads()) do
			if userInputService:GamepadSupports(v, Enum.KeyCode.Return) then
				return true
			end
		end
		return false
	end, {})
	local var3, var4 = reactModule.useState(function() --[[ line: 35 ]]
		-- upvalues: var2 (ref)
		return var2()
	end)
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: userInputService (copy), var4 (ref), var2 (ref)
		local gamepadConnectedConnection = userInputService.GamepadConnected:Connect(function() --[[ line: 40 ]]
			-- upvalues: var4 (copy), var2 (copy)
			var4(var2())
		end)
		local var6 = userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ line: 44 ]]
			-- upvalues: var4 (copy), var2 (copy)
			var4(var2())
		end)
		var4(var2())
		
		return function() --[[ line: 50 ]]
			-- upvalues: gamepadConnectedConnection (ref), var6 (ref)
			gamepadConnectedConnection:Disconnect()
			var6:Disconnect()
		end
	end, { var2 })
	
	return var3
end
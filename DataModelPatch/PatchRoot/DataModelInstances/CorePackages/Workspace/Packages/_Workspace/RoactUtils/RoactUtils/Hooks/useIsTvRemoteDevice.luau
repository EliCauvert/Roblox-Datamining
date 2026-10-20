local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function()
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseResult = ReactModule.useCallback(function(): boolean
		-- upvalues: UserInputService (upval)
		if UserInputService.PreferredInput ~= Enum.PreferredInput.Gamepad then
			return false
		end
		for _, connectedGamepad in ipairs(UserInputService:GetConnectedGamepads()) do
			if UserInputService:GamepadSupports(connectedGamepad, Enum.KeyCode.Return) then
				return true
			end
		end
		return false
	end, {})
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: UseResult (copy)
		return UseResult()
	end)
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseStateResult2 (copy), UseResult (copy)
		local GamepadConnectedConnection = UserInputService.GamepadConnected:Connect(function()
			-- upvalues: UseStateResult2 (upval), UseResult (upval)
			UseStateResult2(UseResult())
		end)
		local Connection = UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UseResult (upval)
			UseStateResult2(UseResult())
		end)
		UseStateResult2(UseResult())
		
		return function()
			-- upvalues: GamepadConnectedConnection (copy), Connection (copy)
			GamepadConnectedConnection:Disconnect()
			Connection:Disconnect()
		end
	end, { UseResult })
	
	return UseStateResult
end
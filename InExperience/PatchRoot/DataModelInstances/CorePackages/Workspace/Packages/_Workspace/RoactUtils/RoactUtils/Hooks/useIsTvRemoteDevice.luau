local Parent = script:FindFirstAncestor("RoactUtils").Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local FFlagLuaSupportMicroGamepadPreferredInput = require(Parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local ButtonCenter = if game:GetEngineFeature("EnableMicroGamepadKeycodes") then Enum.KeyCode.ButtonCenter else Enum.KeyCode.Return

return function()
	-- upvalues: ReactModule (copy), FFlagLuaSupportMicroGamepadPreferredInput (copy), UserInputService (copy), ButtonCenter (copy)
	local UseResult = ReactModule.useCallback(function(): boolean
		-- upvalues: FFlagLuaSupportMicroGamepadPreferredInput (upval), UserInputService (upval), ButtonCenter (upval)
		local IsPreferredInputMatch: boolean = FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad
		
		if UserInputService.PreferredInput ~= Enum.PreferredInput.Gamepad and not IsPreferredInputMatch then
			return false
		end
		for _, connectedGamepad in ipairs(UserInputService:GetConnectedGamepads()) do
			if UserInputService:GamepadSupports(connectedGamepad, ButtonCenter) then
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
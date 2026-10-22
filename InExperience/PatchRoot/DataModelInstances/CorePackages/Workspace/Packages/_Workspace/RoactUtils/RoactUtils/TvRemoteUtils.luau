local Parent = script:FindFirstAncestor("RoactUtils").Parent
local UserInputService = require(Parent.MockableProxyServices).UserInputService
local FFlagLuaSupportMicroGamepadPreferredInput = require(Parent.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local ButtonCenter = if game:GetEngineFeature("EnableMicroGamepadKeycodes") then Enum.KeyCode.ButtonCenter else Enum.KeyCode.Return

return {
	isTvRemoteDevice = function(): boolean
		-- upvalues: FFlagLuaSupportMicroGamepadPreferredInput (copy), UserInputService (copy), ButtonCenter (copy)
		local IsPreferredInputMatch: boolean = FFlagLuaSupportMicroGamepadPreferredInput and UserInputService.PreferredInput == Enum.PreferredInput.MicroGamepad
		
		if UserInputService.PreferredInput ~= Enum.PreferredInput.Gamepad and not IsPreferredInputMatch then
			return false
		end
		for _, connectedGamepad in UserInputService:GetConnectedGamepads() do
			if UserInputService:GamepadSupports(connectedGamepad, ButtonCenter) then
				return true
			end
		end
		return false
	end,
	isRealGamepadConnected = function(): boolean
		-- upvalues: UserInputService (copy), ButtonCenter (copy)
		for _, connectedGamepad in UserInputService:GetConnectedGamepads() do
			if not UserInputService:GamepadSupports(connectedGamepad, ButtonCenter) then
				return true
			end
		end
		return false
	end
}
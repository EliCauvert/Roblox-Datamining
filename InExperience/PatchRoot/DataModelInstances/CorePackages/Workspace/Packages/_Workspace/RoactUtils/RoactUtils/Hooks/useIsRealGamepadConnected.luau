local RoactUtils = script:FindFirstAncestor("RoactUtils")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(RoactUtils.Parent.React)
local UseExternalEventModule = require(script.Parent.useExternalEvent)
local TvRemoteUtilsModule = require(RoactUtils.TvRemoteUtils)

return function()
	-- upvalues: ReactModule (copy), TvRemoteUtilsModule (copy), UseExternalEventModule (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(TvRemoteUtilsModule.isRealGamepadConnected)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), TvRemoteUtilsModule (upval)
		UseStateResult2(TvRemoteUtilsModule.isRealGamepadConnected())
	end, {})
	UseExternalEventModule(UserInputService.GamepadConnected, UseResult)
	UseExternalEventModule(UserInputService.GamepadDisconnected, UseResult)
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	
	return UseStateResult
end
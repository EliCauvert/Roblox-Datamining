local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local UseExternalEventModule = require(script.Parent.useExternalEvent)
local DoesGamepadSupportKeyCodesModule = require(script.Parent.doesGamepadSupportKeyCodes)

return function(p1, p2) --[[ Line: 17 | Named "useGamepadSupports" ]]
	-- upvalues: ReactModule (copy), DoesGamepadSupportKeyCodesModule (copy), UserInputService (copy), UseExternalEventModule (copy)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 18 ]]
		-- upvalues: DoesGamepadSupportKeyCodesModule (upval), p1 (copy), UserInputService (upval)
		return DoesGamepadSupportKeyCodesModule(p1, UserInputService:GetLastInputType())
	end, { p1, p2 })
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseResult)
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 24 ]]
		-- upvalues: UseStateResult2 (copy), UseResult (copy)
		UseStateResult2(UseResult())
	end, { UseResult })
	UseExternalEventModule(UserInputService.GamepadConnected, UseResult1)
	UseExternalEventModule(UserInputService.GamepadDisconnected, UseResult1)
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: UseResult1 (copy)
		UseResult1()
	end, { UseResult1 })
	
	return UseStateResult
end
local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local useExternalEventModule = require(script.Parent.useExternalEvent)
local doesGamepadSupportKeyCodesModule = require(script.Parent.doesGamepadSupportKeyCodes)

return function(p0, p1) --[[ line: 17 | named "useGamepadSupports" ]]
	-- upvalues: reactModule (ref), doesGamepadSupportKeyCodesModule (ref), userInputService (ref), useExternalEventModule (ref)
	local var4 = reactModule.useCallback(function() --[[ line: 18 ]]
		-- upvalues: doesGamepadSupportKeyCodesModule (copy), p0 (ref), userInputService (copy)
		return doesGamepadSupportKeyCodesModule(p0, userInputService:GetLastInputType())
	end, { p0, p1 })
	local var5, var6 = reactModule.useState(var4)
	local var7 = reactModule.useCallback(function() --[[ line: 24 ]]
		-- upvalues: var6 (ref), var4 (ref)
		var6(var4())
	end, { var4 })
	useExternalEventModule(userInputService.GamepadConnected, var7)
	useExternalEventModule(userInputService.GamepadDisconnected, var7)
	reactModule.useEffect(function() --[[ line: 31 ]]
		-- upvalues: var7 (ref)
		var7()
	end, { var7 })
	
	return var5
end
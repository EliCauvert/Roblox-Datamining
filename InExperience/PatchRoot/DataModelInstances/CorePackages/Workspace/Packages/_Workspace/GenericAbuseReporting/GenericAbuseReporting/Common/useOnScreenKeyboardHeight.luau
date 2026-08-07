local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local userInputService = game:GetService("UserInputService")

return function() --[[ line: 14 ]]
	-- upvalues: reactModule (ref), userInputService (ref)
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(0)
	local var6, var7 = reactModule.useState(0)
	reactModule.useEffect(function() --[[ line: 19 ]]
		-- upvalues: userInputService (copy), var3 (ref), var5 (ref), var7 (ref)
		local function updateKeyboardState() --[[ line: 20 ]]
			-- upvalues: userInputService (copy), var3 (copy), var5 (copy), var7 (copy)
			local onScreenKeyboardVisible = userInputService.OnScreenKeyboardVisible
			local y = userInputService.OnScreenKeyboardSize.Y
			local y_1 = userInputService.OnScreenKeyboardPosition.Y
			var3(onScreenKeyboardVisible)
			var5(if onScreenKeyboardVisible then y else 0)
			var7(if onScreenKeyboardVisible then y_1 else 0)
		end
		
		local onScreenKeyboardVisible = userInputService.OnScreenKeyboardVisible
		local y = userInputService.OnScreenKeyboardSize.Y
		local y_1 = userInputService.OnScreenKeyboardPosition.Y
		var3(onScreenKeyboardVisible)
		var5(if onScreenKeyboardVisible then y else 0)
		var7(if onScreenKeyboardVisible then y_1 else 0)
		local var9 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateKeyboardState)
		local var10 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(updateKeyboardState)
		local var11 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateKeyboardState)
		
		return function() --[[ line: 38 ]]
			-- upvalues: var9 (ref), var10 (ref), var11 (ref)
			if var9 then
				var9:Disconnect()
			end
			if var10 then
				var10:Disconnect()
			end
			if var11 then
				var11:Disconnect()
			end
		end
	end, {})
	
	return {
		isKeyboardShowing = var2,
		onScreenKeyboardHeight = var4,
		keyboardPositionY = var6
	}
end
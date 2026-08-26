local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local userInputService = game:GetService("UserInputService")

return function()
	-- upvalues: reactModule (ref), userInputService (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(0)
	local var5, var6 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var2 (ref), var4 (ref), var6 (ref)
		local function updateKeyboardState()
			-- upvalues: userInputService (copy), var2 (copy), var4 (copy), var6 (copy)
			local onScreenKeyboardVisible = userInputService.OnScreenKeyboardVisible
			local y = userInputService.OnScreenKeyboardSize.Y
			local y_1 = userInputService.OnScreenKeyboardPosition.Y
			var2(onScreenKeyboardVisible)
			var4(if onScreenKeyboardVisible then y else 0)
			var6(if onScreenKeyboardVisible then y_1 else 0)
		end
		
		local onScreenKeyboardVisible = userInputService.OnScreenKeyboardVisible
		local y = userInputService.OnScreenKeyboardSize.Y
		local y_1 = userInputService.OnScreenKeyboardPosition.Y
		var2(onScreenKeyboardVisible)
		var4(if onScreenKeyboardVisible then y else 0)
		var6(if onScreenKeyboardVisible then y_1 else 0)
		local var7 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateKeyboardState)
		local var8 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(updateKeyboardState)
		local var9 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateKeyboardState)
		
		return function()
			-- upvalues: var7 (ref), var8 (ref), var9 (ref)
			if var7 then
				var7:Disconnect()
			end
			if var8 then
				var8:Disconnect()
			end
			if var9 then
				var9:Disconnect()
			end
		end
	end, {})
	
	return {
		isKeyboardShowing = var1,
		onScreenKeyboardHeight = var3,
		keyboardPositionY = var5
	}
end
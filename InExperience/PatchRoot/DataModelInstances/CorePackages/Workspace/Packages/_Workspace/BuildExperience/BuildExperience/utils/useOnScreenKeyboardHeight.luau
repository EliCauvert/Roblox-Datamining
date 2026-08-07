local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function() --[[ line: 8 | named "useOnScreenKeyboardHeight" ]]
	-- upvalues: userInputService (ref), reactModule (ref)
	local var2, var3 = reactModule.useState(function() --[[ line: 9 | named "read" ]]
		-- upvalues: userInputService (copy)
		return if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0
	end)
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: var3 (ref), userInputService (copy)
		local function update() --[[ line: 19 ]]
			-- upvalues: var3 (copy), userInputService (copy)
			var3(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end
		
		local var5 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(update)
		local var6 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(update)
		var3(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		
		return function() --[[ line: 27 ]]
			-- upvalues: var5 (ref), var6 (ref)
			var5:Disconnect()
			var6:Disconnect()
		end
	end, {})
	
	return var2
end
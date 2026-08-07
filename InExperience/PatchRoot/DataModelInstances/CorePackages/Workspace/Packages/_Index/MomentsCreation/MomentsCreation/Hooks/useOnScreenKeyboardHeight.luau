local reactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local userInputService = game:GetService("UserInputService")

return function() --[[ line: 15 | named "useOnScreenKeyboardHeight" ]]
	-- upvalues: reactModule (ref), userInputService (ref)
	local var2, var3 = reactModule.useState(0)
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: userInputService (copy), var3 (ref)
		local var4 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ line: 19 ]]
			-- upvalues: var3 (copy), userInputService (copy)
			var3(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		
		return function() --[[ line: 25 ]]
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end
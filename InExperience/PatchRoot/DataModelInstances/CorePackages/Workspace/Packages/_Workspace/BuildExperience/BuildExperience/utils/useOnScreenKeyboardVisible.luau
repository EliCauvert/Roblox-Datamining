local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function() --[[ line: 5 | named "useOnScreenKeyboardVisible" ]]
	-- upvalues: reactModule (ref), userInputService (ref)
	local var2, var3 = reactModule.useState(userInputService.OnScreenKeyboardVisible)
	reactModule.useEffect(function() --[[ line: 8 ]]
		-- upvalues: userInputService (copy), var3 (ref)
		local var4 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ line: 9 ]]
			-- upvalues: var3 (copy), userInputService (copy)
			var3(userInputService.OnScreenKeyboardVisible)
		end)
		
		return function() --[[ line: 13 ]]
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end
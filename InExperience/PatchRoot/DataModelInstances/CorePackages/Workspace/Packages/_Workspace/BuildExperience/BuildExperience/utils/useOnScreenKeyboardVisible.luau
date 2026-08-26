local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function()
	-- upvalues: reactModule (ref), userInputService (ref)
	local var1, var2 = reactModule.useState(userInputService.OnScreenKeyboardVisible)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var2 (ref)
		local var3 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: var2 (copy), userInputService (copy)
			var2(userInputService.OnScreenKeyboardVisible)
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return var1
end
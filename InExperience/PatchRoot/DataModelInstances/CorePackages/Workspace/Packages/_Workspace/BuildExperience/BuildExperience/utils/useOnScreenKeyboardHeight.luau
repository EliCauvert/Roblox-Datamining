local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function()
	-- upvalues: userInputService (ref), reactModule (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: userInputService (copy)
		return if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), userInputService (copy)
		local function update()
			-- upvalues: var2 (copy), userInputService (copy)
			var2(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end
		
		local var3 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(update)
		local var4 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(update)
		var2(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		
		return function()
			-- upvalues: var3 (ref), var4 (ref)
			var3:Disconnect()
			var4:Disconnect()
		end
	end, {})
	
	return var1
end
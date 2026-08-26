local reactModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.React)
local userInputService = game:GetService("UserInputService")
local useEffect = reactModule.useEffect
local useState = reactModule.useState

return function()
	-- upvalues: useState (ref), useEffect (ref), userInputService (ref)
	local var1, var2 = useState(0)
	useEffect(function()
		-- upvalues: userInputService (copy), var2 (ref)
		local var3 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: var2 (copy), userInputService (copy)
			var2(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return var1
end
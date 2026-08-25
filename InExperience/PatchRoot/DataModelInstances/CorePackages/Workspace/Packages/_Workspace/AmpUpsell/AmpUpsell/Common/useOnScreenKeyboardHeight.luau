local reactModule = require(script:FindFirstAncestor("AmpUpsell").Parent.React)
local userInputService = game:GetService("UserInputService")
local useEffect = reactModule.useEffect
local useState = reactModule.useState

return function()
	-- upvalues: useState (ref), useEffect (ref), userInputService (ref)
	local var2, var3 = useState(0)
	useEffect(function()
		-- upvalues: userInputService (copy), var3 (ref)
		local var4 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: var3 (copy), userInputService (copy)
			var3(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end
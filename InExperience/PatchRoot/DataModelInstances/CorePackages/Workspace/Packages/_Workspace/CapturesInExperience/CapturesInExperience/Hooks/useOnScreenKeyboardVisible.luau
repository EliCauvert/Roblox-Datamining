local userInputService = game:GetService("UserInputService")
local reactModule = require(script.Parent.Parent.Parent.React)
local useEffect = reactModule.useEffect
local useState = reactModule.useState

return function()
	-- upvalues: useState (ref), useEffect (ref), userInputService (ref)
	local var1, var2 = useState(false)
	useEffect(function()
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
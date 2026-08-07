local userInputService = game:GetService("UserInputService")
local reactModule = require(script.Parent.Parent.Parent.React)
local useEffect = reactModule.useEffect
local useState = reactModule.useState

return function() --[[ line: 11 ]]
	-- upvalues: useState (ref), useEffect (ref), userInputService (ref)
	local var2, var3 = useState(false)
	useEffect(function() --[[ line: 14 ]]
		-- upvalues: userInputService (copy), var3 (ref)
		local var4 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ line: 16 ]]
			-- upvalues: var3 (copy), userInputService (copy)
			var3(userInputService.OnScreenKeyboardVisible)
		end)
		
		return function() --[[ line: 19 ]]
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end
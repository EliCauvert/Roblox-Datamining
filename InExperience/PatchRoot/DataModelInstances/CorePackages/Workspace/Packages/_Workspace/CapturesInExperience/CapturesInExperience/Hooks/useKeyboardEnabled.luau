local userInputService = game:GetService("UserInputService")
local reactModule = require(script.Parent.Parent.Parent.React)
local useEffect = reactModule.useEffect
local useState = reactModule.useState

return function() --[[ line: 11 ]]
	-- upvalues: useState (ref), userInputService (ref), useEffect (ref)
	local var2, var3 = useState(userInputService.KeyboardEnabled)
	useEffect(function() --[[ line: 14 ]]
		-- upvalues: userInputService (copy), var3 (ref)
		local var4 = userInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function() --[[ line: 15 ]]
			-- upvalues: var3 (copy), userInputService (copy)
			var3(userInputService.KeyboardEnabled)
		end)
		
		return function() --[[ line: 19 ]]
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end
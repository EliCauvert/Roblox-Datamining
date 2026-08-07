local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function() --[[ line: 18 ]]
	-- upvalues: reactModule (ref), userInputService (ref)
	local var2, var3 = reactModule.useState(userInputService.PreferredInput)
	reactModule.useEffect(function() --[[ line: 21 ]]
		-- upvalues: userInputService (copy), var3 (ref)
		local var4 = userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ line: 24 ]]
			-- upvalues: var3 (copy), userInputService (copy)
			var3(userInputService.PreferredInput)
		end)
		
		return function() --[[ line: 28 ]]
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end
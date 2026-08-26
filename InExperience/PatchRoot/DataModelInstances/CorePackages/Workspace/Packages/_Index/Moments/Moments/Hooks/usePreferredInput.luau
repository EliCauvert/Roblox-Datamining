local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function()
	-- upvalues: reactModule (ref), userInputService (ref)
	local var1, var2 = reactModule.useState(userInputService.PreferredInput)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var2 (ref)
		local var3 = userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: var2 (copy), userInputService (copy)
			var2(userInputService.PreferredInput)
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return var1
end
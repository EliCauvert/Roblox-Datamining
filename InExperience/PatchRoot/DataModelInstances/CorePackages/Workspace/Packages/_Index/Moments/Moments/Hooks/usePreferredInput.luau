local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function()
	-- upvalues: reactModule (ref), userInputService (ref)
	local var2, var3 = reactModule.useState(userInputService.PreferredInput)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var3 (ref)
		local var4 = userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: var3 (copy), userInputService (copy)
			var3(userInputService.PreferredInput)
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end
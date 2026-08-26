local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local userInputService = require(foundation.Utility.Wrappers.Services).UserInputService

return function()
	-- upvalues: reactModule (ref), userInputService (ref)
	local var1, var2 = reactModule.useState(userInputService.PreferredInput)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var2 (ref)
		local var3 = userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: var2 (copy), userInputService (copy)
			var2(userInputService.PreferredInput)
		end)
		var2(userInputService.PreferredInput)
		
		return function()
			-- upvalues: var3 (ref)
			if var3 then
				var3:Disconnect()
			end
		end
	end, {})
	
	return var1
end
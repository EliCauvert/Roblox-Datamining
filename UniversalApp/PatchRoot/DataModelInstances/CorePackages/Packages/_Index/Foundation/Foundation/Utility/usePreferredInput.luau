local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local userInputService = require(foundation.Utility.Wrappers.Services).UserInputService

return function()
	-- upvalues: reactModule (ref), userInputService (ref)
	local var2, var3 = reactModule.useState(userInputService.PreferredInput)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var3 (ref)
		local var4 = userInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: var3 (copy), userInputService (copy)
			var3(userInputService.PreferredInput)
		end)
		var3(userInputService.PreferredInput)
		
		return function()
			-- upvalues: var4 (ref)
			if var4 then
				var4:Disconnect()
			end
		end
	end, {})
	
	return var2
end
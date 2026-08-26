local notificationService = game:GetService("NotificationService")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function()
	-- upvalues: reactModule (ref), notificationService (ref)
	local var1, var2 = reactModule.useState(string.lower(notificationService.SelectedTheme))
	reactModule.useEffect(function()
		-- upvalues: notificationService (copy), var2 (ref)
		local var3 = notificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
			-- upvalues: var2 (copy), notificationService (copy)
			var2(string.lower(notificationService.SelectedTheme))
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end)
	
	return var1
end
local notificationService = game:GetService("NotificationService")
local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function()
	-- upvalues: reactModule (ref), notificationService (ref)
	local var2, var3 = reactModule.useState(string.lower(notificationService.SelectedTheme))
	reactModule.useEffect(function()
		-- upvalues: notificationService (copy), var3 (ref)
		local var4 = notificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
			-- upvalues: var3 (copy), notificationService (copy)
			var3(string.lower(notificationService.SelectedTheme))
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end)
	
	return var2
end
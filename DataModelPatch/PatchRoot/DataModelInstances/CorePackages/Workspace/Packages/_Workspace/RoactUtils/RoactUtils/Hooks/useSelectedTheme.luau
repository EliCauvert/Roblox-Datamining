local NotificationService = game:GetService("NotificationService")
local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function()
	-- upvalues: ReactModule (copy), NotificationService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(string.lower(NotificationService.SelectedTheme))
	ReactModule.useEffect(function()
		-- upvalues: NotificationService (upval), UseStateResult2 (copy)
		local Connection = NotificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function()
			-- upvalues: UseStateResult2 (upval), NotificationService (upval)
			UseStateResult2(string.lower(NotificationService.SelectedTheme))
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end)
	
	return UseStateResult
end
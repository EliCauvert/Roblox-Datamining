local NotificationService = game:GetService("NotificationService")
local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function() --[[ Line: 13 | Named "useSelectedTheme" ]]
	-- upvalues: ReactModule (copy), NotificationService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(string.lower(NotificationService.SelectedTheme))
	ReactModule.useEffect(function() --[[ Line: 16 ]]
		-- upvalues: NotificationService (upval), UseStateResult2 (copy)
		local Connection = NotificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function() --[[ Line: 17 ]]
			-- upvalues: UseStateResult2 (upval), NotificationService (upval)
			UseStateResult2(string.lower(NotificationService.SelectedTheme))
		end)
		
		return function() --[[ Line: 21 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end)
	
	return UseStateResult
end
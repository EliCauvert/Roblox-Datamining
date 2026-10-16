local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function() --[[ Line: 7 | Named "useRobloxLocale" ]]
	-- upvalues: ReactModule (copy), LocalizationService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(LocalizationService.RobloxLocaleId)
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: LocalizationService (upval), UseStateResult2 (copy)
		local Connection = LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ Line: 11 ]]
			-- upvalues: UseStateResult2 (upval), LocalizationService (upval)
			UseStateResult2(LocalizationService.RobloxLocaleId)
		end)
		
		return function() --[[ Line: 15 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end
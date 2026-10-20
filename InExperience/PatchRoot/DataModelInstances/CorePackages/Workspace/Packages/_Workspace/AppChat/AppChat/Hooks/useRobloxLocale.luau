local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function()
	-- upvalues: ReactModule (copy), LocalizationService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(LocalizationService.RobloxLocaleId)
	ReactModule.useEffect(function()
		-- upvalues: LocalizationService (upval), UseStateResult2 (copy)
		local Connection = LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: UseStateResult2 (upval), LocalizationService (upval)
			UseStateResult2(LocalizationService.RobloxLocaleId)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end
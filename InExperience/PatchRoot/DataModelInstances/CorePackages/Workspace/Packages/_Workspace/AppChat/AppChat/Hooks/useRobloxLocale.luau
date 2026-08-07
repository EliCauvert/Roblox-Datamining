local localizationService = game:GetService("LocalizationService")
local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function() --[[ line: 7 | named "useRobloxLocale" ]]
	-- upvalues: reactModule (ref), localizationService (ref)
	local var2, var3 = reactModule.useState(localizationService.RobloxLocaleId)
	reactModule.useEffect(function() --[[ line: 10 ]]
		-- upvalues: localizationService (copy), var3 (ref)
		local var4 = localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function() --[[ line: 11 ]]
			-- upvalues: var3 (copy), localizationService (copy)
			var3(localizationService.RobloxLocaleId)
		end)
		
		return function() --[[ line: 15 ]]
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end
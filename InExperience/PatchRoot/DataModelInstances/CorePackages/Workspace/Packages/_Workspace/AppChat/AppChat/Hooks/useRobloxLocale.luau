local localizationService = game:GetService("LocalizationService")
local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function()
	-- upvalues: reactModule (ref), localizationService (ref)
	local var1, var2 = reactModule.useState(localizationService.RobloxLocaleId)
	reactModule.useEffect(function()
		-- upvalues: localizationService (copy), var2 (ref)
		local var3 = localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: var2 (copy), localizationService (copy)
			var2(localizationService.RobloxLocaleId)
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return var1
end
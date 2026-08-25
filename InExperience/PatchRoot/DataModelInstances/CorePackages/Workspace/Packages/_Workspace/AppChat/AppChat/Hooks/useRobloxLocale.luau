local localizationService = game:GetService("LocalizationService")
local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

return function()
	-- upvalues: reactModule (ref), localizationService (ref)
	local var2, var3 = reactModule.useState(localizationService.RobloxLocaleId)
	reactModule.useEffect(function()
		-- upvalues: localizationService (copy), var3 (ref)
		local var4 = localizationService:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: var3 (copy), localizationService (copy)
			var3(localizationService.RobloxLocaleId)
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end
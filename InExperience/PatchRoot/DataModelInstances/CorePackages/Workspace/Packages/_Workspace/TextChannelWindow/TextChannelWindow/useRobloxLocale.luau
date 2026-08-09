local localizationService = game:GetService("LocalizationService")
local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

return function() --[[ line: 7 | named "useRobloxLocale" ]]
	-- upvalues: reactModule (ref), localizationService (ref), useEventConnection (ref)
	local var2, var3 = reactModule.useState(localizationService.RobloxLocaleId)
	useEventConnection(localizationService:GetPropertyChangedSignal("RobloxLocaleId"), function() --[[ line: 10 ]]
		-- upvalues: var3 (ref), localizationService (copy)
		var3(localizationService.RobloxLocaleId)
	end, {})
	
	return var2
end
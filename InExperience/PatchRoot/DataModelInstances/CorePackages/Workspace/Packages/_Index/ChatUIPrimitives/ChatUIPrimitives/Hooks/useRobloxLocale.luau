local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

return function() --[[ line: 8 | named "useRobloxLocale" ]]
	-- upvalues: reactModule (ref), localizationService (ref), useEventConnection (ref)
	local var2, var3 = reactModule.useState(localizationService.RobloxLocaleId)
	useEventConnection(localizationService:GetPropertyChangedSignal("RobloxLocaleId"), function() --[[ line: 11 ]]
		-- upvalues: var3 (ref), localizationService (copy)
		var3(localizationService.RobloxLocaleId)
	end, {})
	
	return var2
end
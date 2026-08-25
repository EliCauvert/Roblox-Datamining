local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

return function()
	-- upvalues: reactModule (ref), localizationService (ref), useEventConnection (ref)
	local var2, var3 = reactModule.useState(localizationService.RobloxLocaleId)
	useEventConnection(localizationService:GetPropertyChangedSignal("RobloxLocaleId"), function()
		-- upvalues: var3 (ref), localizationService (copy)
		var3(localizationService.RobloxLocaleId)
	end, {})
	
	return var2
end
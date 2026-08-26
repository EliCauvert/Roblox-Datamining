local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

return function()
	-- upvalues: reactModule (ref), localizationService (ref), useEventConnection (ref)
	local var1, var2 = reactModule.useState(localizationService.RobloxLocaleId)
	useEventConnection(localizationService:GetPropertyChangedSignal("RobloxLocaleId"), function()
		-- upvalues: var2 (ref), localizationService (copy)
		var2(localizationService.RobloxLocaleId)
	end, {})
	
	return var1
end
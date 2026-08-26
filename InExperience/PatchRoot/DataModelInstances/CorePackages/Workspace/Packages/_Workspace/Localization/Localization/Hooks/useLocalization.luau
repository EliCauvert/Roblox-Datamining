local localization = script:FindFirstAncestor("Localization")
local parent = localization.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local robloxLocaleIdKeyModule = require(localization.RobloxLocaleIdKey)
local localizationRoactContextModule = require(localization.LocalizationRoactContext)
local localizeStringsModule = require(localization.localizeStrings)
local useSignal = require(parent.RoactUtils).Hooks.useSignal

return function(p1)
	-- upvalues: reactModule (ref), localizationRoactContextModule (ref), localizationService (ref), useSignal (ref), argCheckModule (ref), localizeStringsModule (ref), robloxLocaleIdKeyModule (ref)
	local var1 = reactModule.useContext(localizationRoactContextModule)
	local var2, var3 = reactModule.useState(localizationService.RobloxLocaleId)
	useSignal(var1.changed, reactModule.useCallback(function(_)
		-- upvalues: var1 (ref), var2 (ref), var3 (ref)
		local locale = var1:GetLocale()
		
		if locale ~= var2 then
			var3(locale)
		end
	end, { var1 }))
	argCheckModule.isType(p1, "table", "LocalizationConsumer.props.stringsToBeLocalized")
	local var4 = localizeStringsModule(var1, p1)
	var4[robloxLocaleIdKeyModule] = var2
	
	return var4
end
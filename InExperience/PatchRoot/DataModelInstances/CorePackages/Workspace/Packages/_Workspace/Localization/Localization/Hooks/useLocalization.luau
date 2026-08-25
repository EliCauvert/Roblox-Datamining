local localization = script:FindFirstAncestor("Localization")
local parent = localization.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local robloxLocaleIdKeyModule = require(localization.RobloxLocaleIdKey)
local localizationRoactContextModule = require(localization.LocalizationRoactContext)
local localizeStringsModule = require(localization.localizeStrings)
local useSignal = require(parent.RoactUtils).Hooks.useSignal

return function(p0)
	-- upvalues: reactModule (ref), localizationRoactContextModule (ref), localizationService (ref), useSignal (ref), argCheckModule (ref), localizeStringsModule (ref), robloxLocaleIdKeyModule (ref)
	local var7 = reactModule.useContext(localizationRoactContextModule)
	local var8, var9 = reactModule.useState(localizationService.RobloxLocaleId)
	useSignal(var7.changed, reactModule.useCallback(function(_)
		-- upvalues: var7 (ref), var8 (ref), var9 (ref)
		local locale = var7:GetLocale()
		
		if locale ~= var8 then
			var9(locale)
		end
	end, { var7 }))
	argCheckModule.isType(p0, "table", "LocalizationConsumer.props.stringsToBeLocalized")
	local var10 = localizeStringsModule(var7, p0)
	var10[robloxLocaleIdKeyModule] = var8
	
	return var10
end
local Localization = script:FindFirstAncestor("Localization")
local Parent = Localization.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local RobloxLocaleIdKeyModule = require(Localization.RobloxLocaleIdKey)
local LocalizationRoactContextModule = require(Localization.LocalizationRoactContext)
local LocalizeStringsModule = require(Localization.localizeStrings)
local UseSignalFunction = require(Parent.RoactUtils).Hooks.useSignal

return function(p1) --[[ Line: 17 | Named "useLocalization" ]]
	-- upvalues: ReactModule (copy), LocalizationRoactContextModule (copy), LocalizationService (copy), UseSignalFunction (copy), ArgCheckModule (copy), LocalizeStringsModule (copy), RobloxLocaleIdKeyModule (copy)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContextModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(LocalizationService.RobloxLocaleId)
	UseSignalFunction(UseContextResult.changed, (ReactModule.useCallback(function(_) --[[ Line: 22 ]]
		-- upvalues: UseContextResult (copy), UseStateResult (copy), UseStateResult2 (copy)
		local Locale = UseContextResult:GetLocale()
		
		if Locale ~= UseStateResult then
			UseStateResult2(Locale)
		end
	end, { UseContextResult })))
	ArgCheckModule.isType(p1, "table", "LocalizationConsumer.props.stringsToBeLocalized")
	local LocalizeStringsModuleResult = LocalizeStringsModule(UseContextResult, p1)
	LocalizeStringsModuleResult[RobloxLocaleIdKeyModule] = UseStateResult
	
	return LocalizeStringsModuleResult
end
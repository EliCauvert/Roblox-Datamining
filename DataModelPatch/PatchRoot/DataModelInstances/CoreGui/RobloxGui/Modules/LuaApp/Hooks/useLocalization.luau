local CorePackages = game:GetService("CorePackages")

if require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagUseLocalizationFromAppTempCommon)() then
	return require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
else
	local LocalizationService = game:GetService("LocalizationService")
	local ReactModule = require(CorePackages.Packages.React)
	local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
	local RobloxLocaleIdKey = require(CorePackages.Workspace.Packages.Localization).RobloxLocaleIdKey
	local LocalizationRoactContext = require(CorePackages.Workspace.Packages.Localization).LocalizationRoactContext
	local LocalizeStringsFunction = require(CorePackages.Workspace.Packages.Localization).localizeStrings
	local UseSignalFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useSignal
	
	return function(p1)
		-- upvalues: ReactModule (copy), LocalizationRoactContext (copy), LocalizationService (copy), UseSignalFunction (copy), ArgCheckModule (copy), LocalizeStringsFunction (copy), RobloxLocaleIdKey (copy)
		local UseContextResult = ReactModule.useContext(LocalizationRoactContext)
		local UseStateResult, UseStateResult2 = ReactModule.useState(LocalizationService.RobloxLocaleId)
		UseSignalFunction(UseContextResult.changed, (ReactModule.useCallback(function(_)
			-- upvalues: UseContextResult (copy), UseStateResult (copy), UseStateResult2 (copy)
			local Locale = UseContextResult:GetLocale()
			
			if Locale ~= UseStateResult then
				UseStateResult2(Locale)
			end
		end, { UseContextResult })))
		ArgCheckModule.isType(p1, "table", "LocalizationConsumer.props.stringsToBeLocalized")
		local LocalizeStringsResult = LocalizeStringsFunction(UseContextResult, p1)
		LocalizeStringsResult[RobloxLocaleIdKey] = UseStateResult
		
		return LocalizeStringsResult
	end
end
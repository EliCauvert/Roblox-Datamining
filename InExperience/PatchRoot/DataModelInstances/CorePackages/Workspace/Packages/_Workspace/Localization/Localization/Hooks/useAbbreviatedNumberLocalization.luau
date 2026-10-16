local Localization = script:FindFirstAncestor("Localization")
local Parent = Localization.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local AbbreviateCountModule = require(Localization.abbreviateCount)
local LocalizationRoactContextModule = require(Localization.LocalizationRoactContext)
local UseSignalFunction = require(Parent.RoactUtils).Hooks.useSignal

return function(p1) --[[ Line: 13 | Named "useAbbreviatedNumberLocalization" ]]
	-- upvalues: ReactModule (copy), LocalizationRoactContextModule (copy), LocalizationService (copy), UseSignalFunction (copy), AbbreviateCountModule (copy)
	local UseContextResult = ReactModule.useContext(LocalizationRoactContextModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(LocalizationService.RobloxLocaleId)
	UseSignalFunction(UseContextResult.changed, (ReactModule.useCallback(function(_) --[[ Line: 18 ]]
		-- upvalues: UseContextResult (copy), UseStateResult (copy), UseStateResult2 (copy)
		local Locale = UseContextResult:GetLocale()
		
		if Locale ~= UseStateResult then
			UseStateResult2(Locale)
		end
	end, { UseContextResult })))
	
	return ReactModule.useMemo(function() --[[ Line: 27 ]]
		-- upvalues: p1 (copy), AbbreviateCountModule (upval), UseStateResult (copy)
		return if p1 == nil then nil else AbbreviateCountModule(p1, UseStateResult)
	end, { p1, UseStateResult })
end
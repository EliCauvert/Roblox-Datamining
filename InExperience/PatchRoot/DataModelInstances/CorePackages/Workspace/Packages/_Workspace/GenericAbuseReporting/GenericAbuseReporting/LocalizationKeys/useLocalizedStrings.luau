local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local ReactModule = require(Parent.React)
local LocalizationKeysContextModule = require(script.Parent.LocalizationKeysContext)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function() --[[ Line: 8 | Named "useLocalizedStrings" ]]
	-- upvalues: ReactModule (copy), LocalizationKeysContextModule (copy), UseLocalizationFunction (copy)
	return (UseLocalizationFunction((ReactModule.useContext(LocalizationKeysContextModule))))
end
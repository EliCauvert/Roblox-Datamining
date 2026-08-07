local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local reactModule = require(parent.React)
local localizationKeysContextModule = require(script.Parent.LocalizationKeysContext)
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function() --[[ line: 8 | named "useLocalizedStrings" ]]
	-- upvalues: reactModule (ref), localizationKeysContextModule (ref), useLocalization (ref)
	return useLocalization(reactModule.useContext(localizationKeysContextModule))
end
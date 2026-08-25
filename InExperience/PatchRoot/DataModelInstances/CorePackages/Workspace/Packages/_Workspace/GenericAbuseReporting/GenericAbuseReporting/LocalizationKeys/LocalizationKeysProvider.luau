local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local localizationKeysContextModule = require(genericAbuseReporting.LocalizationKeys.LocalizationKeysContext)
local defaultLocalizationKeysModule = require(genericAbuseReporting.LocalizationKeys.DefaultLocalizationKeys)

return function(p0)
	-- upvalues: reactModule (ref), defaultLocalizationKeysModule (ref), localizationKeysContextModule (ref)
	return reactModule.createElement(localizationKeysContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: p0 (ref), defaultLocalizationKeysModule (copy)
			local localizationKeys = p0.localizationKeys
			
			return {
				formTitle = if localizationKeys then localizationKeys.formTitle else defaultLocalizationKeysModule.formTitle,
				formSubmit = if localizationKeys then localizationKeys.formSubmit else defaultLocalizationKeysModule.formSubmit,
				completeTitle = if localizationKeys then localizationKeys.completeTitle else defaultLocalizationKeysModule.completeTitle,
				completeDescription = if localizationKeys then localizationKeys.completeDescription else defaultLocalizationKeysModule.completeDescription,
				completeClose = if localizationKeys then localizationKeys.completeClose else defaultLocalizationKeysModule.completeClose,
				failedTitle = if localizationKeys then localizationKeys.failedTitle else defaultLocalizationKeysModule.failedTitle,
				failedDescription = if localizationKeys then localizationKeys.failedDescription else defaultLocalizationKeysModule.failedDescription,
				failedClose = if localizationKeys then localizationKeys.failedClose else defaultLocalizationKeysModule.failedClose
			}
		end, { p0.localizationKeys })
	}, p0.children)
end
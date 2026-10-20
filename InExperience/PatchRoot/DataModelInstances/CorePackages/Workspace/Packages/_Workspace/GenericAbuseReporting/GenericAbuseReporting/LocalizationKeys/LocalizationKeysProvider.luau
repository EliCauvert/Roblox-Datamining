local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local LocalizationKeysContextModule = require(GenericAbuseReporting.LocalizationKeys.LocalizationKeysContext)
local DefaultLocalizationKeysModule = require(GenericAbuseReporting.LocalizationKeys.DefaultLocalizationKeys)

return function(p1)
	-- upvalues: ReactModule (copy), DefaultLocalizationKeysModule (copy), LocalizationKeysContextModule (copy)
	return ReactModule.createElement(LocalizationKeysContextModule.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), DefaultLocalizationKeysModule (upval)
			local LocalizationKeys = p1.localizationKeys
			
			return {
				formTitle = LocalizationKeys and LocalizationKeys.formTitle or DefaultLocalizationKeysModule.formTitle,
				formSubmit = LocalizationKeys and LocalizationKeys.formSubmit or DefaultLocalizationKeysModule.formSubmit,
				completeTitle = LocalizationKeys and LocalizationKeys.completeTitle or DefaultLocalizationKeysModule.completeTitle,
				completeDescription = LocalizationKeys and LocalizationKeys.completeDescription or DefaultLocalizationKeysModule.completeDescription,
				completeClose = LocalizationKeys and LocalizationKeys.completeClose or DefaultLocalizationKeysModule.completeClose,
				failedTitle = LocalizationKeys and LocalizationKeys.failedTitle or DefaultLocalizationKeysModule.failedTitle,
				failedDescription = LocalizationKeys and LocalizationKeys.failedDescription or DefaultLocalizationKeysModule.failedDescription,
				failedClose = LocalizationKeys and LocalizationKeys.failedClose or DefaultLocalizationKeysModule.failedClose
			}
		end, { p1.localizationKeys })
	}, p1.children)
end
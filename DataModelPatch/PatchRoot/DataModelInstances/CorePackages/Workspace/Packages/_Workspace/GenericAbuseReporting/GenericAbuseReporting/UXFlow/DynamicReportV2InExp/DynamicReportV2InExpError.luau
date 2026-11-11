local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Empty = FoundationModule.Empty
local View = FoundationModule.View

return ReactModule.memo(function()
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), View (copy), Empty (copy)
	return ReactModule.createElement(View, { tag = "align-x-center align-y-center size-full" }, {
		Empty = ReactModule.createElement(Empty, {
			icon = { name = "icons/status/oof_xlarge", size = "XLarge" },
			text = UseLocalizationFunction({
				errorText = "Feature.AbuseReportDialog.Label.GeneralError"
			}).errorText
		})
	})
end)
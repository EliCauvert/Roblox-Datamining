local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Empty = FoundationModule.Empty
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View

local function DynamicReportV2ErrorLegacy()
	-- upvalues: ReactModule (copy), Sheet (copy), Empty (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = ReactModule.createElement(Sheet.Content, {}, { ReactModule.createElement(Empty, {}) })
	})
end

local function DynamicReportV2ErrorV2()
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Sheet (copy), View (copy), Empty (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = ReactModule.createElement(Sheet.Content, {}, {
			Center = ReactModule.createElement(View, { tag = "align-x-center align-y-center size-full" }, {
				Empty = ReactModule.createElement(Empty, {
					icon = { name = "icons/status/oof_xlarge", size = "XLarge" },
					text = UseLocalizationFunction({
						errorText = "Feature.AbuseReportDialog.Label.GeneralError"
					}).errorText
				})
			})
		})
	})
end

return ReactModule.memo(if require(Parent.SharedFlags).FFlagAbuseReportMenuV2 then DynamicReportV2ErrorV2 else DynamicReportV2ErrorLegacy)
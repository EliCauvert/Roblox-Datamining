local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local empty = foundationModule.Empty
local sheet = foundationModule.Sheet
local view = foundationModule.View

return reactModule.memo(if require(parent.SharedFlags).FFlagAbuseReportMenuV2 then function() --[[ line: 22 | named "DynamicReportV2ErrorV2" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), sheet (ref), view (ref), empty (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(sheet.Content, {}, {
			Center = reactModule.createElement(view, { tag = "align-x-center align-y-center size-full" }, {
				Empty = reactModule.createElement(empty, {
					icon = { name = "icons/status/oof_xlarge", size = "XLarge" },
					text = useLocalization({
						errorText = "Feature.AbuseReportDialog.Label.GeneralError"
					}).errorText
				})
			})
		})
	})
end else function() --[[ line: 14 | named "DynamicReportV2ErrorLegacy" ]]
	-- upvalues: reactModule (ref), sheet (ref), empty (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(sheet.Content, {}, { reactModule.createElement(empty, {}) })
	})
end)
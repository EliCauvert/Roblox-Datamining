local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local empty = foundationModule.Empty
local sheet = foundationModule.Sheet
local view = foundationModule.View

return reactModule.memo(function()
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
end)
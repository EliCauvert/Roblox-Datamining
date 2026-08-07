local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local empty = foundationModule.Empty
local view = foundationModule.View

return reactModule.memo(function() --[[ line: 14 | named "DynamicReportV2InExpError" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), view (ref), empty (ref)
	return reactModule.createElement(view, { tag = "align-x-center align-y-center size-full" }, {
		Empty = reactModule.createElement(empty, {
			icon = { name = "icons/status/oof_xlarge", size = "XLarge" },
			text = useLocalization({
				errorText = "Feature.AbuseReportDialog.Label.GeneralError"
			}).errorText
		})
	})
end)
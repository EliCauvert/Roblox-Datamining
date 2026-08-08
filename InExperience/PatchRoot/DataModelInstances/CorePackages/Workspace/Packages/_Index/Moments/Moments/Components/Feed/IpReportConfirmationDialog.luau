local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local text = foundationModule.Text
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	ipReportCodeLabel = "Feature.ReportAbuse.Label.YourReportCode",
	ipReportSubmittedBody = "Feature.ReportAbuse.Description.IpInfringementReportModal",
	ipReportSubmittedClose = "Feature.ReportAbuse.Action.Close",
	ipReportSubmittedTitle = "Feature.ReportAbuse.Title.SelectInSceneIpReport"
}

return function(p0) --[[ line: 33 | named "IpReportConfirmationDialog" ]]
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), dialog (ref), foundationModule (ref), view (ref), text (ref)
	local var4 = useLocalization(t)
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		onClose = p0.onClose,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var4.ipReportSubmittedTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			ReportCodeContent = reactModule.createElement(view, { tag = "col align-x-center gap-small size-full-0 auto-y" }, {
				ReportCodeLabel = reactModule.createElement(text, {
					tag = "auto-xy text-title-medium text-align-x-center content-default",
					LayoutOrder = 1,
					Text = var4.ipReportCodeLabel
				}),
				ReportCode = reactModule.createElement(text, {
					tag = "auto-xy text-heading-medium text-align-x-center content-emphasis",
					LayoutOrder = 2,
					Text = p0.reportCode
				}),
				ReportSubmittedBody = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					RichText = true,
					LayoutOrder = 3,
					Text = var4.ipReportSubmittedBody
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var4.ipReportSubmittedClose,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p0.onClose
				}
			}
		})
	})
end
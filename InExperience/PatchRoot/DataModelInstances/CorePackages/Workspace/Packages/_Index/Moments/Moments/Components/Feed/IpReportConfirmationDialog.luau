local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	ipReportCodeLabel = "Feature.ReportAbuse.Label.YourReportCode",
	ipReportSubmittedBody = "Feature.ReportAbuse.Description.IpInfringementReportModal",
	ipReportSubmittedClose = "Feature.ReportAbuse.Action.Close",
	ipReportSubmittedTitle = "Feature.ReportAbuse.Title.SelectInSceneIpReport"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy), View (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		onClose = p1.onClose,
		size = FoundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseLocalizationResult.ipReportSubmittedTitle
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			ReportCodeContent = ReactModule.createElement(View, { tag = "col align-x-center gap-small size-full-0 auto-y" }, {
				ReportCodeLabel = ReactModule.createElement(Text, {
					tag = "auto-xy text-title-medium text-align-x-center content-default",
					LayoutOrder = 1,
					Text = UseLocalizationResult.ipReportCodeLabel
				}),
				ReportCode = ReactModule.createElement(Text, {
					tag = "auto-xy text-heading-medium text-align-x-center content-emphasis",
					LayoutOrder = 2,
					Text = p1.reportCode
				}),
				ReportSubmittedBody = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					RichText = true,
					LayoutOrder = 3,
					Text = UseLocalizationResult.ipReportSubmittedBody
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.ipReportSubmittedClose,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.onClose
				}
			}
		})
	})
end
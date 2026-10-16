local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local InputSize = FoundationModule.Enums.InputSize
local TextFeedbackReasonDialogModule = require(MomentsCreation.Components.Dialogs.TextFeedbackReasonDialog)
local GetFFlagMomentsGeneratedTextDisclosureWrapModule = require(MomentsCreation.Flags.GetFFlagMomentsGeneratedTextDisclosureWrap)

return function(p1) --[[ Line: 40 | Named "GeneratedTextFeedbackView" ]]
	-- upvalues: GetFFlagMomentsGeneratedTextDisclosureWrapModule (copy), ReactModule (copy), View (copy), Text (copy), IconButton (copy), IconName (copy), IconVariant (copy), InputSize (copy), ButtonVariant (copy), TextFeedbackReasonDialogModule (copy)
	return if p1.visible then ReactModule.createElement(ReactModule.Fragment, nil, {
		Feedback = ReactModule.createElement(View, {
			tag = "col align-x-center gap-small size-full-0 auto-y",
			LayoutOrder = p1.layoutOrder
		}, {
			Disclosure = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = if GetFFlagMomentsGeneratedTextDisclosureWrapModule then "size-full-0 auto-y text-body-small text-wrap text-align-x-center text-align-y-top content-neutral" else "size-full-0 auto-y text-body-small text-align-x-center text-align-y-top content-neutral",
				Text = p1.disclosureText
			}),
			Icons = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-center gap-small auto-xy"
			}, {
				ThumbsUp = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					testId = "generated-text-feedback-thumbs-up",
					icon = if p1.selectedAction == "thumbs_up" then { name = IconName.ThumbUp, variant = IconVariant.Filled } else IconName.ThumbUp,
					onActivated = p1.onThumbsUp,
					size = InputSize.Small,
					variant = ButtonVariant.Utility
				}),
				ThumbsDown = ReactModule.createElement(IconButton, {
					LayoutOrder = 2,
					testId = "generated-text-feedback-thumbs-down",
					icon = if p1.selectedAction == "thumbs_down" then { name = IconName.ThumbDown, variant = IconVariant.Filled } else IconName.ThumbDown,
					onActivated = p1.onThumbsDown,
					size = InputSize.Small,
					variant = ButtonVariant.Utility
				})
			})
		}),
		ReasonDialog = if p1.showReasonDialog then ReactModule.createElement(TextFeedbackReasonDialogModule, {
			onNotHelpful = p1.onNotHelpful,
			onPolicyViolation = p1.onPolicyViolation,
			onDismiss = p1.onDismissDialog
		}) else nil
	}) else nil
end
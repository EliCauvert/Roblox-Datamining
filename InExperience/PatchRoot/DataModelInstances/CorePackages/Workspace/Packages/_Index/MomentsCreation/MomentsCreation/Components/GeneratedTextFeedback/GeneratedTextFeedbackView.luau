local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local inputSize = foundationModule.Enums.InputSize
local textFeedbackReasonDialogModule = require(momentsCreation.Components.Dialogs.TextFeedbackReasonDialog)

return function(p0)
	-- upvalues: reactModule (ref), view (ref), text (ref), iconButton (ref), iconName (ref), iconVariant (ref), inputSize (ref), buttonVariant (ref), textFeedbackReasonDialogModule (ref)
	return if p0.visible then reactModule.createElement(reactModule.Fragment, nil, {
		Feedback = reactModule.createElement(view, {
			tag = "col align-x-center gap-small size-full-0 auto-y",
			LayoutOrder = p0.layoutOrder
		}, {
			Disclosure = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-body-small text-align-x-center text-align-y-top content-neutral",
				Text = p0.disclosureText
			}),
			Icons = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-center gap-small auto-xy"
			}, {
				ThumbsUp = reactModule.createElement(iconButton, {
					LayoutOrder = 1,
					testId = "generated-text-feedback-thumbs-up",
					icon = if p0.selectedAction == "thumbs_up" then { name = iconName.ThumbUp, variant = iconVariant.Filled } else iconName.ThumbUp,
					onActivated = p0.onThumbsUp,
					size = inputSize.Small,
					variant = buttonVariant.Utility
				}),
				ThumbsDown = reactModule.createElement(iconButton, {
					LayoutOrder = 2,
					testId = "generated-text-feedback-thumbs-down",
					icon = if p0.selectedAction == "thumbs_down" then { name = iconName.ThumbDown, variant = iconVariant.Filled } else iconName.ThumbDown,
					onActivated = p0.onThumbsDown,
					size = inputSize.Small,
					variant = buttonVariant.Utility
				})
			})
		}),
		ReasonDialog = if p0.showReasonDialog then reactModule.createElement(textFeedbackReasonDialogModule, {
			onNotHelpful = p0.onNotHelpful,
			onPolicyViolation = p0.onPolicyViolation,
			onDismiss = p0.onDismissDialog
		}) else nil
	}) else nil
end
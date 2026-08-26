local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local text = foundationModule.Text
local useLocalization = localizationModule.Hooks.useLocalization
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local t = {
	title = "Feature.Moments.Title.GenerateTextFeedbackReason",
	notHelpful = "Feature.Moments.Action.GenerateTextFeedbackNotHelpful",
	policy = "Feature.Moments.Action.GenerateTextFeedbackPolicy"
}

return function(p1)
	-- upvalues: useCreationFlowStringsModule (ref), useLocalization (ref), t (ref), reactModule (ref), dialog (ref), foundationModule (ref), text (ref)
	local var1 = useLocalization(t)
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = foundationModule.Enums.DialogSize.Small
	}, {
		DialogTitle = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
			Text = var1.title
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 2,
			orientation = foundationModule.Enums.Orientation.Vertical,
			actions = {
				{
					text = var1.notHelpful,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onNotHelpful
				},
				{
					text = var1.policy,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onPolicyViolation
				},
				{
					text = useCreationFlowStringsModule().GeneralCtaCancel,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onDismiss
				}
			}
		})
	})
end
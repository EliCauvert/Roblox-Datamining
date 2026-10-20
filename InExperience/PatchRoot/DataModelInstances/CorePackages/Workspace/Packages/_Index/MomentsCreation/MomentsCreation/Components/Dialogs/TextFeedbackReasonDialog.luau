local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local Text = FoundationModule.Text
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local config = {
	title = "Feature.Moments.Title.GenerateTextFeedbackReason",
	notHelpful = "Feature.Moments.Action.GenerateTextFeedbackNotHelpful",
	policy = "Feature.Moments.Action.GenerateTextFeedbackPolicy"
}

return function(p1)
	-- upvalues: UseCreationFlowStringsModule (copy), UseLocalizationFunction (copy), config (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy), Text (copy)
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = FoundationModule.Enums.DialogSize.Small
	}, {
		DialogTitle = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-center content-emphasis",
			Text = UseLocalizationResult.title
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 2,
			orientation = FoundationModule.Enums.Orientation.Vertical,
			actions = {
				{
					text = UseLocalizationResult.notHelpful,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onNotHelpful
				},
				{
					text = UseLocalizationResult.policy,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onPolicyViolation
				},
				{
					text = UseCreationFlowStringsModuleResult.GeneralCtaCancel,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onDismiss
				}
			}
		})
	})
end
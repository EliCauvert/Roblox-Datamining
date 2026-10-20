local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseBuildPageEligibilityModule = require(BuildExperience.useBuildPageEligibility)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseBuildPageEligibilityModule (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		dialogAction = LocalizationStringsModule.BUILD_ELIGIBILITY_DIALOG_ACTION,
		errorDescription = LocalizationStringsModule.BUILD_ELIGIBILITY_ERROR_DESCRIPTION,
		errorTitle = LocalizationStringsModule.BUILD_ELIGIBILITY_ERROR_TITLE,
		ineligibleDescription = LocalizationStringsModule.BUILD_ELIGIBILITY_INELIGIBLE_DESCRIPTION,
		ineligibleTitle = LocalizationStringsModule.BUILD_ELIGIBILITY_INELIGIBLE_TITLE
	})
	local IsVariantMatch = p1.variant == UseBuildPageEligibilityModule.Status.Ineligible
	
	return ReactModule.createElement(Dialog.Root, {
		testId = "build-eligibility-dialog",
		size = DialogSize.Small
	}, {
		Title = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = if IsVariantMatch then UseLocalizationResult.ineligibleTitle else UseLocalizationResult.errorTitle
		}),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Description = ReactModule.createElement(Dialog.Text, {
				Text = if IsVariantMatch then UseLocalizationResult.ineligibleDescription else UseLocalizationResult.errorDescription
			})
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.dialogAction,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onDismiss
				}
			}
		})
	})
end
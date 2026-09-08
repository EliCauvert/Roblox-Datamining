local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useBuildPageEligibilityModule = require(buildExperience.useBuildPageEligibility)
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useBuildPageEligibilityModule (ref), reactModule (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local var1 = useLocalization({
		dialogAction = localizationStringsModule.BUILD_ELIGIBILITY_DIALOG_ACTION,
		errorDescription = localizationStringsModule.BUILD_ELIGIBILITY_ERROR_DESCRIPTION,
		errorTitle = localizationStringsModule.BUILD_ELIGIBILITY_ERROR_TITLE,
		ineligibleDescription = localizationStringsModule.BUILD_ELIGIBILITY_INELIGIBLE_DESCRIPTION,
		ineligibleTitle = localizationStringsModule.BUILD_ELIGIBILITY_INELIGIBLE_TITLE
	})
	local var2 = p1.variant == useBuildPageEligibilityModule.Status.Ineligible
	
	return reactModule.createElement(dialog.Root, {
		testId = "build-eligibility-dialog",
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = if var2 then var1.ineligibleTitle else var1.errorTitle
		}),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, {
				Text = if var2 then var1.ineligibleDescription else var1.errorDescription
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.dialogAction,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onDismiss
				}
			}
		})
	})
end
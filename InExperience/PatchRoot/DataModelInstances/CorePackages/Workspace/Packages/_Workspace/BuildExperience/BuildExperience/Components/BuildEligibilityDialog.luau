local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useBuildPageEligibilityModule = require(buildExperience.useBuildPageEligibility)
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize

return function(p0) --[[ line: 20 | named "BuildEligibilityDialog" ]]
	-- upvalues: useBuildPageEligibilityModule (ref), localizationStringsModule (ref), reactModule (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local var5 = p0.variant == useBuildPageEligibilityModule.Status.Ineligible
	
	return reactModule.createElement(dialog.Root, {
		testId = "build-eligibility-dialog",
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = if var5 then localizationStringsModule.BUILD_ELIGIBILITY_INELIGIBLE_TITLE else localizationStringsModule.BUILD_ELIGIBILITY_ERROR_TITLE
		}),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, {
				Text = if var5 then localizationStringsModule.BUILD_ELIGIBILITY_INELIGIBLE_DESCRIPTION else localizationStringsModule.BUILD_ELIGIBILITY_ERROR_DESCRIPTION
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = localizationStringsModule.BUILD_ELIGIBILITY_DIALOG_ACTION,
					variant = buttonVariant.Emphasis,
					onActivated = p0.onDismiss
				}
			}
		})
	})
end
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local var1 = useLocalization({
		action = localizationStringsModule.PRIVATE_INVITES_ADD_ERROR_ACTION,
		body = localizationStringsModule.PRIVATE_INVITES_ADD_ERROR,
		title = localizationStringsModule.PRIVATE_INVITES_ADD_ERROR_TITLE
	})
	
	return reactModule.createElement(dialog.Root, {
		testId = "build-private-invite-add-error-dialog",
		onClose = p1.onDismiss,
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(dialog.Text, { Text = var1.body })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.action,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onDismiss
				}
			}
		})
	})
end
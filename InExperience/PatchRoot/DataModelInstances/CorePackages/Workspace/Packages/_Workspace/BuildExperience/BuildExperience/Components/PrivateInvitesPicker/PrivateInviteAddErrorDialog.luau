local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize

return function(p1) --[[ Line: 22 | Named "PrivateInviteAddErrorDialog" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		action = LocalizationStringsModule.PRIVATE_INVITES_ADD_ERROR_ACTION,
		body = LocalizationStringsModule.PRIVATE_INVITES_ADD_ERROR,
		title = LocalizationStringsModule.PRIVATE_INVITES_ADD_ERROR_TITLE
	})
	
	return ReactModule.createElement(Dialog.Root, {
		testId = "build-private-invite-add-error-dialog",
		onClose = p1.onDismiss,
		size = DialogSize.Small
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Body = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.body })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.action,
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onDismiss
				}
			}
		})
	})
end
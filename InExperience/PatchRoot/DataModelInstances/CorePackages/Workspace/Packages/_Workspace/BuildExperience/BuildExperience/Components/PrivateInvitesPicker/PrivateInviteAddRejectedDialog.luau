local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local PrivateInviteUserRowModule = require(script.Parent.PrivateInviteUserRow)
local Dialog = FoundationModule.Dialog
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize

return function(p1) --[[ Line: 25 | Named "PrivateInviteAddRejectedDialog" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), PrivateInviteUserRowModule (copy), Dialog (copy), DialogSize (copy), View (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		action = LocalizationStringsModule.PRIVATE_INVITES_ADD_ERROR_ACTION,
		title = LocalizationStringsModule.PRIVATE_INVITES_ADD_REJECTED_TITLE,
		unknownUser = LocalizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER
	})
	local Elements = {}
	
	for LayoutOrder, rejectedUserId in p1.rejectedUserIds do
		Elements[`user-{rejectedUserId}`] = ReactModule.createElement(PrivateInviteUserRowModule, {
			userId = rejectedUserId,
			layoutOrder = LayoutOrder,
			unknownText = UseLocalizationResult.unknownUser
		})
	end
	return ReactModule.createElement(Dialog.Root, {
		testId = "build-private-invite-add-rejected-dialog",
		onClose = p1.onDismiss,
		size = DialogSize.Small
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Users = ReactModule.createElement(View, { tag = "col gap-xsmall size-full-0 auto-y" }, Elements)
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
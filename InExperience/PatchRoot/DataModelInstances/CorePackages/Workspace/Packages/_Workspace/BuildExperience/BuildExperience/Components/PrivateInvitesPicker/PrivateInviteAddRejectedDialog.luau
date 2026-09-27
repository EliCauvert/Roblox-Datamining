local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local privateInviteUserRowModule = require(script.Parent.PrivateInviteUserRow)
local dialog = foundationModule.Dialog
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), privateInviteUserRowModule (ref), dialog (ref), dialogSize (ref), view (ref), buttonVariant (ref)
	local var1 = useLocalization({
		action = localizationStringsModule.PRIVATE_INVITES_ADD_ERROR_ACTION,
		title = localizationStringsModule.PRIVATE_INVITES_ADD_REJECTED_TITLE,
		unknownUser = localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER
	})
	local t = {}
	
	for i, v in p1.rejectedUserIds do
		t[`user-{v}`] = reactModule.createElement(privateInviteUserRowModule, {
			userId = v,
			layoutOrder = i,
			unknownText = var1.unknownUser
		})
	end
	return reactModule.createElement(dialog.Root, {
		testId = "build-private-invite-add-rejected-dialog",
		onClose = p1.onDismiss,
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Users = reactModule.createElement(view, { tag = "col gap-xsmall size-full-0 auto-y" }, t)
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
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
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), privateInviteUserRowModule (ref), buttonVariant (ref), dialog (ref), dialogSize (ref), view (ref)
	local var1 = useLocalization({
		body = localizationStringsModule.PRIVATE_INVITES_SEND_FAILURE_BODY,
		hint = localizationStringsModule.PRIVATE_INVITES_SEND_FAILURE_HINT,
		share = localizationStringsModule.SHARE_AUDIENCE_SHARE,
		title = localizationStringsModule.PRIVATE_INVITES_SEND_FAILURE_TITLE,
		unknownUser = localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER
	})
	local t = {}
	
	for i, v in p1.failedUserIds do
		t[`user-{v}`] = reactModule.createElement(privateInviteUserRowModule, {
			userId = v,
			layoutOrder = i,
			unknownText = var1.unknownUser
		})
	end
	return reactModule.createElement(dialog.Root, {
		testId = "build-private-invite-send-failure-dialog",
		onClose = p1.onCancel,
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = var1.body }),
			Users = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col gap-xsmall size-full-0 auto-y"
			}, t),
			Hint = reactModule.createElement(dialog.Text, { LayoutOrder = 3, Text = var1.hint })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.share,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onShare
				}
			}
		})
	})
end
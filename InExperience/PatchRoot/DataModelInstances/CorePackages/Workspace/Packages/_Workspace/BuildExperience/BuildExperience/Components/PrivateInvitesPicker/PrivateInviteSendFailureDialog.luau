local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useUserProfileInfoModule = require(buildExperience.Components.UserPicker.useUserProfileInfo)
local dialog = foundationModule.Dialog
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize

local function FailedUserRow(p1)
	-- upvalues: useUserProfileInfoModule (ref), reactModule (ref), text (ref)
	local var1 = useUserProfileInfoModule(p1.userId)
	
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-align-x-left content-default",
		LayoutOrder = p1.layoutOrder,
		Text = if var1.displayName ~= "" then p1.unknownText else var1.displayName
	})
end

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), FailedUserRow (ref), buttonVariant (ref), dialog (ref), dialogSize (ref), view (ref)
	local var1 = useLocalization({
		body = localizationStringsModule.PRIVATE_INVITES_SEND_FAILURE_BODY,
		hint = localizationStringsModule.PRIVATE_INVITES_SEND_FAILURE_HINT,
		share = localizationStringsModule.SHARE_AUDIENCE_SHARE,
		title = localizationStringsModule.PRIVATE_INVITES_SEND_FAILURE_TITLE,
		unknownUser = localizationStringsModule.PRIVATE_INVITES_UNKNOWN_USER
	})
	local t = {}
	
	for i, v in p1.failedUserIds do
		t[`user-{v}`] = reactModule.createElement(FailedUserRow, {
			userId = v,
			layoutOrder = i,
			unknownText = var1.unknownUser
		})
	end
	return reactModule.createElement(dialog.Root, {
		testId = "build-private-invite-send-failure-dialog",
		disablePortal = p1.disablePortal == true,
		hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop,
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
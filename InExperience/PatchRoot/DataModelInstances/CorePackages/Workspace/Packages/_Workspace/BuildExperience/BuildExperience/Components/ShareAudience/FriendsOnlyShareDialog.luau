local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize

return function(p0) --[[ line: 22 | named "FriendsOnlyShareDialog" ]]
	-- upvalues: localizationStringsModule (ref), buttonVariant (ref), reactModule (ref), dialog (ref), dialogSize (ref)
	return reactModule.createElement(dialog.Root, {
		testId = "build-friends-only-share-dialog",
		disablePortal = p0.disablePortal == true,
		hasBackdrop = p0.hasBackdrop == nil or p0.hasBackdrop,
		onClose = p0.onCancel,
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = localizationStringsModule.SHARE_AUDIENCE_FRIENDS_ONLY_TITLE
		}),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, {
				Text = localizationStringsModule.SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = localizationStringsModule.SHARE_AUDIENCE_SHARE,
					variant = buttonVariant.Emphasis,
					onActivated = p0.onShare
				},
				{
					text = localizationStringsModule.SHARE_AUDIENCE_CANCEL,
					variant = buttonVariant.Standard,
					onActivated = p0.onCancel
				}
			}
		})
	})
end
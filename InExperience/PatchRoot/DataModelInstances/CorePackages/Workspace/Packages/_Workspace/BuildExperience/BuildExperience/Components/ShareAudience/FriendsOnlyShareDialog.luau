local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

return function(p0)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), buttonVariant (ref), reactModule (ref), dialog (ref), dialogSize (ref)
	local SHARE_AUDIENCE_CANCEL, SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION, SHARE_AUDIENCE_SHARE, SHARE_AUDIENCE_FRIENDS_ONLY_TITLE
	local var5 = if fFlagBuildLocalization then useLocalization({
		cancel = localizationStringsModule.SHARE_AUDIENCE_CANCEL,
		description = localizationStringsModule.SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION,
		share = localizationStringsModule.SHARE_AUDIENCE_SHARE,
		title = localizationStringsModule.SHARE_AUDIENCE_FRIENDS_ONLY_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		SHARE_AUDIENCE_CANCEL = var5.cancel
		SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION = var5.description
		SHARE_AUDIENCE_SHARE = var5.share
		SHARE_AUDIENCE_FRIENDS_ONLY_TITLE = var5.title
	else
		SHARE_AUDIENCE_CANCEL = localizationStringsModule.SHARE_AUDIENCE_CANCEL
		SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION = localizationStringsModule.SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION
		SHARE_AUDIENCE_SHARE = localizationStringsModule.SHARE_AUDIENCE_SHARE
		SHARE_AUDIENCE_FRIENDS_ONLY_TITLE = localizationStringsModule.SHARE_AUDIENCE_FRIENDS_ONLY_TITLE
	end
	return reactModule.createElement(dialog.Root, {
		testId = "build-friends-only-share-dialog",
		disablePortal = p0.disablePortal == true,
		hasBackdrop = p0.hasBackdrop == nil or p0.hasBackdrop,
		onClose = p0.onCancel,
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = SHARE_AUDIENCE_FRIENDS_ONLY_TITLE
		}),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, { Text = SHARE_AUDIENCE_FRIENDS_ONLY_DESCRIPTION })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = SHARE_AUDIENCE_SHARE,
					variant = buttonVariant.Emphasis,
					onActivated = p0.onShare
				},
				{
					text = SHARE_AUDIENCE_CANCEL,
					variant = buttonVariant.Standard,
					onActivated = p0.onCancel
				}
			}
		})
	})
end
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

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), buttonVariant (ref), reactModule (ref), dialog (ref), dialogSize (ref)
	local SHARE_AUDIENCE_CANCEL, SHARE_AUDIENCE_PLAYTESTERS_ONLY_DESCRIPTION, SHARE_AUDIENCE_SHARE, SHARE_AUDIENCE_PLAYTESTERS_ONLY_TITLE
	local var1 = if fFlagBuildLocalization then useLocalization({
		cancel = localizationStringsModule.SHARE_AUDIENCE_CANCEL,
		description = localizationStringsModule.SHARE_AUDIENCE_PLAYTESTERS_ONLY_DESCRIPTION,
		share = localizationStringsModule.SHARE_AUDIENCE_SHARE,
		title = localizationStringsModule.SHARE_AUDIENCE_PLAYTESTERS_ONLY_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		SHARE_AUDIENCE_CANCEL = var1.cancel
		SHARE_AUDIENCE_PLAYTESTERS_ONLY_DESCRIPTION = var1.description
		SHARE_AUDIENCE_SHARE = var1.share
		SHARE_AUDIENCE_PLAYTESTERS_ONLY_TITLE = var1.title
	else
		SHARE_AUDIENCE_CANCEL = localizationStringsModule.SHARE_AUDIENCE_CANCEL
		SHARE_AUDIENCE_PLAYTESTERS_ONLY_DESCRIPTION = localizationStringsModule.SHARE_AUDIENCE_PLAYTESTERS_ONLY_DESCRIPTION
		SHARE_AUDIENCE_SHARE = localizationStringsModule.SHARE_AUDIENCE_SHARE
		SHARE_AUDIENCE_PLAYTESTERS_ONLY_TITLE = localizationStringsModule.SHARE_AUDIENCE_PLAYTESTERS_ONLY_TITLE
	end
	return reactModule.createElement(dialog.Root, {
		testId = "build-playtesters-only-share-dialog",
		disablePortal = p1.disablePortal == true,
		hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop,
		onClose = p1.onCancel,
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = SHARE_AUDIENCE_PLAYTESTERS_ONLY_TITLE
		}),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, { Text = SHARE_AUDIENCE_PLAYTESTERS_ONLY_DESCRIPTION }),
			Error = if p1.errorText ~= nil then nil else reactModule.createElement(dialog.Text, { Text = p1.errorText })
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = SHARE_AUDIENCE_SHARE,
					variant = buttonVariant.Emphasis,
					onActivated = p1.onShare
				},
				{
					text = SHARE_AUDIENCE_CANCEL,
					variant = buttonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end
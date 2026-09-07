local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local friendsOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local playtestersOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.PlaytestersOnlyShareDialog)
local _ = require(buildExperience.utils.useExperienceShareFlow)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), friendsOnlyShareDialogModule (ref), playtestersOnlyShareDialogModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		FriendsOnlyShareDialog = if p1.activeDialog == "friends" then reactModule.createElement(friendsOnlyShareDialogModule, { onCancel = p1.onCancel, onShare = p1.onConfirmFriends }) else nil,
		PlaytestersOnlyShareDialog = if p1.activeDialog == "playtesters" then reactModule.createElement(playtestersOnlyShareDialogModule, {
			onCancel = p1.onCancel,
			onShare = p1.onConfirmPlaytesters,
			errorText = if p1.hasShareError then if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
				shareLinkError = localizationStringsModule.PRIVATE_INVITES_SHARE_LINK_ERROR
			}) else nil).shareLinkError else localizationStringsModule.PRIVATE_INVITES_SHARE_LINK_ERROR else nil
		}) else nil
	})
end
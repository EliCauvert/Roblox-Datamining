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

return function(p0)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), friendsOnlyShareDialogModule (ref), playtestersOnlyShareDialogModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		FriendsOnlyShareDialog = if p0.activeDialog == "friends" then reactModule.createElement(friendsOnlyShareDialogModule, { onCancel = p0.onCancel, onShare = p0.onConfirmFriends }) else nil,
		PlaytestersOnlyShareDialog = if p0.activeDialog == "playtesters" then reactModule.createElement(playtestersOnlyShareDialogModule, {
			onCancel = p0.onCancel,
			onShare = p0.onConfirmPlaytesters,
			errorText = if p0.hasShareError then if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
				shareLinkError = localizationStringsModule.PRIVATE_INVITES_SHARE_LINK_ERROR
			}) else nil).shareLinkError else localizationStringsModule.PRIVATE_INVITES_SHARE_LINK_ERROR else nil
		}) else nil
	})
end
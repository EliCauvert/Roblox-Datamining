local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local friendsOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local playtestersOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.PlaytestersOnlyShareDialog)
local _ = require(buildExperience.utils.useExperienceShareFlow)

return function(p0) --[[ line: 26 | named "ExperienceShareOverlays" ]]
	-- upvalues: reactModule (ref), friendsOnlyShareDialogModule (ref), playtestersOnlyShareDialogModule (ref), localizationStringsModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		FriendsOnlyShareDialog = if p0.activeDialog == "friends" then reactModule.createElement(friendsOnlyShareDialogModule, { onCancel = p0.onCancel, onShare = p0.onConfirmFriends }) else nil,
		PlaytestersOnlyShareDialog = if p0.activeDialog == "playtesters" then reactModule.createElement(playtestersOnlyShareDialogModule, {
			onCancel = p0.onCancel,
			onShare = p0.onConfirmPlaytesters,
			errorText = if p0.hasShareError then localizationStringsModule.PRIVATE_INVITES_SHARE_LINK_ERROR else nil
		}) else nil
	})
end
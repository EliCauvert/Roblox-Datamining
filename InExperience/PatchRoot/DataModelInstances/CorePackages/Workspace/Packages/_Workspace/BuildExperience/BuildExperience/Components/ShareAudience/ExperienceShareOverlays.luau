local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FriendsOnlyShareDialogModule = require(BuildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local PlaytestersOnlyShareDialogModule = require(BuildExperience.Components.ShareAudience.PlaytestersOnlyShareDialog)
local _ = require(BuildExperience.utils.useExperienceShareFlow)

return function(p1) --[[ Line: 27 | Named "ExperienceShareOverlays" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), FriendsOnlyShareDialogModule (copy), PlaytestersOnlyShareDialogModule (copy)
	local ShareLinkError = UseLocalizationFunction({
		shareLinkError = LocalizationStringsModule.PRIVATE_INVITES_SHARE_LINK_ERROR
	}).shareLinkError
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		FriendsOnlyShareDialog = if p1.activeDialog == "friends" then ReactModule.createElement(FriendsOnlyShareDialogModule, { onCancel = p1.onCancel, onShare = p1.onConfirmFriends }) else nil,
		PlaytestersOnlyShareDialog = if p1.activeDialog == "playtesters" then ReactModule.createElement(PlaytestersOnlyShareDialogModule, {
			onCancel = p1.onCancel,
			onShare = p1.onConfirmPlaytesters,
			errorText = if p1.hasShareError then ShareLinkError else nil
		}) else nil
	})
end
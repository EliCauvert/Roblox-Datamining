local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local textKeysModule = require(editProfile.Common.TextKeys)
local realNamesInDisplayNamesIXPModule = require(editProfile.Flags.RealNamesInDisplayNamesIXP)
local fFlagEditProfileDisplayNameUseUnder17DescriptionModule = require(editProfile.Flags.FFlagEditProfileDisplayNameUseUnder17Description)
local useRealNamesInDisplayNamesEnabledModule = require(script.Parent.useRealNamesInDisplayNamesEnabled)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local t = {
	displayNameCaption = textKeysModule.DisplayNameCaption,
	displayNameChangeError = textKeysModule.DisplayNameError,
	displayNameChangeMixedCharactersError = textKeysModule.DisplayNameError,
	displayNameModalCaption = textKeysModule.DisplayNameModalCaption,
	displayNameCoolDownMessage = textKeysModule.DisplayNameRecently,
	displayNameTooShortError = textKeysModule.DisplayNameTooShort,
	displayNameUpdatedMessage = textKeysModule.DisplayNameUpdated,
	displayNameEditMessage = textKeysModule.EditDisplayName,
	displayNameTitle = textKeysModule.DisplayName,
	nameTooShortError = textKeysModule.NameTooShortError,
	nameTooLongError = textKeysModule.NameTooLongError,
	nameUnsupportedCharsError = textKeysModule.NameUnsupportedCharsError,
	nameInappropriateError = textKeysModule.NameInappropriateError,
	nameHasChangedError = textKeysModule.NameHasChangedError,
	nameNotAvailableError = textKeysModule.NameNotAvailableError,
	searchForFriendsPrompt = textKeysModule.SearchForFriendPrompt
}
local t_1 = {
	displayNameCaption = textKeysModule.AgedUpDisplayNameConnectionsCaption,
	displayNameChangeError = textKeysModule.AgedUpDisplayNameError,
	displayNameChangeMixedCharactersError = textKeysModule.AgedUpDisplayNameMixedCharactersError,
	displayNameModalCaption = textKeysModule.AgedUpDisplayNameModalCaption,
	displayNameCoolDownMessage = textKeysModule.AgedUpDisplayNameRecently,
	displayNameTooShortError = textKeysModule.AgedUpDisplayNameTooShort,
	displayNameUpdatedMessage = textKeysModule.AgedUpDisplayNameUpdated,
	displayNameEditMessage = textKeysModule.EditAgedUpDisplayName,
	displayNameTitle = textKeysModule.AgedUpDisplayName,
	nameTooShortError = textKeysModule.AgedUpNameTooShortError,
	nameTooLongError = textKeysModule.AgedUpNameTooLongError,
	nameUnsupportedCharsError = textKeysModule.AgedUpNameUnsupportedCharsError,
	nameInappropriateError = textKeysModule.AgedUpNameInappropriateError,
	nameHasChangedError = textKeysModule.AgedUpNameHasChangedError,
	nameNotAvailableError = textKeysModule.AgedUpNameNotAvailableError,
	searchForFriendsPrompt = textKeysModule.AgedUpSearchForFriendsPrompt
}

return function()
	-- upvalues: useRealNamesInDisplayNamesEnabledModule (ref), realNamesInDisplayNamesIXPModule (ref), t_1 (ref), t (ref), fFlagEditProfileDisplayNameUseUnder17DescriptionModule (ref), useLocalization (ref)
	local var1 = if realNamesInDisplayNamesIXPModule.useIsExperimentEnabled({ isExposureEnabled = true }) and useRealNamesInDisplayNamesEnabledModule() then t_1 else t
	local var2 = var1
	
	if fFlagEditProfileDisplayNameUseUnder17DescriptionModule then
		var2 = table.clone(var1)
		var2.displayNameCaption = t.displayNameCaption
		var2.displayNameModalCaption = t.displayNameModalCaption
	end
	return useLocalization(var2)
end
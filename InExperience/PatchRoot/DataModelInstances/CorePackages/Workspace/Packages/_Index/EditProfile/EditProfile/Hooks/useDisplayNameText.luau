local EditProfile = script:FindFirstAncestor("EditProfile")
local TextKeysModule = require(EditProfile.Common.TextKeys)
local RealNamesInDisplayNamesIXPModule = require(EditProfile.Flags.RealNamesInDisplayNamesIXP)
local FFlagEditProfileDisplayNameUseUnder17DescriptionModule = require(EditProfile.Flags.FFlagEditProfileDisplayNameUseUnder17Description)
local UseRealNamesInDisplayNamesEnabledModule = require(script.Parent.useRealNamesInDisplayNamesEnabled)
local UseLocalizationFunction = require(EditProfile.Parent.Localization).Hooks.useLocalization
local config = {
	displayNameCaption = TextKeysModule.DisplayNameCaption,
	displayNameChangeError = TextKeysModule.DisplayNameError,
	displayNameChangeMixedCharactersError = TextKeysModule.DisplayNameError,
	displayNameModalCaption = TextKeysModule.DisplayNameModalCaption,
	displayNameCoolDownMessage = TextKeysModule.DisplayNameRecently,
	displayNameTooShortError = TextKeysModule.DisplayNameTooShort,
	displayNameUpdatedMessage = TextKeysModule.DisplayNameUpdated,
	displayNameEditMessage = TextKeysModule.EditDisplayName,
	displayNameTitle = TextKeysModule.DisplayName,
	nameTooShortError = TextKeysModule.NameTooShortError,
	nameTooLongError = TextKeysModule.NameTooLongError,
	nameUnsupportedCharsError = TextKeysModule.NameUnsupportedCharsError,
	nameInappropriateError = TextKeysModule.NameInappropriateError,
	nameHasChangedError = TextKeysModule.NameHasChangedError,
	nameNotAvailableError = TextKeysModule.NameNotAvailableError,
	searchForFriendsPrompt = TextKeysModule.SearchForFriendPrompt
}
local config1 = {
	displayNameCaption = TextKeysModule.AgedUpDisplayNameConnectionsCaption,
	displayNameChangeError = TextKeysModule.AgedUpDisplayNameError,
	displayNameChangeMixedCharactersError = TextKeysModule.AgedUpDisplayNameMixedCharactersError,
	displayNameModalCaption = TextKeysModule.AgedUpDisplayNameModalCaption,
	displayNameCoolDownMessage = TextKeysModule.AgedUpDisplayNameRecently,
	displayNameTooShortError = TextKeysModule.AgedUpDisplayNameTooShort,
	displayNameUpdatedMessage = TextKeysModule.AgedUpDisplayNameUpdated,
	displayNameEditMessage = TextKeysModule.EditAgedUpDisplayName,
	displayNameTitle = TextKeysModule.AgedUpDisplayName,
	nameTooShortError = TextKeysModule.AgedUpNameTooShortError,
	nameTooLongError = TextKeysModule.AgedUpNameTooLongError,
	nameUnsupportedCharsError = TextKeysModule.AgedUpNameUnsupportedCharsError,
	nameInappropriateError = TextKeysModule.AgedUpNameInappropriateError,
	nameHasChangedError = TextKeysModule.AgedUpNameHasChangedError,
	nameNotAvailableError = TextKeysModule.AgedUpNameNotAvailableError,
	searchForFriendsPrompt = TextKeysModule.AgedUpSearchForFriendsPrompt
}

return function()
	-- upvalues: UseRealNamesInDisplayNamesEnabledModule (copy), RealNamesInDisplayNamesIXPModule (copy), config1 (copy), config (copy), FFlagEditProfileDisplayNameUseUnder17DescriptionModule (copy), UseLocalizationFunction (copy)
	local UseRealNamesInDisplayNamesEnabledModuleResult = UseRealNamesInDisplayNamesEnabledModule()
	local Config = if RealNamesInDisplayNamesIXPModule.useIsExperimentEnabled({ isExposureEnabled = true }) and UseRealNamesInDisplayNamesEnabledModuleResult then config1 else config
	local Config1 = Config
	
	if FFlagEditProfileDisplayNameUseUnder17DescriptionModule then
		Config1 = table.clone(Config)
		Config1.displayNameCaption = config.displayNameCaption
		Config1.displayNameModalCaption = config.displayNameModalCaption
	end
	return UseLocalizationFunction(Config1)
end
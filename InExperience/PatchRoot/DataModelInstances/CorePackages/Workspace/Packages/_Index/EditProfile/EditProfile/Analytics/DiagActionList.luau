local eventNamesModule = require(script.Parent.Enums.EventNames)

return {
	[eventNamesModule.EditProfileOpened] = {
		name = game:DefineFastString("EditProfileOpened", "EditProfileOpened")
	},
	[eventNamesModule.DisplayNameSaved] = {
		name = game:DefineFastString("DisplayNameSaved", "DisplayNameSaved")
	},
	[eventNamesModule.DisplayNameModalOpened] = {
		name = game:DefineFastString("DisplayNameModalOpened", "DisplayNameModalOpened")
	},
	[eventNamesModule.DisplayNameModalLoaded] = {
		name = game:DefineFastString("DisplayNameModalLoaded", "DisplayNameModalLoaded")
	},
	[eventNamesModule.EditUsernameOpened] = {
		name = game:DefineFastString("EditUsernameOpened", "EditUsernameOpened")
	},
	[eventNamesModule.UsernameSaved] = {
		name = game:DefineFastString("UsernameSaved", "UsernameSaved")
	},
	[eventNamesModule.FilteredDisplayName] = {
		name = game:DefineFastString("FilteredDisplayName", "FilteredDisplayName")
	},
	[eventNamesModule.DisplayNameTooShort] = {
		name = game:DefineFastString("DisplayNameTooShort", "DisplayNameTooShort")
	},
	[eventNamesModule.DescriptionPINBlocked] = {
		name = game:DefineFastString("DescriptionPINBlocked", "DescriptionPINBlocked")
	},
	[eventNamesModule.OpenAvatarMarketplace] = {
		name = "OpenAvatarMarketplace",
		platformSpecificity = require(script:FindFirstAncestor("EditProfile").Parent.SocialLuaAnalytics).Analytics.Enums.PlatformSpecificity.BucketsOnly
	}
}
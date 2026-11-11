local EventNamesModule = require(script.Parent.Enums.EventNames)

return {
	[EventNamesModule.EditProfileOpened] = {
		name = game:DefineFastString("EditProfileOpened", "EditProfileOpened")
	},
	[EventNamesModule.DisplayNameSaved] = {
		name = game:DefineFastString("DisplayNameSaved", "DisplayNameSaved")
	},
	[EventNamesModule.DisplayNameModalOpened] = {
		name = game:DefineFastString("DisplayNameModalOpened", "DisplayNameModalOpened")
	},
	[EventNamesModule.DisplayNameModalLoaded] = {
		name = game:DefineFastString("DisplayNameModalLoaded", "DisplayNameModalLoaded")
	},
	[EventNamesModule.EditUsernameOpened] = {
		name = game:DefineFastString("EditUsernameOpened", "EditUsernameOpened")
	},
	[EventNamesModule.UsernameSaved] = {
		name = game:DefineFastString("UsernameSaved", "UsernameSaved")
	},
	[EventNamesModule.FilteredDisplayName] = {
		name = game:DefineFastString("FilteredDisplayName", "FilteredDisplayName")
	},
	[EventNamesModule.DisplayNameTooShort] = {
		name = game:DefineFastString("DisplayNameTooShort", "DisplayNameTooShort")
	},
	[EventNamesModule.DescriptionPINBlocked] = {
		name = game:DefineFastString("DescriptionPINBlocked", "DescriptionPINBlocked")
	},
	[EventNamesModule.OpenAvatarMarketplace] = {
		name = "OpenAvatarMarketplace",
		platformSpecificity = require(script:FindFirstAncestor("EditProfile").Parent.SocialLuaAnalytics).Analytics.Enums.PlatformSpecificity.BucketsOnly
	}
}
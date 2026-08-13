return {
	RODUX_KEY = "EditProfile",
	CloseUpdateUsernameModal = "CloseUpdateUsernameModal",
	UpdateUsernameModalSuccess = "UpdateUsernameModalSuccess",
	EditProfileBackground = "EditProfileBackground",
	EditUserNameWebView = "navigateToEditUsername",
	ChangeUsernamePrice = 1000,
	JavascriptHybrid = {
		Module = { Navigation = "Navigation" },
		Function = { navigateToFeature = "navigateToFeature" },
		Feature = {
			CloseUpdateUsernameModal = "CloseUpdateUsernameModal",
			UpdateUsernameModalSuccess = "UpdateUsernameModalSuccess"
		}
	},
	DisplayNameValidationErrorCodes = {
		TooShort = 1,
		TooLong = 2,
		InvalidCharacters = 3,
		Moderated = 4,
		Throttled = 5,
		InvalidCharacterSetCombination = 8,
		NameNotAvailable = 9
	},
	SocialMediaOrder = {
		"facebook",
		"twitter",
		"youtube",
		"twitch",
		"guilded"
	},
	SocialMediaIcons = {
		twitter = "icons/brands/x",
		facebook = "icons/brands/facebook",
		youtube = "icons/brands/youtube",
		twitch = "icons/brands/twitch",
		guilded = "icons/brands/guilded"
	},
	SocialNetworksErrorCodes = {
		Facebook = 11,
		Twitter = 12,
		YouTube = 13,
		Twitch = 14,
		Guilded = 15
	},
	DescriptionErrorCodes = { Throttled = 0, PinLocked = 2 },
	VisibilitySettings = {
		AllUsers = "AllUsers",
		FriendsFollowingAndFollowers = "FriendsFollowingAndFollowers",
		FriendsAndFollowing = "FriendsAndFollowing",
		Friends = "Friends",
		NoOne = "NoOne"
	}
}
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local fFlagAddIEMProfilePage = require(parent.SharedFlags).FFlagAddIEMProfilePage
local fFlagProfilePlatformEnableCurrencyTransfer = require(parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local fFlagEnableProfileCompletion = require(parent.SharedFlags).FFlagEnableProfileCompletion
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEditBackgroundMenuItemModule = require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local fFlagSocialEnableProfileInspectAndBuy = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local fFlagProfilePlatformEnableMomentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableMoments)

return {
	Components = {
		About = "About",
		Actions = "Actions",
		CoverPhoto = "CoverPhoto",
		CurrentlyWearing = "CurrentlyWearing",
		FavoriteExperiences = "FavoriteExperiences",
		Store = "Store",
		SocialLinks = "SocialLinks",
		Videos = "Videos",
		UserProfileHeader = "UserProfileHeader",
		ViewFullProfile = "ViewFullProfile",
		Inventory = "Inventory",
		CommunityProfileHeader = "CommunityProfileHeader",
		Experiences = "Experiences",
		ContactProfileHeader = "ContactProfileHeader",
		ContactDescription = "ContactDescription",
		CommunityLocked = "CommunityLocked",
		ProfileBackground = "ProfileBackground",
		Events = "Events",
		CurrentlyPlaying = "CurrentlyPlaying",
		ProfileCompletion = if fFlagEnableProfileCompletion then "ProfileCompletion" else "",
		Moments = if fFlagProfilePlatformEnableMomentsModule then "UserMoments" else ""
	},
	ProfileActions = {
		AcceptFriendRequest = "AcceptFriendRequest",
		AcceptOffNetworkFriendRequest = "AcceptOffNetworkFriendRequest",
		AddFriend = "AddFriend",
		AddFriendFromContacts = "AddFriendFromContacts",
		AddFriendFromContactsSent = "AddFriendFromContactsSent",
		AddTrustedConnection = "AddTrustedConnection",
		AddTrustedConnectionViaLink = "AddTrustedConnectionViaLink",
		AddIncomingTrustedConnection = "AddIncomingTrustedConnection",
		PendingTrustedConnection = "PendingTrustedConnection",
		PendingIncomingTrustedConnection = "PendingIncomingTrustedConnection",
		Block = "Block",
		CannotAddFriend = "CannotAddFriend",
		Chat = "Chat",
		EditAlias = "EditAlias",
		EditAppearance = if fFlagProfilePlatformEnableEditAppearanceMenuModule then "EditAppearance" else "",
		EditAvatar = "EditAvatar",
		EditLook = "EditLook",
		EditEmotes = if fFlagProfilePlatformEnableEditAppearanceMenuModule then "EditEmotes" else "",
		SwitchAvatar = if fFlagProfilePlatformEnableEditAppearanceMenuModule then "SwitchAvatar" else "",
		EditBackground = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEditBackgroundMenuItemModule then "EditBackground" else "",
		EditProfile = "EditProfile",
		IgnoreFriendRequest = "IgnoreFriendRequest",
		JoinExperience = "JoinExperience",
		PendingFriendRequest = "PendingFriendRequest",
		QrCode = "QrCode",
		Report = "Report",
		ShareProfile = "ShareProfile",
		Unblock = "Unblock",
		Unfriend = "Unfriend",
		CopyLink = "CopyLink",
		JoinCommunity = "JoinCommunity",
		CancelJoinCommunityRequest = "CancelJoinCommunityRequest",
		ViewCommunity = "ViewCommunity",
		ViewFullProfile = "ViewFullProfile",
		LeaveCommunity = "LeaveCommunity",
		MakePrimaryCommunity = "MakePrimaryCommunity",
		RemovePrimaryCommunity = "RemovePrimaryCommunity",
		Follow = "Follow",
		Unfollow = "Unfollow",
		RemoveTrustedConnection = "RemoveTrustedConnection",
		ViewPlatformProfile = "ViewPlatformProfile",
		ViewAbout = "ViewAbout",
		CurrencyTransfer = if fFlagProfilePlatformEnableCurrencyTransfer then "CurrencyTransfer" else "",
		ContextualOverflow = if require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor) then "ContextualOverflow" else "",
		UnlockChat = "UnlockChat"
	},
	DisabledReasons = {
		BannedFromCommunity = "BannedFromCommunity",
		CommunityIsClosed = "CommunityIsClosed",
		MaxCommunitiesJoined = "MaxCommunitiesJoined",
		InsufficientVerificationLevelLow = "InsufficientVerificationLevelLow",
		InsufficientVerificationLevelMedium = "InsufficientVerificationLevelMedium",
		InsufficientVerificationLevelHigh = "InsufficientVerificationLevelHigh",
		AccountCreatedLessThanOneDay = "AccountCreatedLessThanOneDay",
		AccountCreatedLessThanThreeDays = "AccountCreatedLessThanThreeDays",
		AccountCreatedLessThanOneWeek = "AccountCreatedLessThanOneWeek",
		AccountCreatedLessThanOneMonth = "AccountCreatedLessThanOneMonth",
		AccountCreatedLessThanThreeMonths = "AccountCreatedLessThanThreeMonths"
	},
	ProfileTypes = {
		User = "User",
		Community = "Community",
		Contact = "Contact"
	},
	Sources = {
		HomepageFriendsCarousel = "HomepageFriendsCarousel",
		OffNetworkFriendRequest = "OffNetworkFriendRequest",
		PlayerSearch = "PlayerSearch",
		ProfileDeepLink = "ProfileDeepLink",
		ProfileShare = "ProfileShare",
		QrCode = "QrCode",
		HomepageAd = "HomepageAd",
		ItemDetailsPage = "ItemDetailsPage",
		MutualConnectionsList = "MutualConnectionsList",
		JoinGameCard = "JoinGameCard",
		SchoolMemberList = "SchoolMemberList",
		InExperienceProfile = if fFlagAddIEMProfilePage then "InExperienceProfile" else "",
		MomentsFeed = if fFlagProfilePlatformEnableMomentsModule then "MomentsFeed" else ""
	},
	ContextualTypes = {
		AccountDeleted = "AccountDeleted",
		Presence = "Presence",
		IsYourself = "IsYourself",
		PreviousUsername = "PreviousUsername",
		YouAreFollowing = "YouAreFollowing",
		FollowsYou = "FollowsYou",
		MutualFriends = "MutualFriends",
		PlayedTogether = "PlayedTogether",
		OffNetworkFriendRequest = "OffNetworkFriendRequest",
		SentFromQrCode = "SentFromQrCode",
		SentFromExperience = "SentFromExperience"
	},
	PresenceTypes = {
		Online = "Online",
		Offline = "Offline",
		InGame = "InGame",
		InStudio = "InStudio"
	},
	Screens = {
		ProfileMain = "ProfileMain",
		ItemDetails = "ItemDetails",
		ItemOrBundleDetails = "ItemOrBundleDetails",
		VideoFullscreen = "VideoFullscreen",
		EditProfilePage = "EditProfilePage",
		EditDisplayNameModal = "EditDisplayNameModal",
		EditDescriptionModal = "EditDescriptionModal",
		EditDisplayNameErrorModal = "EditDisplayNameErrorModal",
		UsernameInsufficientFundsModal = "UsernameInsufficientFundsModal",
		SetAliasModal = "SetAliasModal",
		SetNicknameModal = "SetNicknameModal",
		ContextualMenu = "ContextualMenu",
		EditProfileBackground = "EditProfileBackground",
		CommunityVerificationModal = "CommunityVerificationModal",
		PurchaseConfirmationModal = "PurchaseConfirmationModal",
		TransferRobuxFlow = if fFlagProfilePlatformEnableCurrencyTransfer then "TransferRobuxFlow" else "",
		InsufficientRobuxDialog = if fFlagSocialEnableProfileInspectAndBuy then "InsufficientRobuxDialog" else "",
		InspectAvatarSheet = if fFlagSocialEnableProfileInspectAndBuy then "InspectAvatarSheet" else "",
		MomentsAll = if fFlagProfilePlatformEnableMomentsModule then "MomentsAll" else "",
		MomentsFeed = if fFlagProfilePlatformEnableMomentsModule then "MomentsFeed" else ""
	},
	NameTypes = {
		Alias = "Alias",
		DisplayName = "DisplayName",
		Username = "Username"
	},
	ButtonSurface = { Actions = "Actions", ContextualMenu = "ContextualMenu" },
	ItemTypes = { Asset = "Asset", Bundle = "Bundle" },
	FriendStatus = {
		Self = "self",
		NotFriends = "nonfriend",
		Friends = "friend",
		RequestSent = "requestSent",
		RequestReceived = "requestReceived",
		Ineligible = "ineligible",
		Unknown = "unknown"
	},
	PriceLineContentType = { Price = "price", Text = "text" },
	SocialMediaTypes = {
		Twitter = "twitter",
		Facebook = "facebook",
		Discord = "discord",
		YouTube = "youtube",
		Twitch = "twitch",
		Guilded = "guilded",
		X = "x"
	},
	ViewFullProfileTypes = { Profile = "Profile", Community = "Community" },
	ProfileFormFactor = { Wide = "Wide", PeekView = "PeekView" },
	ProfileTabVariants = { Default = "Default", MeTab = "MeTab" },
	ProfileAvatarLayoutVariant = { Default = "Default", MeTabMobile = "MeTabMobile" },
	LoadingState = {
		Failed = "Failed",
		Finished = "Finished",
		Loading = "Loading"
	},
	SocialCountEnableKeys = {
		IsFriendsCountEnabled = "isFriendsCountEnabled",
		IsFollowersCountEnabled = "isFollowersCountEnabled",
		IsFollowingsCountEnabled = "isFollowingsCountEnabled",
		IsMutualFriendsCountEnabled = "isMutualFriendsCountEnabled"
	}
}
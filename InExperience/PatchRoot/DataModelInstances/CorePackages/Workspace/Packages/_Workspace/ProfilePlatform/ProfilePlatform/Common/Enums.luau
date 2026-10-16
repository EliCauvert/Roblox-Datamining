local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local FFlagAddIEMProfilePage = require(Parent.SharedFlags).FFlagAddIEMProfilePage
local FFlagProfilePlatformEnableCurrencyTransfer = require(Parent.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableTradeItemsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local FFlagEnableProfileCompletion = require(Parent.SharedFlags).FFlagEnableProfileCompletion
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEditBackgroundMenuItemModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local FFlagSocialEnableProfileInspectAndBuy = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local FFlagProfilePlatformEnableMomentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableMoments)
local FFlagFriendsCallingClientGateDEV = require(Parent.SharedFlags).FFlagFriendsCallingClientGate_DEV
local FFlagUseUserCtaCommonEnums = require(Parent.SharedFlags).FFlagUseUserCtaCommonEnums
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor
local UserCtaCommonModule = require(Parent.UserCtaCommon)
local UserCtaAction = if FFlagUseUserCtaCommonEnums then UserCtaCommonModule.Enums.UserCtaAction else nil

local function buildSharedProfileActions() --[[ Line: 174 ]]
	-- upvalues: UserCtaAction (copy), FFlagFriendsCallingClientGateDEV (copy), FFlagProfilePlatformEnableEditAppearanceMenuModule (copy), FFlagProfilePlatformEditBackgroundMenuItemModule (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagProfilePlatformEnableTradeItemsModule (copy), FFlagJoinabilityCTARefactor (copy)
	local Copy = table.clone(UserCtaAction)
	Copy.Call = if FFlagFriendsCallingClientGateDEV then UserCtaAction.Call else ""
	Copy.EditAppearance = if FFlagProfilePlatformEnableEditAppearanceMenuModule then UserCtaAction.EditAppearance else ""
	Copy.EditEmotes = if FFlagProfilePlatformEnableEditAppearanceMenuModule then UserCtaAction.EditEmotes else ""
	Copy.SwitchAvatar = if FFlagProfilePlatformEnableEditAppearanceMenuModule then UserCtaAction.SwitchAvatar else ""
	Copy.EditBackground = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEditBackgroundMenuItemModule then UserCtaAction.EditBackground else ""
	Copy.CurrencyTransfer = if FFlagProfilePlatformEnableCurrencyTransfer then UserCtaAction.CurrencyTransfer else ""
	Copy.TradeItems = if FFlagProfilePlatformEnableTradeItemsModule then UserCtaAction.TradeItems else ""
	Copy.ContextualOverflow = UserCtaAction.ContextualOverflow
	Copy.PlayExperience = if FFlagJoinabilityCTARefactor then UserCtaAction.PlayExperience else ""
	Copy.ViewProfile = if FFlagJoinabilityCTARefactor then UserCtaAction.ViewProfile else ""
	Copy.UnlockExperience = if FFlagJoinabilityCTARefactor then UserCtaAction.UnlockExperience else ""
	
	return Copy
end

return {
	Components = {
		About = "About",
		Actions = "Actions",
		CoverPhoto = "CoverPhoto",
		CurrentlyWearing = "CurrentlyWearing",
		FavoriteExperiences = "FavoriteExperiences",
		Store = "Store",
		SocialLinks = "SocialLinks",
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
		Announcements = "Announcements",
		ProfileCompletion = if FFlagEnableProfileCompletion then "ProfileCompletion" else "",
		Moments = if FFlagProfilePlatformEnableMomentsModule then "UserMoments" else ""
	},
	ProfileActions = if FFlagUseUserCtaCommonEnums then buildSharedProfileActions() else {
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
		Call = if FFlagFriendsCallingClientGateDEV then "Call" else "",
		Chat = "Chat",
		EditAlias = "EditAlias",
		EditAppearance = if FFlagProfilePlatformEnableEditAppearanceMenuModule then "EditAppearance" else "",
		EditAvatar = "EditAvatar",
		EditLook = "EditLook",
		EditEmotes = if FFlagProfilePlatformEnableEditAppearanceMenuModule then "EditEmotes" else "",
		SwitchAvatar = if FFlagProfilePlatformEnableEditAppearanceMenuModule then "SwitchAvatar" else "",
		EditBackground = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEditBackgroundMenuItemModule then "EditBackground" else "",
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
		CurrencyTransfer = if FFlagProfilePlatformEnableCurrencyTransfer then "CurrencyTransfer" else "",
		TradeItems = if FFlagProfilePlatformEnableTradeItemsModule then "TradeItems" else "",
		ContextualOverflow = "ContextualOverflow",
		UnlockChat = "UnlockChat",
		PlayExperience = if FFlagJoinabilityCTARefactor then "PlayExperience" else "",
		ViewProfile = "",
		UnlockExperience = ""
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
		InExperienceProfile = if FFlagAddIEMProfilePage then "InExperienceProfile" else "",
		MomentsFeed = if FFlagProfilePlatformEnableMomentsModule then "MomentsFeed" else ""
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
		EditProfilePage = "EditProfilePage",
		EditDisplayNameErrorModal = "EditDisplayNameErrorModal",
		UsernameInsufficientFundsModal = "UsernameInsufficientFundsModal",
		SetAliasModal = "SetAliasModal",
		SetNicknameModal = "SetNicknameModal",
		ContextualMenu = "ContextualMenu",
		EditProfileBackground = "EditProfileBackground",
		CommunityVerificationModal = "CommunityVerificationModal",
		PurchaseConfirmationModal = "PurchaseConfirmationModal",
		TransferRobuxFlow = if FFlagProfilePlatformEnableCurrencyTransfer then "TransferRobuxFlow" else "",
		InsufficientRobuxDialog = if FFlagSocialEnableProfileInspectAndBuy then "InsufficientRobuxDialog" else "",
		InspectAvatarSheet = if FFlagSocialEnableProfileInspectAndBuy then "InspectAvatarSheet" else "",
		MomentsAll = if FFlagProfilePlatformEnableMomentsModule then "MomentsAll" else "",
		MomentsFeed = if FFlagProfilePlatformEnableMomentsModule then "MomentsFeed" else ""
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
local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseJoinUserInExperienceFunction = require(Parent.SocialExperienceJoin).useJoinUserInExperience
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local ProfileShareLinksModule = require(Parent.ProfileShareLinks)
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseAboutSectionsModule = require(ProfilePlatform.Hooks.useAboutSections)
local UseActionsComponentRequestModule = require(ProfilePlatform.Hooks.useActionsComponentRequest)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileShareLinkFunction = ProfileShareLinksModule.Hooks.useProfileShareLink
local UseShortUrlFunction = ProfileShareLinksModule.Hooks.useShortUrl
local UseGetOrGenerateLinkUrlFunction = ProfileShareLinksModule.Hooks.useGetOrGenerateLinkUrl
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local FFlagProfilePlatformAddTC = SharedFlagsModule.FFlagProfilePlatformAddTC
local FFlagEnablePlatformProfileContextualMenuOption = require(Parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local FFlagProfilePlatformNewProfileHeader = SharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local FFlagProfileAboutDetailsUseSheet = SharedFlagsModule.FFlagProfileAboutDetailsUseSheet
local FFlagProfilePlatformPassPresenceToJoinUserInExperience = SharedFlagsModule.FFlagProfilePlatformPassPresenceToJoinUserInExperience
local FFlagProfilePlatformPresenceStoreMigrationModule = require(ProfilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local UseGetPresenceByUserId = if FFlagProfilePlatformPresenceStoreMigrationModule then require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local FFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local FFlagProfilePlatformEnableCurrencyTransfer = SharedFlagsModule.FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableTradeItemsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEditBackgroundMenuItemModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local FFlagProfilePlatformEnableEditLookModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local FFlagJoinabilityCTARefactor = SharedFlagsModule.FFlagJoinabilityCTARefactor
local ProfileActionsModule = require(ProfilePlatform.Components.CTARow.ProfileActions)
local _ = require(Parent.GenericAbuseReporting.AbuseVector)
local PresenceModule = require(ProfilePlatform.Rodux.Presence)
local FFlagProfilePlatformEnableUserFollowModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableUserFollow)
local Text = tostring(DateTime.now().UnixTimestampMillis)
local config = { skipFetch = true }

return function(ButtonSurface) --[[ Line: 67 ]]
	-- upvalues: UseLocalUserIdFunction (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseShortUrlFunction (copy), UseGetOrGenerateLinkUrlFunction (copy), UseEffectOnceFunction (copy), ReactModule (copy), Text (copy), TextKeysModule (copy), UseLocalizationFunction (copy), EnumsModule (copy), FFlagProfilePlatformAddTC (copy), FFlagProfilePlatformEnableEditAppearanceMenuModule (copy), FFlagProfilePlatformEditBackgroundMenuItemModule (copy), FFlagProfilePlatformEnableEditLookModule (copy), FFlagJoinabilityCTARefactor (copy), FFlagProfilePlatformNewProfileHeader (copy), FFlagEnablePlatformProfileContextualMenuOption (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagProfilePlatformEnableTradeItemsModule (copy), FFlagProfilePlatformEnableUserFollowModule (copy), FFlagProfilePlatformPresenceStoreMigrationModule (copy), UseGetPresenceByUserId (copy), config (copy), FFlagProfilePlatformPassPresenceToJoinUserInExperience (copy), UseSelectorFunction (copy), PresenceModule (copy), UseAboutSectionsModule (copy), FFlagProfileAboutDetailsUseSheet (copy), FFlagProfilePlatformRefreshActionsRespectPoliciesModule (copy), UseActionsComponentRequestModule (copy), UseJoinUserInExperienceFunction (copy), UseProfileShareLinkFunction (copy), Contexts (copy), ProfileActionsModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local NavigateToTransfer = UseProfileWrapperContextModuleResult.navigateTo and UseProfileWrapperContextModuleResult.navigateTo.navigateToTransfer or nil
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseShortUrlResult = UseShortUrlFunction()
	UseEffectOnceFunction(UseGetOrGenerateLinkUrlFunction(), not (UseShortUrlResult ~= nil))
	local UseMemoResult = ReactModule.useMemo(function(): string --[[ Line: 81 ]]
		-- upvalues: UseShortUrlResult (copy), Text (upval)
		return string.format("%s&source=ProfileShare&stamp=%s", UseShortUrlResult or "", Text)
	end, { UseShortUrlResult })
	local AcceptFriend = TextKeysModule.AcceptFriend
	local AddFriend = TextKeysModule.AddFriend
	local UseLocalizationResult = UseLocalizationFunction({
		[EnumsModule.ProfileActions.AcceptFriendRequest] = AcceptFriend,
		[EnumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = AcceptFriend,
		[EnumsModule.ProfileActions.AddFriend] = AddFriend,
		[EnumsModule.ProfileActions.AddFriendFromContacts] = AddFriend,
		[EnumsModule.ProfileActions.AddFriendFromContactsSent] = TextKeysModule.PendingRequest,
		[EnumsModule.ProfileActions.AddTrustedConnection] = if FFlagProfilePlatformAddTC then TextKeysModule.AddTrustedConnection else nil,
		[EnumsModule.ProfileActions.AddIncomingTrustedConnection] = if FFlagProfilePlatformAddTC then TextKeysModule.AcceptTrustedConnection else nil,
		[EnumsModule.ProfileActions.Block] = TextKeysModule.Block,
		[EnumsModule.ProfileActions.CannotAddFriend] = AddFriend,
		[EnumsModule.ProfileActions.Chat] = TextKeysModule.Chat,
		[EnumsModule.ProfileActions.UnlockChat] = TextKeysModule.UnlockChat,
		[EnumsModule.ProfileActions.EditAlias] = TextKeysModule.CustomizeName,
		[EnumsModule.ProfileActions.EditAppearance] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then TextKeysModule.EditAppearance else nil,
		[EnumsModule.ProfileActions.EditEmotes] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then TextKeysModule.EditEmotes else nil,
		[EnumsModule.ProfileActions.SwitchAvatar] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then TextKeysModule.SwitchAvatar else nil,
		[EnumsModule.ProfileActions.EditBackground] = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEditBackgroundMenuItemModule then TextKeysModule.EditBackground else nil,
		[EnumsModule.ProfileActions.EditAvatar] = TextKeysModule.EditAvatar,
		[EnumsModule.ProfileActions.EditLook] = if FFlagProfilePlatformEnableEditLookModule then TextKeysModule.EditLook else nil,
		[EnumsModule.ProfileActions.EditProfile] = TextKeysModule.EditProfile,
		[EnumsModule.ProfileActions.IgnoreFriendRequest] = TextKeysModule.IgnoreFriendRequest,
		[EnumsModule.ProfileActions.JoinExperience] = TextKeysModule.Join,
		[EnumsModule.ProfileActions.PlayExperience] = if FFlagJoinabilityCTARefactor then TextKeysModule.Play else nil,
		[EnumsModule.ProfileActions.PendingFriendRequest] = TextKeysModule.PendingRequest,
		[EnumsModule.ProfileActions.QrCode] = TextKeysModule.ToQRCode,
		[EnumsModule.ProfileActions.Report] = TextKeysModule.Report,
		[EnumsModule.ProfileActions.ShareProfile] = TextKeysModule.ShareProfile,
		[EnumsModule.ProfileActions.Unblock] = TextKeysModule.Unblock,
		[EnumsModule.ProfileActions.Unfriend] = TextKeysModule.Unfriend,
		[EnumsModule.ProfileActions.CopyLink] = TextKeysModule.CopyLink,
		[EnumsModule.ProfileActions.JoinCommunity] = TextKeysModule.JoinCommunity,
		[EnumsModule.ProfileActions.CancelJoinCommunityRequest] = TextKeysModule.CancelJoinCommunityRequest,
		[EnumsModule.ProfileActions.ViewCommunity] = TextKeysModule.ViewCommunity,
		[EnumsModule.ProfileActions.ViewFullProfile] = TextKeysModule.ViewFullProfile,
		[EnumsModule.ProfileActions.LeaveCommunity] = TextKeysModule.LeaveCommunity,
		[EnumsModule.ProfileActions.MakePrimaryCommunity] = TextKeysModule.MakePrimaryCommunity,
		[EnumsModule.ProfileActions.RemovePrimaryCommunity] = TextKeysModule.RemovePrimaryCommunity,
		[EnumsModule.ProfileActions.Follow] = TextKeysModule.Follow,
		[EnumsModule.ProfileActions.Unfollow] = TextKeysModule.Unfollow,
		[EnumsModule.ProfileActions.RemoveTrustedConnection] = TextKeysModule.RemoveTrustedConnection,
		[EnumsModule.ProfileActions.ViewAbout] = if FFlagProfilePlatformNewProfileHeader then TextKeysModule.AboutThisProfile else nil,
		[EnumsModule.ProfileActions.ViewPlatformProfile] = if FFlagEnablePlatformProfileContextualMenuOption then TextKeysModule.ViewPlatformProfile else nil,
		[EnumsModule.ProfileActions.CurrencyTransfer] = if FFlagProfilePlatformEnableCurrencyTransfer then TextKeysModule.CurrencyTransfer else nil,
		[EnumsModule.ProfileActions.TradeItems] = if FFlagProfilePlatformEnableTradeItemsModule then TextKeysModule.TradeItems else nil,
		friendAcceptedToast = TextKeysModule.FriendAdded,
		friendRemovedToast = TextKeysModule.FriendRemoved,
		trustedConnectionRemovedToast = TextKeysModule.TrustedConnectionRemoved,
		friendRequestSentToast = TextKeysModule.FriendRequestSent,
		friendRequestIgnoredToast = TextKeysModule.RequestIgnored,
		followedToast = if FFlagProfilePlatformEnableUserFollowModule then TextKeysModule.Followed else nil,
		unfollowedToast = if FFlagProfilePlatformEnableUserFollowModule then TextKeysModule.Unfollowed else nil,
		userBlockedToast = TextKeysModule.UserBlocked,
		blockLimitReachedToast = TextKeysModule.BlockLimitReached,
		blocktargetAlreadyBlockedToast = TextKeysModule.BlockTargetAlreadyBlocked,
		blockedOnPlatformToast = TextKeysModule.UnblockTargetBlockedOnPlatform,
		unblockTargetNotBlockedToast = TextKeysModule.UnblockTargetNotBlocked,
		unblockTargetParentManagedToast = TextKeysModule.UnblockTargetParentManaged,
		somethingIsWrongToast = TextKeysModule.SomethingIsWrong,
		alreadyFriendError = TextKeysModule.AlreadyFriendError,
		defaultFriendingError = TextKeysModule.DefaultFriendingError,
		invalidNicknameError = TextKeysModule.InvalidNicknameError,
		invalidTargetUserError = TextKeysModule.InvalidTargetUserError,
		maxFriendsError = TextKeysModule.MaxFriendsError,
		unauthorizedError = TextKeysModule.UnauthorizedError,
		userBannedError = TextKeysModule.UserBannedError,
		userBlockedError = TextKeysModule.UserBlockedError,
		userNotPassedCaptchaError = TextKeysModule.UserNotPassedCaptchaError,
		tooManyRequestsError = TextKeysModule.TooManyRequestsError
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 179 ]]
		-- upvalues: UseProfileWrapperContextModuleResult (copy)
		UseProfileWrapperContextModuleResult.navigateTo.previousView(true)
	end, {
		UseProfileWrapperContextModuleResult.navigateTo.previousView
	})
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local UseGetPresenceByUserIdResult = if FFlagProfilePlatformPresenceStoreMigrationModule then UseGetPresenceByUserId(ProfileId, config) elseif FFlagProfilePlatformPassPresenceToJoinUserInExperience then UseSelectorFunction(function(p1) --[[ Line: 191 ]]
		-- upvalues: PresenceModule (upval), ProfileId (copy)
		return PresenceModule.Selectors.getUserPresenceByUserId(p1, ProfileId) or {
			lastLocation = "",
			userPresenceType = PresenceModule.Enums.PresenceType.Offline
		}
	end) else nil
	local AboutSections = nil
	local ProfileName = nil
	
	if FFlagProfilePlatformNewProfileHeader then
		local UseAboutSectionsModuleResult = UseAboutSectionsModule()
		AboutSections = UseAboutSectionsModuleResult.aboutSections
		ProfileName = if FFlagProfileAboutDetailsUseSheet then UseAboutSectionsModuleResult.profileName else nil
	end
	local UseActionsComponentRequestModuleResult = if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then UseActionsComponentRequestModule() else nil
	local UseJoinUserInExperienceResult = UseJoinUserInExperienceFunction(ProfileId, {
		isHomePageCarousel = UseProfileWrapperContextModuleResult.sourceInfo.source == EnumsModule.Sources.HomepageFriendsCarousel,
		homepageCarouselAbsolutePosition = UseProfileWrapperContextModuleResult.sourceInfo.homepageCarouselAbsolutePosition,
		openGameDetailsPeekViewClosed = UseResult,
		presence = if FFlagProfilePlatformPassPresenceToJoinUserInExperience then UseGetPresenceByUserIdResult else nil
	})
	local QRCodePage = UseProfileWrapperContextModuleResult.navigateTo.qRCodePage
	local EditUsername = UseProfileWrapperContextModuleResult.navigateTo.editUsername
	local EditEmotes = if FFlagProfilePlatformEnableEditAppearanceMenuModule then UseProfileWrapperContextModuleResult.navigateTo.editEmotes else nil
	local SwitchAvatar = if FFlagProfilePlatformEnableEditAppearanceMenuModule then UseProfileWrapperContextModuleResult.navigateTo.switchAvatar else nil
	local EditAvatar = UseProfileWrapperContextModuleResult.navigateTo.editAvatar
	local config1 = {
		localized = UseLocalizationResult,
		analytics = UseProfileAnalyticsContextModuleResult,
		buttonSurface = ButtonSurface,
		profileWrapperContext = UseProfileWrapperContextModuleResult,
		navigateTo = UseProfileWrapperContextModuleResult.navigateTo,
		dispatch = UseDispatchResult,
		profileId = ProfileId,
		localUserId = UseLocalUserIdResult,
		navigation = UseNavigationResult,
		profileType = ProfileType,
		experienceUtilities = UseJoinUserInExperienceResult,
		profileShareLink = UseProfileShareLinkFunction({ context = Contexts.ProfileCard }),
		PROFILE_SHARE_LINK_URL = UseMemoResult,
		aboutSections = if FFlagProfilePlatformNewProfileHeader then AboutSections else nil,
		aboutProfileName = if FFlagProfileAboutDetailsUseSheet then ProfileName else nil,
		actionsComponentRequest = if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then UseActionsComponentRequestModuleResult else nil
	}
	
	return (ReactModule.useMemo(function() --[[ Line: 254 ]]
		-- upvalues: ProfileActionsModule (upval), config1 (copy)
		local t = {}
		
		for i, value in ProfileActionsModule do
			local v1 = value(config1)
			
			if v1 ~= nil then
				t[i] = v1
			end
		end
		return t
	end, {
		UseDispatchResult, ProfileId, UseProfileWrapperContextModuleResult,
		if FFlagProfilePlatformEnableCurrencyTransfer then NavigateToTransfer else nil,
		QRCodePage, UseLocalizationResult, UseLocalUserIdResult, UseNavigationResult,
		EditUsername, UseJoinUserInExperienceResult.joinExperience,
		if FFlagJoinabilityCTARefactor then UseJoinUserInExperienceResult.playExperience else nil,
		UseJoinUserInExperienceResult.isLoading,
		UseProfileAnalyticsContextModuleResult, ButtonSurface,
		if FFlagProfilePlatformNewProfileHeader then AboutSections else nil,
		if FFlagProfileAboutDetailsUseSheet then ProfileName else nil, ProfileType,
		EditAvatar,
		if FFlagProfilePlatformEnableEditAppearanceMenuModule then EditEmotes else nil,
		if FFlagProfilePlatformEnableEditAppearanceMenuModule then SwitchAvatar else nil,
		UseMemoResult, UseJoinUserInExperienceResult.isInExperience, config1,
		if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then UseActionsComponentRequestModuleResult else nil
	}))
end
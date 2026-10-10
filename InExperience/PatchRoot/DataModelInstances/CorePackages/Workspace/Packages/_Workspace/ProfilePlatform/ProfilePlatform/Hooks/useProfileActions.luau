local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local navigationModule = require(parent.Navigation)
local socialExperienceJoinModule = require(parent.SocialExperienceJoin)
local sharedFlagsModule = require(parent.SharedFlags)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useNavigation = navigationModule.useNavigation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useJoinUserInExperience = socialExperienceJoinModule.useJoinUserInExperience
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local profileShareLinksModule = require(parent.ProfileShareLinks)
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useAboutSectionsModule = require(profilePlatform.Hooks.useAboutSections)
local useActionsComponentRequestModule = require(profilePlatform.Hooks.useActionsComponentRequest)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileShareLink = profileShareLinksModule.Hooks.useProfileShareLink
local useShortUrl = profileShareLinksModule.Hooks.useShortUrl
local useGetOrGenerateLinkUrl = profileShareLinksModule.Hooks.useGetOrGenerateLinkUrl
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local fFlagProfilePlatformAddTC = sharedFlagsModule.FFlagProfilePlatformAddTC
local fFlagEnablePlatformProfileContextualMenuOption = require(parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local fFlagProfilePlatformNewProfileHeader = sharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local fFlagProfileAboutDetailsUseSheet = sharedFlagsModule.FFlagProfileAboutDetailsUseSheet
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagProfilePlatformPassPresenceToJoinUserInExperience = sharedFlagsModule.FFlagProfilePlatformPassPresenceToJoinUserInExperience
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local var1 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local fFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(profilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local fFlagProfilePlatformEnableCurrencyTransfer = sharedFlagsModule.FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableTradeItemsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEditBackgroundMenuItemModule = require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local fFlagProfilePlatformEnableEditLookModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local fFlagJoinabilityCTARefactor = sharedFlagsModule.FFlagJoinabilityCTARefactor
local profileActionsModule = require(profilePlatform.Components.CTARow.ProfileActions)
local _ = require(parent.GenericAbuseReporting.AbuseVector)
local presenceModule = require(profilePlatform.Rodux.Presence)
local fFlagProfilePlatformEnableUserFollowModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableUserFollow)
local var2 = tostring(DateTime.now().UnixTimestampMillis)
local t = { skipFetch = true }

return function(p1)
	-- upvalues: useLocalUserId (ref), useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useShortUrl (ref), useGetOrGenerateLinkUrl (ref), useEffectOnce (ref), reactModule (ref), var2 (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), useLocalization (ref), enumsModule (ref), fFlagProfilePlatformAddTC (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), fFlagProfilePlatformEditBackgroundMenuItemModule (ref), fFlagProfilePlatformEnableEditLookModule (ref), fFlagJoinabilityCTARefactor (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagEnablePlatformProfileContextualMenuOption (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformEnableTradeItemsModule (ref), fFlagProfilePlatformEnableUserFollowModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), var1 (ref), t (ref), fFlagProfilePlatformPassPresenceToJoinUserInExperience (ref), useSelector (ref), presenceModule (ref), useAboutSectionsModule (ref), fFlagProfileAboutDetailsUseSheet (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), useJoinUserInExperience (ref), useProfileShareLink (ref), contexts (ref), profileActionsModule (ref)
	local var3 = useLocalUserId()
	local var4 = useDispatch()
	local var5 = useNavigation()
	local var6 = useProfileWrapperContextModule()
	local var7 = if var6.navigateTo then var6.navigateTo.navigateToTransfer else nil
	local var8 = useProfileAnalyticsContextModule()
	local var9 = useShortUrl()
	useEffectOnce(useGetOrGenerateLinkUrl(), not (var9 ~= nil))
	local var10 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), var2 (copy)
		return string.format("%s&source=ProfileShare&stamp=%s", var9 or "", var2)
	end, { var9 })
	local var11 = if fFlagConnectionsToFriendsRename then textKeysModule.AcceptFriend else textKeysModule.AcceptConnection
	local var12 = if fFlagConnectionsToFriendsRename then textKeysModule.AddFriend else textKeysModule.AddConnection
	local var13 = useLocalization({
		[enumsModule.ProfileActions.AcceptFriendRequest] = var11,
		[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = var11,
		[enumsModule.ProfileActions.AddFriend] = var12,
		[enumsModule.ProfileActions.AddFriendFromContacts] = var12,
		[enumsModule.ProfileActions.AddFriendFromContactsSent] = textKeysModule.PendingRequest,
		[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AddTrustedConnection else nil,
		[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AcceptTrustedConnection else nil,
		[enumsModule.ProfileActions.Block] = textKeysModule.Block,
		[enumsModule.ProfileActions.CannotAddFriend] = var12,
		[enumsModule.ProfileActions.Chat] = textKeysModule.Chat,
		[enumsModule.ProfileActions.UnlockChat] = textKeysModule.UnlockChat,
		[enumsModule.ProfileActions.EditAlias] = textKeysModule.CustomizeName,
		[enumsModule.ProfileActions.EditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then textKeysModule.EditAppearance else nil,
		[enumsModule.ProfileActions.EditEmotes] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then textKeysModule.EditEmotes else nil,
		[enumsModule.ProfileActions.SwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then textKeysModule.SwitchAvatar else nil,
		[enumsModule.ProfileActions.EditBackground] = if fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEditBackgroundMenuItemModule then textKeysModule.EditBackground else nil,
		[enumsModule.ProfileActions.EditAvatar] = textKeysModule.EditAvatar,
		[enumsModule.ProfileActions.EditLook] = if fFlagProfilePlatformEnableEditLookModule then textKeysModule.EditLook else nil,
		[enumsModule.ProfileActions.EditProfile] = textKeysModule.EditProfile,
		[enumsModule.ProfileActions.IgnoreFriendRequest] = if fFlagConnectionsToFriendsRename then textKeysModule.IgnoreFriendRequest else textKeysModule.IgnoreConnectionRequest,
		[enumsModule.ProfileActions.JoinExperience] = textKeysModule.Join,
		[enumsModule.ProfileActions.PlayExperience] = if fFlagJoinabilityCTARefactor then textKeysModule.Play else nil,
		[enumsModule.ProfileActions.PendingFriendRequest] = textKeysModule.PendingRequest,
		[enumsModule.ProfileActions.QrCode] = textKeysModule.ToQRCode,
		[enumsModule.ProfileActions.Report] = textKeysModule.Report,
		[enumsModule.ProfileActions.ShareProfile] = textKeysModule.ShareProfile,
		[enumsModule.ProfileActions.Unblock] = textKeysModule.Unblock,
		[enumsModule.ProfileActions.Unfriend] = if fFlagConnectionsToFriendsRename then textKeysModule.Unfriend else textKeysModule.RemoveConnection,
		[enumsModule.ProfileActions.CopyLink] = textKeysModule.CopyLink,
		[enumsModule.ProfileActions.JoinCommunity] = textKeysModule.JoinCommunity,
		[enumsModule.ProfileActions.CancelJoinCommunityRequest] = textKeysModule.CancelJoinCommunityRequest,
		[enumsModule.ProfileActions.ViewCommunity] = textKeysModule.ViewCommunity,
		[enumsModule.ProfileActions.ViewFullProfile] = textKeysModule.ViewFullProfile,
		[enumsModule.ProfileActions.LeaveCommunity] = textKeysModule.LeaveCommunity,
		[enumsModule.ProfileActions.MakePrimaryCommunity] = textKeysModule.MakePrimaryCommunity,
		[enumsModule.ProfileActions.RemovePrimaryCommunity] = textKeysModule.RemovePrimaryCommunity,
		[enumsModule.ProfileActions.Follow] = textKeysModule.Follow,
		[enumsModule.ProfileActions.Unfollow] = textKeysModule.Unfollow,
		[enumsModule.ProfileActions.RemoveTrustedConnection] = textKeysModule.RemoveTrustedConnection,
		[enumsModule.ProfileActions.ViewAbout] = if fFlagProfilePlatformNewProfileHeader then textKeysModule.AboutThisProfile else nil,
		[enumsModule.ProfileActions.ViewPlatformProfile] = if fFlagEnablePlatformProfileContextualMenuOption then textKeysModule.ViewPlatformProfile else nil,
		[enumsModule.ProfileActions.CurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then textKeysModule.CurrencyTransfer else nil,
		[enumsModule.ProfileActions.TradeItems] = if fFlagProfilePlatformEnableTradeItemsModule then textKeysModule.TradeItems else nil,
		friendAcceptedToast = if fFlagConnectionsToFriendsRename then textKeysModule.FriendAdded else textKeysModule.ConnectionAdded,
		friendRemovedToast = if fFlagConnectionsToFriendsRename then textKeysModule.FriendRemoved else textKeysModule.ConnectionRemoved,
		trustedConnectionRemovedToast = textKeysModule.TrustedConnectionRemoved,
		friendRequestSentToast = if fFlagConnectionsToFriendsRename then textKeysModule.FriendRequestSent else textKeysModule.ConnectionRequestSent,
		friendRequestIgnoredToast = textKeysModule.RequestIgnored,
		followedToast = if fFlagProfilePlatformEnableUserFollowModule then textKeysModule.Followed else nil,
		unfollowedToast = if fFlagProfilePlatformEnableUserFollowModule then textKeysModule.Unfollowed else nil,
		userBlockedToast = textKeysModule.UserBlocked,
		blockLimitReachedToast = textKeysModule.BlockLimitReached,
		blocktargetAlreadyBlockedToast = textKeysModule.BlockTargetAlreadyBlocked,
		blockedOnPlatformToast = textKeysModule.UnblockTargetBlockedOnPlatform,
		unblockTargetNotBlockedToast = textKeysModule.UnblockTargetNotBlocked,
		unblockTargetParentManagedToast = textKeysModule.UnblockTargetParentManaged,
		somethingIsWrongToast = textKeysModule.SomethingIsWrong,
		alreadyFriendError = textKeysModule.AlreadyFriendError,
		defaultFriendingError = textKeysModule.DefaultFriendingError,
		invalidNicknameError = textKeysModule.InvalidNicknameError,
		invalidTargetUserError = textKeysModule.InvalidTargetUserError,
		maxFriendsError = textKeysModule.MaxFriendsError,
		unauthorizedError = textKeysModule.UnauthorizedError,
		userBannedError = textKeysModule.UserBannedError,
		userBlockedError = textKeysModule.UserBlockedError,
		userNotPassedCaptchaError = textKeysModule.UserNotPassedCaptchaError,
		tooManyRequestsError = textKeysModule.TooManyRequestsError
	})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6.navigateTo.previousView(true)
	end, { var6.navigateTo.previousView })
	local profileId = var6.profileId
	local profileType = var6.profileType
	local var15 = if fFlagProfilePlatformPresenceStoreMigrationModule then var1(profileId, t) elseif fFlagProfilePlatformPassPresenceToJoinUserInExperience then useSelector(function(p2)
		-- upvalues: presenceModule (copy), profileId (ref)
		return presenceModule.Selectors.getUserPresenceByUserId(p2, profileId) or {
			lastLocation = "",
			userPresenceType = presenceModule.Enums.PresenceType.Offline
		}
	end) else nil
	local aboutSections = nil
	local var16 = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var17 = useAboutSectionsModule()
		aboutSections = var17.aboutSections
		var16 = if fFlagProfileAboutDetailsUseSheet then var17.profileName else nil
	end
	local var18 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var19 = useJoinUserInExperience(profileId, {
		isHomePageCarousel = var6.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
		homepageCarouselAbsolutePosition = var6.sourceInfo.homepageCarouselAbsolutePosition,
		openGameDetailsPeekViewClosed = var14,
		presence = if fFlagProfilePlatformPassPresenceToJoinUserInExperience then var15 else nil
	})
	local t_1 = {
		localized = var13,
		analytics = var8,
		buttonSurface = p1,
		profileWrapperContext = var6,
		navigateTo = var6.navigateTo,
		dispatch = var4,
		profileId = profileId,
		localUserId = var3,
		navigation = var5,
		profileType = profileType,
		experienceUtilities = var19,
		profileShareLink = useProfileShareLink({ context = contexts.ProfileCard }),
		PROFILE_SHARE_LINK_URL = var10,
		aboutSections = if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		aboutProfileName = if fFlagProfileAboutDetailsUseSheet then var16 else nil,
		actionsComponentRequest = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var18 else nil
	}
	
	return reactModule.useMemo(function()
		-- upvalues: profileActionsModule (copy), t_1 (ref)
		local t = {}
		
		for i, v in profileActionsModule do
			local var20 = v(t_1)
			
			if var20 ~= nil then
				t[i] = var20
			end
		end
		return t
	end, {
		var4, profileId, var6,
		if fFlagProfilePlatformEnableCurrencyTransfer then var7 else nil,
		var6.navigateTo.qRCodePage, var13, var3, var5,
		var6.navigateTo.editUsername, var19.joinExperience,
		if fFlagJoinabilityCTARefactor then var19.playExperience else nil,
		var19.isLoading, var8, p1,
		if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		if fFlagProfileAboutDetailsUseSheet then var16 else nil, profileType,
		var6.navigateTo.editAvatar,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then if fFlagProfilePlatformEnableEditAppearanceMenuModule then var6.navigateTo.editEmotes else nil else nil,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then if fFlagProfilePlatformEnableEditAppearanceMenuModule then var6.navigateTo.switchAvatar else nil else nil,
		var10, var19.isInExperience, t_1,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var18 else nil
	})
end
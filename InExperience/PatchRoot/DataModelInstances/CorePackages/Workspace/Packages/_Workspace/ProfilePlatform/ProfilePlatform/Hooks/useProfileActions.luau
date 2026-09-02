local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local guiService = game:GetService("GuiService")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local roactUtilsModule = require(parent.RoactUtils)
local socialCommonModule = require(parent.SocialCommon)
local navigationModule = require(parent.Navigation)
local setAliasModule = require(parent.SetAlias)
local socialExperienceJoinModule = require(parent.SocialExperienceJoin)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local sharedFlagsModule = require(parent.SharedFlags)
local httpModule = require(parent.Http)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local images = UIBloxModule.App.ImageSet.Images
local httpService = game:GetService("HttpService")
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useNavigation = navigationModule.useNavigation
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local navigationRoduxModule = require(parent.NavigationRodux)
local url = httpModule.Url
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = robloxAppEnumsModule.AppPage
local useJoinUserInExperience = socialExperienceJoinModule.useJoinUserInExperience
local socialStopwatchModule = require(parent.SocialStopwatch)
local networkingFriendsModule = require(profilePlatform.Networking.NetworkingFriends)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local profileShareLinksModule = require(parent.ProfileShareLinks)
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local sources = require(parent.SocialLuaAnalytics).Analytics.Enums.Sources
local textKeysModule = require(profilePlatform.Common.TextKeys)
local getAvailableCommunityComponentsModule = require(profilePlatform.Hooks.getAvailableCommunityComponents)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)
local refreshProfilePlatformModule = require(profilePlatform.Networking.refreshProfilePlatform)
local refreshProfilePlatformActionInfoModule = require(profilePlatform.Networking.refreshProfilePlatformActionInfo)
local refreshProfilePlatformUserInfoModule = require(profilePlatform.Networking.refreshProfilePlatformUserInfo)
local useAboutSectionsModule = require(profilePlatform.Hooks.useAboutSections)
local useActionsComponentRequestModule = require(profilePlatform.Hooks.useActionsComponentRequest)
local groupsNetworkingModule = require(profilePlatform.Networking.GroupsNetworking)
local myUserBlockingNetworkingModule = require(profilePlatform.Networking.myUserBlockingNetworking)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local getPlatformFriendsServiceModule = require(profilePlatform.Utils.getPlatformFriendsService)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local enumsModule = require(profilePlatform.Common.Enums)
local contextualInfoTypes = socialCommonModule.Enums.ContextualInfoTypes
local useProfileShareLink = profileShareLinksModule.Hooks.useProfileShareLink
local useShortUrl = profileShareLinksModule.Hooks.useShortUrl
local useGetOrGenerateLinkUrl = profileShareLinksModule.Hooks.useGetOrGenerateLinkUrl
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local profileSharePolicyEnum = profileShareLinksModule.Enums.ProfileSharePolicyEnum
local dataHydrationModule = require(parent.DataHydration)
local fFlagEnableAbuseReportRevampFlow = sharedFlagsModule.FFlagEnableAbuseReportRevampFlow
local fFlagMoveInExperienceModeToEditProfile = require(parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local fFlagProfilePlatformAddTC = sharedFlagsModule.FFlagProfilePlatformAddTC
local fFlagFixTFLinksVRGatingModule = require(profilePlatform.Flags.FFlagFixTFLinksVRGating)
local fFlagEnablePlatformProfileContextualMenuOption = require(parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local fFlagProfilePlatformNewProfileHeader = sharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local fFlagProfileAboutDetailsUseSheet = sharedFlagsModule.FFlagProfileAboutDetailsUseSheet
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagPendingIncomingTrustedConnectionModule = require(profilePlatform.Flags.FFlagPendingIncomingTrustedConnection)
local fFlagProfilePlatformPassPresenceToJoinUserInExperience = sharedFlagsModule.FFlagProfilePlatformPassPresenceToJoinUserInExperience
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local var2 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local fFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(profilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local fFlagEnableAbuseReportRevampProfileAndGroupModule = require(profilePlatform.Flags.FFlagEnableAbuseReportRevampProfileAndGroup)
local fFlagProfilePlatformEnableCurrencyTransfer = sharedFlagsModule.FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableTradeItemsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEditBackgroundMenuItemModule = require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local fFlagProfilePlatformEnableEditLookModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var3 = dataHydrationModule.Friends.FriendsStore.get()
local fFlagProfilePlatformEditBackgroundMenuItemModule_1 = fFlagProfilePlatformEnableEditAppearanceMenuModule and fFlagProfilePlatformEditBackgroundMenuItemModule
local profileActionsModule = require(profilePlatform.Components.CTARow.ProfileActions)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local chatEntryPointNames = socialCommonModule.Enums.ChatEntryPointNames
local enteredChatFromEntryPointModule = require(parent.AppChat.EnteredChatFromEntryPoint)
local notificationTypeList = guiService:GetNotificationTypeList()
local friendRequestNicknamesIXP = require(parent.FriendRequestNicknames).FriendRequestNicknamesIXP
local enums = require(parent.CurrencyTransfers).Enums
local transferDirection = enums.TransferDirection
local transferOrigination = enums.TransferOrigination
local constantsModule = require(profilePlatform.Common.Constants)
local presenceModule = require(profilePlatform.Rodux.Presence)
local fFlagProfilePlatformEnableUnlockChatModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat)
local fFlagProfilePlatformEnableUserFollowModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableUserFollow)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local USER_BLOCKING_ERRORS = constantsModule.USER_BLOCKING_ERRORS
local USER_FRIENDING_ERRORS = constantsModule.USER_FRIENDING_ERRORS
local STATUS_CODES = constantsModule.STATUS_CODES
local base_url = `{url.BASE_URL}share/g/%s`
local var4 = tostring(DateTime.now().UnixTimestampMillis)

local function _(p1)
	-- upvalues: enumsModule (ref)
	return p1 == enumsModule.ProfileTypes.Community
end

local var5 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()
local t = { skipFetch = true }

return function(p1)
	-- upvalues: useLocalUserId (ref), useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useShortUrl (ref), useGetOrGenerateLinkUrl (ref), useEffectOnce (ref), reactModule (ref), var4 (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), useLocalization (ref), enumsModule (ref), fFlagProfilePlatformAddTC (ref), fFlagProfilePlatformEnableUnlockChatModule (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), fFlagProfilePlatformEditBackgroundMenuItemModule (ref), fFlagProfilePlatformEnableEditLookModule (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagEnablePlatformProfileContextualMenuOption (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformEnableTradeItemsModule (ref), fFlagProfilePlatformEnableUserFollowModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), var2 (ref), t (ref), fFlagProfilePlatformPassPresenceToJoinUserInExperience (ref), useSelector (ref), presenceModule (ref), useAboutSectionsModule (ref), fFlagProfileAboutDetailsUseSheet (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), useJoinUserInExperience (ref), fFlagProfilePlatformEditBackgroundMenuItemModule_1 (ref), iconName (ref), eventNamesModule (ref), friendRequestNicknamesIXP (ref), useProfileShareLink (ref), contexts (ref), profileSharePolicyEnum (ref), USER_FRIENDING_ERRORS (ref), STATUS_CODES (ref), httpService (ref), setCurrentToastMessage (ref), fFlagProfilePlatformCTAsRefactorModule (ref), profileActionsModule (ref), buttonVariant (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var3 (ref), networkingFriendsModule (ref), images (ref), refreshProfilePlatformActionInfoModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), buttonType (ref), contextualInfoTypes (ref), refreshProfilePlatformModule (ref), enteredChatFromEntryPointModule (ref), chatEntryPointNames (ref), guiService (ref), notificationTypeList (ref), socialStopwatchModule (ref), setAliasModule (ref), foundationModule (ref), fFlagAXEnableProfileTab (ref), refreshProfilePlatformUserInfoModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), default (ref), fFlagEnableAbuseReportRevampFlow (ref), fFlagEnableAbuseReportRevampProfileAndGroupModule (ref), abuseVectorModule (ref), openDynamicAbuseReportModule (ref), closeCentralOverlay (ref), url (ref), myUserBlockingNetworkingModule (ref), USER_BLOCKING_ERRORS (ref), base_url (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), urlBuilder (ref), urlBase (ref), var5 (ref), sources (ref), fFlagFixTFLinksVRGatingModule (ref), fFlagPendingIncomingTrustedConnectionModule (ref), getPlatformFriendsServiceModule (ref), transferDirection (ref), transferOrigination (ref)
	local var6 = useLocalUserId()
	local var7 = useDispatch()
	local var8 = useNavigation()
	local var9 = useProfileWrapperContextModule()
	local var10 = if var9.navigateTo then var9.navigateTo.navigateToTransfer else nil
	local var11 = useProfileAnalyticsContextModule()
	local var12 = useShortUrl()
	useEffectOnce(useGetOrGenerateLinkUrl(), not (var12 ~= nil))
	local var13 = reactModule.useMemo(function()
		-- upvalues: var12 (ref), var4 (copy)
		return string.format("%s&source=ProfileShare&stamp=%s", var12 or "", var4)
	end, { var12 })
	local var14 = if fFlagConnectionsToFriendsRename then textKeysModule.AcceptFriend else textKeysModule.AcceptConnection
	local var15 = if fFlagConnectionsToFriendsRename then textKeysModule.AddFriend else textKeysModule.AddConnection
	local var16 = useLocalization({
		[enumsModule.ProfileActions.AcceptFriendRequest] = var14,
		[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = var14,
		[enumsModule.ProfileActions.AddFriend] = var15,
		[enumsModule.ProfileActions.AddFriendFromContacts] = var15,
		[enumsModule.ProfileActions.AddFriendFromContactsSent] = textKeysModule.PendingRequest,
		[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AddTrustedConnection else nil,
		[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AcceptTrustedConnection else nil,
		[enumsModule.ProfileActions.Block] = textKeysModule.Block,
		[enumsModule.ProfileActions.CannotAddFriend] = var15,
		[enumsModule.ProfileActions.Chat] = textKeysModule.Chat,
		[enumsModule.ProfileActions.UnlockChat] = if fFlagProfilePlatformEnableUnlockChatModule then textKeysModule.UnlockChat else nil,
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
	local var17 = reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9.navigateTo.previousView(true)
	end, { var9.navigateTo.previousView })
	local profileId = var9.profileId
	local var18 = if fFlagEnablePlatformProfileContextualMenuOption then var9.profilePlatformId else nil
	local profileType = var9.profileType
	local var19 = if fFlagProfilePlatformPresenceStoreMigrationModule then var2(profileId, t) elseif fFlagProfilePlatformPassPresenceToJoinUserInExperience then useSelector(function(p2)
		-- upvalues: presenceModule (copy), profileId (ref)
		return presenceModule.Selectors.getUserPresenceByUserId(p2, profileId) or {
			lastLocation = "",
			userPresenceType = presenceModule.Enums.PresenceType.Offline
		}
	end) else nil
	local aboutSections = nil
	local var20 = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var21 = useAboutSectionsModule()
		aboutSections = var21.aboutSections
		var20 = if fFlagProfileAboutDetailsUseSheet then var21.profileName else nil
	end
	local var22 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var23 = useJoinUserInExperience(profileId, {
		isHomePageCarousel = var9.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
		homepageCarouselAbsolutePosition = var9.sourceInfo.homepageCarouselAbsolutePosition,
		openGameDetailsPeekViewClosed = var17,
		presence = if fFlagProfilePlatformPassPresenceToJoinUserInExperience then var19 else nil
	})
	local qRCodePage = var9.navigateTo.qRCodePage
	local editUsername = var9.navigateTo.editUsername
	local var24 = if fFlagProfilePlatformEnableEditAppearanceMenuModule then var9.navigateTo.editEmotes else nil
	local var25 = if fFlagProfilePlatformEnableEditAppearanceMenuModule then var9.navigateTo.switchAvatar else nil
	
	local function getEditBackgroundAction()
		-- upvalues: fFlagProfilePlatformEditBackgroundMenuItemModule_1 (copy), var9 (ref), var16 (ref), enumsModule (copy), iconName (copy), var11 (ref), eventNamesModule (copy), p1 (ref)
		if fFlagProfilePlatformEditBackgroundMenuItemModule_1 then
			local editBackground = var9.navigateTo.editBackground
			
			return {
				text = var16[enumsModule.ProfileActions.EditBackground],
				icon = iconName.Image,
				onActivated = function()
					-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), editBackground (ref)
					var11.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditBackground, { buttonSurface = p1 })
					editBackground()
				end
			}
		end
		return nil
	end
	
	local editAvatar = var9.navigateTo.editAvatar
	local var26 = friendRequestNicknamesIXP.useFriendRequestNicknames()
	local var27 = useProfileShareLink({ context = contexts.ProfileCard })
	local var28 = var27.policy == profileSharePolicyEnum.Disabled
	local t_1 = {
		[USER_FRIENDING_ERRORS.INVALID_TARGET_USER_ERROR] = var16.invalidTargetUserError,
		[USER_FRIENDING_ERRORS.ALREADY_FRIEND_ERROR] = var16.alreadyFriendError,
		[USER_FRIENDING_ERRORS.MAX_FRIENDS_ERROR] = var16.maxFriendsError,
		[USER_FRIENDING_ERRORS.INVALID_NICKNAME_ERROR] = var16.invalidNicknameError
	}
	local t_2 = {
		[USER_FRIENDING_ERRORS.UNAUTHORIZED_ERROR] = var16.unauthorizedError
	}
	local t_3 = {
		[USER_FRIENDING_ERRORS.USER_BANNED_ERROR] = var16.userBannedError,
		[USER_FRIENDING_ERRORS.USER_BLOCKED_ERROR] = var16.userBlockedError,
		[USER_FRIENDING_ERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = var16.userNotPassedCaptchaError
	}
	local t_4 = {
		[USER_FRIENDING_ERRORS.TOO_MANY_REQUESTS_ERROR] = var16.tooManyRequestsError
	}
	
	local function _(p2, p3, p4)
		-- upvalues: enumsModule (copy), STATUS_CODES (copy), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref)
		if p2 == enumsModule.ProfileActions.AddFriend or p2 == enumsModule.ProfileActions.AddFriendFromContacts then
			return if p3 == STATUS_CODES.BAD_REQUEST then t_1[p4] elseif p3 == STATUS_CODES.UNAUTHORIZED then t_2[p4] elseif p3 == STATUS_CODES.FORBIDDEN then t_3[p4] elseif p3 == STATUS_CODES.TOO_MANY_REQUESTS then t_4[p4] else nil
		end
	end
	
	local function setErrorToast(value, p2)
		-- upvalues: httpService (copy), enumsModule (copy), STATUS_CODES (copy), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref), var16 (ref), var7 (ref), setCurrentToastMessage (copy)
		if p2 == nil then
			var7(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var16.defaultFriendingError
			}))
			
			return
		end
		local var29
		local statusCode = p2.StatusCode
		local var30 = if p2.Body then httpService:JSONDecode(p2.Body) else nil
		local var31 = if var30 and var30.errors and (var30.errors[1] and var30.errors[1].code) then var30.errors[1].code else nil
		
		if value ~= enumsModule.ProfileActions.AddFriend and value ~= enumsModule.ProfileActions.AddFriendFromContacts then
			var7(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var29 or var16.defaultFriendingError
			}))
			
			return
		var29 = if statusCode == STATUS_CODES.BAD_REQUEST then t_1[var31] elseif statusCode == STATUS_CODES.UNAUTHORIZED then t_2[var31] elseif statusCode == STATUS_CODES.FORBIDDEN then t_3[var31] elseif statusCode == STATUS_CODES.TOO_MANY_REQUESTS then t_4[var31] else nil
	end
	
	local var32 = if fFlagProfilePlatformCTAsRefactorModule then {
		localized = var16,
		analytics = var11,
		buttonSurface = p1,
		profileWrapperContext = var9,
		navigateTo = var9.navigateTo,
		dispatch = var7,
		profileId = profileId,
		localUserId = var6,
		navigation = var8,
		profileType = profileType,
		experienceUtilities = var23,
		friendRequestNicknamesEnabled = var26,
		profileShareLink = var27,
		PROFILE_SHARE_LINK_URL = var13,
		aboutSections = if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		aboutProfileName = if fFlagProfileAboutDetailsUseSheet then var20 else nil,
		actionsComponentRequest = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var22 else nil
	} else nil
	
	return reactModule.useMemo(function()
		-- upvalues: fFlagProfilePlatformCTAsRefactorModule (copy), profileActionsModule (copy), var32 (ref), enumsModule (copy), var16 (ref), buttonVariant (copy), var11 (ref), eventNamesModule (copy), p1 (ref), var9 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var3 (copy), profileId (ref), var7 (ref), networkingFriendsModule (copy), var6 (ref), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var22 (ref), friendRequestNicknamesIXP (copy), var26 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy), setErrorToast (ref), buttonType (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), profileType (ref), var8 (ref), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy), socialStopwatchModule (copy), setAliasModule (copy), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), iconName (copy), editAvatar (ref), fFlagProfilePlatformEnableEditLookModule (copy), var24 (ref), var25 (ref), getEditBackgroundAction (ref), foundationModule (copy), fFlagAXEnableProfileTab (copy), editUsername (ref), refreshProfilePlatformUserInfoModule (copy), fFlagMoveInExperienceModeToEditProfile (copy), var23 (ref), qRCodePage (ref), var28 (ref), default (copy), contexts (copy), var13 (ref), textKeysModule (copy), var27 (ref), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), abuseVectorModule (copy), openDynamicAbuseReportModule (copy), closeCentralOverlay (copy), url (copy), myUserBlockingNetworkingModule (copy), USER_BLOCKING_ERRORS (copy), base_url (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy), urlBuilder (copy), urlBase (copy), var5 (copy), fFlagProfilePlatformAddTC (copy), sources (copy), fFlagFixTFLinksVRGatingModule (copy), fFlagPendingIncomingTrustedConnectionModule (copy), fFlagProfilePlatformNewProfileHeader (copy), aboutSections (write), fFlagProfileAboutDetailsUseSheet (copy), var20 (write), fFlagEnablePlatformProfileContextualMenuOption (copy), getPlatformFriendsServiceModule (copy), var18 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var10 (ref), transferDirection (copy), transferOrigination (copy), fFlagProfilePlatformEnableTradeItemsModule (copy)
		if not fFlagProfilePlatformCTAsRefactorModule then
			return {
				[enumsModule.ProfileActions.AcceptFriendRequest] = {
					text = var16[enumsModule.ProfileActions.AcceptFriendRequest],
					variant = buttonVariant.Emphasis,
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var9 (copy), enumsModule (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var3 (copy), profileId (copy), var7 (copy), networkingFriendsModule (copy), var6 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonAcceptFriendRequest, {
							buttonSurface = p1,
							absolutePosition = var9.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = var9.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = var9.sourceInfo.isRecommendation,
							source = var9.sourceInfo.source,
							contextualInfoType = var9.sourceInfo.contextualInfoType,
							recommendationContextType = var9.sourceInfo.recommendationContextType,
							recommendationRank = var9.sourceInfo.recommendationRank,
							recommendationSessionId = var9.sourceInfo.recommendationSessionId
						})
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var3.AcceptFriendRequest(profileId) else var7(networkingFriendsModule.AcceptFriendRequestFromUserId.API({ targetUserId = profileId, currentUserId = var6 }))):andThen(function()
							-- upvalues: var7 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
							var7(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var16.friendAcceptedToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
						end)
					end
				},
				[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = {
					text = var16[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), var9 (copy), var7 (copy), networkingFriendsModule (copy), profileId (copy), var6 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriendFromContacts, { shareLinkId = var9.sourceInfo.shareLinkId })
						
						return var7(networkingFriendsModule.AcceptFriendRequestWithToken.API({
							targetUserId = profileId,
							currentUserId = var6,
							friendingToken = var9.offNetworkFriendRequestToken
						})):andThen(function()
							-- upvalues: var7 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
							var7(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var16.friendAcceptedToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
						end)
					end
				},
				[enumsModule.ProfileActions.AddFriend] = {
					text = var16[enumsModule.ProfileActions.AddFriend],
					variant = buttonVariant.Emphasis,
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var9 (copy), enumsModule (copy), friendRequestNicknamesIXP (copy), var26 (copy), appPage (copy), profileId (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var7 (copy), navigateDown (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var3 (copy), networkingFriendsModule (copy), var6 (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy), setErrorToast (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriend, {
							buttonSurface = p1,
							absolutePosition = var9.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = var9.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = var9.sourceInfo.isRecommendation,
							source = var9.sourceInfo.source,
							contextualInfoType = var9.sourceInfo.contextualInfoType,
							recommendationContextType = var9.sourceInfo.recommendationContextType,
							recommendationRank = var9.sourceInfo.recommendationRank,
							recommendationSessionId = var9.sourceInfo.recommendationSessionId
						})
						
						if not friendRequestNicknamesIXP.FFlagFriendRequestNicknames or not var26 then
							var7(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var16.friendRequestSentToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return (if fFlagMigrateFriendshipStatusesRemainingActions then var3.RequestFriendship(profileId, var9.sourceInfo.friendshipOriginSourceType) else var7(networkingFriendsModule.RequestFriendshipFromUserId.API({
								targetUserId = profileId,
								currentUserId = var6,
								friendshipOriginSourceType = var9.sourceInfo.friendshipOriginSourceType
							}))):andThen(function()
								-- upvalues: var7 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
								return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
							end):catch(function(p3)
								-- upvalues: setErrorToast (copy), enumsModule (copy)
								setErrorToast(enumsModule.ProfileActions.AddFriend, p3)
							end)
						end
						local t = {
							name = appPage.SetNicknameModal,
							extraProps = {
								friendRequestParams = {
									targetUserId = profileId,
									source = var9.sourceInfo.friendshipOriginSourceType
								}
							}
						}
						
						return if fFlagSignalsNavP3Dispatch then var1.down(var1.fromLegacyPage(t)) else var7(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.AddFriendFromContacts] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					text = var16[enumsModule.ProfileActions.AddFriendFromContacts],
					onActivated = function()
						-- upvalues: var7 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var3 (copy), profileId (copy), networkingFriendsModule (copy), var6 (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy), setErrorToast (copy)
						var7(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = var16.friendRequestSentToast,
							toastIcon = images["icons/actions/friends/friendAdd"]
						}))
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var3.RequestFriendship(profileId, nil, { isContact = true }) else var7(networkingFriendsModule.RequestFriendshipFromContactId.API({
							currentUserId = var6,
							contactId = profileId,
							contextType = contextualInfoTypes.Contacts
						}))):andThen(function()
							-- upvalues: var7 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							return var7(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = {
									enumsModule.Components.ContactProfileHeader,
									enumsModule.Components.Actions,
									enumsModule.Components.ContactDescription
								}
							}))
						end):catch(function(p3)
							-- upvalues: setErrorToast (copy), enumsModule (copy)
							setErrorToast(enumsModule.ProfileActions.AddFriendFromContacts, p3)
						end)
					end
				},
				[enumsModule.ProfileActions.AddFriendFromContactsSent] = {
					isDisabled = true,
					buttonType = buttonType.Secondary,
					variant = buttonVariant.Subtle,
					text = var16[enumsModule.ProfileActions.AddFriendFromContactsSent],
					onActivated = function() end
				},
				[enumsModule.ProfileActions.Block] = {
					text = var16[enumsModule.ProfileActions.Block],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var8 (copy), appPage (copy), profileId (copy), var7 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonBlock, { buttonSurface = p1 })
						var8.push(appPage.BlockingModal, {
							navProps = {
								userId = profileId,
								onBlockSuccess = function()
									-- upvalues: var7 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
									var7(setCurrentToastMessage({
										isLocalized = true,
										toastMessage = var16.userBlockedToast,
										toastIcon = images["icons/actions/block"]
									}))
									var7(refreshProfilePlatformActionInfoModule(profileId, var22))
								end
							}
						})
					end
				},
				[enumsModule.ProfileActions.CannotAddFriend] = {
					isDisabled = true,
					text = var16[enumsModule.ProfileActions.CannotAddFriend],
					onActivated = function() end
				},
				[enumsModule.ProfileActions.Chat] = {
					text = var16[enumsModule.ProfileActions.Chat],
					variant = buttonVariant.Standard,
					onActivated = function()
						-- upvalues: p1 (copy), enumsModule (copy), var11 (copy), eventNamesModule (copy), var7 (copy), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), profileId (copy), notificationTypeList (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonChat, { buttonSurface = p1 })
						else
							var11.fireAnalyticsEvent(eventNamesModule.CTAButtonChat, { buttonSurface = p1 })
						end
						var7(enteredChatFromEntryPointModule(chatEntryPointNames.ProfilePeekView))
						guiService:BroadcastNotification(profileId, notificationTypeList.LAUNCH_CONVERSATION)
					end
				},
				[enumsModule.ProfileActions.EditAlias] = {
					text = var16[enumsModule.ProfileActions.EditAlias],
					onActivated = function()
						-- upvalues: socialStopwatchModule (copy), var11 (copy), eventNamesModule (copy), p1 (copy), var8 (copy), enumsModule (copy), profileId (copy), setAliasModule (copy)
						socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CustomizeNameOpened)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonSetAlias, { buttonSurface = p1 })
						var8.navigate(enumsModule.Screens.SetAliasModal, {
							profileUserId = profileId,
							origin = setAliasModule.Analytics.EntryPoints.ContextualMenu
						})
					end
				},
				[enumsModule.ProfileActions.EditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var16[enumsModule.ProfileActions.EditAppearance],
					variant = buttonVariant.Emphasis,
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonEditAppearance, { buttonSurface = p1 })
					end
				} else nil,
				[enumsModule.ProfileActions.EditAvatar] = {
					text = var16[enumsModule.ProfileActions.EditAvatar],
					icon = if fFlagProfilePlatformEnableEditAppearanceMenuModule then iconName.Person else nil,
					onActivated = function()
						-- upvalues: var11 (copy), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), eventNamesModule (copy), p1 (copy), editAvatar (copy)
						var11.fireAnalyticsEvent(if fFlagProfilePlatformEnableEditAppearanceMenuModule then eventNamesModule.EditAppearanceMenuEditAvatar else eventNamesModule.CTAButtonEditAvatar, { buttonSurface = p1 })
						editAvatar()
					end
				},
				[enumsModule.ProfileActions.EditLook] = if fFlagProfilePlatformEnableEditLookModule then {
					text = var16[enumsModule.ProfileActions.EditLook],
					icon = iconName.Person,
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), editAvatar (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonEditLook, { buttonSurface = p1 })
						editAvatar()
					end
				} else nil,
				[enumsModule.ProfileActions.EditEmotes] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var16[enumsModule.ProfileActions.EditEmotes],
					icon = iconName.SquareFaceWavingHand,
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var24 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditEmote, { buttonSurface = p1 })
						var24()
					end
				} else nil,
				[enumsModule.ProfileActions.SwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var16[enumsModule.ProfileActions.SwitchAvatar],
					icon = iconName.PersonStandingArrowReverse,
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var25 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuSwitchAvatar, { buttonSurface = p1 })
						var25()
					end
				} else nil,
				[enumsModule.ProfileActions.EditBackground] = getEditBackgroundAction(),
				[enumsModule.ProfileActions.EditProfile] = {
					component = foundationModule.Button,
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var16[enumsModule.ProfileActions.EditProfile],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var8 (copy), enumsModule (copy), fFlagAXEnableProfileTab (copy), var9 (copy), editUsername (copy), var7 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy), fFlagMoveInExperienceModeToEditProfile (copy)
						local var33
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonOpenEditProfilePage, { buttonSurface = p1 })
						local navigate = var8.navigate
						local editProfilePage = enumsModule.Screens.EditProfilePage
						local t = {}
						
						if fFlagAXEnableProfileTab then
							var33 = var9.forceFullView == true
							var33 = nil
						else
							var33 = nil
						end
						t.fullBleed = var33
						
						function t.navigateToEditUsername(p3)
							-- upvalues: editUsername (copy), var7 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
							editUsername({
								showToast = p3,
								onUsernameChanged = function()
									-- upvalues: var7 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
									var7(refreshProfilePlatformUserInfoModule(profileId))
								end
							})
						end
						
						function t.onIdentityChange()
							-- upvalues: var7 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
							var7(refreshProfilePlatformUserInfoModule(profileId))
						end
						
						t.onToggleInExperienceMode = if fFlagMoveInExperienceModeToEditProfile then function()
							-- upvalues: var7 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy), var11 (copy), eventNamesModule (copy)
							var7(refreshProfilePlatformUserInfoModule(profileId))
							var11.fireAnalyticsEvent(eventNamesModule.ToggleInExperienceModeButton, {})
						end else nil
						navigate(editProfilePage, t)
					end
				},
				[enumsModule.ProfileActions.IgnoreFriendRequest] = {
					text = var16[enumsModule.ProfileActions.IgnoreFriendRequest],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var3 (copy), profileId (copy), var7 (copy), networkingFriendsModule (copy), var6 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonIgnoreFriendRequest, { buttonSurface = p1 })
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var3.DeclineFriendRequest(profileId) else var7(networkingFriendsModule.DeclineFriendRequestFromUserId.API({ targetUserId = profileId, currentUserId = var6 }))):andThen(function()
							-- upvalues: var7 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
							var7(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var16.friendRequestIgnoredToast,
								toastIcon = images["icons/actions/reject"]
							}))
							
							return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
						end)
					end
				},
				[enumsModule.ProfileActions.JoinExperience] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					isLoading = var23.isLoading,
					isDisabled = not var23.isInExperience,
					text = var16[enumsModule.ProfileActions.JoinExperience],
					onActivated = function()
						-- upvalues: var23 (copy)
						var23.joinExperience()
					end
				},
				[enumsModule.ProfileActions.PendingFriendRequest] = {
					isDisabled = true,
					buttonType = buttonType.Secondary,
					variant = buttonVariant.Subtle,
					text = var16[enumsModule.ProfileActions.PendingFriendRequest],
					onActivated = function() end
				},
				[enumsModule.ProfileActions.QrCode] = {
					text = var16[enumsModule.ProfileActions.QrCode],
					icon = iconName.SquaresGridQr,
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), qRCodePage (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfileQRCode, { buttonSurface = p1 })
						qRCodePage()
					end
				},
				[enumsModule.ProfileActions.ShareProfile] = {
					component = foundationModule.Button,
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var16[enumsModule.ProfileActions.ShareProfile],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var28 (copy), default (copy), contexts (copy), var13 (copy), profileId (copy), var7 (copy), setCurrentToastMessage (copy), textKeysModule (copy), var27 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfile, { buttonSurface = p1 })
						
						if var28 then
							default:setClipboardText({
								context = contexts.ProfileCard,
								text = string.format("%s/%s", var13, profileId)
							})
							var7(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
							
							return
						end
						var27.onActivated()
					end
				},
				[enumsModule.ProfileActions.Report] = {
					text = var16[enumsModule.ProfileActions.Report],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), profileType (copy), enumsModule (copy), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), abuseVectorModule (copy), var7 (copy), openDynamicAbuseReportModule (copy), profileId (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy), appPage (copy), url (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonReport, { buttonSurface = p1 })
						local var33 = nil
						
						if profileType == enumsModule.ProfileTypes.User then
							var33 = "userprofile"
						elseif profileType == enumsModule.ProfileTypes.Community then
							var33 = "group"
						end
						if fFlagEnableAbuseReportRevampFlow and fFlagEnableAbuseReportRevampProfileAndGroupModule then
							var7(openDynamicAbuseReportModule({
								abuseVector = if profileType == enumsModule.ProfileTypes.Community then abuseVectorModule.Group else abuseVectorModule.UserProfile,
								targetId = profileId,
								onClose = function()
									-- upvalues: var7 (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
									var7(closeCentralOverlay())
									var7(refreshProfilePlatformActionInfoModule(profileId, var22))
								end
							}))
							
							return
						end
						local t = {
							name = appPage.GenericWebPage,
							detail = `{url.BASE_URL}abusereport/{var33}?id={profileId}`,
							extraProps = { titleKey = textKeysModule.Report }
						}
						
						if fFlagSignalsNavP3Dispatch then
							var1.down(var1.fromLegacyPage(t))
							
							return
						end
						var7(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.Unblock] = {
					text = var16[enumsModule.ProfileActions.Unblock],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var7 (copy), myUserBlockingNetworkingModule (copy), profileId (copy), var6 (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy), USER_BLOCKING_ERRORS (copy), setCurrentToastMessage (copy), var16 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonUnblock, { buttonSurface = p1 })
						
						return var7(myUserBlockingNetworkingModule.UnblockUserById.API({ userId = profileId, currentUserId = var6 })):andThen(function()
							-- upvalues: var7 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
							return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
						end):catch(function(p3)
							-- upvalues: USER_BLOCKING_ERRORS (copy), var7 (copy), setCurrentToastMessage (copy), var16 (copy)
							if p3 ~= nil and tonumber(p3.Body) == USER_BLOCKING_ERRORS.PARENT_BLOCKED_TARGET_USER_ERROR then
								var7(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var16.unblockTargetParentManagedToast
								}))
								
								return
							elseif p3 ~= nil and tonumber(p3.Body) == USER_BLOCKING_ERRORS.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
								var7(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var16.unblockTargetNotBlockedToast
								}))
								
								return
							elseif p3 == nil or tonumber(p3.Body) ~= USER_BLOCKING_ERRORS.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
								var7(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var16.somethingIsWrongToast
								}))
								
								return
							end
							var7(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var16.blockedOnPlatformToast
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.Unfriend] = {
					text = var16[enumsModule.ProfileActions.Unfriend],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var3 (copy), profileId (copy), var7 (copy), networkingFriendsModule (copy), var6 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfriend, { buttonSurface = p1 })
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var3.Unfriend(profileId) else var7(networkingFriendsModule.UnfriendTargetUserId.API({ targetUserId = profileId, currentUserId = var6 }))):andThen(function()
							-- upvalues: var7 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
							var7(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var16.friendRemovedToast,
								toastIcon = images["icons/actions/friends/friendRemove"]
							}))
							
							return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
						end)
					end
				},
				[enumsModule.ProfileActions.CopyLink] = {
					text = var16[enumsModule.ProfileActions.CopyLink],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), default (copy), contexts (copy), base_url (copy), profileId (copy), var7 (copy), setCurrentToastMessage (copy), textKeysModule (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCopyLink, { buttonSurface = p1 })
						default:setClipboardText({
							context = contexts.ProfileCard,
							text = string.format(base_url, profileId)
						})
						var7(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
					end
				},
				[enumsModule.ProfileActions.JoinCommunity] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					text = var16[enumsModule.ProfileActions.JoinCommunity],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var9 (copy), var7 (copy), groupsNetworkingModule (copy), profileId (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonJoinCommunity, { buttonSurface = p1, btnContext = var9.sourceInfo.source })
						
						return var7(groupsNetworkingModule.JoinGroup.API({ groupId = profileId })):andThen(function()
							-- upvalues: var7 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var7(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.CancelJoinCommunityRequest] = {
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var16[enumsModule.ProfileActions.CancelJoinCommunityRequest],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var9 (copy), var7 (copy), groupsNetworkingModule (copy), profileId (copy), var6 (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonCancelJoinCommunityRequest, { buttonSurface = p1, btnContext = var9.sourceInfo.source })
						
						return var7(groupsNetworkingModule.CancelJoinGroupRequest.API({ groupId = profileId, userId = var6 })):andThen(function()
							-- upvalues: var7 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var7(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = { enumsModule.Components.Actions }
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.ViewCommunity] = {
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.SubEmphasis,
					text = var16[enumsModule.ProfileActions.ViewCommunity],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var9 (copy), appPage (copy), urlBuilder (copy), profileId (copy), textKeysModule (copy), var7 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonViewCommunity, { buttonSurface = p1, btnContext = var9.sourceInfo.source })
						local t = {
							name = appPage.GenericWebPage,
							detail = urlBuilder.user.group({ groupId = profileId }),
							extraProps = {
								titleKey = textKeysModule.Community,
								onClose = function()
									-- upvalues: var7 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
									var7(getProfilePlatformModule.API({
										includeComponentOrdering = true,
										profileType = profileType,
										profileId = profileId,
										components = getAvailableCommunityComponentsModule()
									}))
								end
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var1.down(var1.fromLegacyPage(t))
							
							return
						end
						var7(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.ViewFullProfile] = {
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.SubEmphasis,
					text = var16[enumsModule.ProfileActions.ViewFullProfile],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var9 (copy), appPage (copy), urlBuilder (copy), urlBase (copy), profileId (copy), textKeysModule (copy), var7 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, { buttonSurface = p1, btnContext = var9.sourceInfo.source })
						local t = {
							name = appPage.GenericWebPage,
							detail = urlBuilder.new({ base = urlBase.WWW, path = `profiles/{profileId}` })(),
							extraProps = {
								titleKey = textKeysModule.Profile,
								onClose = function()
									-- upvalues: var7 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
									var7(getProfilePlatformModule.API({
										includeComponentOrdering = true,
										profileType = profileType,
										profileId = profileId,
										components = getAvailableCommunityComponentsModule()
									}))
								end
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var1.down(var1.fromLegacyPage(t))
							
							return
						end
						var7(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.LeaveCommunity] = {
					text = var16[enumsModule.ProfileActions.LeaveCommunity],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var9 (copy), var7 (copy), groupsNetworkingModule (copy), profileId (copy), var6 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonLeaveCommunity, { buttonSurface = p1, btnContext = var9.sourceInfo.source })
						
						return var7(groupsNetworkingModule.LeaveGroup.API({ groupId = profileId, userId = var6 })):andThen(function()
							-- upvalues: var7 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var7(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.MakePrimaryCommunity] = {
					text = var16[enumsModule.ProfileActions.MakePrimaryCommunity],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var9 (copy), var7 (copy), groupsNetworkingModule (copy), profileId (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonMakePrimaryCommunity, { buttonSurface = p1, btnContext = var9.sourceInfo.source })
						
						return var7(groupsNetworkingModule.MakePrimaryGroup.API({ groupId = profileId })):andThen(function()
							-- upvalues: var7 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var7(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = { enumsModule.Components.Actions }
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.RemovePrimaryCommunity] = {
					text = var16[enumsModule.ProfileActions.RemovePrimaryCommunity],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var9 (copy), var7 (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity, { buttonSurface = p1, btnContext = var9.sourceInfo.source })
						
						return var7(groupsNetworkingModule.RemovePrimaryGroup.API()):andThen(function()
							-- upvalues: var7 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var7(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = { enumsModule.Components.Actions }
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.Follow] = if profileType == enumsModule.ProfileTypes.Community then {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Standard,
					text = var16[enumsModule.ProfileActions.Follow],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var7 (copy), groupsNetworkingModule (copy), profileId (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonFollow, { buttonSurface = p1 })
						
						return var7(groupsNetworkingModule.JoinGroup.API({ groupId = profileId })):andThen(function()
							-- upvalues: var7 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var7(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[enumsModule.ProfileActions.Unfollow] = if profileType == enumsModule.ProfileTypes.Community then {
					text = var16[enumsModule.ProfileActions.Unfollow],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var7 (copy), groupsNetworkingModule (copy), profileId (copy), var6 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = p1 })
						
						return var7(groupsNetworkingModule.LeaveGroup.API({ groupId = profileId, userId = var6 })):andThen(function()
							-- upvalues: var7 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var7(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[enumsModule.ProfileActions.RemoveTrustedConnection] = {
					text = var16[enumsModule.ProfileActions.RemoveTrustedConnection],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var5 (copy), profileId (copy), var7 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemoveTrustedConnection, { buttonSurface = p1 })
						
						return var5.removeTrustedConnectionRequest(profileId):andThen(function()
							-- upvalues: var7 (copy), setCurrentToastMessage (copy), var16 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
							var7(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var16.trustedConnectionRemovedToast,
								toastIcon = images["icons/actions/friends/friendRemove"]
							}))
							
							return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
						end)
					end
				},
				[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then {
					text = var16[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var8 (copy), appPage (copy), profileId (copy), sources (copy), var7 (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, { buttonSurface = p1 })
						var8.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								onRequestSent = function()
									-- upvalues: var7 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
									return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
								end
							}
						})
					end
				} else nil,
				[enumsModule.ProfileActions.AddTrustedConnectionViaLink] = if fFlagFixTFLinksVRGatingModule then if fFlagProfilePlatformAddTC then {
					text = var16[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), sources (copy), var8 (copy), appPage (copy), profileId (copy), var7 (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, {
							buttonSurface = p1,
							modalVariantOverride = sources.ShareLinkSender
						})
						var8.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								modalVariantOverride = sources.ShareLinkSender,
								onRequestSent = function()
									-- upvalues: var7 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
									return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
								end
							}
						})
					end
				} else nil else {
					text = var16[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), sources (copy), var8 (copy), appPage (copy), profileId (copy), var7 (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, {
							buttonSurface = p1,
							modalVariantOverride = sources.ShareLinkSender
						})
						var8.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								modalVariantOverride = sources.ShareLinkSender,
								onRequestSent = function()
									-- upvalues: var7 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
									return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
								end
							}
						})
					end
				},
				[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then {
					text = var16[enumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var8 (copy), appPage (copy), profileId (copy), var7 (copy), refreshProfilePlatformActionInfoModule (copy), var22 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection, { buttonSurface = p1 })
						var8.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								onRequestAccepted = function()
									-- upvalues: var7 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var22 (copy)
									return var7(refreshProfilePlatformActionInfoModule(profileId, var22))
								end
							}
						})
					end
				} else nil,
				[enumsModule.ProfileActions.PendingTrustedConnection] = if fFlagProfilePlatformAddTC then {
					isDisabled = true,
					text = var16[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() end
				} else nil,
				[enumsModule.ProfileActions.PendingIncomingTrustedConnection] = if fFlagPendingIncomingTrustedConnectionModule then {
					isDisabled = true,
					text = var16[enumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function() end
				} else nil,
				[enumsModule.ProfileActions.ViewAbout] = if fFlagProfilePlatformNewProfileHeader then {
					text = var16[enumsModule.ProfileActions.ViewAbout],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), var9 (copy), appPage (copy), aboutSections (copy), fFlagProfileAboutDetailsUseSheet (copy), var20 (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var7 (copy), navigateDown (copy)
						var11.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, { buttonSurface = p1, btnContext = var9.sourceInfo.source })
						local t = {
							name = appPage.AboutDetailsSheet,
							extraProps = {
								sections = aboutSections,
								profileName = if fFlagProfileAboutDetailsUseSheet then var20 else nil
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var1.down(var1.fromLegacyPage(t))
							
							return
						end
						var7(navigateDown(t))
					end
				} else nil,
				[enumsModule.ProfileActions.ViewPlatformProfile] = if fFlagEnablePlatformProfileContextualMenuOption then {
					text = var16[enumsModule.ProfileActions.ViewPlatformProfile],
					onActivated = function()
						-- upvalues: var11 (copy), eventNamesModule (copy), p1 (copy), getPlatformFriendsServiceModule (copy), var18 (copy)
						var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonViewPlatformProfile, { buttonSurface = p1 })
						getPlatformFriendsServiceModule:ShowProfile(var18)
					end
				} else nil,
				[enumsModule.ProfileActions.CurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
					text = var16[enumsModule.ProfileActions.CurrencyTransfer],
					onActivated = function()
						-- upvalues: p1 (copy), enumsModule (copy), var11 (copy), eventNamesModule (copy), var10 (copy), profileId (copy), transferDirection (copy), transferOrigination (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCurrencyTransfer, { buttonSurface = p1 })
						else
							var11.fireAnalyticsEvent(eventNamesModule.CTAButtonCurrencyTransfer, { buttonSurface = p1 })
						end
						if var10 then
							var10({
								recipientUserId = profileId,
								direction = transferDirection.Send,
								transferOrigination = transferOrigination.Profile
							})
						end
					end
				} else nil,
				[enumsModule.ProfileActions.TradeItems] = if fFlagProfilePlatformEnableTradeItemsModule then {
					text = var16[enumsModule.ProfileActions.TradeItems],
					onActivated = function()
						-- upvalues: p1 (copy), enumsModule (copy), var11 (copy), eventNamesModule (copy), appPage (copy), url (copy), profileId (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var7 (copy), navigateDown (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var11.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonTradeItems, { buttonSurface = p1 })
						else
							var11.fireAnalyticsEvent(eventNamesModule.CTAButtonTradeItems, { buttonSurface = p1 })
						end
						local t = {
							name = appPage.GenericWebPage,
							detail = `{url.BASE_URL}users/{profileId}/trade`,
							extraProps = { titleKey = textKeysModule.TradeItems }
						}
						
						if fFlagSignalsNavP3Dispatch then
							var1.down(var1.fromLegacyPage(t))
							
							return
						end
						var7(navigateDown(t))
					end
				} else nil
			}
		end
		local t = {}
		
		for i, v in profileActionsModule do
			local var33 = v(var32)
			
			if var33 ~= nil then
				t[i] = var33
			end
		end
		return t
	end, {
		var7, profileId, var9,
		if fFlagProfilePlatformEnableCurrencyTransfer then var10 else nil, qRCodePage,
		var16, var6, var8, editUsername, var23.joinExperience, var23.isLoading,
		var11, var26, p1,
		if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		if fFlagProfileAboutDetailsUseSheet then var20 else nil, profileType,
		editAvatar,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then var24 else nil,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then var25 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var13 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var23.isInExperience else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var32 else nil,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var22 else nil
	})
end
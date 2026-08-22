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
local var16 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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
local fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(profilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local fFlagProfilePlatformAddTC = sharedFlagsModule.FFlagProfilePlatformAddTC
local fFlagEnablePlatformProfileContextualMenuOption = require(parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local fFlagProfilePlatformNewProfileHeader = sharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local fFlagProfileAboutDetailsUseSheet = sharedFlagsModule.FFlagProfileAboutDetailsUseSheet
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagPendingIncomingTrustedConnectionModule = require(profilePlatform.Flags.FFlagPendingIncomingTrustedConnection)
local fFlagProfilePlatformPassPresenceToJoinUserInExperience = sharedFlagsModule.FFlagProfilePlatformPassPresenceToJoinUserInExperience
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local var38 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local fFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(profilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local fFlagEnableAbuseReportRevampProfileAndGroupModule = require(profilePlatform.Flags.FFlagEnableAbuseReportRevampProfileAndGroup)
local fFlagProfilePlatformEnableCurrencyTransfer = sharedFlagsModule.FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableTradeItemsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableTradeItems)
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEditBackgroundMenuItemModule = require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local fFlagProfilePlatformEnableEditLookModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var46 = dataHydrationModule.Friends.FriendsStore.get()
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
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local USER_BLOCKING_ERRORS = constantsModule.USER_BLOCKING_ERRORS
local USER_FRIENDING_ERRORS = constantsModule.USER_FRIENDING_ERRORS
local STATUS_CODES = constantsModule.STATUS_CODES
local base_url = `{url.BASE_URL}share/g/%s`
local var57 = tostring(DateTime.now().UnixTimestampMillis)

local function _(p0) --[[ line: 137 | named "areFollowActionsSupportedForProfileType" ]]
	-- upvalues: enumsModule (ref)
	return p0 == enumsModule.ProfileTypes.Community
end

local var58 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()
local t = { skipFetch = true }

return function(p1) --[[ line: 158 ]]
	-- upvalues: useLocalUserId (ref), useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useShortUrl (ref), useGetOrGenerateLinkUrl (ref), useEffectOnce (ref), reactModule (ref), var57 (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), useLocalization (ref), enumsModule (ref), fFlagProfilePlatformAddTC (ref), fFlagProfilePlatformEnableUnlockChatModule (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), fFlagProfilePlatformEditBackgroundMenuItemModule (ref), fFlagProfilePlatformEnableEditLookModule (ref), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagEnablePlatformProfileContextualMenuOption (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformEnableTradeItemsModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), var38 (ref), t (ref), fFlagProfilePlatformPassPresenceToJoinUserInExperience (ref), useSelector (ref), presenceModule (ref), useAboutSectionsModule (ref), fFlagProfileAboutDetailsUseSheet (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), useJoinUserInExperience (ref), fFlagProfilePlatformEditBackgroundMenuItemModule_1 (ref), iconName (ref), eventNamesModule (ref), friendRequestNicknamesIXP (ref), useProfileShareLink (ref), contexts (ref), profileSharePolicyEnum (ref), USER_FRIENDING_ERRORS (ref), STATUS_CODES (ref), httpService (ref), setCurrentToastMessage (ref), fFlagProfilePlatformCTAsRefactorModule (ref), profileActionsModule (ref), buttonVariant (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var46 (ref), networkingFriendsModule (ref), images (ref), refreshProfilePlatformActionInfoModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var16 (ref), navigateDown (ref), buttonType (ref), contextualInfoTypes (ref), refreshProfilePlatformModule (ref), enteredChatFromEntryPointModule (ref), chatEntryPointNames (ref), guiService (ref), notificationTypeList (ref), socialStopwatchModule (ref), setAliasModule (ref), foundationModule (ref), fFlagAXEnableProfileTab (ref), refreshProfilePlatformUserInfoModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), default (ref), fFlagEnableAbuseReportRevampFlow (ref), fFlagEnableAbuseReportRevampProfileAndGroupModule (ref), abuseVectorModule (ref), openDynamicAbuseReportModule (ref), closeCentralOverlay (ref), url (ref), myUserBlockingNetworkingModule (ref), USER_BLOCKING_ERRORS (ref), base_url (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), urlBuilder (ref), urlBase (ref), var58 (ref), sources (ref), fFlagPendingIncomingTrustedConnectionModule (ref), getPlatformFriendsServiceModule (ref), transferDirection (ref), transferOrigination (ref)
	local var60 = useLocalUserId()
	local var61 = useDispatch()
	local var62 = useNavigation()
	local var63 = useProfileWrapperContextModule()
	local var64 = if var63.navigateTo then var63.navigateTo.navigateToTransfer else nil
	local var65 = useProfileAnalyticsContextModule()
	local var66 = useShortUrl()
	useEffectOnce(useGetOrGenerateLinkUrl(), not (var66 ~= nil))
	local var67 = reactModule.useMemo(function() --[[ line: 172 ]]
		-- upvalues: var66 (ref), var57 (copy)
		return string.format("%s&source=ProfileShare&stamp=%s", var66 or "", var57)
	end, { var66 })
	local var68 = if fFlagConnectionsToFriendsRename then textKeysModule.AcceptFriend else textKeysModule.AcceptConnection
	local var69 = if fFlagConnectionsToFriendsRename then textKeysModule.AddFriend else textKeysModule.AddConnection
	local var70 = useLocalization({
		[enumsModule.ProfileActions.AcceptFriendRequest] = var68,
		[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = var68,
		[enumsModule.ProfileActions.AddFriend] = var69,
		[enumsModule.ProfileActions.AddFriendFromContacts] = var69,
		[enumsModule.ProfileActions.AddFriendFromContactsSent] = textKeysModule.PendingRequest,
		[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AddTrustedConnection else nil,
		[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AcceptTrustedConnection else nil,
		[enumsModule.ProfileActions.Block] = textKeysModule.Block,
		[enumsModule.ProfileActions.CannotAddFriend] = var69,
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
		[enumsModule.ProfileActions.ViewFullProfile] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then textKeysModule.ViewFullProfile else nil,
		[enumsModule.ProfileActions.LeaveCommunity] = textKeysModule.LeaveCommunity,
		[enumsModule.ProfileActions.MakePrimaryCommunity] = textKeysModule.MakePrimaryCommunity,
		[enumsModule.ProfileActions.RemovePrimaryCommunity] = textKeysModule.RemovePrimaryCommunity,
		[enumsModule.ProfileActions.Follow] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then textKeysModule.Follow else nil,
		[enumsModule.ProfileActions.Unfollow] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then textKeysModule.Unfollow else nil,
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
	local var71 = reactModule.useCallback(function() --[[ line: 287 ]]
		-- upvalues: var63 (ref)
		var63.navigateTo.previousView(true)
	end, { var63.navigateTo.previousView })
	local profileId = var63.profileId
	local var72 = if fFlagEnablePlatformProfileContextualMenuOption then var63.profilePlatformId else nil
	local profileType = var63.profileType
	local var73 = if fFlagProfilePlatformPresenceStoreMigrationModule then var38(profileId, t) elseif fFlagProfilePlatformPassPresenceToJoinUserInExperience then useSelector(function(p2) --[[ line: 302 ]]
		-- upvalues: presenceModule (copy), profileId (ref)
		return presenceModule.Selectors.getUserPresenceByUserId(p2, profileId) or {
			lastLocation = "",
			userPresenceType = presenceModule.Enums.PresenceType.Offline
		}
	end) else nil
	local aboutSections = nil
	local var74 = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var75 = useAboutSectionsModule()
		aboutSections = var75.aboutSections
		var74 = if fFlagProfileAboutDetailsUseSheet then var75.profileName else nil
	end
	local var76 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var77 = useJoinUserInExperience(profileId, {
		isHomePageCarousel = var63.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
		homepageCarouselAbsolutePosition = var63.sourceInfo.homepageCarouselAbsolutePosition,
		openGameDetailsPeekViewClosed = var71,
		presence = if fFlagProfilePlatformPassPresenceToJoinUserInExperience then var73 else nil
	})
	local qRCodePage = var63.navigateTo.qRCodePage
	local editUsername = var63.navigateTo.editUsername
	local var78 = if fFlagProfilePlatformEnableEditAppearanceMenuModule then var63.navigateTo.editEmotes else nil
	local var79 = if fFlagProfilePlatformEnableEditAppearanceMenuModule then var63.navigateTo.switchAvatar else nil
	
	local function getEditBackgroundAction() --[[ line: 341 ]]
		-- upvalues: fFlagProfilePlatformEditBackgroundMenuItemModule_1 (copy), var63 (ref), var70 (ref), enumsModule (copy), iconName (copy), var65 (ref), eventNamesModule (copy), p1 (ref)
		if fFlagProfilePlatformEditBackgroundMenuItemModule_1 then
			local editBackground = var63.navigateTo.editBackground
			
			return {
				text = var70[enumsModule.ProfileActions.EditBackground],
				icon = iconName.Image,
				onActivated = function() --[[ line: 347 ]]
					-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), editBackground (ref)
					var65.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditBackground, { buttonSurface = p1 })
					editBackground()
				end
			}
		end
		return nil
	end
	
	local editAvatar = var63.navigateTo.editAvatar
	local var81 = friendRequestNicknamesIXP.useFriendRequestNicknames()
	local var82 = useProfileShareLink({ context = contexts.ProfileCard })
	local var83 = var82.policy == profileSharePolicyEnum.Disabled
	local t_1 = {
		[USER_FRIENDING_ERRORS.INVALID_TARGET_USER_ERROR] = var70.invalidTargetUserError,
		[USER_FRIENDING_ERRORS.ALREADY_FRIEND_ERROR] = var70.alreadyFriendError,
		[USER_FRIENDING_ERRORS.MAX_FRIENDS_ERROR] = var70.maxFriendsError,
		[USER_FRIENDING_ERRORS.INVALID_NICKNAME_ERROR] = var70.invalidNicknameError
	}
	local t_2 = {
		[USER_FRIENDING_ERRORS.UNAUTHORIZED_ERROR] = var70.unauthorizedError
	}
	local t_3 = {
		[USER_FRIENDING_ERRORS.USER_BANNED_ERROR] = var70.userBannedError,
		[USER_FRIENDING_ERRORS.USER_BLOCKED_ERROR] = var70.userBlockedError,
		[USER_FRIENDING_ERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = var70.userNotPassedCaptchaError
	}
	local t_4 = {
		[USER_FRIENDING_ERRORS.TOO_MANY_REQUESTS_ERROR] = var70.tooManyRequestsError
	}
	
	local function _(p3, p4, p5) --[[ line: 385 | named "getErrorToastMessage" ]]
		-- upvalues: enumsModule (copy), STATUS_CODES (copy), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref)
		if p3 == enumsModule.ProfileActions.AddFriend or p3 == enumsModule.ProfileActions.AddFriendFromContacts then
			return if p4 == STATUS_CODES.BAD_REQUEST then t_1[p5] elseif p4 == STATUS_CODES.UNAUTHORIZED then t_2[p5] elseif p4 == STATUS_CODES.FORBIDDEN then t_3[p5] elseif p4 == STATUS_CODES.TOO_MANY_REQUESTS then t_4[p5] else nil
		end
	end
	
	local function setErrorToast(value, p6) --[[ line: 400 ]]
		-- upvalues: httpService (copy), enumsModule (copy), STATUS_CODES (copy), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref), var70 (ref), var61 (ref), setCurrentToastMessage (copy)
		if p6 == nil then
			var61(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var70.defaultFriendingError
			}))
			
			return
		end
		local var92
		local statusCode = p6.StatusCode
		local var90 = if p6.Body then httpService:JSONDecode(p6.Body) else nil
		local var91 = if var90 and var90.errors and (var90.errors[1] and var90.errors[1].code) then var90.errors[1].code else nil
		
		if value ~= enumsModule.ProfileActions.AddFriend and value ~= enumsModule.ProfileActions.AddFriendFromContacts then
			var61(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var92 or var70.defaultFriendingError
			}))
			
			return
		var92 = if statusCode == STATUS_CODES.BAD_REQUEST then t_1[var91] elseif statusCode == STATUS_CODES.UNAUTHORIZED then t_2[var91] elseif statusCode == STATUS_CODES.FORBIDDEN then t_3[var91] elseif statusCode == STATUS_CODES.TOO_MANY_REQUESTS then t_4[var91] else nil
	end
	
	local var89 = if fFlagProfilePlatformCTAsRefactorModule then {
		localized = var70,
		analytics = var65,
		buttonSurface = p1,
		profileWrapperContext = var63,
		navigateTo = var63.navigateTo,
		dispatch = var61,
		profileId = profileId,
		localUserId = var60,
		navigation = var62,
		profileType = profileType,
		experienceUtilities = var77,
		friendRequestNicknamesEnabled = var81,
		profileShareLink = var82,
		PROFILE_SHARE_LINK_URL = var67,
		aboutSections = if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		aboutProfileName = if fFlagProfileAboutDetailsUseSheet then var74 else nil,
		actionsComponentRequest = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var76 else nil
	} else nil
	
	return reactModule.useMemo(function() --[[ line: 447 ]]
		-- upvalues: fFlagProfilePlatformCTAsRefactorModule (copy), profileActionsModule (copy), var89 (ref), enumsModule (copy), var70 (ref), buttonVariant (copy), var65 (ref), eventNamesModule (copy), p1 (ref), var63 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var46 (copy), profileId (ref), var61 (ref), networkingFriendsModule (copy), var60 (ref), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var76 (ref), friendRequestNicknamesIXP (copy), var81 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy), setErrorToast (ref), buttonType (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), profileType (ref), var62 (ref), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy), socialStopwatchModule (copy), setAliasModule (copy), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), iconName (copy), editAvatar (ref), fFlagProfilePlatformEnableEditLookModule (copy), var78 (ref), var79 (ref), getEditBackgroundAction (ref), foundationModule (copy), fFlagAXEnableProfileTab (copy), editUsername (ref), refreshProfilePlatformUserInfoModule (copy), fFlagMoveInExperienceModeToEditProfile (copy), var77 (ref), qRCodePage (ref), var83 (ref), default (copy), contexts (copy), var67 (ref), textKeysModule (copy), var82 (ref), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), abuseVectorModule (copy), openDynamicAbuseReportModule (copy), closeCentralOverlay (copy), url (copy), myUserBlockingNetworkingModule (copy), USER_BLOCKING_ERRORS (copy), base_url (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy), urlBuilder (copy), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (copy), urlBase (copy), var58 (copy), fFlagProfilePlatformAddTC (copy), sources (copy), fFlagPendingIncomingTrustedConnectionModule (copy), fFlagProfilePlatformNewProfileHeader (copy), aboutSections (write), fFlagProfileAboutDetailsUseSheet (copy), var74 (write), fFlagEnablePlatformProfileContextualMenuOption (copy), getPlatformFriendsServiceModule (copy), var72 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var64 (ref), transferDirection (copy), transferOrigination (copy), fFlagProfilePlatformEnableTradeItemsModule (copy)
		if fFlagProfilePlatformCTAsRefactorModule then
			local t = {}
			
			for i, v in profileActionsModule do
				local var94 = v(var89)
				
				if var94 ~= nil then
					t[i] = var94
				end
			end
			return t
		else
			return {
				[enumsModule.ProfileActions.AcceptFriendRequest] = {
					text = var70[enumsModule.ProfileActions.AcceptFriendRequest],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 473 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var63 (copy), enumsModule (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var46 (copy), profileId (copy), var61 (copy), networkingFriendsModule (copy), var60 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonAcceptFriendRequest, {
							buttonSurface = p1,
							absolutePosition = var63.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = var63.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = var63.sourceInfo.isRecommendation,
							source = var63.sourceInfo.source,
							contextualInfoType = var63.sourceInfo.contextualInfoType,
							recommendationContextType = var63.sourceInfo.recommendationContextType,
							recommendationRank = var63.sourceInfo.recommendationRank,
							recommendationSessionId = var63.sourceInfo.recommendationSessionId
						})
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var46.AcceptFriendRequest(profileId) else var61(networkingFriendsModule.AcceptFriendRequestFromUserId.API({ targetUserId = profileId, currentUserId = var60 }))):andThen(function() --[[ line: 492 ]]
							-- upvalues: var61 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
							var61(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var70.friendAcceptedToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var61(refreshProfilePlatformActionInfoModule(profileId, var76))
						end)
					end
				},
				[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = {
					text = var70[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest],
					onActivated = function() --[[ line: 504 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), var63 (copy), var61 (copy), networkingFriendsModule (copy), profileId (copy), var60 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriendFromContacts, { shareLinkId = var63.sourceInfo.shareLinkId })
						
						return var61(networkingFriendsModule.AcceptFriendRequestWithToken.API({
							targetUserId = profileId,
							currentUserId = var60,
							friendingToken = var63.offNetworkFriendRequestToken
						})):andThen(function() --[[ line: 512 ]]
							-- upvalues: var61 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
							var61(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var70.friendAcceptedToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var61(refreshProfilePlatformActionInfoModule(profileId, var76))
						end)
					end
				},
				[enumsModule.ProfileActions.AddFriend] = {
					text = var70[enumsModule.ProfileActions.AddFriend],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 525 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var63 (copy), enumsModule (copy), friendRequestNicknamesIXP (copy), var81 (copy), appPage (copy), profileId (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var61 (copy), navigateDown (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var46 (copy), networkingFriendsModule (copy), var60 (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy), setErrorToast (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriend, {
							buttonSurface = p1,
							absolutePosition = var63.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = var63.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = var63.sourceInfo.isRecommendation,
							source = var63.sourceInfo.source,
							contextualInfoType = var63.sourceInfo.contextualInfoType,
							recommendationContextType = var63.sourceInfo.recommendationContextType,
							recommendationRank = var63.sourceInfo.recommendationRank,
							recommendationSessionId = var63.sourceInfo.recommendationSessionId
						})
						
						if not friendRequestNicknamesIXP.FFlagFriendRequestNicknames or not var81 then
							var61(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var70.friendRequestSentToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return (if fFlagMigrateFriendshipStatusesRemainingActions then var46.RequestFriendship(profileId, var63.sourceInfo.friendshipOriginSourceType) else var61(networkingFriendsModule.RequestFriendshipFromUserId.API({
								targetUserId = profileId,
								currentUserId = var60,
								friendshipOriginSourceType = var63.sourceInfo.friendshipOriginSourceType
							}))):andThen(function() --[[ line: 571 ]]
								-- upvalues: var61 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
								return var61(refreshProfilePlatformActionInfoModule(profileId, var76))
							end):catch(function(p7) --[[ line: 576 ]]
								-- upvalues: setErrorToast (copy), enumsModule (copy)
								setErrorToast(enumsModule.ProfileActions.AddFriend, p7)
							end)
						end
						local t = {
							name = appPage.SetNicknameModal,
							extraProps = {
								friendRequestParams = {
									targetUserId = profileId,
									source = var63.sourceInfo.friendshipOriginSourceType
								}
							}
						}
						
						return if fFlagSignalsNavP3Dispatch then var16.down(var16.fromLegacyPage(t)) else var61(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.AddFriendFromContacts] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					text = var70[enumsModule.ProfileActions.AddFriendFromContacts],
					onActivated = function() --[[ line: 586 ]]
						-- upvalues: var61 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var46 (copy), profileId (copy), networkingFriendsModule (copy), var60 (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy), setErrorToast (copy)
						var61(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = var70.friendRequestSentToast,
							toastIcon = images["icons/actions/friends/friendAdd"]
						}))
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var46.RequestFriendship(profileId, nil, { isContact = true }) else var61(networkingFriendsModule.RequestFriendshipFromContactId.API({
							currentUserId = var60,
							contactId = profileId,
							contextType = contextualInfoTypes.Contacts
						}))):andThen(function() --[[ line: 600 ]]
							-- upvalues: var61 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							return var61(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = {
									enumsModule.Components.ContactProfileHeader,
									enumsModule.Components.Actions,
									enumsModule.Components.ContactDescription
								}
							}))
						end):catch(function(p8) --[[ line: 611 ]]
							-- upvalues: setErrorToast (copy), enumsModule (copy)
							setErrorToast(enumsModule.ProfileActions.AddFriendFromContacts, p8)
						end)
					end
				},
				[enumsModule.ProfileActions.AddFriendFromContactsSent] = {
					isDisabled = true,
					buttonType = buttonType.Secondary,
					variant = buttonVariant.Subtle,
					text = var70[enumsModule.ProfileActions.AddFriendFromContactsSent],
					onActivated = function() --[[ line: 620 ]] end
				},
				[enumsModule.ProfileActions.Block] = {
					text = var70[enumsModule.ProfileActions.Block],
					onActivated = function() --[[ line: 625 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), appPage (copy), profileId (copy), var61 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonBlock, { buttonSurface = p1 })
						var62.push(appPage.BlockingModal, {
							navProps = {
								userId = profileId,
								onBlockSuccess = function() --[[ line: 632 ]]
									-- upvalues: var61 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
									var61(setCurrentToastMessage({
										isLocalized = true,
										toastMessage = var70.userBlockedToast,
										toastIcon = images["icons/actions/block"]
									}))
									var61(refreshProfilePlatformActionInfoModule(profileId, var76))
								end
							}
						})
					end
				},
				[enumsModule.ProfileActions.CannotAddFriend] = {
					isDisabled = true,
					text = var70[enumsModule.ProfileActions.CannotAddFriend],
					onActivated = function() --[[ line: 647 ]] end
				},
				[enumsModule.ProfileActions.Chat] = {
					text = var70[enumsModule.ProfileActions.Chat],
					variant = buttonVariant.Standard,
					onActivated = function() --[[ line: 653 ]]
						-- upvalues: p1 (copy), enumsModule (copy), var65 (copy), eventNamesModule (copy), var61 (copy), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), profileId (copy), notificationTypeList (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonChat, { buttonSurface = p1 })
						else
							var65.fireAnalyticsEvent(eventNamesModule.CTAButtonChat, { buttonSurface = p1 })
						end
						var61(enteredChatFromEntryPointModule(chatEntryPointNames.ProfilePeekView))
						guiService:BroadcastNotification(profileId, notificationTypeList.LAUNCH_CONVERSATION)
					end
				},
				[enumsModule.ProfileActions.EditAlias] = {
					text = var70[enumsModule.ProfileActions.EditAlias],
					onActivated = function() --[[ line: 670 ]]
						-- upvalues: socialStopwatchModule (copy), var65 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), enumsModule (copy), profileId (copy), setAliasModule (copy)
						socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CustomizeNameOpened)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonSetAlias, { buttonSurface = p1 })
						var62.navigate(enumsModule.Screens.SetAliasModal, {
							profileUserId = profileId,
							origin = setAliasModule.Analytics.EntryPoints.ContextualMenu
						})
					end
				},
				[enumsModule.ProfileActions.EditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var70[enumsModule.ProfileActions.EditAppearance],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 685 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonEditAppearance, { buttonSurface = p1 })
					end
				} else nil,
				[enumsModule.ProfileActions.EditAvatar] = {
					text = var70[enumsModule.ProfileActions.EditAvatar],
					icon = if fFlagProfilePlatformEnableEditAppearanceMenuModule then iconName.Person else nil,
					onActivated = function() --[[ line: 695 ]]
						-- upvalues: var65 (copy), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), eventNamesModule (copy), p1 (copy), editAvatar (copy)
						var65.fireAnalyticsEvent(if fFlagProfilePlatformEnableEditAppearanceMenuModule then eventNamesModule.EditAppearanceMenuEditAvatar else eventNamesModule.CTAButtonEditAvatar, { buttonSurface = p1 })
						editAvatar()
					end
				},
				[enumsModule.ProfileActions.EditLook] = if fFlagProfilePlatformEnableEditLookModule then {
					text = var70[enumsModule.ProfileActions.EditLook],
					icon = iconName.Person,
					onActivated = function() --[[ line: 711 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), editAvatar (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonEditLook, { buttonSurface = p1 })
						editAvatar()
					end
				} else nil,
				[enumsModule.ProfileActions.EditEmotes] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var70[enumsModule.ProfileActions.EditEmotes],
					icon = iconName.SquareFaceWavingHand,
					onActivated = function() --[[ line: 723 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var78 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditEmote, { buttonSurface = p1 })
						var78()
					end
				} else nil,
				[enumsModule.ProfileActions.SwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var70[enumsModule.ProfileActions.SwitchAvatar],
					icon = iconName.PersonStandingArrowReverse,
					onActivated = function() --[[ line: 735 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var79 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuSwitchAvatar, { buttonSurface = p1 })
						var79()
					end
				} else nil,
				[enumsModule.ProfileActions.EditBackground] = getEditBackgroundAction(),
				[enumsModule.ProfileActions.EditProfile] = {
					component = foundationModule.Button,
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var70[enumsModule.ProfileActions.EditProfile],
					onActivated = function() --[[ line: 749 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), enumsModule (copy), fFlagAXEnableProfileTab (copy), var63 (copy), editUsername (copy), var61 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy), fFlagMoveInExperienceModeToEditProfile (copy)
						local var97
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonOpenEditProfilePage, { buttonSurface = p1 })
						local navigate = var62.navigate
						local editProfilePage = enumsModule.Screens.EditProfilePage
						local t = {}
						
						if fFlagAXEnableProfileTab then
							var97 = var63.forceFullView == true
							var97 = nil
						else
							var97 = nil
						end
						t.fullBleed = var97
						
						function t.navigateToEditUsername(p9) --[[ line: 759 ]]
							-- upvalues: editUsername (copy), var61 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
							editUsername({
								showToast = p9,
								onUsernameChanged = function() --[[ line: 762 ]]
									-- upvalues: var61 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
									var61(refreshProfilePlatformUserInfoModule(profileId))
								end
							})
						end
						
						function t.onIdentityChange() --[[ line: 767 ]]
							-- upvalues: var61 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
							var61(refreshProfilePlatformUserInfoModule(profileId))
						end
						
						t.onToggleInExperienceMode = if fFlagMoveInExperienceModeToEditProfile then function() --[[ line: 771 ]]
							-- upvalues: var61 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy), var65 (copy), eventNamesModule (copy)
							var61(refreshProfilePlatformUserInfoModule(profileId))
							var65.fireAnalyticsEvent(eventNamesModule.ToggleInExperienceModeButton, {})
						end else nil
						navigate(editProfilePage, t)
					end
				},
				[enumsModule.ProfileActions.IgnoreFriendRequest] = {
					text = var70[enumsModule.ProfileActions.IgnoreFriendRequest],
					onActivated = function() --[[ line: 781 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var46 (copy), profileId (copy), var61 (copy), networkingFriendsModule (copy), var60 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonIgnoreFriendRequest, { buttonSurface = p1 })
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var46.DeclineFriendRequest(profileId) else var61(networkingFriendsModule.DeclineFriendRequestFromUserId.API({ targetUserId = profileId, currentUserId = var60 }))):andThen(function() --[[ line: 791 ]]
							-- upvalues: var61 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
							var61(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var70.friendRequestIgnoredToast,
								toastIcon = images["icons/actions/reject"]
							}))
							
							return var61(refreshProfilePlatformActionInfoModule(profileId, var76))
						end)
					end
				},
				[enumsModule.ProfileActions.JoinExperience] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					isLoading = var77.isLoading,
					isDisabled = not var77.isInExperience,
					text = var70[enumsModule.ProfileActions.JoinExperience],
					onActivated = function() --[[ line: 808 ]]
						-- upvalues: var77 (copy)
						var77.joinExperience()
					end
				},
				[enumsModule.ProfileActions.PendingFriendRequest] = {
					isDisabled = true,
					buttonType = buttonType.Secondary,
					variant = buttonVariant.Subtle,
					text = var70[enumsModule.ProfileActions.PendingFriendRequest],
					onActivated = function() --[[ line: 817 ]] end
				},
				[enumsModule.ProfileActions.QrCode] = {
					text = var70[enumsModule.ProfileActions.QrCode],
					icon = iconName.SquaresGridQr,
					onActivated = function() --[[ line: 823 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), qRCodePage (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfileQRCode, { buttonSurface = p1 })
						qRCodePage()
					end
				},
				[enumsModule.ProfileActions.ShareProfile] = {
					component = foundationModule.Button,
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var70[enumsModule.ProfileActions.ShareProfile],
					onActivated = function() --[[ line: 835 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var83 (copy), default (copy), contexts (copy), var67 (copy), profileId (copy), var61 (copy), setCurrentToastMessage (copy), textKeysModule (copy), var82 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfile, { buttonSurface = p1 })
						
						if var83 then
							default:setClipboardText({
								context = contexts.ProfileCard,
								text = string.format("%s/%s", var67, profileId)
							})
							var61(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
							
							return
						end
						var82.onActivated()
					end
				},
				[enumsModule.ProfileActions.Report] = {
					text = var70[enumsModule.ProfileActions.Report],
					onActivated = function() --[[ line: 854 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), profileType (copy), enumsModule (copy), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), abuseVectorModule (copy), var61 (copy), openDynamicAbuseReportModule (copy), profileId (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy), appPage (copy), url (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonReport, { buttonSurface = p1 })
						local var98 = nil
						
						if profileType == enumsModule.ProfileTypes.User then
							var98 = "userprofile"
						elseif profileType == enumsModule.ProfileTypes.Community then
							var98 = "group"
						end
						if fFlagEnableAbuseReportRevampFlow and fFlagEnableAbuseReportRevampProfileAndGroupModule then
							var61(openDynamicAbuseReportModule({
								abuseVector = if profileType == enumsModule.ProfileTypes.Community then abuseVectorModule.Group else abuseVectorModule.UserProfile,
								targetId = profileId,
								onClose = function() --[[ line: 873 ]]
									-- upvalues: var61 (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
									var61(closeCentralOverlay())
									var61(refreshProfilePlatformActionInfoModule(profileId, var76))
								end
							}))
							
							return
						end
						local t = {
							name = appPage.GenericWebPage,
							detail = `{url.BASE_URL}abusereport/{var98}?id={profileId}`,
							extraProps = { titleKey = textKeysModule.Report }
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var61(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.Unblock] = {
					text = var70[enumsModule.ProfileActions.Unblock],
					onActivated = function() --[[ line: 896 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), myUserBlockingNetworkingModule (copy), profileId (copy), var60 (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy), USER_BLOCKING_ERRORS (copy), setCurrentToastMessage (copy), var70 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonUnblock, { buttonSurface = p1 })
						
						return var61(myUserBlockingNetworkingModule.UnblockUserById.API({ userId = profileId, currentUserId = var60 })):andThen(function() --[[ line: 904 ]]
							-- upvalues: var61 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
							return var61(refreshProfilePlatformActionInfoModule(profileId, var76))
						end):catch(function(p10) --[[ line: 907 ]]
							-- upvalues: USER_BLOCKING_ERRORS (copy), var61 (copy), setCurrentToastMessage (copy), var70 (copy)
							if p10 ~= nil and tonumber(p10.Body) == USER_BLOCKING_ERRORS.PARENT_BLOCKED_TARGET_USER_ERROR then
								var61(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var70.unblockTargetParentManagedToast
								}))
								
								return
							elseif p10 ~= nil and tonumber(p10.Body) == USER_BLOCKING_ERRORS.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
								var61(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var70.unblockTargetNotBlockedToast
								}))
								
								return
							elseif p10 == nil or tonumber(p10.Body) ~= USER_BLOCKING_ERRORS.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
								var61(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var70.somethingIsWrongToast
								}))
								
								return
							end
							var61(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var70.blockedOnPlatformToast
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.Unfriend] = {
					text = var70[enumsModule.ProfileActions.Unfriend],
					onActivated = function() --[[ line: 949 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var46 (copy), profileId (copy), var61 (copy), networkingFriendsModule (copy), var60 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfriend, { buttonSurface = p1 })
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var46.Unfriend(profileId) else var61(networkingFriendsModule.UnfriendTargetUserId.API({ targetUserId = profileId, currentUserId = var60 }))):andThen(function() --[[ line: 959 ]]
							-- upvalues: var61 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
							var61(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var70.friendRemovedToast,
								toastIcon = images["icons/actions/friends/friendRemove"]
							}))
							
							return var61(refreshProfilePlatformActionInfoModule(profileId, var76))
						end)
					end
				},
				[enumsModule.ProfileActions.CopyLink] = {
					text = var70[enumsModule.ProfileActions.CopyLink],
					onActivated = function() --[[ line: 971 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), default (copy), contexts (copy), base_url (copy), profileId (copy), var61 (copy), setCurrentToastMessage (copy), textKeysModule (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCopyLink, { buttonSurface = p1 })
						default:setClipboardText({
							context = contexts.ProfileCard,
							text = string.format(base_url, profileId)
						})
						var61(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
					end
				},
				[enumsModule.ProfileActions.JoinCommunity] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					text = var70[enumsModule.ProfileActions.JoinCommunity],
					onActivated = function() --[[ line: 989 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var63 (copy), var61 (copy), groupsNetworkingModule (copy), profileId (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonJoinCommunity, { buttonSurface = p1, btnContext = var63.sourceInfo.source })
						
						return var61(groupsNetworkingModule.JoinGroup.API({ groupId = profileId })):andThen(function() --[[ line: 997 ]]
							-- upvalues: var61 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var61(getProfilePlatformModule.API({
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
					text = var70[enumsModule.ProfileActions.CancelJoinCommunityRequest],
					onActivated = function() --[[ line: 1011 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var63 (copy), var61 (copy), groupsNetworkingModule (copy), profileId (copy), var60 (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonCancelJoinCommunityRequest, { buttonSurface = p1, btnContext = var63.sourceInfo.source })
						
						return var61(groupsNetworkingModule.CancelJoinGroupRequest.API({ groupId = profileId, userId = var60 })):andThen(function() --[[ line: 1020 ]]
							-- upvalues: var61 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var61(refreshProfilePlatformModule({
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
					text = var70[enumsModule.ProfileActions.ViewCommunity],
					onActivated = function() --[[ line: 1035 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var63 (copy), appPage (copy), urlBuilder (copy), profileId (copy), textKeysModule (copy), var61 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonViewCommunity, { buttonSurface = p1, btnContext = var63.sourceInfo.source })
						local t = {
							name = appPage.GenericWebPage,
							detail = urlBuilder.user.group({ groupId = profileId }),
							extraProps = {
								titleKey = textKeysModule.Community,
								onClose = function() --[[ line: 1046 ]]
									-- upvalues: var61 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
									var61(getProfilePlatformModule.API({
										includeComponentOrdering = true,
										profileType = profileType,
										profileId = profileId,
										components = getAvailableCommunityComponentsModule()
									}))
								end
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var61(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.ViewFullProfile] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then {
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.SubEmphasis,
					text = var70[enumsModule.ProfileActions.ViewFullProfile],
					onActivated = function() --[[ line: 1068 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var63 (copy), appPage (copy), urlBuilder (copy), urlBase (copy), profileId (copy), textKeysModule (copy), var61 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, { buttonSurface = p1, btnContext = var63.sourceInfo.source })
						local t = {
							name = appPage.GenericWebPage,
							detail = urlBuilder.new({ base = urlBase.WWW, path = `profiles/{profileId}` })(),
							extraProps = {
								titleKey = textKeysModule.Profile,
								onClose = function() --[[ line: 1082 ]]
									-- upvalues: var61 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
									var61(getProfilePlatformModule.API({
										includeComponentOrdering = true,
										profileType = profileType,
										profileId = profileId,
										components = getAvailableCommunityComponentsModule()
									}))
								end
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var61(navigateDown(t))
					end
				} else nil,
				[enumsModule.ProfileActions.LeaveCommunity] = {
					text = var70[enumsModule.ProfileActions.LeaveCommunity],
					onActivated = function() --[[ line: 1102 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var63 (copy), var61 (copy), groupsNetworkingModule (copy), profileId (copy), var60 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonLeaveCommunity, { buttonSurface = p1, btnContext = var63.sourceInfo.source })
						
						return var61(groupsNetworkingModule.LeaveGroup.API({ groupId = profileId, userId = var60 })):andThen(function() --[[ line: 1111 ]]
							-- upvalues: var61 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var61(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.MakePrimaryCommunity] = {
					text = var70[enumsModule.ProfileActions.MakePrimaryCommunity],
					onActivated = function() --[[ line: 1123 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var63 (copy), var61 (copy), groupsNetworkingModule (copy), profileId (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonMakePrimaryCommunity, { buttonSurface = p1, btnContext = var63.sourceInfo.source })
						
						return var61(groupsNetworkingModule.MakePrimaryGroup.API({ groupId = profileId })):andThen(function() --[[ line: 1131 ]]
							-- upvalues: var61 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var61(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = { enumsModule.Components.Actions }
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.RemovePrimaryCommunity] = {
					text = var70[enumsModule.ProfileActions.RemovePrimaryCommunity],
					onActivated = function() --[[ line: 1144 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var63 (copy), var61 (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity, { buttonSurface = p1, btnContext = var63.sourceInfo.source })
						
						return var61(groupsNetworkingModule.RemovePrimaryGroup.API()):andThen(function() --[[ line: 1150 ]]
							-- upvalues: var61 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var61(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = { enumsModule.Components.Actions }
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.Follow] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule and profileType == enumsModule.ProfileTypes.Community then {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Standard,
					text = var70[enumsModule.ProfileActions.Follow],
					onActivated = function() --[[ line: 1167 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), groupsNetworkingModule (copy), profileId (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonFollow, { buttonSurface = p1 })
						
						return var61(groupsNetworkingModule.JoinGroup.API({ groupId = profileId })):andThen(function() --[[ line: 1173 ]]
							-- upvalues: var61 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var61(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[enumsModule.ProfileActions.Unfollow] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule and profileType == enumsModule.ProfileTypes.Community then {
					text = var70[enumsModule.ProfileActions.Unfollow],
					onActivated = function() --[[ line: 1188 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), groupsNetworkingModule (copy), profileId (copy), var60 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = p1 })
						
						return var61(groupsNetworkingModule.LeaveGroup.API({ groupId = profileId, userId = var60 })):andThen(function() --[[ line: 1196 ]]
							-- upvalues: var61 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var61(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[enumsModule.ProfileActions.RemoveTrustedConnection] = {
					text = var70[enumsModule.ProfileActions.RemoveTrustedConnection],
					onActivated = function() --[[ line: 1209 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var58 (copy), profileId (copy), var61 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemoveTrustedConnection, { buttonSurface = p1 })
						
						return var58.removeTrustedConnectionRequest(profileId):andThen(function() --[[ line: 1213 ]]
							-- upvalues: var61 (copy), setCurrentToastMessage (copy), var70 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
							var61(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var70.trustedConnectionRemovedToast,
								toastIcon = images["icons/actions/friends/friendRemove"]
							}))
							
							return var61(refreshProfilePlatformActionInfoModule(profileId, var76))
						end)
					end
				},
				[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then {
					text = var70[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1226 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), appPage (copy), profileId (copy), sources (copy), var61 (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, { buttonSurface = p1 })
						var62.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								onRequestSent = function() --[[ line: 1234 ]]
									-- upvalues: var61 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
									return var61(refreshProfilePlatformActionInfoModule(profileId, var76))
								end
							}
						})
					end
				} else nil,
				[enumsModule.ProfileActions.AddTrustedConnectionViaLink] = {
					text = var70[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1246 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), sources (copy), var62 (copy), appPage (copy), profileId (copy), var61 (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, {
							buttonSurface = p1,
							modalVariantOverride = sources.ShareLinkSender
						})
						var62.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								modalVariantOverride = sources.ShareLinkSender,
								onRequestSent = function() --[[ line: 1256 ]]
									-- upvalues: var61 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
									return var61(refreshProfilePlatformActionInfoModule(profileId, var76))
								end
							}
						})
					end
				},
				[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then {
					text = var70[enumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function() --[[ line: 1268 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), appPage (copy), profileId (copy), var61 (copy), refreshProfilePlatformActionInfoModule (copy), var76 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection, { buttonSurface = p1 })
						var62.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								onRequestAccepted = function() --[[ line: 1275 ]]
									-- upvalues: var61 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var76 (copy)
									return var61(refreshProfilePlatformActionInfoModule(profileId, var76))
								end
							}
						})
					end
				} else nil,
				[enumsModule.ProfileActions.PendingTrustedConnection] = if fFlagProfilePlatformAddTC then {
					isDisabled = true,
					text = var70[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1289 ]] end
				} else nil,
				[enumsModule.ProfileActions.PendingIncomingTrustedConnection] = if fFlagPendingIncomingTrustedConnectionModule then {
					isDisabled = true,
					text = var70[enumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function() --[[ line: 1296 ]] end
				} else nil,
				[enumsModule.ProfileActions.ViewAbout] = if fFlagProfilePlatformNewProfileHeader then {
					text = var70[enumsModule.ProfileActions.ViewAbout],
					onActivated = function() --[[ line: 1302 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), var63 (copy), appPage (copy), aboutSections (copy), fFlagProfileAboutDetailsUseSheet (copy), var74 (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var61 (copy), navigateDown (copy)
						var65.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, { buttonSurface = p1, btnContext = var63.sourceInfo.source })
						local t = {
							name = appPage.AboutDetailsSheet,
							extraProps = {
								sections = aboutSections,
								profileName = if fFlagProfileAboutDetailsUseSheet then var74 else nil
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var61(navigateDown(t))
					end
				} else nil,
				[enumsModule.ProfileActions.ViewPlatformProfile] = if fFlagEnablePlatformProfileContextualMenuOption then {
					text = var70[enumsModule.ProfileActions.ViewPlatformProfile],
					onActivated = function() --[[ line: 1328 ]]
						-- upvalues: var65 (copy), eventNamesModule (copy), p1 (copy), getPlatformFriendsServiceModule (copy), var72 (copy)
						var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonViewPlatformProfile, { buttonSurface = p1 })
						getPlatformFriendsServiceModule:ShowProfile(var72)
					end
				} else nil,
				[enumsModule.ProfileActions.CurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
					text = var70[enumsModule.ProfileActions.CurrencyTransfer],
					onActivated = function() --[[ line: 1339 ]]
						-- upvalues: p1 (copy), enumsModule (copy), var65 (copy), eventNamesModule (copy), var64 (copy), profileId (copy), transferDirection (copy), transferOrigination (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCurrencyTransfer, { buttonSurface = p1 })
						else
							var65.fireAnalyticsEvent(eventNamesModule.CTAButtonCurrencyTransfer, { buttonSurface = p1 })
						end
						if var64 then
							var64({
								recipientUserId = profileId,
								direction = transferDirection.Send,
								transferOrigination = transferOrigination.Profile
							})
						end
					end
				} else nil,
				[enumsModule.ProfileActions.TradeItems] = if fFlagProfilePlatformEnableTradeItemsModule then {
					text = var70[enumsModule.ProfileActions.TradeItems],
					onActivated = function() --[[ line: 1362 ]]
						-- upvalues: p1 (copy), enumsModule (copy), var65 (copy), eventNamesModule (copy), appPage (copy), url (copy), profileId (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var61 (copy), navigateDown (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var65.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonTradeItems, { buttonSurface = p1 })
						else
							var65.fireAnalyticsEvent(eventNamesModule.CTAButtonTradeItems, { buttonSurface = p1 })
						end
						local t = {
							name = appPage.GenericWebPage,
							detail = `{url.BASE_URL}users/{profileId}/trade`,
							extraProps = { titleKey = textKeysModule.TradeItems }
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var61(navigateDown(t))
					end
				} else nil
			}
		end
	end, {
		var61, profileId, var63,
		if fFlagProfilePlatformEnableCurrencyTransfer then var64 else nil, qRCodePage,
		var70, var60, var62, editUsername, var77.joinExperience, var77.isLoading,
		var65, var81, p1,
		if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		if fFlagProfileAboutDetailsUseSheet then var74 else nil, profileType,
		editAvatar,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then var78 else nil,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then var79 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var67 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var77.isInExperience else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var89 else nil,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var76 else nil
	})
end
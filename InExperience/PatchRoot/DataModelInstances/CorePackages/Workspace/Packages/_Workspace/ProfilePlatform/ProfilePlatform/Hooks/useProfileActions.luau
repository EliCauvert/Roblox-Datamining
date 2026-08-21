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
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEditBackgroundMenuItemModule = require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local fFlagProfilePlatformEnableEditLookModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var45 = dataHydrationModule.Friends.FriendsStore.get()
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
local var56 = tostring(DateTime.now().UnixTimestampMillis)

local function _(p0) --[[ line: 136 | named "areFollowActionsSupportedForProfileType" ]]
	-- upvalues: enumsModule (ref)
	return p0 == enumsModule.ProfileTypes.Community
end

local var57 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()
local t = { skipFetch = true }

return function(p1) --[[ line: 157 ]]
	-- upvalues: useLocalUserId (ref), useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useShortUrl (ref), useGetOrGenerateLinkUrl (ref), useEffectOnce (ref), reactModule (ref), var56 (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), useLocalization (ref), enumsModule (ref), fFlagProfilePlatformAddTC (ref), fFlagProfilePlatformEnableUnlockChatModule (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), fFlagProfilePlatformEditBackgroundMenuItemModule (ref), fFlagProfilePlatformEnableEditLookModule (ref), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagEnablePlatformProfileContextualMenuOption (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), var38 (ref), t (ref), fFlagProfilePlatformPassPresenceToJoinUserInExperience (ref), useSelector (ref), presenceModule (ref), useAboutSectionsModule (ref), fFlagProfileAboutDetailsUseSheet (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), useJoinUserInExperience (ref), fFlagProfilePlatformEditBackgroundMenuItemModule_1 (ref), iconName (ref), eventNamesModule (ref), friendRequestNicknamesIXP (ref), useProfileShareLink (ref), contexts (ref), profileSharePolicyEnum (ref), USER_FRIENDING_ERRORS (ref), STATUS_CODES (ref), httpService (ref), setCurrentToastMessage (ref), fFlagProfilePlatformCTAsRefactorModule (ref), profileActionsModule (ref), buttonVariant (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var45 (ref), networkingFriendsModule (ref), images (ref), refreshProfilePlatformActionInfoModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var16 (ref), navigateDown (ref), buttonType (ref), contextualInfoTypes (ref), refreshProfilePlatformModule (ref), enteredChatFromEntryPointModule (ref), chatEntryPointNames (ref), guiService (ref), notificationTypeList (ref), socialStopwatchModule (ref), setAliasModule (ref), foundationModule (ref), fFlagAXEnableProfileTab (ref), refreshProfilePlatformUserInfoModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), default (ref), fFlagEnableAbuseReportRevampFlow (ref), fFlagEnableAbuseReportRevampProfileAndGroupModule (ref), abuseVectorModule (ref), openDynamicAbuseReportModule (ref), closeCentralOverlay (ref), url (ref), myUserBlockingNetworkingModule (ref), USER_BLOCKING_ERRORS (ref), base_url (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), urlBuilder (ref), urlBase (ref), var57 (ref), sources (ref), fFlagPendingIncomingTrustedConnectionModule (ref), getPlatformFriendsServiceModule (ref), transferDirection (ref), transferOrigination (ref)
	local var59 = useLocalUserId()
	local var60 = useDispatch()
	local var61 = useNavigation()
	local var62 = useProfileWrapperContextModule()
	local var63 = if var62.navigateTo then var62.navigateTo.navigateToTransfer else nil
	local var64 = useProfileAnalyticsContextModule()
	local var65 = useShortUrl()
	useEffectOnce(useGetOrGenerateLinkUrl(), not (var65 ~= nil))
	local var66 = reactModule.useMemo(function() --[[ line: 171 ]]
		-- upvalues: var65 (ref), var56 (copy)
		return string.format("%s&source=ProfileShare&stamp=%s", var65 or "", var56)
	end, { var65 })
	local var67 = if fFlagConnectionsToFriendsRename then textKeysModule.AcceptFriend else textKeysModule.AcceptConnection
	local var68 = if fFlagConnectionsToFriendsRename then textKeysModule.AddFriend else textKeysModule.AddConnection
	local var69 = useLocalization({
		[enumsModule.ProfileActions.AcceptFriendRequest] = var67,
		[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = var67,
		[enumsModule.ProfileActions.AddFriend] = var68,
		[enumsModule.ProfileActions.AddFriendFromContacts] = var68,
		[enumsModule.ProfileActions.AddFriendFromContactsSent] = textKeysModule.PendingRequest,
		[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AddTrustedConnection else nil,
		[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AcceptTrustedConnection else nil,
		[enumsModule.ProfileActions.Block] = textKeysModule.Block,
		[enumsModule.ProfileActions.CannotAddFriend] = var68,
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
	local var70 = reactModule.useCallback(function() --[[ line: 285 ]]
		-- upvalues: var62 (ref)
		var62.navigateTo.previousView(true)
	end, { var62.navigateTo.previousView })
	local profileId = var62.profileId
	local var71 = if fFlagEnablePlatformProfileContextualMenuOption then var62.profilePlatformId else nil
	local profileType = var62.profileType
	local var72 = if fFlagProfilePlatformPresenceStoreMigrationModule then var38(profileId, t) elseif fFlagProfilePlatformPassPresenceToJoinUserInExperience then useSelector(function(p2) --[[ line: 300 ]]
		-- upvalues: presenceModule (copy), profileId (ref)
		return presenceModule.Selectors.getUserPresenceByUserId(p2, profileId) or {
			lastLocation = "",
			userPresenceType = presenceModule.Enums.PresenceType.Offline
		}
	end) else nil
	local aboutSections = nil
	local var73 = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var74 = useAboutSectionsModule()
		aboutSections = var74.aboutSections
		var73 = if fFlagProfileAboutDetailsUseSheet then var74.profileName else nil
	end
	local var75 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var76 = useJoinUserInExperience(profileId, {
		isHomePageCarousel = var62.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
		homepageCarouselAbsolutePosition = var62.sourceInfo.homepageCarouselAbsolutePosition,
		openGameDetailsPeekViewClosed = var70,
		presence = if fFlagProfilePlatformPassPresenceToJoinUserInExperience then var72 else nil
	})
	local qRCodePage = var62.navigateTo.qRCodePage
	local editUsername = var62.navigateTo.editUsername
	local var77 = if fFlagProfilePlatformEnableEditAppearanceMenuModule then var62.navigateTo.editEmotes else nil
	local var78 = if fFlagProfilePlatformEnableEditAppearanceMenuModule then var62.navigateTo.switchAvatar else nil
	
	local function getEditBackgroundAction() --[[ line: 339 ]]
		-- upvalues: fFlagProfilePlatformEditBackgroundMenuItemModule_1 (copy), var62 (ref), var69 (ref), enumsModule (copy), iconName (copy), var64 (ref), eventNamesModule (copy), p1 (ref)
		if fFlagProfilePlatformEditBackgroundMenuItemModule_1 then
			local editBackground = var62.navigateTo.editBackground
			
			return {
				text = var69[enumsModule.ProfileActions.EditBackground],
				icon = iconName.Image,
				onActivated = function() --[[ line: 345 ]]
					-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), editBackground (ref)
					var64.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditBackground, { buttonSurface = p1 })
					editBackground()
				end
			}
		end
		return nil
	end
	
	local editAvatar = var62.navigateTo.editAvatar
	local var80 = friendRequestNicknamesIXP.useFriendRequestNicknames()
	local var81 = useProfileShareLink({ context = contexts.ProfileCard })
	local var82 = var81.policy == profileSharePolicyEnum.Disabled
	local t_1 = {
		[USER_FRIENDING_ERRORS.INVALID_TARGET_USER_ERROR] = var69.invalidTargetUserError,
		[USER_FRIENDING_ERRORS.ALREADY_FRIEND_ERROR] = var69.alreadyFriendError,
		[USER_FRIENDING_ERRORS.MAX_FRIENDS_ERROR] = var69.maxFriendsError,
		[USER_FRIENDING_ERRORS.INVALID_NICKNAME_ERROR] = var69.invalidNicknameError
	}
	local t_2 = {
		[USER_FRIENDING_ERRORS.UNAUTHORIZED_ERROR] = var69.unauthorizedError
	}
	local t_3 = {
		[USER_FRIENDING_ERRORS.USER_BANNED_ERROR] = var69.userBannedError,
		[USER_FRIENDING_ERRORS.USER_BLOCKED_ERROR] = var69.userBlockedError,
		[USER_FRIENDING_ERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = var69.userNotPassedCaptchaError
	}
	local t_4 = {
		[USER_FRIENDING_ERRORS.TOO_MANY_REQUESTS_ERROR] = var69.tooManyRequestsError
	}
	
	local function _(p3, p4, p5) --[[ line: 383 | named "getErrorToastMessage" ]]
		-- upvalues: enumsModule (copy), STATUS_CODES (copy), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref)
		if p3 == enumsModule.ProfileActions.AddFriend or p3 == enumsModule.ProfileActions.AddFriendFromContacts then
			return if p4 == STATUS_CODES.BAD_REQUEST then t_1[p5] elseif p4 == STATUS_CODES.UNAUTHORIZED then t_2[p5] elseif p4 == STATUS_CODES.FORBIDDEN then t_3[p5] elseif p4 == STATUS_CODES.TOO_MANY_REQUESTS then t_4[p5] else nil
		end
	end
	
	local function setErrorToast(value, p6) --[[ line: 398 ]]
		-- upvalues: httpService (copy), enumsModule (copy), STATUS_CODES (copy), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref), var69 (ref), var60 (ref), setCurrentToastMessage (copy)
		if p6 == nil then
			var60(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var69.defaultFriendingError
			}))
			
			return
		end
		local var91
		local statusCode = p6.StatusCode
		local var89 = if p6.Body then httpService:JSONDecode(p6.Body) else nil
		local var90 = if var89 and var89.errors and (var89.errors[1] and var89.errors[1].code) then var89.errors[1].code else nil
		
		if value ~= enumsModule.ProfileActions.AddFriend and value ~= enumsModule.ProfileActions.AddFriendFromContacts then
			var60(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var91 or var69.defaultFriendingError
			}))
			
			return
		var91 = if statusCode == STATUS_CODES.BAD_REQUEST then t_1[var90] elseif statusCode == STATUS_CODES.UNAUTHORIZED then t_2[var90] elseif statusCode == STATUS_CODES.FORBIDDEN then t_3[var90] elseif statusCode == STATUS_CODES.TOO_MANY_REQUESTS then t_4[var90] else nil
	end
	
	local var88 = if fFlagProfilePlatformCTAsRefactorModule then {
		localized = var69,
		analytics = var64,
		buttonSurface = p1,
		profileWrapperContext = var62,
		navigateTo = var62.navigateTo,
		dispatch = var60,
		profileId = profileId,
		localUserId = var59,
		navigation = var61,
		profileType = profileType,
		experienceUtilities = var76,
		friendRequestNicknamesEnabled = var80,
		profileShareLink = var81,
		PROFILE_SHARE_LINK_URL = var66,
		aboutSections = if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		aboutProfileName = if fFlagProfileAboutDetailsUseSheet then var73 else nil,
		actionsComponentRequest = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var75 else nil
	} else nil
	
	return reactModule.useMemo(function() --[[ line: 445 ]]
		-- upvalues: fFlagProfilePlatformCTAsRefactorModule (copy), profileActionsModule (copy), var88 (ref), enumsModule (copy), var69 (ref), buttonVariant (copy), var64 (ref), eventNamesModule (copy), p1 (ref), var62 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var45 (copy), profileId (ref), var60 (ref), networkingFriendsModule (copy), var59 (ref), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var75 (ref), friendRequestNicknamesIXP (copy), var80 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy), setErrorToast (ref), buttonType (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), profileType (ref), var61 (ref), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy), socialStopwatchModule (copy), setAliasModule (copy), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), iconName (copy), editAvatar (ref), fFlagProfilePlatformEnableEditLookModule (copy), var77 (ref), var78 (ref), getEditBackgroundAction (ref), foundationModule (copy), fFlagAXEnableProfileTab (copy), editUsername (ref), refreshProfilePlatformUserInfoModule (copy), fFlagMoveInExperienceModeToEditProfile (copy), var76 (ref), qRCodePage (ref), var82 (ref), default (copy), contexts (copy), var66 (ref), textKeysModule (copy), var81 (ref), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), abuseVectorModule (copy), openDynamicAbuseReportModule (copy), closeCentralOverlay (copy), url (copy), myUserBlockingNetworkingModule (copy), USER_BLOCKING_ERRORS (copy), base_url (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy), urlBuilder (copy), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (copy), urlBase (copy), var57 (copy), fFlagProfilePlatformAddTC (copy), sources (copy), fFlagPendingIncomingTrustedConnectionModule (copy), fFlagProfilePlatformNewProfileHeader (copy), aboutSections (write), fFlagProfileAboutDetailsUseSheet (copy), var73 (write), fFlagEnablePlatformProfileContextualMenuOption (copy), getPlatformFriendsServiceModule (copy), var71 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var63 (ref), transferDirection (copy), transferOrigination (copy)
		if fFlagProfilePlatformCTAsRefactorModule then
			local t = {}
			
			for i, v in profileActionsModule do
				local var93 = v(var88)
				
				if var93 ~= nil then
					t[i] = var93
				end
			end
			return t
		else
			return {
				[enumsModule.ProfileActions.AcceptFriendRequest] = {
					text = var69[enumsModule.ProfileActions.AcceptFriendRequest],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 471 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), enumsModule (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var45 (copy), profileId (copy), var60 (copy), networkingFriendsModule (copy), var59 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonAcceptFriendRequest, {
							buttonSurface = p1,
							absolutePosition = var62.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = var62.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = var62.sourceInfo.isRecommendation,
							source = var62.sourceInfo.source,
							contextualInfoType = var62.sourceInfo.contextualInfoType,
							recommendationContextType = var62.sourceInfo.recommendationContextType,
							recommendationRank = var62.sourceInfo.recommendationRank,
							recommendationSessionId = var62.sourceInfo.recommendationSessionId
						})
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var45.AcceptFriendRequest(profileId) else var60(networkingFriendsModule.AcceptFriendRequestFromUserId.API({ targetUserId = profileId, currentUserId = var59 }))):andThen(function() --[[ line: 490 ]]
							-- upvalues: var60 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
							var60(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var69.friendAcceptedToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var60(refreshProfilePlatformActionInfoModule(profileId, var75))
						end)
					end
				},
				[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = {
					text = var69[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest],
					onActivated = function() --[[ line: 502 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), var62 (copy), var60 (copy), networkingFriendsModule (copy), profileId (copy), var59 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriendFromContacts, { shareLinkId = var62.sourceInfo.shareLinkId })
						
						return var60(networkingFriendsModule.AcceptFriendRequestWithToken.API({
							targetUserId = profileId,
							currentUserId = var59,
							friendingToken = var62.offNetworkFriendRequestToken
						})):andThen(function() --[[ line: 510 ]]
							-- upvalues: var60 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
							var60(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var69.friendAcceptedToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var60(refreshProfilePlatformActionInfoModule(profileId, var75))
						end)
					end
				},
				[enumsModule.ProfileActions.AddFriend] = {
					text = var69[enumsModule.ProfileActions.AddFriend],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 523 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), enumsModule (copy), friendRequestNicknamesIXP (copy), var80 (copy), appPage (copy), profileId (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var60 (copy), navigateDown (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var45 (copy), networkingFriendsModule (copy), var59 (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy), setErrorToast (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriend, {
							buttonSurface = p1,
							absolutePosition = var62.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = var62.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = var62.sourceInfo.isRecommendation,
							source = var62.sourceInfo.source,
							contextualInfoType = var62.sourceInfo.contextualInfoType,
							recommendationContextType = var62.sourceInfo.recommendationContextType,
							recommendationRank = var62.sourceInfo.recommendationRank,
							recommendationSessionId = var62.sourceInfo.recommendationSessionId
						})
						
						if not friendRequestNicknamesIXP.FFlagFriendRequestNicknames or not var80 then
							var60(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var69.friendRequestSentToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return (if fFlagMigrateFriendshipStatusesRemainingActions then var45.RequestFriendship(profileId, var62.sourceInfo.friendshipOriginSourceType) else var60(networkingFriendsModule.RequestFriendshipFromUserId.API({
								targetUserId = profileId,
								currentUserId = var59,
								friendshipOriginSourceType = var62.sourceInfo.friendshipOriginSourceType
							}))):andThen(function() --[[ line: 569 ]]
								-- upvalues: var60 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
								return var60(refreshProfilePlatformActionInfoModule(profileId, var75))
							end):catch(function(p7) --[[ line: 574 ]]
								-- upvalues: setErrorToast (copy), enumsModule (copy)
								setErrorToast(enumsModule.ProfileActions.AddFriend, p7)
							end)
						end
						local t = {
							name = appPage.SetNicknameModal,
							extraProps = {
								friendRequestParams = {
									targetUserId = profileId,
									source = var62.sourceInfo.friendshipOriginSourceType
								}
							}
						}
						
						return if fFlagSignalsNavP3Dispatch then var16.down(var16.fromLegacyPage(t)) else var60(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.AddFriendFromContacts] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					text = var69[enumsModule.ProfileActions.AddFriendFromContacts],
					onActivated = function() --[[ line: 584 ]]
						-- upvalues: var60 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var45 (copy), profileId (copy), networkingFriendsModule (copy), var59 (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy), setErrorToast (copy)
						var60(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = var69.friendRequestSentToast,
							toastIcon = images["icons/actions/friends/friendAdd"]
						}))
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var45.RequestFriendship(profileId, nil, { isContact = true }) else var60(networkingFriendsModule.RequestFriendshipFromContactId.API({
							currentUserId = var59,
							contactId = profileId,
							contextType = contextualInfoTypes.Contacts
						}))):andThen(function() --[[ line: 598 ]]
							-- upvalues: var60 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							return var60(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = {
									enumsModule.Components.ContactProfileHeader,
									enumsModule.Components.Actions,
									enumsModule.Components.ContactDescription
								}
							}))
						end):catch(function(p8) --[[ line: 609 ]]
							-- upvalues: setErrorToast (copy), enumsModule (copy)
							setErrorToast(enumsModule.ProfileActions.AddFriendFromContacts, p8)
						end)
					end
				},
				[enumsModule.ProfileActions.AddFriendFromContactsSent] = {
					isDisabled = true,
					buttonType = buttonType.Secondary,
					variant = buttonVariant.Subtle,
					text = var69[enumsModule.ProfileActions.AddFriendFromContactsSent],
					onActivated = function() --[[ line: 618 ]] end
				},
				[enumsModule.ProfileActions.Block] = {
					text = var69[enumsModule.ProfileActions.Block],
					onActivated = function() --[[ line: 623 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), appPage (copy), profileId (copy), var60 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonBlock, { buttonSurface = p1 })
						var61.push(appPage.BlockingModal, {
							navProps = {
								userId = profileId,
								onBlockSuccess = function() --[[ line: 630 ]]
									-- upvalues: var60 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
									var60(setCurrentToastMessage({
										isLocalized = true,
										toastMessage = var69.userBlockedToast,
										toastIcon = images["icons/actions/block"]
									}))
									var60(refreshProfilePlatformActionInfoModule(profileId, var75))
								end
							}
						})
					end
				},
				[enumsModule.ProfileActions.CannotAddFriend] = {
					isDisabled = true,
					text = var69[enumsModule.ProfileActions.CannotAddFriend],
					onActivated = function() --[[ line: 645 ]] end
				},
				[enumsModule.ProfileActions.Chat] = {
					text = var69[enumsModule.ProfileActions.Chat],
					variant = buttonVariant.Standard,
					onActivated = function() --[[ line: 651 ]]
						-- upvalues: p1 (copy), enumsModule (copy), var64 (copy), eventNamesModule (copy), var60 (copy), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), profileId (copy), notificationTypeList (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonChat, { buttonSurface = p1 })
						else
							var64.fireAnalyticsEvent(eventNamesModule.CTAButtonChat, { buttonSurface = p1 })
						end
						var60(enteredChatFromEntryPointModule(chatEntryPointNames.ProfilePeekView))
						guiService:BroadcastNotification(profileId, notificationTypeList.LAUNCH_CONVERSATION)
					end
				},
				[enumsModule.ProfileActions.EditAlias] = {
					text = var69[enumsModule.ProfileActions.EditAlias],
					onActivated = function() --[[ line: 668 ]]
						-- upvalues: socialStopwatchModule (copy), var64 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), enumsModule (copy), profileId (copy), setAliasModule (copy)
						socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CustomizeNameOpened)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonSetAlias, { buttonSurface = p1 })
						var61.navigate(enumsModule.Screens.SetAliasModal, {
							profileUserId = profileId,
							origin = setAliasModule.Analytics.EntryPoints.ContextualMenu
						})
					end
				},
				[enumsModule.ProfileActions.EditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var69[enumsModule.ProfileActions.EditAppearance],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 683 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonEditAppearance, { buttonSurface = p1 })
					end
				} else nil,
				[enumsModule.ProfileActions.EditAvatar] = {
					text = var69[enumsModule.ProfileActions.EditAvatar],
					icon = if fFlagProfilePlatformEnableEditAppearanceMenuModule then iconName.Person else nil,
					onActivated = function() --[[ line: 693 ]]
						-- upvalues: var64 (copy), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), eventNamesModule (copy), p1 (copy), editAvatar (copy)
						var64.fireAnalyticsEvent(if fFlagProfilePlatformEnableEditAppearanceMenuModule then eventNamesModule.EditAppearanceMenuEditAvatar else eventNamesModule.CTAButtonEditAvatar, { buttonSurface = p1 })
						editAvatar()
					end
				},
				[enumsModule.ProfileActions.EditLook] = if fFlagProfilePlatformEnableEditLookModule then {
					text = var69[enumsModule.ProfileActions.EditLook],
					icon = iconName.Person,
					onActivated = function() --[[ line: 709 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), editAvatar (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonEditLook, { buttonSurface = p1 })
						editAvatar()
					end
				} else nil,
				[enumsModule.ProfileActions.EditEmotes] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var69[enumsModule.ProfileActions.EditEmotes],
					icon = iconName.SquareFaceWavingHand,
					onActivated = function() --[[ line: 721 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var77 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditEmote, { buttonSurface = p1 })
						var77()
					end
				} else nil,
				[enumsModule.ProfileActions.SwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var69[enumsModule.ProfileActions.SwitchAvatar],
					icon = iconName.PersonStandingArrowReverse,
					onActivated = function() --[[ line: 733 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var78 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuSwitchAvatar, { buttonSurface = p1 })
						var78()
					end
				} else nil,
				[enumsModule.ProfileActions.EditBackground] = getEditBackgroundAction(),
				[enumsModule.ProfileActions.EditProfile] = {
					component = foundationModule.Button,
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var69[enumsModule.ProfileActions.EditProfile],
					onActivated = function() --[[ line: 747 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), enumsModule (copy), fFlagAXEnableProfileTab (copy), var62 (copy), editUsername (copy), var60 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy), fFlagMoveInExperienceModeToEditProfile (copy)
						local var96
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonOpenEditProfilePage, { buttonSurface = p1 })
						local navigate = var61.navigate
						local editProfilePage = enumsModule.Screens.EditProfilePage
						local t = {}
						
						if fFlagAXEnableProfileTab then
							var96 = var62.forceFullView == true
							var96 = nil
						else
							var96 = nil
						end
						t.fullBleed = var96
						
						function t.navigateToEditUsername(p9) --[[ line: 757 ]]
							-- upvalues: editUsername (copy), var60 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
							editUsername({
								showToast = p9,
								onUsernameChanged = function() --[[ line: 760 ]]
									-- upvalues: var60 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
									var60(refreshProfilePlatformUserInfoModule(profileId))
								end
							})
						end
						
						function t.onIdentityChange() --[[ line: 765 ]]
							-- upvalues: var60 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
							var60(refreshProfilePlatformUserInfoModule(profileId))
						end
						
						t.onToggleInExperienceMode = if fFlagMoveInExperienceModeToEditProfile then function() --[[ line: 769 ]]
							-- upvalues: var60 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy), var64 (copy), eventNamesModule (copy)
							var60(refreshProfilePlatformUserInfoModule(profileId))
							var64.fireAnalyticsEvent(eventNamesModule.ToggleInExperienceModeButton, {})
						end else nil
						navigate(editProfilePage, t)
					end
				},
				[enumsModule.ProfileActions.IgnoreFriendRequest] = {
					text = var69[enumsModule.ProfileActions.IgnoreFriendRequest],
					onActivated = function() --[[ line: 779 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var45 (copy), profileId (copy), var60 (copy), networkingFriendsModule (copy), var59 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonIgnoreFriendRequest, { buttonSurface = p1 })
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var45.DeclineFriendRequest(profileId) else var60(networkingFriendsModule.DeclineFriendRequestFromUserId.API({ targetUserId = profileId, currentUserId = var59 }))):andThen(function() --[[ line: 789 ]]
							-- upvalues: var60 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
							var60(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var69.friendRequestIgnoredToast,
								toastIcon = images["icons/actions/reject"]
							}))
							
							return var60(refreshProfilePlatformActionInfoModule(profileId, var75))
						end)
					end
				},
				[enumsModule.ProfileActions.JoinExperience] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					isLoading = var76.isLoading,
					isDisabled = not var76.isInExperience,
					text = var69[enumsModule.ProfileActions.JoinExperience],
					onActivated = function() --[[ line: 806 ]]
						-- upvalues: var76 (copy)
						var76.joinExperience()
					end
				},
				[enumsModule.ProfileActions.PendingFriendRequest] = {
					isDisabled = true,
					buttonType = buttonType.Secondary,
					variant = buttonVariant.Subtle,
					text = var69[enumsModule.ProfileActions.PendingFriendRequest],
					onActivated = function() --[[ line: 815 ]] end
				},
				[enumsModule.ProfileActions.QrCode] = {
					text = var69[enumsModule.ProfileActions.QrCode],
					icon = iconName.SquaresGridQr,
					onActivated = function() --[[ line: 821 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), qRCodePage (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfileQRCode, { buttonSurface = p1 })
						qRCodePage()
					end
				},
				[enumsModule.ProfileActions.ShareProfile] = {
					component = foundationModule.Button,
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var69[enumsModule.ProfileActions.ShareProfile],
					onActivated = function() --[[ line: 833 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var82 (copy), default (copy), contexts (copy), var66 (copy), profileId (copy), var60 (copy), setCurrentToastMessage (copy), textKeysModule (copy), var81 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfile, { buttonSurface = p1 })
						
						if var82 then
							default:setClipboardText({
								context = contexts.ProfileCard,
								text = string.format("%s/%s", var66, profileId)
							})
							var60(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
							
							return
						end
						var81.onActivated()
					end
				},
				[enumsModule.ProfileActions.Report] = {
					text = var69[enumsModule.ProfileActions.Report],
					onActivated = function() --[[ line: 852 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), profileType (copy), enumsModule (copy), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), abuseVectorModule (copy), var60 (copy), openDynamicAbuseReportModule (copy), profileId (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy), appPage (copy), url (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonReport, { buttonSurface = p1 })
						local var97 = nil
						
						if profileType == enumsModule.ProfileTypes.User then
							var97 = "userprofile"
						elseif profileType == enumsModule.ProfileTypes.Community then
							var97 = "group"
						end
						if fFlagEnableAbuseReportRevampFlow and fFlagEnableAbuseReportRevampProfileAndGroupModule then
							var60(openDynamicAbuseReportModule({
								abuseVector = if profileType == enumsModule.ProfileTypes.Community then abuseVectorModule.Group else abuseVectorModule.UserProfile,
								targetId = profileId,
								onClose = function() --[[ line: 871 ]]
									-- upvalues: var60 (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
									var60(closeCentralOverlay())
									var60(refreshProfilePlatformActionInfoModule(profileId, var75))
								end
							}))
							
							return
						end
						local t = {
							name = appPage.GenericWebPage,
							detail = `{url.BASE_URL}abusereport/{var97}?id={profileId}`,
							extraProps = { titleKey = textKeysModule.Report }
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var60(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.Unblock] = {
					text = var69[enumsModule.ProfileActions.Unblock],
					onActivated = function() --[[ line: 894 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var60 (copy), myUserBlockingNetworkingModule (copy), profileId (copy), var59 (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy), USER_BLOCKING_ERRORS (copy), setCurrentToastMessage (copy), var69 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonUnblock, { buttonSurface = p1 })
						
						return var60(myUserBlockingNetworkingModule.UnblockUserById.API({ userId = profileId, currentUserId = var59 })):andThen(function() --[[ line: 902 ]]
							-- upvalues: var60 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
							return var60(refreshProfilePlatformActionInfoModule(profileId, var75))
						end):catch(function(p10) --[[ line: 905 ]]
							-- upvalues: USER_BLOCKING_ERRORS (copy), var60 (copy), setCurrentToastMessage (copy), var69 (copy)
							if p10 ~= nil and tonumber(p10.Body) == USER_BLOCKING_ERRORS.PARENT_BLOCKED_TARGET_USER_ERROR then
								var60(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var69.unblockTargetParentManagedToast
								}))
								
								return
							elseif p10 ~= nil and tonumber(p10.Body) == USER_BLOCKING_ERRORS.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
								var60(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var69.unblockTargetNotBlockedToast
								}))
								
								return
							elseif p10 == nil or tonumber(p10.Body) ~= USER_BLOCKING_ERRORS.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
								var60(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var69.somethingIsWrongToast
								}))
								
								return
							end
							var60(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var69.blockedOnPlatformToast
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.Unfriend] = {
					text = var69[enumsModule.ProfileActions.Unfriend],
					onActivated = function() --[[ line: 947 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var45 (copy), profileId (copy), var60 (copy), networkingFriendsModule (copy), var59 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfriend, { buttonSurface = p1 })
						
						return (if fFlagMigrateFriendshipStatusesRemainingActions then var45.Unfriend(profileId) else var60(networkingFriendsModule.UnfriendTargetUserId.API({ targetUserId = profileId, currentUserId = var59 }))):andThen(function() --[[ line: 957 ]]
							-- upvalues: var60 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
							var60(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var69.friendRemovedToast,
								toastIcon = images["icons/actions/friends/friendRemove"]
							}))
							
							return var60(refreshProfilePlatformActionInfoModule(profileId, var75))
						end)
					end
				},
				[enumsModule.ProfileActions.CopyLink] = {
					text = var69[enumsModule.ProfileActions.CopyLink],
					onActivated = function() --[[ line: 969 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), default (copy), contexts (copy), base_url (copy), profileId (copy), var60 (copy), setCurrentToastMessage (copy), textKeysModule (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCopyLink, { buttonSurface = p1 })
						default:setClipboardText({
							context = contexts.ProfileCard,
							text = string.format(base_url, profileId)
						})
						var60(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
					end
				},
				[enumsModule.ProfileActions.JoinCommunity] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					text = var69[enumsModule.ProfileActions.JoinCommunity],
					onActivated = function() --[[ line: 987 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), var60 (copy), groupsNetworkingModule (copy), profileId (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonJoinCommunity, { buttonSurface = p1, btnContext = var62.sourceInfo.source })
						
						return var60(groupsNetworkingModule.JoinGroup.API({ groupId = profileId })):andThen(function() --[[ line: 995 ]]
							-- upvalues: var60 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var60(getProfilePlatformModule.API({
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
					text = var69[enumsModule.ProfileActions.CancelJoinCommunityRequest],
					onActivated = function() --[[ line: 1009 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), var60 (copy), groupsNetworkingModule (copy), profileId (copy), var59 (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonCancelJoinCommunityRequest, { buttonSurface = p1, btnContext = var62.sourceInfo.source })
						
						return var60(groupsNetworkingModule.CancelJoinGroupRequest.API({ groupId = profileId, userId = var59 })):andThen(function() --[[ line: 1018 ]]
							-- upvalues: var60 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var60(refreshProfilePlatformModule({
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
					text = var69[enumsModule.ProfileActions.ViewCommunity],
					onActivated = function() --[[ line: 1033 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), appPage (copy), urlBuilder (copy), profileId (copy), textKeysModule (copy), var60 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonViewCommunity, { buttonSurface = p1, btnContext = var62.sourceInfo.source })
						local t = {
							name = appPage.GenericWebPage,
							detail = urlBuilder.user.group({ groupId = profileId }),
							extraProps = {
								titleKey = textKeysModule.Community,
								onClose = function() --[[ line: 1044 ]]
									-- upvalues: var60 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
									var60(getProfilePlatformModule.API({
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
						var60(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.ViewFullProfile] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then {
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.SubEmphasis,
					text = var69[enumsModule.ProfileActions.ViewFullProfile],
					onActivated = function() --[[ line: 1066 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), appPage (copy), urlBuilder (copy), urlBase (copy), profileId (copy), textKeysModule (copy), var60 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, { buttonSurface = p1, btnContext = var62.sourceInfo.source })
						local t = {
							name = appPage.GenericWebPage,
							detail = urlBuilder.new({ base = urlBase.WWW, path = `profiles/{profileId}` })(),
							extraProps = {
								titleKey = textKeysModule.Profile,
								onClose = function() --[[ line: 1080 ]]
									-- upvalues: var60 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
									var60(getProfilePlatformModule.API({
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
						var60(navigateDown(t))
					end
				} else nil,
				[enumsModule.ProfileActions.LeaveCommunity] = {
					text = var69[enumsModule.ProfileActions.LeaveCommunity],
					onActivated = function() --[[ line: 1100 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), var60 (copy), groupsNetworkingModule (copy), profileId (copy), var59 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonLeaveCommunity, { buttonSurface = p1, btnContext = var62.sourceInfo.source })
						
						return var60(groupsNetworkingModule.LeaveGroup.API({ groupId = profileId, userId = var59 })):andThen(function() --[[ line: 1109 ]]
							-- upvalues: var60 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var60(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.MakePrimaryCommunity] = {
					text = var69[enumsModule.ProfileActions.MakePrimaryCommunity],
					onActivated = function() --[[ line: 1121 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), var60 (copy), groupsNetworkingModule (copy), profileId (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonMakePrimaryCommunity, { buttonSurface = p1, btnContext = var62.sourceInfo.source })
						
						return var60(groupsNetworkingModule.MakePrimaryGroup.API({ groupId = profileId })):andThen(function() --[[ line: 1129 ]]
							-- upvalues: var60 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var60(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = { enumsModule.Components.Actions }
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.RemovePrimaryCommunity] = {
					text = var69[enumsModule.ProfileActions.RemovePrimaryCommunity],
					onActivated = function() --[[ line: 1142 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), var60 (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity, { buttonSurface = p1, btnContext = var62.sourceInfo.source })
						
						return var60(groupsNetworkingModule.RemovePrimaryGroup.API()):andThen(function() --[[ line: 1148 ]]
							-- upvalues: var60 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var60(refreshProfilePlatformModule({
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
					text = var69[enumsModule.ProfileActions.Follow],
					onActivated = function() --[[ line: 1165 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var60 (copy), groupsNetworkingModule (copy), profileId (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonFollow, { buttonSurface = p1 })
						
						return var60(groupsNetworkingModule.JoinGroup.API({ groupId = profileId })):andThen(function() --[[ line: 1171 ]]
							-- upvalues: var60 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var60(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[enumsModule.ProfileActions.Unfollow] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule and profileType == enumsModule.ProfileTypes.Community then {
					text = var69[enumsModule.ProfileActions.Unfollow],
					onActivated = function() --[[ line: 1186 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var60 (copy), groupsNetworkingModule (copy), profileId (copy), var59 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = p1 })
						
						return var60(groupsNetworkingModule.LeaveGroup.API({ groupId = profileId, userId = var59 })):andThen(function() --[[ line: 1194 ]]
							-- upvalues: var60 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var60(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[enumsModule.ProfileActions.RemoveTrustedConnection] = {
					text = var69[enumsModule.ProfileActions.RemoveTrustedConnection],
					onActivated = function() --[[ line: 1207 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var57 (copy), profileId (copy), var60 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemoveTrustedConnection, { buttonSurface = p1 })
						
						return var57.removeTrustedConnectionRequest(profileId):andThen(function() --[[ line: 1211 ]]
							-- upvalues: var60 (copy), setCurrentToastMessage (copy), var69 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
							var60(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var69.trustedConnectionRemovedToast,
								toastIcon = images["icons/actions/friends/friendRemove"]
							}))
							
							return var60(refreshProfilePlatformActionInfoModule(profileId, var75))
						end)
					end
				},
				[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then {
					text = var69[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1224 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), appPage (copy), profileId (copy), sources (copy), var60 (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, { buttonSurface = p1 })
						var61.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								onRequestSent = function() --[[ line: 1232 ]]
									-- upvalues: var60 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
									return var60(refreshProfilePlatformActionInfoModule(profileId, var75))
								end
							}
						})
					end
				} else nil,
				[enumsModule.ProfileActions.AddTrustedConnectionViaLink] = {
					text = var69[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1244 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), sources (copy), var61 (copy), appPage (copy), profileId (copy), var60 (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, {
							buttonSurface = p1,
							modalVariantOverride = sources.ShareLinkSender
						})
						var61.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								modalVariantOverride = sources.ShareLinkSender,
								onRequestSent = function() --[[ line: 1254 ]]
									-- upvalues: var60 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
									return var60(refreshProfilePlatformActionInfoModule(profileId, var75))
								end
							}
						})
					end
				},
				[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then {
					text = var69[enumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function() --[[ line: 1266 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), appPage (copy), profileId (copy), var60 (copy), refreshProfilePlatformActionInfoModule (copy), var75 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection, { buttonSurface = p1 })
						var61.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								onRequestAccepted = function() --[[ line: 1273 ]]
									-- upvalues: var60 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var75 (copy)
									return var60(refreshProfilePlatformActionInfoModule(profileId, var75))
								end
							}
						})
					end
				} else nil,
				[enumsModule.ProfileActions.PendingTrustedConnection] = if fFlagProfilePlatformAddTC then {
					isDisabled = true,
					text = var69[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1287 ]] end
				} else nil,
				[enumsModule.ProfileActions.PendingIncomingTrustedConnection] = if fFlagPendingIncomingTrustedConnectionModule then {
					isDisabled = true,
					text = var69[enumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function() --[[ line: 1294 ]] end
				} else nil,
				[enumsModule.ProfileActions.ViewAbout] = if fFlagProfilePlatformNewProfileHeader then {
					text = var69[enumsModule.ProfileActions.ViewAbout],
					onActivated = function() --[[ line: 1300 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), var62 (copy), appPage (copy), aboutSections (copy), fFlagProfileAboutDetailsUseSheet (copy), var73 (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var60 (copy), navigateDown (copy)
						var64.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, { buttonSurface = p1, btnContext = var62.sourceInfo.source })
						local t = {
							name = appPage.AboutDetailsSheet,
							extraProps = {
								sections = aboutSections,
								profileName = if fFlagProfileAboutDetailsUseSheet then var73 else nil
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var60(navigateDown(t))
					end
				} else nil,
				[enumsModule.ProfileActions.ViewPlatformProfile] = if fFlagEnablePlatformProfileContextualMenuOption then {
					text = var69[enumsModule.ProfileActions.ViewPlatformProfile],
					onActivated = function() --[[ line: 1326 ]]
						-- upvalues: var64 (copy), eventNamesModule (copy), p1 (copy), getPlatformFriendsServiceModule (copy), var71 (copy)
						var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonViewPlatformProfile, { buttonSurface = p1 })
						getPlatformFriendsServiceModule:ShowProfile(var71)
					end
				} else nil,
				[enumsModule.ProfileActions.CurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
					text = var69[enumsModule.ProfileActions.CurrencyTransfer],
					onActivated = function() --[[ line: 1337 ]]
						-- upvalues: p1 (copy), enumsModule (copy), var64 (copy), eventNamesModule (copy), var63 (copy), profileId (copy), transferDirection (copy), transferOrigination (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var64.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCurrencyTransfer, { buttonSurface = p1 })
						else
							var64.fireAnalyticsEvent(eventNamesModule.CTAButtonCurrencyTransfer, { buttonSurface = p1 })
						end
						if var63 then
							var63({
								recipientUserId = profileId,
								direction = transferDirection.Send,
								transferOrigination = transferOrigination.Profile
							})
						end
					end
				} else nil
			}
		end
	end, {
		var60, profileId, var62,
		if fFlagProfilePlatformEnableCurrencyTransfer then var63 else nil, qRCodePage,
		var69, var59, var61, editUsername, var76.joinExperience, var76.isLoading,
		var64, var80, p1,
		if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		if fFlagProfileAboutDetailsUseSheet then var73 else nil, profileType,
		editAvatar,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then var77 else nil,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then var78 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var66 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var76.isInExperience else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var88 else nil,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var75 else nil
	})
end
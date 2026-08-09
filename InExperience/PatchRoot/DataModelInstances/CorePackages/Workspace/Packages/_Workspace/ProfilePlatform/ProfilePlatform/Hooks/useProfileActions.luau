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
local fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage)
local fFlagEnablePlatformProfileContextualMenuOption = require(parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local fFlagProfilePlatformNewProfileHeader = sharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local fFlagProfileAboutDetailsUseSheet = sharedFlagsModule.FFlagProfileAboutDetailsUseSheet
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local fFlagPendingIncomingTrustedConnectionModule = require(profilePlatform.Flags.FFlagPendingIncomingTrustedConnection)
local fFlagProfilePlatformPassPresenceToJoinUserInExperience = sharedFlagsModule.FFlagProfilePlatformPassPresenceToJoinUserInExperience
local fFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(profilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local fFlagEnableAbuseReportRevampProfileAndGroupModule = require(profilePlatform.Flags.FFlagEnableAbuseReportRevampProfileAndGroup)
local fFlagProfilePlatformEnableCurrencyTransfer = sharedFlagsModule.FFlagProfilePlatformEnableCurrencyTransfer
local fFlagProfilePlatformEnableEditAppearanceMenuModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local fFlagProfilePlatformEditBackgroundMenuItemModule = require(profilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local fFlagProfilePlatformEnableEditLookModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local fFlagProfilePlatformCTAsRefactorModule = require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
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
local var54 = tostring(DateTime.now().UnixTimestampMillis)

local function _(p0) --[[ line: 130 | named "areFollowActionsSupportedForProfileType" ]]
	-- upvalues: enumsModule (ref)
	return p0 == enumsModule.ProfileTypes.Community
end

local var55 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()

return function(p1) --[[ line: 149 ]]
	-- upvalues: useLocalUserId (ref), useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useShortUrl (ref), useGetOrGenerateLinkUrl (ref), useEffectOnce (ref), reactModule (ref), var54 (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), useLocalization (ref), enumsModule (ref), fFlagProfilePlatformAddTC (ref), fFlagProfilePlatformEnableUnlockChatModule (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), fFlagProfilePlatformEditBackgroundMenuItemModule (ref), fFlagProfilePlatformEnableEditLookModule (ref), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagEnablePlatformProfileContextualMenuOption (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformPassPresenceToJoinUserInExperience (ref), useSelector (ref), presenceModule (ref), useAboutSectionsModule (ref), fFlagProfileAboutDetailsUseSheet (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), useJoinUserInExperience (ref), fFlagProfilePlatformEditBackgroundMenuItemModule_1 (ref), iconName (ref), eventNamesModule (ref), friendRequestNicknamesIXP (ref), useProfileShareLink (ref), contexts (ref), profileSharePolicyEnum (ref), USER_FRIENDING_ERRORS (ref), STATUS_CODES (ref), httpService (ref), setCurrentToastMessage (ref), fFlagProfilePlatformCTAsRefactorModule (ref), profileActionsModule (ref), buttonVariant (ref), networkingFriendsModule (ref), images (ref), refreshProfilePlatformActionInfoModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var16 (ref), navigateDown (ref), buttonType (ref), contextualInfoTypes (ref), refreshProfilePlatformModule (ref), enteredChatFromEntryPointModule (ref), chatEntryPointNames (ref), guiService (ref), notificationTypeList (ref), socialStopwatchModule (ref), setAliasModule (ref), foundationModule (ref), fFlagAXEnableProfileTab (ref), refreshProfilePlatformUserInfoModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), default (ref), fFlagEnableAbuseReportRevampFlow (ref), fFlagEnableAbuseReportRevampProfileAndGroupModule (ref), abuseVectorModule (ref), openDynamicAbuseReportModule (ref), closeCentralOverlay (ref), url (ref), myUserBlockingNetworkingModule (ref), USER_BLOCKING_ERRORS (ref), fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (ref), base_url (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), urlBuilder (ref), urlBase (ref), var55 (ref), sources (ref), fFlagPendingIncomingTrustedConnectionModule (ref), getPlatformFriendsServiceModule (ref), transferDirection (ref), transferOrigination (ref)
	local var56 = useLocalUserId()
	local var57 = useDispatch()
	local var58 = useNavigation()
	local var59 = useProfileWrapperContextModule()
	local var60 = if var59.navigateTo then var59.navigateTo.navigateToTransfer else nil
	local var61 = useProfileAnalyticsContextModule()
	local var62 = useShortUrl()
	useEffectOnce(useGetOrGenerateLinkUrl(), not (var62 ~= nil))
	local var63 = reactModule.useMemo(function() --[[ line: 163 ]]
		-- upvalues: var62 (ref), var54 (copy)
		return string.format("%s&source=ProfileShare&stamp=%s", var62 or "", var54)
	end, { var62 })
	local var64 = if fFlagConnectionsToFriendsRename then textKeysModule.AcceptFriend else textKeysModule.AcceptConnection
	local var65 = if fFlagConnectionsToFriendsRename then textKeysModule.AddFriend else textKeysModule.AddConnection
	local var66 = useLocalization({
		[enumsModule.ProfileActions.AcceptFriendRequest] = var64,
		[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = var64,
		[enumsModule.ProfileActions.AddFriend] = var65,
		[enumsModule.ProfileActions.AddFriendFromContacts] = var65,
		[enumsModule.ProfileActions.AddFriendFromContactsSent] = textKeysModule.PendingRequest,
		[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AddTrustedConnection else nil,
		[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AcceptTrustedConnection else nil,
		[enumsModule.ProfileActions.Block] = textKeysModule.Block,
		[enumsModule.ProfileActions.CannotAddFriend] = var65,
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
	local var67 = reactModule.useCallback(function() --[[ line: 277 ]]
		-- upvalues: var59 (ref)
		var59.navigateTo.previousView(true)
	end, { var59.navigateTo.previousView })
	local profileId = var59.profileId
	local var68 = if fFlagEnablePlatformProfileContextualMenuOption then var59.profilePlatformId else nil
	local profileType = var59.profileType
	local var69 = if fFlagProfilePlatformPassPresenceToJoinUserInExperience then useSelector(function(p2) --[[ line: 287 ]]
		-- upvalues: presenceModule (copy), profileId (ref)
		return presenceModule.Selectors.getUserPresenceByUserId(p2, profileId) or {
			lastLocation = "",
			userPresenceType = presenceModule.Enums.PresenceType.Offline
		}
	end) else nil
	local aboutSections = nil
	local var70 = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var71 = useAboutSectionsModule()
		aboutSections = var71.aboutSections
		var70 = if fFlagProfileAboutDetailsUseSheet then var71.profileName else nil
	end
	local var72 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var73 = useJoinUserInExperience(profileId, {
		isHomePageCarousel = var59.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
		homepageCarouselAbsolutePosition = var59.sourceInfo.homepageCarouselAbsolutePosition,
		openGameDetailsPeekViewClosed = var67,
		presence = if fFlagProfilePlatformPassPresenceToJoinUserInExperience then var69 else nil
	})
	local qRCodePage = var59.navigateTo.qRCodePage
	local editUsername = var59.navigateTo.editUsername
	local var74 = if fFlagProfilePlatformEnableEditAppearanceMenuModule then var59.navigateTo.editEmotes else nil
	local var75 = if fFlagProfilePlatformEnableEditAppearanceMenuModule then var59.navigateTo.switchAvatar else nil
	
	local function getEditBackgroundAction() --[[ line: 325 ]]
		-- upvalues: fFlagProfilePlatformEditBackgroundMenuItemModule_1 (copy), var59 (ref), var66 (ref), enumsModule (copy), iconName (copy), var61 (ref), eventNamesModule (copy), p1 (ref)
		if fFlagProfilePlatformEditBackgroundMenuItemModule_1 then
			local editBackground = var59.navigateTo.editBackground
			
			return {
				text = var66[enumsModule.ProfileActions.EditBackground],
				icon = iconName.Image,
				onActivated = function() --[[ line: 331 ]]
					-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), editBackground (ref)
					var61.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditBackground, { buttonSurface = p1 })
					editBackground()
				end
			}
		end
		return nil
	end
	
	local editAvatar = var59.navigateTo.editAvatar
	local var77 = friendRequestNicknamesIXP.useFriendRequestNicknames()
	local var78 = useProfileShareLink({ context = contexts.ProfileCard })
	local var79 = var78.policy == profileSharePolicyEnum.Disabled
	local t = {
		[USER_FRIENDING_ERRORS.INVALID_TARGET_USER_ERROR] = var66.invalidTargetUserError,
		[USER_FRIENDING_ERRORS.ALREADY_FRIEND_ERROR] = var66.alreadyFriendError,
		[USER_FRIENDING_ERRORS.MAX_FRIENDS_ERROR] = var66.maxFriendsError,
		[USER_FRIENDING_ERRORS.INVALID_NICKNAME_ERROR] = var66.invalidNicknameError
	}
	local t_1 = {
		[USER_FRIENDING_ERRORS.UNAUTHORIZED_ERROR] = var66.unauthorizedError
	}
	local t_2 = {
		[USER_FRIENDING_ERRORS.USER_BANNED_ERROR] = var66.userBannedError,
		[USER_FRIENDING_ERRORS.USER_BLOCKED_ERROR] = var66.userBlockedError,
		[USER_FRIENDING_ERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = var66.userNotPassedCaptchaError
	}
	local t_3 = {
		[USER_FRIENDING_ERRORS.TOO_MANY_REQUESTS_ERROR] = var66.tooManyRequestsError
	}
	
	local function _(p3, p4, p5) --[[ line: 369 | named "getErrorToastMessage" ]]
		-- upvalues: enumsModule (copy), STATUS_CODES (copy), t (ref), t_1 (ref), t_2 (ref), t_3 (ref)
		if p3 == enumsModule.ProfileActions.AddFriend or p3 == enumsModule.ProfileActions.AddFriendFromContacts then
			return if p4 == STATUS_CODES.BAD_REQUEST then t[p5] elseif p4 == STATUS_CODES.UNAUTHORIZED then t_1[p5] elseif p4 == STATUS_CODES.FORBIDDEN then t_2[p5] elseif p4 == STATUS_CODES.TOO_MANY_REQUESTS then t_3[p5] else nil
		end
	end
	
	local function setErrorToast(value, p6) --[[ line: 384 ]]
		-- upvalues: httpService (copy), enumsModule (copy), STATUS_CODES (copy), t (ref), t_1 (ref), t_2 (ref), t_3 (ref), var66 (ref), var57 (ref), setCurrentToastMessage (copy)
		if p6 == nil then
			var57(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var66.defaultFriendingError
			}))
			
			return
		end
		local var88
		local statusCode = p6.StatusCode
		local var86 = if p6.Body then httpService:JSONDecode(p6.Body) else nil
		local var87 = if var86 and var86.errors and (var86.errors[1] and var86.errors[1].code) then var86.errors[1].code else nil
		
		if value ~= enumsModule.ProfileActions.AddFriend and value ~= enumsModule.ProfileActions.AddFriendFromContacts then
			var57(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var88 or var66.defaultFriendingError
			}))
			
			return
		var88 = if statusCode == STATUS_CODES.BAD_REQUEST then t[var87] elseif statusCode == STATUS_CODES.UNAUTHORIZED then t_1[var87] elseif statusCode == STATUS_CODES.FORBIDDEN then t_2[var87] elseif statusCode == STATUS_CODES.TOO_MANY_REQUESTS then t_3[var87] else nil
	end
	
	local var85 = if fFlagProfilePlatformCTAsRefactorModule then {
		localized = var66,
		analytics = var61,
		buttonSurface = p1,
		profileWrapperContext = var59,
		navigateTo = var59.navigateTo,
		dispatch = var57,
		profileId = profileId,
		localUserId = var56,
		navigation = var58,
		profileType = profileType,
		experienceUtilities = var73,
		friendRequestNicknamesEnabled = var77,
		profileShareLink = var78,
		PROFILE_SHARE_LINK_URL = var63,
		aboutSections = if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		aboutProfileName = if fFlagProfileAboutDetailsUseSheet then var70 else nil,
		actionsComponentRequest = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var72 else nil
	} else nil
	
	return reactModule.useMemo(function() --[[ line: 431 ]]
		-- upvalues: fFlagProfilePlatformCTAsRefactorModule (copy), profileActionsModule (copy), var85 (ref), enumsModule (copy), var66 (ref), buttonVariant (copy), var61 (ref), eventNamesModule (copy), p1 (ref), var59 (ref), var57 (ref), networkingFriendsModule (copy), profileId (ref), var56 (ref), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var72 (ref), friendRequestNicknamesIXP (copy), var77 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy), setErrorToast (ref), buttonType (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), profileType (ref), var58 (ref), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy), socialStopwatchModule (copy), setAliasModule (copy), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), iconName (copy), editAvatar (ref), fFlagProfilePlatformEnableEditLookModule (copy), var74 (ref), var75 (ref), getEditBackgroundAction (ref), foundationModule (copy), fFlagAXEnableProfileTab (copy), editUsername (ref), refreshProfilePlatformUserInfoModule (copy), fFlagMoveInExperienceModeToEditProfile (copy), var73 (ref), qRCodePage (ref), var79 (ref), default (copy), contexts (copy), var63 (ref), textKeysModule (copy), var78 (ref), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), abuseVectorModule (copy), openDynamicAbuseReportModule (copy), closeCentralOverlay (copy), url (copy), myUserBlockingNetworkingModule (copy), USER_BLOCKING_ERRORS (copy), fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (copy), base_url (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy), urlBuilder (copy), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (copy), urlBase (copy), var55 (copy), fFlagProfilePlatformAddTC (copy), sources (copy), fFlagPendingIncomingTrustedConnectionModule (copy), fFlagProfilePlatformNewProfileHeader (copy), aboutSections (write), fFlagProfileAboutDetailsUseSheet (copy), var70 (write), fFlagEnablePlatformProfileContextualMenuOption (copy), getPlatformFriendsServiceModule (copy), var68 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var60 (ref), transferDirection (copy), transferOrigination (copy)
		if fFlagProfilePlatformCTAsRefactorModule then
			local t = {}
			
			for i, v in profileActionsModule do
				local var90 = v(var85)
				
				if var90 ~= nil then
					t[i] = var90
				end
			end
			return t
		else
			return {
				[enumsModule.ProfileActions.AcceptFriendRequest] = {
					text = var66[enumsModule.ProfileActions.AcceptFriendRequest],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 457 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), enumsModule (copy), var57 (copy), networkingFriendsModule (copy), profileId (copy), var56 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonAcceptFriendRequest, {
							buttonSurface = p1,
							absolutePosition = var59.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = var59.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = var59.sourceInfo.isRecommendation,
							source = var59.sourceInfo.source,
							contextualInfoType = var59.sourceInfo.contextualInfoType,
							recommendationContextType = var59.sourceInfo.recommendationContextType,
							recommendationRank = var59.sourceInfo.recommendationRank,
							recommendationSessionId = var59.sourceInfo.recommendationSessionId
						})
						
						return var57(networkingFriendsModule.AcceptFriendRequestFromUserId.API({ targetUserId = profileId, currentUserId = var56 })):andThen(function() --[[ line: 473 ]]
							-- upvalues: var57 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
							var57(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var66.friendAcceptedToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var57(refreshProfilePlatformActionInfoModule(profileId, var72))
						end)
					end
				},
				[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = {
					text = var66[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest],
					onActivated = function() --[[ line: 485 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), var59 (copy), var57 (copy), networkingFriendsModule (copy), profileId (copy), var56 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriendFromContacts, { shareLinkId = var59.sourceInfo.shareLinkId })
						
						return var57(networkingFriendsModule.AcceptFriendRequestWithToken.API({
							targetUserId = profileId,
							currentUserId = var56,
							friendingToken = var59.offNetworkFriendRequestToken
						})):andThen(function() --[[ line: 493 ]]
							-- upvalues: var57 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
							var57(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var66.friendAcceptedToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var57(refreshProfilePlatformActionInfoModule(profileId, var72))
						end)
					end
				},
				[enumsModule.ProfileActions.AddFriend] = {
					text = var66[enumsModule.ProfileActions.AddFriend],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 506 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), enumsModule (copy), friendRequestNicknamesIXP (copy), var77 (copy), appPage (copy), profileId (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var57 (copy), navigateDown (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), networkingFriendsModule (copy), var56 (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy), setErrorToast (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriend, {
							buttonSurface = p1,
							absolutePosition = var59.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = var59.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = var59.sourceInfo.isRecommendation,
							source = var59.sourceInfo.source,
							contextualInfoType = var59.sourceInfo.contextualInfoType,
							recommendationContextType = var59.sourceInfo.recommendationContextType,
							recommendationRank = var59.sourceInfo.recommendationRank,
							recommendationSessionId = var59.sourceInfo.recommendationSessionId
						})
						
						if not friendRequestNicknamesIXP.FFlagFriendRequestNicknames or not var77 then
							var57(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var66.friendRequestSentToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var57(networkingFriendsModule.RequestFriendshipFromUserId.API({
								targetUserId = profileId,
								currentUserId = var56,
								friendshipOriginSourceType = var59.sourceInfo.friendshipOriginSourceType
							})):andThen(function() --[[ line: 546 ]]
								-- upvalues: var57 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
								return var57(refreshProfilePlatformActionInfoModule(profileId, var72))
							end):catch(function(p7) --[[ line: 551 ]]
								-- upvalues: setErrorToast (copy), enumsModule (copy)
								setErrorToast(enumsModule.ProfileActions.AddFriend, p7)
							end)
						end
						local t = {
							name = appPage.SetNicknameModal,
							extraProps = {
								friendRequestParams = {
									targetUserId = profileId,
									source = var59.sourceInfo.friendshipOriginSourceType
								}
							}
						}
						
						return if fFlagSignalsNavP3Dispatch then var16.down(var16.fromLegacyPage(t)) else var57(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.AddFriendFromContacts] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					text = var66[enumsModule.ProfileActions.AddFriendFromContacts],
					onActivated = function() --[[ line: 561 ]]
						-- upvalues: var57 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), networkingFriendsModule (copy), var56 (copy), profileId (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy), setErrorToast (copy)
						var57(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = var66.friendRequestSentToast,
							toastIcon = images["icons/actions/friends/friendAdd"]
						}))
						
						return var57(networkingFriendsModule.RequestFriendshipFromContactId.API({
							currentUserId = var56,
							contactId = profileId,
							contextType = contextualInfoTypes.Contacts
						})):andThen(function() --[[ line: 572 ]]
							-- upvalues: var57 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							return var57(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = {
									enumsModule.Components.ContactProfileHeader,
									enumsModule.Components.Actions,
									enumsModule.Components.ContactDescription
								}
							}))
						end):catch(function(p8) --[[ line: 583 ]]
							-- upvalues: setErrorToast (copy), enumsModule (copy)
							setErrorToast(enumsModule.ProfileActions.AddFriendFromContacts, p8)
						end)
					end
				},
				[enumsModule.ProfileActions.AddFriendFromContactsSent] = {
					isDisabled = true,
					buttonType = buttonType.Secondary,
					variant = buttonVariant.Subtle,
					text = var66[enumsModule.ProfileActions.AddFriendFromContactsSent],
					onActivated = function() --[[ line: 592 ]] end
				},
				[enumsModule.ProfileActions.Block] = {
					text = var66[enumsModule.ProfileActions.Block],
					onActivated = function() --[[ line: 597 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var58 (copy), appPage (copy), profileId (copy), var57 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonBlock, { buttonSurface = p1 })
						var58.push(appPage.BlockingModal, {
							navProps = {
								userId = profileId,
								onBlockSuccess = function() --[[ line: 604 ]]
									-- upvalues: var57 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
									var57(setCurrentToastMessage({
										isLocalized = true,
										toastMessage = var66.userBlockedToast,
										toastIcon = images["icons/actions/block"]
									}))
									var57(refreshProfilePlatformActionInfoModule(profileId, var72))
								end
							}
						})
					end
				},
				[enumsModule.ProfileActions.CannotAddFriend] = {
					isDisabled = true,
					text = var66[enumsModule.ProfileActions.CannotAddFriend],
					onActivated = function() --[[ line: 619 ]] end
				},
				[enumsModule.ProfileActions.Chat] = {
					text = var66[enumsModule.ProfileActions.Chat],
					variant = buttonVariant.Standard,
					onActivated = function() --[[ line: 625 ]]
						-- upvalues: p1 (copy), enumsModule (copy), var61 (copy), eventNamesModule (copy), var57 (copy), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), profileId (copy), notificationTypeList (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonChat, { buttonSurface = p1 })
						else
							var61.fireAnalyticsEvent(eventNamesModule.CTAButtonChat, { buttonSurface = p1 })
						end
						var57(enteredChatFromEntryPointModule(chatEntryPointNames.ProfilePeekView))
						guiService:BroadcastNotification(profileId, notificationTypeList.LAUNCH_CONVERSATION)
					end
				},
				[enumsModule.ProfileActions.EditAlias] = {
					text = var66[enumsModule.ProfileActions.EditAlias],
					onActivated = function() --[[ line: 642 ]]
						-- upvalues: socialStopwatchModule (copy), var61 (copy), eventNamesModule (copy), p1 (copy), var58 (copy), enumsModule (copy), profileId (copy), setAliasModule (copy)
						socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CustomizeNameOpened)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonSetAlias, { buttonSurface = p1 })
						var58.navigate(enumsModule.Screens.SetAliasModal, {
							profileUserId = profileId,
							origin = setAliasModule.Analytics.EntryPoints.ContextualMenu
						})
					end
				},
				[enumsModule.ProfileActions.EditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var66[enumsModule.ProfileActions.EditAppearance],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 657 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonEditAppearance, { buttonSurface = p1 })
					end
				} else nil,
				[enumsModule.ProfileActions.EditAvatar] = {
					text = var66[enumsModule.ProfileActions.EditAvatar],
					icon = if fFlagProfilePlatformEnableEditAppearanceMenuModule then iconName.Person else nil,
					onActivated = function() --[[ line: 667 ]]
						-- upvalues: var61 (copy), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), eventNamesModule (copy), p1 (copy), editAvatar (copy)
						var61.fireAnalyticsEvent(if fFlagProfilePlatformEnableEditAppearanceMenuModule then eventNamesModule.EditAppearanceMenuEditAvatar else eventNamesModule.CTAButtonEditAvatar, { buttonSurface = p1 })
						editAvatar()
					end
				},
				[enumsModule.ProfileActions.EditLook] = if fFlagProfilePlatformEnableEditLookModule then {
					text = var66[enumsModule.ProfileActions.EditLook],
					icon = iconName.Person,
					onActivated = function() --[[ line: 683 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), editAvatar (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonEditLook, { buttonSurface = p1 })
						editAvatar()
					end
				} else nil,
				[enumsModule.ProfileActions.EditEmotes] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var66[enumsModule.ProfileActions.EditEmotes],
					icon = iconName.SquareFaceWavingHand,
					onActivated = function() --[[ line: 695 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var74 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditEmote, { buttonSurface = p1 })
						var74()
					end
				} else nil,
				[enumsModule.ProfileActions.SwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var66[enumsModule.ProfileActions.SwitchAvatar],
					icon = iconName.PersonStandingArrowReverse,
					onActivated = function() --[[ line: 707 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var75 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuSwitchAvatar, { buttonSurface = p1 })
						var75()
					end
				} else nil,
				[enumsModule.ProfileActions.EditBackground] = getEditBackgroundAction(),
				[enumsModule.ProfileActions.EditProfile] = {
					component = foundationModule.Button,
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var66[enumsModule.ProfileActions.EditProfile],
					onActivated = function() --[[ line: 721 ]]
						-- upvalues: socialStopwatchModule (copy), var61 (copy), eventNamesModule (copy), p1 (copy), var58 (copy), enumsModule (copy), fFlagAXEnableProfileTab (copy), var59 (copy), editUsername (copy), var57 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy), fFlagMoveInExperienceModeToEditProfile (copy)
						local var93
						socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.EditProfileOpened)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonOpenEditProfilePage, { buttonSurface = p1 })
						local navigate = var58.navigate
						local editProfilePage = enumsModule.Screens.EditProfilePage
						local t = { profileScreens = enumsModule.Screens }
						
						if fFlagAXEnableProfileTab then
							var93 = var59.forceFullView == true
							var93 = nil
						else
							var93 = nil
						end
						t.fullBleed = var93
						
						function t.navigateToEditUsername(p9) --[[ line: 733 ]]
							-- upvalues: editUsername (copy), var57 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
							editUsername({
								showToast = p9,
								onUsernameChanged = function() --[[ line: 736 ]]
									-- upvalues: var57 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
									var57(refreshProfilePlatformUserInfoModule(profileId))
								end
							})
						end
						
						function t.onIdentityChange() --[[ line: 741 ]]
							-- upvalues: var57 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
							var57(refreshProfilePlatformUserInfoModule(profileId))
						end
						
						t.onToggleInExperienceMode = if fFlagMoveInExperienceModeToEditProfile then function() --[[ line: 745 ]]
							-- upvalues: var57 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy), var61 (copy), eventNamesModule (copy)
							var57(refreshProfilePlatformUserInfoModule(profileId))
							var61.fireAnalyticsEvent(eventNamesModule.ToggleInExperienceModeButton, {})
						end else nil
						navigate(editProfilePage, t)
					end
				},
				[enumsModule.ProfileActions.IgnoreFriendRequest] = {
					text = var66[enumsModule.ProfileActions.IgnoreFriendRequest],
					onActivated = function() --[[ line: 755 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var57 (copy), networkingFriendsModule (copy), profileId (copy), var56 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonIgnoreFriendRequest, { buttonSurface = p1 })
						
						return var57(networkingFriendsModule.DeclineFriendRequestFromUserId.API({ targetUserId = profileId, currentUserId = var56 })):andThen(function() --[[ line: 762 ]]
							-- upvalues: var57 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
							var57(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var66.friendRequestIgnoredToast,
								toastIcon = images["icons/actions/reject"]
							}))
							
							return var57(refreshProfilePlatformActionInfoModule(profileId, var72))
						end)
					end
				},
				[enumsModule.ProfileActions.JoinExperience] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					isLoading = var73.isLoading,
					isDisabled = not var73.isInExperience,
					text = var66[enumsModule.ProfileActions.JoinExperience],
					onActivated = function() --[[ line: 779 ]]
						-- upvalues: var73 (copy)
						var73.joinExperience()
					end
				},
				[enumsModule.ProfileActions.PendingFriendRequest] = {
					isDisabled = true,
					buttonType = buttonType.Secondary,
					variant = buttonVariant.Subtle,
					text = var66[enumsModule.ProfileActions.PendingFriendRequest],
					onActivated = function() --[[ line: 788 ]] end
				},
				[enumsModule.ProfileActions.QrCode] = {
					text = var66[enumsModule.ProfileActions.QrCode],
					icon = iconName.SquaresGridQr,
					onActivated = function() --[[ line: 794 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), qRCodePage (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfileQRCode, { buttonSurface = p1 })
						qRCodePage()
					end
				},
				[enumsModule.ProfileActions.ShareProfile] = {
					component = foundationModule.Button,
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var66[enumsModule.ProfileActions.ShareProfile],
					onActivated = function() --[[ line: 806 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var79 (copy), default (copy), contexts (copy), var63 (copy), profileId (copy), var57 (copy), setCurrentToastMessage (copy), textKeysModule (copy), var78 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfile, { buttonSurface = p1 })
						
						if var79 then
							default:setClipboardText({
								context = contexts.ProfileCard,
								text = string.format("%s/%s", var63, profileId)
							})
							var57(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
							
							return
						end
						var78.onActivated()
					end
				},
				[enumsModule.ProfileActions.Report] = {
					text = var66[enumsModule.ProfileActions.Report],
					onActivated = function() --[[ line: 825 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), profileType (copy), enumsModule (copy), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), abuseVectorModule (copy), var57 (copy), openDynamicAbuseReportModule (copy), profileId (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy), appPage (copy), url (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonReport, { buttonSurface = p1 })
						local var94 = nil
						
						if profileType == enumsModule.ProfileTypes.User then
							var94 = "userprofile"
						elseif profileType == enumsModule.ProfileTypes.Community then
							var94 = "group"
						end
						if fFlagEnableAbuseReportRevampFlow and fFlagEnableAbuseReportRevampProfileAndGroupModule then
							var57(openDynamicAbuseReportModule({
								abuseVector = if profileType == enumsModule.ProfileTypes.Community then abuseVectorModule.Group else abuseVectorModule.UserProfile,
								targetId = profileId,
								onClose = function() --[[ line: 844 ]]
									-- upvalues: var57 (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
									var57(closeCentralOverlay())
									var57(refreshProfilePlatformActionInfoModule(profileId, var72))
								end
							}))
							
							return
						end
						local t = {
							name = appPage.GenericWebPage,
							detail = `{url.BASE_URL}abusereport/{var94}?id={profileId}`,
							extraProps = { titleKey = textKeysModule.Report }
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var57(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.Unblock] = {
					text = var66[enumsModule.ProfileActions.Unblock],
					onActivated = function() --[[ line: 867 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var57 (copy), myUserBlockingNetworkingModule (copy), profileId (copy), var56 (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy), USER_BLOCKING_ERRORS (copy), setCurrentToastMessage (copy), var66 (copy), fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonUnblock, { buttonSurface = p1 })
						
						return var57(myUserBlockingNetworkingModule.UnblockUserById.API({ userId = profileId, currentUserId = var56 })):andThen(function() --[[ line: 875 ]]
							-- upvalues: var57 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
							return var57(refreshProfilePlatformActionInfoModule(profileId, var72))
						end):catch(function(p10) --[[ line: 878 ]]
							-- upvalues: USER_BLOCKING_ERRORS (copy), var57 (copy), setCurrentToastMessage (copy), var66 (copy), fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (copy)
							if p10 ~= nil and tonumber(p10.Body) == USER_BLOCKING_ERRORS.PARENT_BLOCKED_TARGET_USER_ERROR then
								var57(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var66.unblockTargetParentManagedToast
								}))
								
								return
							elseif p10 ~= nil and tonumber(p10.Body) == USER_BLOCKING_ERRORS.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
								var57(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var66.unblockTargetNotBlockedToast
								}))
								
								return
							elseif fFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule and p10 ~= nil and tonumber(p10.Body) == USER_BLOCKING_ERRORS.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
								var57(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var66.blockedOnPlatformToast
								}))
								
								return
							end
							var57(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var66.somethingIsWrongToast
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.Unfriend] = {
					text = var66[enumsModule.ProfileActions.Unfriend],
					onActivated = function() --[[ line: 921 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var57 (copy), networkingFriendsModule (copy), profileId (copy), var56 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfriend, { buttonSurface = p1 })
						
						return var57(networkingFriendsModule.UnfriendTargetUserId.API({ targetUserId = profileId, currentUserId = var56 })):andThen(function() --[[ line: 928 ]]
							-- upvalues: var57 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
							var57(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var66.friendRemovedToast,
								toastIcon = images["icons/actions/friends/friendRemove"]
							}))
							
							return var57(refreshProfilePlatformActionInfoModule(profileId, var72))
						end)
					end
				},
				[enumsModule.ProfileActions.CopyLink] = {
					text = var66[enumsModule.ProfileActions.CopyLink],
					onActivated = function() --[[ line: 940 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), default (copy), contexts (copy), base_url (copy), profileId (copy), var57 (copy), setCurrentToastMessage (copy), textKeysModule (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCopyLink, { buttonSurface = p1 })
						default:setClipboardText({
							context = contexts.ProfileCard,
							text = string.format(base_url, profileId)
						})
						var57(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
					end
				},
				[enumsModule.ProfileActions.JoinCommunity] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					text = var66[enumsModule.ProfileActions.JoinCommunity],
					onActivated = function() --[[ line: 958 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), var57 (copy), groupsNetworkingModule (copy), profileId (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonJoinCommunity, { buttonSurface = p1, btnContext = var59.sourceInfo.source })
						
						return var57(groupsNetworkingModule.JoinGroup.API({ groupId = profileId })):andThen(function() --[[ line: 966 ]]
							-- upvalues: var57 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var57(getProfilePlatformModule.API({
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
					text = var66[enumsModule.ProfileActions.CancelJoinCommunityRequest],
					onActivated = function() --[[ line: 980 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), var57 (copy), groupsNetworkingModule (copy), profileId (copy), var56 (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonCancelJoinCommunityRequest, { buttonSurface = p1, btnContext = var59.sourceInfo.source })
						
						return var57(groupsNetworkingModule.CancelJoinGroupRequest.API({ groupId = profileId, userId = var56 })):andThen(function() --[[ line: 989 ]]
							-- upvalues: var57 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var57(refreshProfilePlatformModule({
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
					text = var66[enumsModule.ProfileActions.ViewCommunity],
					onActivated = function() --[[ line: 1004 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), appPage (copy), urlBuilder (copy), profileId (copy), textKeysModule (copy), var57 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonViewCommunity, { buttonSurface = p1, btnContext = var59.sourceInfo.source })
						local t = {
							name = appPage.GenericWebPage,
							detail = urlBuilder.user.group({ groupId = profileId }),
							extraProps = {
								titleKey = textKeysModule.Community,
								onClose = function() --[[ line: 1015 ]]
									-- upvalues: var57 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
									var57(getProfilePlatformModule.API({
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
						var57(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.ViewFullProfile] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then {
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.SubEmphasis,
					text = var66[enumsModule.ProfileActions.ViewFullProfile],
					onActivated = function() --[[ line: 1037 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), appPage (copy), urlBuilder (copy), urlBase (copy), profileId (copy), textKeysModule (copy), var57 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, { buttonSurface = p1, btnContext = var59.sourceInfo.source })
						local t = {
							name = appPage.GenericWebPage,
							detail = urlBuilder.new({ base = urlBase.WWW, path = `profiles/{profileId}` })(),
							extraProps = {
								titleKey = textKeysModule.Profile,
								onClose = function() --[[ line: 1051 ]]
									-- upvalues: var57 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
									var57(getProfilePlatformModule.API({
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
						var57(navigateDown(t))
					end
				} else nil,
				[enumsModule.ProfileActions.LeaveCommunity] = {
					text = var66[enumsModule.ProfileActions.LeaveCommunity],
					onActivated = function() --[[ line: 1071 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), var57 (copy), groupsNetworkingModule (copy), profileId (copy), var56 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonLeaveCommunity, { buttonSurface = p1, btnContext = var59.sourceInfo.source })
						
						return var57(groupsNetworkingModule.LeaveGroup.API({ groupId = profileId, userId = var56 })):andThen(function() --[[ line: 1080 ]]
							-- upvalues: var57 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var57(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.MakePrimaryCommunity] = {
					text = var66[enumsModule.ProfileActions.MakePrimaryCommunity],
					onActivated = function() --[[ line: 1092 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), var57 (copy), groupsNetworkingModule (copy), profileId (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonMakePrimaryCommunity, { buttonSurface = p1, btnContext = var59.sourceInfo.source })
						
						return var57(groupsNetworkingModule.MakePrimaryGroup.API({ groupId = profileId })):andThen(function() --[[ line: 1100 ]]
							-- upvalues: var57 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var57(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = { enumsModule.Components.Actions }
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.RemovePrimaryCommunity] = {
					text = var66[enumsModule.ProfileActions.RemovePrimaryCommunity],
					onActivated = function() --[[ line: 1113 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), var57 (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity, { buttonSurface = p1, btnContext = var59.sourceInfo.source })
						
						return var57(groupsNetworkingModule.RemovePrimaryGroup.API()):andThen(function() --[[ line: 1119 ]]
							-- upvalues: var57 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var57(refreshProfilePlatformModule({
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
					text = var66[enumsModule.ProfileActions.Follow],
					onActivated = function() --[[ line: 1136 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var57 (copy), groupsNetworkingModule (copy), profileId (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonFollow, { buttonSurface = p1 })
						
						return var57(groupsNetworkingModule.JoinGroup.API({ groupId = profileId })):andThen(function() --[[ line: 1142 ]]
							-- upvalues: var57 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var57(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[enumsModule.ProfileActions.Unfollow] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule and profileType == enumsModule.ProfileTypes.Community then {
					text = var66[enumsModule.ProfileActions.Unfollow],
					onActivated = function() --[[ line: 1157 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var57 (copy), groupsNetworkingModule (copy), profileId (copy), var56 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = p1 })
						
						return var57(groupsNetworkingModule.LeaveGroup.API({ groupId = profileId, userId = var56 })):andThen(function() --[[ line: 1165 ]]
							-- upvalues: var57 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var57(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[enumsModule.ProfileActions.RemoveTrustedConnection] = {
					text = var66[enumsModule.ProfileActions.RemoveTrustedConnection],
					onActivated = function() --[[ line: 1178 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var55 (copy), profileId (copy), var57 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemoveTrustedConnection, { buttonSurface = p1 })
						
						return var55.removeTrustedConnectionRequest(profileId):andThen(function() --[[ line: 1182 ]]
							-- upvalues: var57 (copy), setCurrentToastMessage (copy), var66 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
							var57(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var66.trustedConnectionRemovedToast,
								toastIcon = images["icons/actions/friends/friendRemove"]
							}))
							
							return var57(refreshProfilePlatformActionInfoModule(profileId, var72))
						end)
					end
				},
				[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then {
					text = var66[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1195 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var58 (copy), appPage (copy), profileId (copy), sources (copy), var57 (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, { buttonSurface = p1 })
						var58.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								onRequestSent = function() --[[ line: 1203 ]]
									-- upvalues: var57 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
									return var57(refreshProfilePlatformActionInfoModule(profileId, var72))
								end
							}
						})
					end
				} else nil,
				[enumsModule.ProfileActions.AddTrustedConnectionViaLink] = {
					text = var66[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1215 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), sources (copy), var58 (copy), appPage (copy), profileId (copy), var57 (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, {
							buttonSurface = p1,
							modalVariantOverride = sources.ShareLinkSender
						})
						var58.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								modalVariantOverride = sources.ShareLinkSender,
								onRequestSent = function() --[[ line: 1225 ]]
									-- upvalues: var57 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
									return var57(refreshProfilePlatformActionInfoModule(profileId, var72))
								end
							}
						})
					end
				},
				[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then {
					text = var66[enumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function() --[[ line: 1237 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var58 (copy), appPage (copy), profileId (copy), var57 (copy), refreshProfilePlatformActionInfoModule (copy), var72 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection, { buttonSurface = p1 })
						var58.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								onRequestAccepted = function() --[[ line: 1244 ]]
									-- upvalues: var57 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var72 (copy)
									return var57(refreshProfilePlatformActionInfoModule(profileId, var72))
								end
							}
						})
					end
				} else nil,
				[enumsModule.ProfileActions.PendingTrustedConnection] = if fFlagProfilePlatformAddTC then {
					isDisabled = true,
					text = var66[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1258 ]] end
				} else nil,
				[enumsModule.ProfileActions.PendingIncomingTrustedConnection] = if fFlagPendingIncomingTrustedConnectionModule then {
					isDisabled = true,
					text = var66[enumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function() --[[ line: 1265 ]] end
				} else nil,
				[enumsModule.ProfileActions.ViewAbout] = if fFlagProfilePlatformNewProfileHeader then {
					text = var66[enumsModule.ProfileActions.ViewAbout],
					onActivated = function() --[[ line: 1271 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), appPage (copy), aboutSections (copy), fFlagProfileAboutDetailsUseSheet (copy), var70 (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var57 (copy), navigateDown (copy)
						var61.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, { buttonSurface = p1, btnContext = var59.sourceInfo.source })
						local t = {
							name = appPage.AboutDetailsSheet,
							extraProps = {
								sections = aboutSections,
								profileName = if fFlagProfileAboutDetailsUseSheet then var70 else nil
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var57(navigateDown(t))
					end
				} else nil,
				[enumsModule.ProfileActions.ViewPlatformProfile] = if fFlagEnablePlatformProfileContextualMenuOption then {
					text = var66[enumsModule.ProfileActions.ViewPlatformProfile],
					onActivated = function() --[[ line: 1297 ]]
						-- upvalues: var61 (copy), eventNamesModule (copy), p1 (copy), getPlatformFriendsServiceModule (copy), var68 (copy)
						var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonViewPlatformProfile, { buttonSurface = p1 })
						getPlatformFriendsServiceModule:ShowProfile(var68)
					end
				} else nil,
				[enumsModule.ProfileActions.CurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
					text = var66[enumsModule.ProfileActions.CurrencyTransfer],
					onActivated = function() --[[ line: 1308 ]]
						-- upvalues: p1 (copy), enumsModule (copy), var61 (copy), eventNamesModule (copy), var60 (copy), profileId (copy), transferDirection (copy), transferOrigination (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var61.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCurrencyTransfer, { buttonSurface = p1 })
						else
							var61.fireAnalyticsEvent(eventNamesModule.CTAButtonCurrencyTransfer, { buttonSurface = p1 })
						end
						if var60 then
							var60({
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
		var57, profileId, var59,
		if fFlagProfilePlatformEnableCurrencyTransfer then var60 else nil, qRCodePage,
		var66, var56, var58, editUsername, var73.joinExperience, var73.isLoading,
		var61, var77, p1,
		if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		if fFlagProfileAboutDetailsUseSheet then var70 else nil, profileType,
		editAvatar,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then var74 else nil,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then var75 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var63 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var73.isInExperience else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var85 else nil,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var72 else nil
	})
end
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
local var55 = tostring(DateTime.now().UnixTimestampMillis)

local function _(p0) --[[ line: 133 | named "areFollowActionsSupportedForProfileType" ]]
	-- upvalues: enumsModule (ref)
	return p0 == enumsModule.ProfileTypes.Community
end

local var56 = dataHydrationModule.TrustedConnections.TrustedConnectionsStore.get()
local t = { skipFetch = true }

return function(p1) --[[ line: 154 ]]
	-- upvalues: useLocalUserId (ref), useDispatch (ref), useNavigation (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useShortUrl (ref), useGetOrGenerateLinkUrl (ref), useEffectOnce (ref), reactModule (ref), var55 (ref), fFlagConnectionsToFriendsRename (ref), textKeysModule (ref), useLocalization (ref), enumsModule (ref), fFlagProfilePlatformAddTC (ref), fFlagProfilePlatformEnableUnlockChatModule (ref), fFlagProfilePlatformEnableEditAppearanceMenuModule (ref), fFlagProfilePlatformEditBackgroundMenuItemModule (ref), fFlagProfilePlatformEnableEditLookModule (ref), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagEnablePlatformProfileContextualMenuOption (ref), fFlagProfilePlatformEnableCurrencyTransfer (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), var38 (ref), t (ref), fFlagProfilePlatformPassPresenceToJoinUserInExperience (ref), useSelector (ref), presenceModule (ref), useAboutSectionsModule (ref), fFlagProfileAboutDetailsUseSheet (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), useJoinUserInExperience (ref), fFlagProfilePlatformEditBackgroundMenuItemModule_1 (ref), iconName (ref), eventNamesModule (ref), friendRequestNicknamesIXP (ref), useProfileShareLink (ref), contexts (ref), profileSharePolicyEnum (ref), USER_FRIENDING_ERRORS (ref), STATUS_CODES (ref), httpService (ref), setCurrentToastMessage (ref), fFlagProfilePlatformCTAsRefactorModule (ref), profileActionsModule (ref), buttonVariant (ref), networkingFriendsModule (ref), images (ref), refreshProfilePlatformActionInfoModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var16 (ref), navigateDown (ref), buttonType (ref), contextualInfoTypes (ref), refreshProfilePlatformModule (ref), enteredChatFromEntryPointModule (ref), chatEntryPointNames (ref), guiService (ref), notificationTypeList (ref), socialStopwatchModule (ref), setAliasModule (ref), foundationModule (ref), fFlagAXEnableProfileTab (ref), refreshProfilePlatformUserInfoModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), default (ref), fFlagEnableAbuseReportRevampFlow (ref), fFlagEnableAbuseReportRevampProfileAndGroupModule (ref), abuseVectorModule (ref), openDynamicAbuseReportModule (ref), closeCentralOverlay (ref), url (ref), myUserBlockingNetworkingModule (ref), USER_BLOCKING_ERRORS (ref), base_url (ref), groupsNetworkingModule (ref), getProfilePlatformModule (ref), getAvailableCommunityComponentsModule (ref), urlBuilder (ref), urlBase (ref), var56 (ref), sources (ref), fFlagPendingIncomingTrustedConnectionModule (ref), getPlatformFriendsServiceModule (ref), transferDirection (ref), transferOrigination (ref)
	local var58 = useLocalUserId()
	local var59 = useDispatch()
	local var60 = useNavigation()
	local var61 = useProfileWrapperContextModule()
	local var62 = if var61.navigateTo then var61.navigateTo.navigateToTransfer else nil
	local var63 = useProfileAnalyticsContextModule()
	local var64 = useShortUrl()
	useEffectOnce(useGetOrGenerateLinkUrl(), not (var64 ~= nil))
	local var65 = reactModule.useMemo(function() --[[ line: 168 ]]
		-- upvalues: var64 (ref), var55 (copy)
		return string.format("%s&source=ProfileShare&stamp=%s", var64 or "", var55)
	end, { var64 })
	local var66 = if fFlagConnectionsToFriendsRename then textKeysModule.AcceptFriend else textKeysModule.AcceptConnection
	local var67 = if fFlagConnectionsToFriendsRename then textKeysModule.AddFriend else textKeysModule.AddConnection
	local var68 = useLocalization({
		[enumsModule.ProfileActions.AcceptFriendRequest] = var66,
		[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = var66,
		[enumsModule.ProfileActions.AddFriend] = var67,
		[enumsModule.ProfileActions.AddFriendFromContacts] = var67,
		[enumsModule.ProfileActions.AddFriendFromContactsSent] = textKeysModule.PendingRequest,
		[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AddTrustedConnection else nil,
		[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then textKeysModule.AcceptTrustedConnection else nil,
		[enumsModule.ProfileActions.Block] = textKeysModule.Block,
		[enumsModule.ProfileActions.CannotAddFriend] = var67,
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
	local var69 = reactModule.useCallback(function() --[[ line: 282 ]]
		-- upvalues: var61 (ref)
		var61.navigateTo.previousView(true)
	end, { var61.navigateTo.previousView })
	local profileId = var61.profileId
	local var70 = if fFlagEnablePlatformProfileContextualMenuOption then var61.profilePlatformId else nil
	local profileType = var61.profileType
	local var71 = if fFlagProfilePlatformPresenceStoreMigrationModule then var38(profileId, t) elseif fFlagProfilePlatformPassPresenceToJoinUserInExperience then useSelector(function(p2) --[[ line: 297 ]]
		-- upvalues: presenceModule (copy), profileId (ref)
		return presenceModule.Selectors.getUserPresenceByUserId(p2, profileId) or {
			lastLocation = "",
			userPresenceType = presenceModule.Enums.PresenceType.Offline
		}
	end) else nil
	local aboutSections = nil
	local var72 = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var73 = useAboutSectionsModule()
		aboutSections = var73.aboutSections
		var72 = if fFlagProfileAboutDetailsUseSheet then var73.profileName else nil
	end
	local var74 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var75 = useJoinUserInExperience(profileId, {
		isHomePageCarousel = var61.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
		homepageCarouselAbsolutePosition = var61.sourceInfo.homepageCarouselAbsolutePosition,
		openGameDetailsPeekViewClosed = var69,
		presence = if fFlagProfilePlatformPassPresenceToJoinUserInExperience then var71 else nil
	})
	local qRCodePage = var61.navigateTo.qRCodePage
	local editUsername = var61.navigateTo.editUsername
	local var76 = if fFlagProfilePlatformEnableEditAppearanceMenuModule then var61.navigateTo.editEmotes else nil
	local var77 = if fFlagProfilePlatformEnableEditAppearanceMenuModule then var61.navigateTo.switchAvatar else nil
	
	local function getEditBackgroundAction() --[[ line: 336 ]]
		-- upvalues: fFlagProfilePlatformEditBackgroundMenuItemModule_1 (copy), var61 (ref), var68 (ref), enumsModule (copy), iconName (copy), var63 (ref), eventNamesModule (copy), p1 (ref)
		if fFlagProfilePlatformEditBackgroundMenuItemModule_1 then
			local editBackground = var61.navigateTo.editBackground
			
			return {
				text = var68[enumsModule.ProfileActions.EditBackground],
				icon = iconName.Image,
				onActivated = function() --[[ line: 342 ]]
					-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), editBackground (ref)
					var63.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditBackground, { buttonSurface = p1 })
					editBackground()
				end
			}
		end
		return nil
	end
	
	local editAvatar = var61.navigateTo.editAvatar
	local var79 = friendRequestNicknamesIXP.useFriendRequestNicknames()
	local var80 = useProfileShareLink({ context = contexts.ProfileCard })
	local var81 = var80.policy == profileSharePolicyEnum.Disabled
	local t_1 = {
		[USER_FRIENDING_ERRORS.INVALID_TARGET_USER_ERROR] = var68.invalidTargetUserError,
		[USER_FRIENDING_ERRORS.ALREADY_FRIEND_ERROR] = var68.alreadyFriendError,
		[USER_FRIENDING_ERRORS.MAX_FRIENDS_ERROR] = var68.maxFriendsError,
		[USER_FRIENDING_ERRORS.INVALID_NICKNAME_ERROR] = var68.invalidNicknameError
	}
	local t_2 = {
		[USER_FRIENDING_ERRORS.UNAUTHORIZED_ERROR] = var68.unauthorizedError
	}
	local t_3 = {
		[USER_FRIENDING_ERRORS.USER_BANNED_ERROR] = var68.userBannedError,
		[USER_FRIENDING_ERRORS.USER_BLOCKED_ERROR] = var68.userBlockedError,
		[USER_FRIENDING_ERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = var68.userNotPassedCaptchaError
	}
	local t_4 = {
		[USER_FRIENDING_ERRORS.TOO_MANY_REQUESTS_ERROR] = var68.tooManyRequestsError
	}
	
	local function _(p3, p4, p5) --[[ line: 380 | named "getErrorToastMessage" ]]
		-- upvalues: enumsModule (copy), STATUS_CODES (copy), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref)
		if p3 == enumsModule.ProfileActions.AddFriend or p3 == enumsModule.ProfileActions.AddFriendFromContacts then
			return if p4 == STATUS_CODES.BAD_REQUEST then t_1[p5] elseif p4 == STATUS_CODES.UNAUTHORIZED then t_2[p5] elseif p4 == STATUS_CODES.FORBIDDEN then t_3[p5] elseif p4 == STATUS_CODES.TOO_MANY_REQUESTS then t_4[p5] else nil
		end
	end
	
	local function setErrorToast(value, p6) --[[ line: 395 ]]
		-- upvalues: httpService (copy), enumsModule (copy), STATUS_CODES (copy), t_1 (ref), t_2 (ref), t_3 (ref), t_4 (ref), var68 (ref), var59 (ref), setCurrentToastMessage (copy)
		if p6 == nil then
			var59(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var68.defaultFriendingError
			}))
			
			return
		end
		local var90
		local statusCode = p6.StatusCode
		local var88 = if p6.Body then httpService:JSONDecode(p6.Body) else nil
		local var89 = if var88 and var88.errors and (var88.errors[1] and var88.errors[1].code) then var88.errors[1].code else nil
		
		if value ~= enumsModule.ProfileActions.AddFriend and value ~= enumsModule.ProfileActions.AddFriendFromContacts then
			var59(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = var90 or var68.defaultFriendingError
			}))
			
			return
		var90 = if statusCode == STATUS_CODES.BAD_REQUEST then t_1[var89] elseif statusCode == STATUS_CODES.UNAUTHORIZED then t_2[var89] elseif statusCode == STATUS_CODES.FORBIDDEN then t_3[var89] elseif statusCode == STATUS_CODES.TOO_MANY_REQUESTS then t_4[var89] else nil
	end
	
	local var87 = if fFlagProfilePlatformCTAsRefactorModule then {
		localized = var68,
		analytics = var63,
		buttonSurface = p1,
		profileWrapperContext = var61,
		navigateTo = var61.navigateTo,
		dispatch = var59,
		profileId = profileId,
		localUserId = var58,
		navigation = var60,
		profileType = profileType,
		experienceUtilities = var75,
		friendRequestNicknamesEnabled = var79,
		profileShareLink = var80,
		PROFILE_SHARE_LINK_URL = var65,
		aboutSections = if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		aboutProfileName = if fFlagProfileAboutDetailsUseSheet then var72 else nil,
		actionsComponentRequest = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var74 else nil
	} else nil
	
	return reactModule.useMemo(function() --[[ line: 442 ]]
		-- upvalues: fFlagProfilePlatformCTAsRefactorModule (copy), profileActionsModule (copy), var87 (ref), enumsModule (copy), var68 (ref), buttonVariant (copy), var63 (ref), eventNamesModule (copy), p1 (ref), var61 (ref), var59 (ref), networkingFriendsModule (copy), profileId (ref), var58 (ref), setCurrentToastMessage (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var74 (ref), friendRequestNicknamesIXP (copy), var79 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy), setErrorToast (ref), buttonType (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), profileType (ref), var60 (ref), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), notificationTypeList (copy), socialStopwatchModule (copy), setAliasModule (copy), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), iconName (copy), editAvatar (ref), fFlagProfilePlatformEnableEditLookModule (copy), var76 (ref), var77 (ref), getEditBackgroundAction (ref), foundationModule (copy), fFlagAXEnableProfileTab (copy), editUsername (ref), refreshProfilePlatformUserInfoModule (copy), fFlagMoveInExperienceModeToEditProfile (copy), var75 (ref), qRCodePage (ref), var81 (ref), default (copy), contexts (copy), var65 (ref), textKeysModule (copy), var80 (ref), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), abuseVectorModule (copy), openDynamicAbuseReportModule (copy), closeCentralOverlay (copy), url (copy), myUserBlockingNetworkingModule (copy), USER_BLOCKING_ERRORS (copy), base_url (copy), groupsNetworkingModule (copy), getProfilePlatformModule (copy), getAvailableCommunityComponentsModule (copy), urlBuilder (copy), fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (copy), urlBase (copy), var56 (copy), fFlagProfilePlatformAddTC (copy), sources (copy), fFlagPendingIncomingTrustedConnectionModule (copy), fFlagProfilePlatformNewProfileHeader (copy), aboutSections (write), fFlagProfileAboutDetailsUseSheet (copy), var72 (write), fFlagEnablePlatformProfileContextualMenuOption (copy), getPlatformFriendsServiceModule (copy), var70 (ref), fFlagProfilePlatformEnableCurrencyTransfer (copy), var62 (ref), transferDirection (copy), transferOrigination (copy)
		if fFlagProfilePlatformCTAsRefactorModule then
			local t = {}
			
			for i, v in profileActionsModule do
				local var92 = v(var87)
				
				if var92 ~= nil then
					t[i] = var92
				end
			end
			return t
		else
			return {
				[enumsModule.ProfileActions.AcceptFriendRequest] = {
					text = var68[enumsModule.ProfileActions.AcceptFriendRequest],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 468 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), enumsModule (copy), var59 (copy), networkingFriendsModule (copy), profileId (copy), var58 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonAcceptFriendRequest, {
							buttonSurface = p1,
							absolutePosition = var61.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = var61.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = var61.sourceInfo.isRecommendation,
							source = var61.sourceInfo.source,
							contextualInfoType = var61.sourceInfo.contextualInfoType,
							recommendationContextType = var61.sourceInfo.recommendationContextType,
							recommendationRank = var61.sourceInfo.recommendationRank,
							recommendationSessionId = var61.sourceInfo.recommendationSessionId
						})
						
						return var59(networkingFriendsModule.AcceptFriendRequestFromUserId.API({ targetUserId = profileId, currentUserId = var58 })):andThen(function() --[[ line: 484 ]]
							-- upvalues: var59 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
							var59(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var68.friendAcceptedToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var59(refreshProfilePlatformActionInfoModule(profileId, var74))
						end)
					end
				},
				[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = {
					text = var68[enumsModule.ProfileActions.AcceptOffNetworkFriendRequest],
					onActivated = function() --[[ line: 496 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), var61 (copy), var59 (copy), networkingFriendsModule (copy), profileId (copy), var58 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriendFromContacts, { shareLinkId = var61.sourceInfo.shareLinkId })
						
						return var59(networkingFriendsModule.AcceptFriendRequestWithToken.API({
							targetUserId = profileId,
							currentUserId = var58,
							friendingToken = var61.offNetworkFriendRequestToken
						})):andThen(function() --[[ line: 504 ]]
							-- upvalues: var59 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
							var59(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var68.friendAcceptedToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var59(refreshProfilePlatformActionInfoModule(profileId, var74))
						end)
					end
				},
				[enumsModule.ProfileActions.AddFriend] = {
					text = var68[enumsModule.ProfileActions.AddFriend],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 517 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), enumsModule (copy), friendRequestNicknamesIXP (copy), var79 (copy), appPage (copy), profileId (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var59 (copy), navigateDown (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), networkingFriendsModule (copy), var58 (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy), setErrorToast (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonAddFriend, {
							buttonSurface = p1,
							absolutePosition = var61.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = var61.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = var61.sourceInfo.isRecommendation,
							source = var61.sourceInfo.source,
							contextualInfoType = var61.sourceInfo.contextualInfoType,
							recommendationContextType = var61.sourceInfo.recommendationContextType,
							recommendationRank = var61.sourceInfo.recommendationRank,
							recommendationSessionId = var61.sourceInfo.recommendationSessionId
						})
						
						if not friendRequestNicknamesIXP.FFlagFriendRequestNicknames or not var79 then
							var59(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var68.friendRequestSentToast,
								toastIcon = images["icons/actions/friends/friendAdd"]
							}))
							
							return var59(networkingFriendsModule.RequestFriendshipFromUserId.API({
								targetUserId = profileId,
								currentUserId = var58,
								friendshipOriginSourceType = var61.sourceInfo.friendshipOriginSourceType
							})):andThen(function() --[[ line: 557 ]]
								-- upvalues: var59 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
								return var59(refreshProfilePlatformActionInfoModule(profileId, var74))
							end):catch(function(p7) --[[ line: 562 ]]
								-- upvalues: setErrorToast (copy), enumsModule (copy)
								setErrorToast(enumsModule.ProfileActions.AddFriend, p7)
							end)
						end
						local t = {
							name = appPage.SetNicknameModal,
							extraProps = {
								friendRequestParams = {
									targetUserId = profileId,
									source = var61.sourceInfo.friendshipOriginSourceType
								}
							}
						}
						
						return if fFlagSignalsNavP3Dispatch then var16.down(var16.fromLegacyPage(t)) else var59(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.AddFriendFromContacts] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					text = var68[enumsModule.ProfileActions.AddFriendFromContacts],
					onActivated = function() --[[ line: 572 ]]
						-- upvalues: var59 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), networkingFriendsModule (copy), var58 (copy), profileId (copy), contextualInfoTypes (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy), setErrorToast (copy)
						var59(setCurrentToastMessage({
							isLocalized = true,
							toastMessage = var68.friendRequestSentToast,
							toastIcon = images["icons/actions/friends/friendAdd"]
						}))
						
						return var59(networkingFriendsModule.RequestFriendshipFromContactId.API({
							currentUserId = var58,
							contactId = profileId,
							contextType = contextualInfoTypes.Contacts
						})):andThen(function() --[[ line: 583 ]]
							-- upvalues: var59 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							return var59(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = {
									enumsModule.Components.ContactProfileHeader,
									enumsModule.Components.Actions,
									enumsModule.Components.ContactDescription
								}
							}))
						end):catch(function(p8) --[[ line: 594 ]]
							-- upvalues: setErrorToast (copy), enumsModule (copy)
							setErrorToast(enumsModule.ProfileActions.AddFriendFromContacts, p8)
						end)
					end
				},
				[enumsModule.ProfileActions.AddFriendFromContactsSent] = {
					isDisabled = true,
					buttonType = buttonType.Secondary,
					variant = buttonVariant.Subtle,
					text = var68[enumsModule.ProfileActions.AddFriendFromContactsSent],
					onActivated = function() --[[ line: 603 ]] end
				},
				[enumsModule.ProfileActions.Block] = {
					text = var68[enumsModule.ProfileActions.Block],
					onActivated = function() --[[ line: 608 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var60 (copy), appPage (copy), profileId (copy), var59 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonBlock, { buttonSurface = p1 })
						var60.push(appPage.BlockingModal, {
							navProps = {
								userId = profileId,
								onBlockSuccess = function() --[[ line: 615 ]]
									-- upvalues: var59 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
									var59(setCurrentToastMessage({
										isLocalized = true,
										toastMessage = var68.userBlockedToast,
										toastIcon = images["icons/actions/block"]
									}))
									var59(refreshProfilePlatformActionInfoModule(profileId, var74))
								end
							}
						})
					end
				},
				[enumsModule.ProfileActions.CannotAddFriend] = {
					isDisabled = true,
					text = var68[enumsModule.ProfileActions.CannotAddFriend],
					onActivated = function() --[[ line: 630 ]] end
				},
				[enumsModule.ProfileActions.Chat] = {
					text = var68[enumsModule.ProfileActions.Chat],
					variant = buttonVariant.Standard,
					onActivated = function() --[[ line: 636 ]]
						-- upvalues: p1 (copy), enumsModule (copy), var63 (copy), eventNamesModule (copy), var59 (copy), enteredChatFromEntryPointModule (copy), chatEntryPointNames (copy), guiService (copy), profileId (copy), notificationTypeList (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonChat, { buttonSurface = p1 })
						else
							var63.fireAnalyticsEvent(eventNamesModule.CTAButtonChat, { buttonSurface = p1 })
						end
						var59(enteredChatFromEntryPointModule(chatEntryPointNames.ProfilePeekView))
						guiService:BroadcastNotification(profileId, notificationTypeList.LAUNCH_CONVERSATION)
					end
				},
				[enumsModule.ProfileActions.EditAlias] = {
					text = var68[enumsModule.ProfileActions.EditAlias],
					onActivated = function() --[[ line: 653 ]]
						-- upvalues: socialStopwatchModule (copy), var63 (copy), eventNamesModule (copy), p1 (copy), var60 (copy), enumsModule (copy), profileId (copy), setAliasModule (copy)
						socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CustomizeNameOpened)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonSetAlias, { buttonSurface = p1 })
						var60.navigate(enumsModule.Screens.SetAliasModal, {
							profileUserId = profileId,
							origin = setAliasModule.Analytics.EntryPoints.ContextualMenu
						})
					end
				},
				[enumsModule.ProfileActions.EditAppearance] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var68[enumsModule.ProfileActions.EditAppearance],
					variant = buttonVariant.Emphasis,
					onActivated = function() --[[ line: 668 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonEditAppearance, { buttonSurface = p1 })
					end
				} else nil,
				[enumsModule.ProfileActions.EditAvatar] = {
					text = var68[enumsModule.ProfileActions.EditAvatar],
					icon = if fFlagProfilePlatformEnableEditAppearanceMenuModule then iconName.Person else nil,
					onActivated = function() --[[ line: 678 ]]
						-- upvalues: var63 (copy), fFlagProfilePlatformEnableEditAppearanceMenuModule (copy), eventNamesModule (copy), p1 (copy), editAvatar (copy)
						var63.fireAnalyticsEvent(if fFlagProfilePlatformEnableEditAppearanceMenuModule then eventNamesModule.EditAppearanceMenuEditAvatar else eventNamesModule.CTAButtonEditAvatar, { buttonSurface = p1 })
						editAvatar()
					end
				},
				[enumsModule.ProfileActions.EditLook] = if fFlagProfilePlatformEnableEditLookModule then {
					text = var68[enumsModule.ProfileActions.EditLook],
					icon = iconName.Person,
					onActivated = function() --[[ line: 694 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), editAvatar (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonEditLook, { buttonSurface = p1 })
						editAvatar()
					end
				} else nil,
				[enumsModule.ProfileActions.EditEmotes] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var68[enumsModule.ProfileActions.EditEmotes],
					icon = iconName.SquareFaceWavingHand,
					onActivated = function() --[[ line: 706 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var76 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuEditEmote, { buttonSurface = p1 })
						var76()
					end
				} else nil,
				[enumsModule.ProfileActions.SwitchAvatar] = if fFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = var68[enumsModule.ProfileActions.SwitchAvatar],
					icon = iconName.PersonStandingArrowReverse,
					onActivated = function() --[[ line: 718 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var77 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.EditAppearanceMenuSwitchAvatar, { buttonSurface = p1 })
						var77()
					end
				} else nil,
				[enumsModule.ProfileActions.EditBackground] = getEditBackgroundAction(),
				[enumsModule.ProfileActions.EditProfile] = {
					component = foundationModule.Button,
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var68[enumsModule.ProfileActions.EditProfile],
					onActivated = function() --[[ line: 732 ]]
						-- upvalues: socialStopwatchModule (copy), var63 (copy), eventNamesModule (copy), p1 (copy), var60 (copy), enumsModule (copy), fFlagAXEnableProfileTab (copy), var61 (copy), editUsername (copy), var59 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy), fFlagMoveInExperienceModeToEditProfile (copy)
						local var95
						socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.EditProfileOpened)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonOpenEditProfilePage, { buttonSurface = p1 })
						local navigate = var60.navigate
						local editProfilePage = enumsModule.Screens.EditProfilePage
						local t = { profileScreens = enumsModule.Screens }
						
						if fFlagAXEnableProfileTab then
							var95 = var61.forceFullView == true
							var95 = nil
						else
							var95 = nil
						end
						t.fullBleed = var95
						
						function t.navigateToEditUsername(p9) --[[ line: 744 ]]
							-- upvalues: editUsername (copy), var59 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
							editUsername({
								showToast = p9,
								onUsernameChanged = function() --[[ line: 747 ]]
									-- upvalues: var59 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
									var59(refreshProfilePlatformUserInfoModule(profileId))
								end
							})
						end
						
						function t.onIdentityChange() --[[ line: 752 ]]
							-- upvalues: var59 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy)
							var59(refreshProfilePlatformUserInfoModule(profileId))
						end
						
						t.onToggleInExperienceMode = if fFlagMoveInExperienceModeToEditProfile then function() --[[ line: 756 ]]
							-- upvalues: var59 (copy), refreshProfilePlatformUserInfoModule (copy), profileId (copy), var63 (copy), eventNamesModule (copy)
							var59(refreshProfilePlatformUserInfoModule(profileId))
							var63.fireAnalyticsEvent(eventNamesModule.ToggleInExperienceModeButton, {})
						end else nil
						navigate(editProfilePage, t)
					end
				},
				[enumsModule.ProfileActions.IgnoreFriendRequest] = {
					text = var68[enumsModule.ProfileActions.IgnoreFriendRequest],
					onActivated = function() --[[ line: 766 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), networkingFriendsModule (copy), profileId (copy), var58 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonIgnoreFriendRequest, { buttonSurface = p1 })
						
						return var59(networkingFriendsModule.DeclineFriendRequestFromUserId.API({ targetUserId = profileId, currentUserId = var58 })):andThen(function() --[[ line: 773 ]]
							-- upvalues: var59 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
							var59(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var68.friendRequestIgnoredToast,
								toastIcon = images["icons/actions/reject"]
							}))
							
							return var59(refreshProfilePlatformActionInfoModule(profileId, var74))
						end)
					end
				},
				[enumsModule.ProfileActions.JoinExperience] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					isLoading = var75.isLoading,
					isDisabled = not var75.isInExperience,
					text = var68[enumsModule.ProfileActions.JoinExperience],
					onActivated = function() --[[ line: 790 ]]
						-- upvalues: var75 (copy)
						var75.joinExperience()
					end
				},
				[enumsModule.ProfileActions.PendingFriendRequest] = {
					isDisabled = true,
					buttonType = buttonType.Secondary,
					variant = buttonVariant.Subtle,
					text = var68[enumsModule.ProfileActions.PendingFriendRequest],
					onActivated = function() --[[ line: 799 ]] end
				},
				[enumsModule.ProfileActions.QrCode] = {
					text = var68[enumsModule.ProfileActions.QrCode],
					icon = iconName.SquaresGridQr,
					onActivated = function() --[[ line: 805 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), qRCodePage (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfileQRCode, { buttonSurface = p1 })
						qRCodePage()
					end
				},
				[enumsModule.ProfileActions.ShareProfile] = {
					component = foundationModule.Button,
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.Standard,
					text = var68[enumsModule.ProfileActions.ShareProfile],
					onActivated = function() --[[ line: 817 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var81 (copy), default (copy), contexts (copy), var65 (copy), profileId (copy), var59 (copy), setCurrentToastMessage (copy), textKeysModule (copy), var80 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonShareProfile, { buttonSurface = p1 })
						
						if var81 then
							default:setClipboardText({
								context = contexts.ProfileCard,
								text = string.format("%s/%s", var65, profileId)
							})
							var59(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
							
							return
						end
						var80.onActivated()
					end
				},
				[enumsModule.ProfileActions.Report] = {
					text = var68[enumsModule.ProfileActions.Report],
					onActivated = function() --[[ line: 836 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), profileType (copy), enumsModule (copy), fFlagEnableAbuseReportRevampFlow (copy), fFlagEnableAbuseReportRevampProfileAndGroupModule (copy), abuseVectorModule (copy), var59 (copy), openDynamicAbuseReportModule (copy), profileId (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy), appPage (copy), url (copy), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonReport, { buttonSurface = p1 })
						local var96 = nil
						
						if profileType == enumsModule.ProfileTypes.User then
							var96 = "userprofile"
						elseif profileType == enumsModule.ProfileTypes.Community then
							var96 = "group"
						end
						if fFlagEnableAbuseReportRevampFlow and fFlagEnableAbuseReportRevampProfileAndGroupModule then
							var59(openDynamicAbuseReportModule({
								abuseVector = if profileType == enumsModule.ProfileTypes.Community then abuseVectorModule.Group else abuseVectorModule.UserProfile,
								targetId = profileId,
								onClose = function() --[[ line: 855 ]]
									-- upvalues: var59 (copy), closeCentralOverlay (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
									var59(closeCentralOverlay())
									var59(refreshProfilePlatformActionInfoModule(profileId, var74))
								end
							}))
							
							return
						end
						local t = {
							name = appPage.GenericWebPage,
							detail = `{url.BASE_URL}abusereport/{var96}?id={profileId}`,
							extraProps = { titleKey = textKeysModule.Report }
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var59(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.Unblock] = {
					text = var68[enumsModule.ProfileActions.Unblock],
					onActivated = function() --[[ line: 878 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), myUserBlockingNetworkingModule (copy), profileId (copy), var58 (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy), USER_BLOCKING_ERRORS (copy), setCurrentToastMessage (copy), var68 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonUnblock, { buttonSurface = p1 })
						
						return var59(myUserBlockingNetworkingModule.UnblockUserById.API({ userId = profileId, currentUserId = var58 })):andThen(function() --[[ line: 886 ]]
							-- upvalues: var59 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
							return var59(refreshProfilePlatformActionInfoModule(profileId, var74))
						end):catch(function(p10) --[[ line: 889 ]]
							-- upvalues: USER_BLOCKING_ERRORS (copy), var59 (copy), setCurrentToastMessage (copy), var68 (copy)
							if p10 ~= nil and tonumber(p10.Body) == USER_BLOCKING_ERRORS.PARENT_BLOCKED_TARGET_USER_ERROR then
								var59(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var68.unblockTargetParentManagedToast
								}))
								
								return
							elseif p10 ~= nil and tonumber(p10.Body) == USER_BLOCKING_ERRORS.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
								var59(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var68.unblockTargetNotBlockedToast
								}))
								
								return
							elseif p10 == nil or tonumber(p10.Body) ~= USER_BLOCKING_ERRORS.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
								var59(setCurrentToastMessage({
									isLocalized = true,
									toastMessage = var68.somethingIsWrongToast
								}))
								
								return
							end
							var59(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var68.blockedOnPlatformToast
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.Unfriend] = {
					text = var68[enumsModule.ProfileActions.Unfriend],
					onActivated = function() --[[ line: 931 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), networkingFriendsModule (copy), profileId (copy), var58 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfriend, { buttonSurface = p1 })
						
						return var59(networkingFriendsModule.UnfriendTargetUserId.API({ targetUserId = profileId, currentUserId = var58 })):andThen(function() --[[ line: 938 ]]
							-- upvalues: var59 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
							var59(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var68.friendRemovedToast,
								toastIcon = images["icons/actions/friends/friendRemove"]
							}))
							
							return var59(refreshProfilePlatformActionInfoModule(profileId, var74))
						end)
					end
				},
				[enumsModule.ProfileActions.CopyLink] = {
					text = var68[enumsModule.ProfileActions.CopyLink],
					onActivated = function() --[[ line: 950 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), default (copy), contexts (copy), base_url (copy), profileId (copy), var59 (copy), setCurrentToastMessage (copy), textKeysModule (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCopyLink, { buttonSurface = p1 })
						default:setClipboardText({
							context = contexts.ProfileCard,
							text = string.format(base_url, profileId)
						})
						var59(setCurrentToastMessage({ toastMessage = textKeysModule.LinkCopied }))
					end
				},
				[enumsModule.ProfileActions.JoinCommunity] = {
					buttonType = buttonType.PrimaryContextual,
					variant = buttonVariant.Emphasis,
					text = var68[enumsModule.ProfileActions.JoinCommunity],
					onActivated = function() --[[ line: 968 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), var59 (copy), groupsNetworkingModule (copy), profileId (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonJoinCommunity, { buttonSurface = p1, btnContext = var61.sourceInfo.source })
						
						return var59(groupsNetworkingModule.JoinGroup.API({ groupId = profileId })):andThen(function() --[[ line: 976 ]]
							-- upvalues: var59 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var59(getProfilePlatformModule.API({
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
					text = var68[enumsModule.ProfileActions.CancelJoinCommunityRequest],
					onActivated = function() --[[ line: 990 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), var59 (copy), groupsNetworkingModule (copy), profileId (copy), var58 (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonCancelJoinCommunityRequest, { buttonSurface = p1, btnContext = var61.sourceInfo.source })
						
						return var59(groupsNetworkingModule.CancelJoinGroupRequest.API({ groupId = profileId, userId = var58 })):andThen(function() --[[ line: 999 ]]
							-- upvalues: var59 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var59(refreshProfilePlatformModule({
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
					text = var68[enumsModule.ProfileActions.ViewCommunity],
					onActivated = function() --[[ line: 1014 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), appPage (copy), urlBuilder (copy), profileId (copy), textKeysModule (copy), var59 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonViewCommunity, { buttonSurface = p1, btnContext = var61.sourceInfo.source })
						local t = {
							name = appPage.GenericWebPage,
							detail = urlBuilder.user.group({ groupId = profileId }),
							extraProps = {
								titleKey = textKeysModule.Community,
								onClose = function() --[[ line: 1025 ]]
									-- upvalues: var59 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
									var59(getProfilePlatformModule.API({
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
						var59(navigateDown(t))
					end
				},
				[enumsModule.ProfileActions.ViewFullProfile] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then {
					buttonType = buttonType.PrimarySystem,
					variant = buttonVariant.SubEmphasis,
					text = var68[enumsModule.ProfileActions.ViewFullProfile],
					onActivated = function() --[[ line: 1047 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), appPage (copy), urlBuilder (copy), urlBase (copy), profileId (copy), textKeysModule (copy), var59 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), navigateDown (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, { buttonSurface = p1, btnContext = var61.sourceInfo.source })
						local t = {
							name = appPage.GenericWebPage,
							detail = urlBuilder.new({ base = urlBase.WWW, path = `profiles/{profileId}` })(),
							extraProps = {
								titleKey = textKeysModule.Profile,
								onClose = function() --[[ line: 1061 ]]
									-- upvalues: var59 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
									var59(getProfilePlatformModule.API({
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
						var59(navigateDown(t))
					end
				} else nil,
				[enumsModule.ProfileActions.LeaveCommunity] = {
					text = var68[enumsModule.ProfileActions.LeaveCommunity],
					onActivated = function() --[[ line: 1081 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), var59 (copy), groupsNetworkingModule (copy), profileId (copy), var58 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonLeaveCommunity, { buttonSurface = p1, btnContext = var61.sourceInfo.source })
						
						return var59(groupsNetworkingModule.LeaveGroup.API({ groupId = profileId, userId = var58 })):andThen(function() --[[ line: 1090 ]]
							-- upvalues: var59 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var59(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.MakePrimaryCommunity] = {
					text = var68[enumsModule.ProfileActions.MakePrimaryCommunity],
					onActivated = function() --[[ line: 1102 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), var59 (copy), groupsNetworkingModule (copy), profileId (copy), refreshProfilePlatformModule (copy), profileType (copy), enumsModule (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonMakePrimaryCommunity, { buttonSurface = p1, btnContext = var61.sourceInfo.source })
						
						return var59(groupsNetworkingModule.MakePrimaryGroup.API({ groupId = profileId })):andThen(function() --[[ line: 1110 ]]
							-- upvalues: var59 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var59(refreshProfilePlatformModule({
								profileType = profileType,
								profileId = profileId,
								components = { enumsModule.Components.Actions }
							}))
						end)
					end
				},
				[enumsModule.ProfileActions.RemovePrimaryCommunity] = {
					text = var68[enumsModule.ProfileActions.RemovePrimaryCommunity],
					onActivated = function() --[[ line: 1123 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), var59 (copy), groupsNetworkingModule (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemovePrimaryCommunity, { buttonSurface = p1, btnContext = var61.sourceInfo.source })
						
						return var59(groupsNetworkingModule.RemovePrimaryGroup.API()):andThen(function() --[[ line: 1129 ]]
							-- upvalues: var59 (copy), refreshProfilePlatformModule (copy), profileType (copy), profileId (copy), enumsModule (copy)
							var59(refreshProfilePlatformModule({
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
					text = var68[enumsModule.ProfileActions.Follow],
					onActivated = function() --[[ line: 1146 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), groupsNetworkingModule (copy), profileId (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonFollow, { buttonSurface = p1 })
						
						return var59(groupsNetworkingModule.JoinGroup.API({ groupId = profileId })):andThen(function() --[[ line: 1152 ]]
							-- upvalues: var59 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var59(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[enumsModule.ProfileActions.Unfollow] = if fFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule and profileType == enumsModule.ProfileTypes.Community then {
					text = var68[enumsModule.ProfileActions.Unfollow],
					onActivated = function() --[[ line: 1167 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var59 (copy), groupsNetworkingModule (copy), profileId (copy), var58 (copy), getProfilePlatformModule (copy), profileType (copy), getAvailableCommunityComponentsModule (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = p1 })
						
						return var59(groupsNetworkingModule.LeaveGroup.API({ groupId = profileId, userId = var58 })):andThen(function() --[[ line: 1175 ]]
							-- upvalues: var59 (copy), getProfilePlatformModule (copy), profileType (copy), profileId (copy), getAvailableCommunityComponentsModule (copy)
							var59(getProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = profileType,
								profileId = profileId,
								components = getAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[enumsModule.ProfileActions.RemoveTrustedConnection] = {
					text = var68[enumsModule.ProfileActions.RemoveTrustedConnection],
					onActivated = function() --[[ line: 1188 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var56 (copy), profileId (copy), var59 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonRemoveTrustedConnection, { buttonSurface = p1 })
						
						return var56.removeTrustedConnectionRequest(profileId):andThen(function() --[[ line: 1192 ]]
							-- upvalues: var59 (copy), setCurrentToastMessage (copy), var68 (copy), images (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
							var59(setCurrentToastMessage({
								isLocalized = true,
								toastMessage = var68.trustedConnectionRemovedToast,
								toastIcon = images["icons/actions/friends/friendRemove"]
							}))
							
							return var59(refreshProfilePlatformActionInfoModule(profileId, var74))
						end)
					end
				},
				[enumsModule.ProfileActions.AddTrustedConnection] = if fFlagProfilePlatformAddTC then {
					text = var68[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1205 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var60 (copy), appPage (copy), profileId (copy), sources (copy), var59 (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, { buttonSurface = p1 })
						var60.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								onRequestSent = function() --[[ line: 1213 ]]
									-- upvalues: var59 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
									return var59(refreshProfilePlatformActionInfoModule(profileId, var74))
								end
							}
						})
					end
				} else nil,
				[enumsModule.ProfileActions.AddTrustedConnectionViaLink] = {
					text = var68[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1225 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), sources (copy), var60 (copy), appPage (copy), profileId (copy), var59 (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddTrustedConnection, {
							buttonSurface = p1,
							modalVariantOverride = sources.ShareLinkSender
						})
						var60.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								source = sources.ProfilePlatform,
								modalVariantOverride = sources.ShareLinkSender,
								onRequestSent = function() --[[ line: 1235 ]]
									-- upvalues: var59 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
									return var59(refreshProfilePlatformActionInfoModule(profileId, var74))
								end
							}
						})
					end
				},
				[enumsModule.ProfileActions.AddIncomingTrustedConnection] = if fFlagProfilePlatformAddTC then {
					text = var68[enumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function() --[[ line: 1247 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var60 (copy), appPage (copy), profileId (copy), var59 (copy), refreshProfilePlatformActionInfoModule (copy), var74 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection, { buttonSurface = p1 })
						var60.push(appPage.TrustedContactsModal, {
							props = {
								userId = profileId,
								onRequestAccepted = function() --[[ line: 1254 ]]
									-- upvalues: var59 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var74 (copy)
									return var59(refreshProfilePlatformActionInfoModule(profileId, var74))
								end
							}
						})
					end
				} else nil,
				[enumsModule.ProfileActions.PendingTrustedConnection] = if fFlagProfilePlatformAddTC then {
					isDisabled = true,
					text = var68[enumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() --[[ line: 1268 ]] end
				} else nil,
				[enumsModule.ProfileActions.PendingIncomingTrustedConnection] = if fFlagPendingIncomingTrustedConnectionModule then {
					isDisabled = true,
					text = var68[enumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function() --[[ line: 1275 ]] end
				} else nil,
				[enumsModule.ProfileActions.ViewAbout] = if fFlagProfilePlatformNewProfileHeader then {
					text = var68[enumsModule.ProfileActions.ViewAbout],
					onActivated = function() --[[ line: 1281 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), var61 (copy), appPage (copy), aboutSections (copy), fFlagProfileAboutDetailsUseSheet (copy), var72 (copy), fFlagSignalsNavP3Dispatch (copy), var16 (copy), var59 (copy), navigateDown (copy)
						var63.fireAnalyticsEvent(eventNamesModule.CTAButtonViewFullProfile, { buttonSurface = p1, btnContext = var61.sourceInfo.source })
						local t = {
							name = appPage.AboutDetailsSheet,
							extraProps = {
								sections = aboutSections,
								profileName = if fFlagProfileAboutDetailsUseSheet then var72 else nil
							}
						}
						
						if fFlagSignalsNavP3Dispatch then
							var16.down(var16.fromLegacyPage(t))
							
							return
						end
						var59(navigateDown(t))
					end
				} else nil,
				[enumsModule.ProfileActions.ViewPlatformProfile] = if fFlagEnablePlatformProfileContextualMenuOption then {
					text = var68[enumsModule.ProfileActions.ViewPlatformProfile],
					onActivated = function() --[[ line: 1307 ]]
						-- upvalues: var63 (copy), eventNamesModule (copy), p1 (copy), getPlatformFriendsServiceModule (copy), var70 (copy)
						var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonViewPlatformProfile, { buttonSurface = p1 })
						getPlatformFriendsServiceModule:ShowProfile(var70)
					end
				} else nil,
				[enumsModule.ProfileActions.CurrencyTransfer] = if fFlagProfilePlatformEnableCurrencyTransfer then {
					text = var68[enumsModule.ProfileActions.CurrencyTransfer],
					onActivated = function() --[[ line: 1318 ]]
						-- upvalues: p1 (copy), enumsModule (copy), var63 (copy), eventNamesModule (copy), var62 (copy), profileId (copy), transferDirection (copy), transferOrigination (copy)
						if p1 == enumsModule.ButtonSurface.ContextualMenu then
							var63.fireAnalyticsEvent(eventNamesModule.ContextualMenuButtonCurrencyTransfer, { buttonSurface = p1 })
						else
							var63.fireAnalyticsEvent(eventNamesModule.CTAButtonCurrencyTransfer, { buttonSurface = p1 })
						end
						if var62 then
							var62({
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
		var59, profileId, var61,
		if fFlagProfilePlatformEnableCurrencyTransfer then var62 else nil, qRCodePage,
		var68, var58, var60, editUsername, var75.joinExperience, var75.isLoading,
		var63, var79, p1,
		if fFlagProfilePlatformNewProfileHeader then aboutSections else nil,
		if fFlagProfileAboutDetailsUseSheet then var72 else nil, profileType,
		editAvatar,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then var76 else nil,
		if fFlagProfilePlatformEnableEditAppearanceMenuModule then var77 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var65 else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var75.isInExperience else nil,
		if fFlagProfilePlatformCTAsRefactorModule then var87 else nil,
		if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then var74 else nil
	})
end
local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local GuiService = game:GetService("GuiService")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local RoactUtilsModule = require(Parent.RoactUtils)
local SocialCommonModule = require(Parent.SocialCommon)
local SetAliasModule = require(Parent.SetAlias)
local SharedFlagsModule = require(Parent.SharedFlags)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local Images = UIBloxModule.App.ImageSet.Images
local HttpService = game:GetService("HttpService")
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local Url = require(Parent.Http).Url
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseJoinUserInExperienceFunction = require(Parent.SocialExperienceJoin).useJoinUserInExperience
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local NetworkingFriendsModule = require(ProfilePlatform.Networking.NetworkingFriends)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local ProfileShareLinksModule = require(Parent.ProfileShareLinks)
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local GetAvailableCommunityComponentsModule = require(ProfilePlatform.Hooks.getAvailableCommunityComponents)
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)
local RefreshProfilePlatformModule = require(ProfilePlatform.Networking.refreshProfilePlatform)
local RefreshProfilePlatformActionInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local RefreshProfilePlatformUserInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformUserInfo)
local UseAboutSectionsModule = require(ProfilePlatform.Hooks.useAboutSections)
local UseActionsComponentRequestModule = require(ProfilePlatform.Hooks.useActionsComponentRequest)
local GroupsNetworkingModule = require(ProfilePlatform.Networking.GroupsNetworking)
local MyUserBlockingNetworkingModule = require(ProfilePlatform.Networking.myUserBlockingNetworking)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local GetPlatformFriendsServiceModule = require(ProfilePlatform.Utils.getPlatformFriendsService)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ContextualInfoTypes = SocialCommonModule.Enums.ContextualInfoTypes
local UseProfileShareLinkFunction = ProfileShareLinksModule.Hooks.useProfileShareLink
local UseShortUrlFunction = ProfileShareLinksModule.Hooks.useShortUrl
local UseGetOrGenerateLinkUrlFunction = ProfileShareLinksModule.Hooks.useGetOrGenerateLinkUrl
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local ProfileSharePolicyEnum = ProfileShareLinksModule.Enums.ProfileSharePolicyEnum
local FFlagEnableAbuseReportRevampFlow = SharedFlagsModule.FFlagEnableAbuseReportRevampFlow
local FFlagMoveInExperienceModeToEditProfile = require(Parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUpdateUXForNonSocialCommunities)
local FFlagProfilePlatformAddTC = SharedFlagsModule.FFlagProfilePlatformAddTC
local FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessage)
local FFlagEnablePlatformProfileContextualMenuOption = require(Parent.SharedFlags).FFlagEnablePlatformProfileContextualMenuOption
local FFlagProfilePlatformNewProfileHeader = SharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local FFlagProfileAboutDetailsUseSheet = SharedFlagsModule.FFlagProfileAboutDetailsUseSheet
local FFlagConnectionsToFriendsRename = SharedFlagsModule.FFlagConnectionsToFriendsRename
local FFlagPendingIncomingTrustedConnectionModule = require(ProfilePlatform.Flags.FFlagPendingIncomingTrustedConnection)
local FFlagProfilePlatformPassPresenceToJoinUserInExperience = SharedFlagsModule.FFlagProfilePlatformPassPresenceToJoinUserInExperience
local FFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local FFlagEnableAbuseReportRevampProfileAndGroupModule = require(ProfilePlatform.Flags.FFlagEnableAbuseReportRevampProfileAndGroup)
local FFlagProfilePlatformEnableCurrencyTransfer = SharedFlagsModule.FFlagProfilePlatformEnableCurrencyTransfer
local FFlagProfilePlatformEnableEditAppearanceMenuModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditAppearanceMenu)
local FFlagProfilePlatformEditBackgroundMenuItemModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEditBackgroundMenuItem)
local FFlagProfilePlatformEnableEditLookModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableEditLook)
local FFlagProfilePlatformCTAsRefactorModule = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)
local FFlagProfilePlatformEditBackgroundMenuItemModule1 = FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEditBackgroundMenuItemModule
local ProfileActionsModule = require(ProfilePlatform.Components.CTARow.ProfileActions)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local ChatEntryPointNames = SocialCommonModule.Enums.ChatEntryPointNames
local EnteredChatFromEntryPointModule = require(Parent.AppChat.EnteredChatFromEntryPoint)
local NotificationTypeList = GuiService:GetNotificationTypeList()
local FriendRequestNicknamesIXP = require(Parent.FriendRequestNicknames).FriendRequestNicknamesIXP
local Enums = require(Parent.CurrencyTransfers).Enums
local TransferDirection = Enums.TransferDirection
local TransferOrigination = Enums.TransferOrigination
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local PresenceModule = require(ProfilePlatform.Rodux.Presence)
local FFlagProfilePlatformEnableUnlockChatModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableUnlockChat)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local USERBLOCKINGERRORS = ConstantsModule.USER_BLOCKING_ERRORS
local USERFRIENDINGERRORS = ConstantsModule.USER_FRIENDING_ERRORS
local STATUSCODES = ConstantsModule.STATUS_CODES
local ShareName: string = `{Url.BASE_URL}share/g/%s`
local Text = tostring(DateTime.now().UnixTimestampMillis)

local function _(Community): boolean
	-- upvalues: EnumsModule (copy)
	return Community == EnumsModule.ProfileTypes.Community
end

local GetResult = require(Parent.DataHydration).TrustedConnections.TrustedConnectionsStore.get()

return function(ButtonSurface)
	-- upvalues: UseLocalUserIdFunction (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseShortUrlFunction (copy), UseGetOrGenerateLinkUrlFunction (copy), UseEffectOnceFunction (copy), ReactModule (copy), Text (copy), FFlagConnectionsToFriendsRename (copy), TextKeysModule (copy), UseLocalizationFunction (copy), EnumsModule (copy), FFlagProfilePlatformAddTC (copy), FFlagProfilePlatformEnableUnlockChatModule (copy), FFlagProfilePlatformEnableEditAppearanceMenuModule (copy), FFlagProfilePlatformEditBackgroundMenuItemModule (copy), FFlagProfilePlatformEnableEditLookModule (copy), FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (copy), FFlagProfilePlatformNewProfileHeader (copy), FFlagEnablePlatformProfileContextualMenuOption (copy), FFlagProfilePlatformEnableCurrencyTransfer (copy), FFlagProfilePlatformPassPresenceToJoinUserInExperience (copy), UseSelectorFunction (copy), PresenceModule (copy), UseAboutSectionsModule (copy), FFlagProfileAboutDetailsUseSheet (copy), FFlagProfilePlatformRefreshActionsRespectPoliciesModule (copy), UseActionsComponentRequestModule (copy), UseJoinUserInExperienceFunction (copy), FFlagProfilePlatformEditBackgroundMenuItemModule1 (copy), IconName (copy), EventNamesModule (copy), FriendRequestNicknamesIXP (copy), UseProfileShareLinkFunction (copy), Contexts (copy), ProfileSharePolicyEnum (copy), USERFRIENDINGERRORS (copy), STATUSCODES (copy), HttpService (copy), SetCurrentToastMessageFunction (copy), FFlagProfilePlatformCTAsRefactorModule (copy), ProfileActionsModule (copy), ButtonVariant (copy), NetworkingFriendsModule (copy), Images (copy), RefreshProfilePlatformActionInfoModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), ButtonType (copy), ContextualInfoTypes (copy), RefreshProfilePlatformModule (copy), EnteredChatFromEntryPointModule (copy), ChatEntryPointNames (copy), GuiService (copy), NotificationTypeList (copy), SocialStopwatchModule (copy), SetAliasModule (copy), FoundationModule (copy), FFlagAXEnableProfileTab (copy), RefreshProfilePlatformUserInfoModule (copy), FFlagMoveInExperienceModeToEditProfile (copy), Default (copy), FFlagEnableAbuseReportRevampFlow (copy), FFlagEnableAbuseReportRevampProfileAndGroupModule (copy), AbuseVectorModule (copy), OpenDynamicAbuseReportModule (copy), CloseCentralOverlayFunction (copy), Url (copy), MyUserBlockingNetworkingModule (copy), USERBLOCKINGERRORS (copy), FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (copy), ShareName (copy), GroupsNetworkingModule (copy), GetProfilePlatformModule (copy), GetAvailableCommunityComponentsModule (copy), UrlBuilder (copy), UrlBase (copy), GetResult (copy), Sources (copy), FFlagPendingIncomingTrustedConnectionModule (copy), GetPlatformFriendsServiceModule (copy), TransferDirection (copy), TransferOrigination (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local NavigateToTransfer = UseProfileWrapperContextModuleResult.navigateTo and UseProfileWrapperContextModuleResult.navigateTo.navigateToTransfer or nil
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseShortUrlResult = UseShortUrlFunction()
	UseEffectOnceFunction(UseGetOrGenerateLinkUrlFunction(), not (UseShortUrlResult ~= nil))
	local UseMemoResult = ReactModule.useMemo(function(): string
		-- upvalues: UseShortUrlResult (copy), Text (upval)
		return string.format("%s&source=ProfileShare&stamp=%s", UseShortUrlResult or "", Text)
	end, { UseShortUrlResult })
	local AcceptFriend = if FFlagConnectionsToFriendsRename then TextKeysModule.AcceptFriend else TextKeysModule.AcceptConnection
	local AddFriend = if FFlagConnectionsToFriendsRename then TextKeysModule.AddFriend else TextKeysModule.AddConnection
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
		[EnumsModule.ProfileActions.UnlockChat] = if FFlagProfilePlatformEnableUnlockChatModule then TextKeysModule.UnlockChat else nil,
		[EnumsModule.ProfileActions.EditAlias] = TextKeysModule.CustomizeName,
		[EnumsModule.ProfileActions.EditAppearance] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then TextKeysModule.EditAppearance else nil,
		[EnumsModule.ProfileActions.EditEmotes] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then TextKeysModule.EditEmotes else nil,
		[EnumsModule.ProfileActions.SwitchAvatar] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then TextKeysModule.SwitchAvatar else nil,
		[EnumsModule.ProfileActions.EditBackground] = if FFlagProfilePlatformEnableEditAppearanceMenuModule and FFlagProfilePlatformEditBackgroundMenuItemModule then TextKeysModule.EditBackground else nil,
		[EnumsModule.ProfileActions.EditAvatar] = TextKeysModule.EditAvatar,
		[EnumsModule.ProfileActions.EditLook] = if FFlagProfilePlatformEnableEditLookModule then TextKeysModule.EditLook else nil,
		[EnumsModule.ProfileActions.EditProfile] = TextKeysModule.EditProfile,
		[EnumsModule.ProfileActions.IgnoreFriendRequest] = if FFlagConnectionsToFriendsRename then TextKeysModule.IgnoreFriendRequest else TextKeysModule.IgnoreConnectionRequest,
		[EnumsModule.ProfileActions.JoinExperience] = TextKeysModule.Join,
		[EnumsModule.ProfileActions.PendingFriendRequest] = TextKeysModule.PendingRequest,
		[EnumsModule.ProfileActions.QrCode] = TextKeysModule.ToQRCode,
		[EnumsModule.ProfileActions.Report] = TextKeysModule.Report,
		[EnumsModule.ProfileActions.ShareProfile] = TextKeysModule.ShareProfile,
		[EnumsModule.ProfileActions.Unblock] = TextKeysModule.Unblock,
		[EnumsModule.ProfileActions.Unfriend] = if FFlagConnectionsToFriendsRename then TextKeysModule.Unfriend else TextKeysModule.RemoveConnection,
		[EnumsModule.ProfileActions.CopyLink] = TextKeysModule.CopyLink,
		[EnumsModule.ProfileActions.JoinCommunity] = TextKeysModule.JoinCommunity,
		[EnumsModule.ProfileActions.CancelJoinCommunityRequest] = TextKeysModule.CancelJoinCommunityRequest,
		[EnumsModule.ProfileActions.ViewCommunity] = TextKeysModule.ViewCommunity,
		[EnumsModule.ProfileActions.ViewFullProfile] = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then TextKeysModule.ViewFullProfile else nil,
		[EnumsModule.ProfileActions.LeaveCommunity] = TextKeysModule.LeaveCommunity,
		[EnumsModule.ProfileActions.MakePrimaryCommunity] = TextKeysModule.MakePrimaryCommunity,
		[EnumsModule.ProfileActions.RemovePrimaryCommunity] = TextKeysModule.RemovePrimaryCommunity,
		[EnumsModule.ProfileActions.Follow] = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then TextKeysModule.Follow else nil,
		[EnumsModule.ProfileActions.Unfollow] = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then TextKeysModule.Unfollow else nil,
		[EnumsModule.ProfileActions.RemoveTrustedConnection] = TextKeysModule.RemoveTrustedConnection,
		[EnumsModule.ProfileActions.ViewAbout] = if FFlagProfilePlatformNewProfileHeader then TextKeysModule.AboutThisProfile else nil,
		[EnumsModule.ProfileActions.ViewPlatformProfile] = if FFlagEnablePlatformProfileContextualMenuOption then TextKeysModule.ViewPlatformProfile else nil,
		[EnumsModule.ProfileActions.CurrencyTransfer] = if FFlagProfilePlatformEnableCurrencyTransfer then TextKeysModule.CurrencyTransfer else nil,
		friendAcceptedToast = if FFlagConnectionsToFriendsRename then TextKeysModule.FriendAdded else TextKeysModule.ConnectionAdded,
		friendRemovedToast = if FFlagConnectionsToFriendsRename then TextKeysModule.FriendRemoved else TextKeysModule.ConnectionRemoved,
		trustedConnectionRemovedToast = TextKeysModule.TrustedConnectionRemoved,
		friendRequestSentToast = if FFlagConnectionsToFriendsRename then TextKeysModule.FriendRequestSent else TextKeysModule.ConnectionRequestSent,
		friendRequestIgnoredToast = TextKeysModule.RequestIgnored,
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
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseProfileWrapperContextModuleResult (copy)
		UseProfileWrapperContextModuleResult.navigateTo.previousView(true)
	end, {
		UseProfileWrapperContextModuleResult.navigateTo.previousView
	})
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local ProfilePlatformId = if FFlagEnablePlatformProfileContextualMenuOption then UseProfileWrapperContextModuleResult.profilePlatformId else nil
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local UseSelectorResult = if FFlagProfilePlatformPassPresenceToJoinUserInExperience then UseSelectorFunction(function(p1)
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
		presence = if FFlagProfilePlatformPassPresenceToJoinUserInExperience then UseSelectorResult else nil
	})
	local QRCodePageFunction = UseProfileWrapperContextModuleResult.navigateTo.qRCodePage
	local EditUsernameFunction = UseProfileWrapperContextModuleResult.navigateTo.editUsername
	local EditEmotes = if FFlagProfilePlatformEnableEditAppearanceMenuModule then UseProfileWrapperContextModuleResult.navigateTo.editEmotes else nil
	local SwitchAvatar = if FFlagProfilePlatformEnableEditAppearanceMenuModule then UseProfileWrapperContextModuleResult.navigateTo.switchAvatar else nil
	
	local function getEditBackgroundAction()
		-- upvalues: FFlagProfilePlatformEditBackgroundMenuItemModule1 (upval), UseProfileWrapperContextModuleResult (copy), UseLocalizationResult (copy), EnumsModule (upval), IconName (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), ButtonSurface (copy)
		if FFlagProfilePlatformEditBackgroundMenuItemModule1 then
			local EditBackgroundFunction = UseProfileWrapperContextModuleResult.navigateTo.editBackground
			
			return {
				text = UseLocalizationResult[EnumsModule.ProfileActions.EditBackground],
				icon = IconName.Image,
				onActivated = function()
					-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), EditBackgroundFunction (copy)
					UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.EditAppearanceMenuEditBackground, { buttonSurface = ButtonSurface })
					EditBackgroundFunction()
				end
			}
		else
			return nil
		end
	end
	
	local EditAvatarFunction = UseProfileWrapperContextModuleResult.navigateTo.editAvatar
	local UseFriendRequestNicknamesResult = FriendRequestNicknamesIXP.useFriendRequestNicknames()
	local UseProfileShareLinkResult = UseProfileShareLinkFunction({ context = Contexts.ProfileCard })
	local IsPolicyMatch = UseProfileShareLinkResult.policy == ProfileSharePolicyEnum.Disabled
	local config = {
		[USERFRIENDINGERRORS.INVALID_TARGET_USER_ERROR] = UseLocalizationResult.invalidTargetUserError,
		[USERFRIENDINGERRORS.ALREADY_FRIEND_ERROR] = UseLocalizationResult.alreadyFriendError,
		[USERFRIENDINGERRORS.MAX_FRIENDS_ERROR] = UseLocalizationResult.maxFriendsError,
		[USERFRIENDINGERRORS.INVALID_NICKNAME_ERROR] = UseLocalizationResult.invalidNicknameError
	}
	local config1 = {
		[USERFRIENDINGERRORS.UNAUTHORIZED_ERROR] = UseLocalizationResult.unauthorizedError
	}
	local config2 = {
		[USERFRIENDINGERRORS.USER_BANNED_ERROR] = UseLocalizationResult.userBannedError,
		[USERFRIENDINGERRORS.USER_BLOCKED_ERROR] = UseLocalizationResult.userBlockedError,
		[USERFRIENDINGERRORS.USER_NOT_PASSED_CAPTCHA_ERROR] = UseLocalizationResult.userNotPassedCaptchaError
	}
	local config3 = {
		[USERFRIENDINGERRORS.TOO_MANY_REQUESTS_ERROR] = UseLocalizationResult.tooManyRequestsError
	}
	
	local function _(AddFriend, BADREQUEST, p1)
		-- upvalues: EnumsModule (upval), STATUSCODES (upval), config (copy), config1 (copy), config2 (copy), config3 (copy)
		if AddFriend == EnumsModule.ProfileActions.AddFriend or AddFriend == EnumsModule.ProfileActions.AddFriendFromContacts then
			if BADREQUEST == STATUSCODES.BAD_REQUEST then
				return config[p1]
			elseif BADREQUEST == STATUSCODES.UNAUTHORIZED then
				return config1[p1]
			elseif BADREQUEST == STATUSCODES.FORBIDDEN then
				return config2[p1]
			elseif BADREQUEST == STATUSCODES.TOO_MANY_REQUESTS then
				return config3[p1]
			end
		end
		return nil
	end
	
	local function setErrorToast(AddFriend, p1)
		-- upvalues: HttpService (upval), EnumsModule (upval), STATUSCODES (upval), config (copy), config1 (copy), config2 (copy), config3 (copy), UseLocalizationResult (copy), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval)
		if p1 == nil then
			UseDispatchResult(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastMessage = UseLocalizationResult.defaultFriendingError
			}))
			
			return
		else
			local StatusCode = p1.StatusCode
			local Data = if p1.Body then HttpService:JSONDecode(p1.Body) else nil
			local Code = if Data and Data.errors and Data.errors[1] and Data.errors[1].code then Data.errors[1].code else nil
			UseDispatchResult(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastMessage = (if AddFriend == EnumsModule.ProfileActions.AddFriend or AddFriend == EnumsModule.ProfileActions.AddFriendFromContacts then if StatusCode == STATUSCODES.BAD_REQUEST then config[Code] elseif StatusCode == STATUSCODES.UNAUTHORIZED then config1[Code] elseif StatusCode == STATUSCODES.FORBIDDEN then config2[Code] elseif StatusCode == STATUSCODES.TOO_MANY_REQUESTS then config3[Code] else nil else nil) or UseLocalizationResult.defaultFriendingError
			}))
		end
	end
	
	local Config = if FFlagProfilePlatformCTAsRefactorModule then {
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
		friendRequestNicknamesEnabled = UseFriendRequestNicknamesResult,
		profileShareLink = UseProfileShareLinkResult,
		PROFILE_SHARE_LINK_URL = UseMemoResult,
		aboutSections = if FFlagProfilePlatformNewProfileHeader then AboutSections else nil,
		aboutProfileName = if FFlagProfileAboutDetailsUseSheet then ProfileName else nil,
		actionsComponentRequest = if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then UseActionsComponentRequestModuleResult else nil
	} else nil
	
	return (ReactModule.useMemo(function()
		-- upvalues: FFlagProfilePlatformCTAsRefactorModule (upval), ProfileActionsModule (upval), Config (copy), EnumsModule (upval), UseLocalizationResult (copy), ButtonVariant (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), ButtonSurface (copy), UseProfileWrapperContextModuleResult (copy), UseDispatchResult (copy), NetworkingFriendsModule (upval), ProfileId (copy), UseLocalUserIdResult (copy), SetCurrentToastMessageFunction (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (copy), FriendRequestNicknamesIXP (upval), UseFriendRequestNicknamesResult (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval), setErrorToast (copy), ButtonType (upval), ContextualInfoTypes (upval), RefreshProfilePlatformModule (upval), ProfileType (copy), UseNavigationResult (copy), EnteredChatFromEntryPointModule (upval), ChatEntryPointNames (upval), GuiService (upval), NotificationTypeList (upval), SocialStopwatchModule (upval), SetAliasModule (upval), FFlagProfilePlatformEnableEditAppearanceMenuModule (upval), IconName (upval), EditAvatarFunction (copy), FFlagProfilePlatformEnableEditLookModule (upval), EditEmotes (copy), SwitchAvatar (copy), getEditBackgroundAction (copy), FoundationModule (upval), FFlagAXEnableProfileTab (upval), EditUsernameFunction (copy), RefreshProfilePlatformUserInfoModule (upval), FFlagMoveInExperienceModeToEditProfile (upval), UseJoinUserInExperienceResult (copy), QRCodePageFunction (copy), IsPolicyMatch (copy), Default (upval), Contexts (upval), UseMemoResult (copy), TextKeysModule (upval), UseProfileShareLinkResult (copy), FFlagEnableAbuseReportRevampFlow (upval), FFlagEnableAbuseReportRevampProfileAndGroupModule (upval), AbuseVectorModule (upval), OpenDynamicAbuseReportModule (upval), CloseCentralOverlayFunction (upval), Url (upval), MyUserBlockingNetworkingModule (upval), USERBLOCKINGERRORS (upval), FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (upval), ShareName (upval), GroupsNetworkingModule (upval), GetProfilePlatformModule (upval), GetAvailableCommunityComponentsModule (upval), UrlBuilder (upval), FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule (upval), UrlBase (upval), GetResult (upval), FFlagProfilePlatformAddTC (upval), Sources (upval), FFlagPendingIncomingTrustedConnectionModule (upval), FFlagProfilePlatformNewProfileHeader (upval), AboutSections (ref), FFlagProfileAboutDetailsUseSheet (upval), ProfileName (ref), FFlagEnablePlatformProfileContextualMenuOption (upval), GetPlatformFriendsServiceModule (upval), ProfilePlatformId (copy), FFlagProfilePlatformEnableCurrencyTransfer (upval), NavigateToTransfer (copy), TransferDirection (upval), TransferOrigination (upval)
		if not FFlagProfilePlatformCTAsRefactorModule then
			return {
				[EnumsModule.ProfileActions.AcceptFriendRequest] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.AcceptFriendRequest],
					variant = ButtonVariant.Emphasis,
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseProfileWrapperContextModuleResult (upval), EnumsModule (upval), UseDispatchResult (upval), NetworkingFriendsModule (upval), ProfileId (upval), UseLocalUserIdResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonAcceptFriendRequest, {
							buttonSurface = ButtonSurface,
							absolutePosition = UseProfileWrapperContextModuleResult.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = UseProfileWrapperContextModuleResult.sourceInfo.source == EnumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = UseProfileWrapperContextModuleResult.sourceInfo.isRecommendation,
							source = UseProfileWrapperContextModuleResult.sourceInfo.source,
							contextualInfoType = UseProfileWrapperContextModuleResult.sourceInfo.contextualInfoType,
							recommendationContextType = UseProfileWrapperContextModuleResult.sourceInfo.recommendationContextType,
							recommendationRank = UseProfileWrapperContextModuleResult.sourceInfo.recommendationRank,
							recommendationSessionId = UseProfileWrapperContextModuleResult.sourceInfo.recommendationSessionId
						})
						
						return UseDispatchResult(NetworkingFriendsModule.AcceptFriendRequestFromUserId.API({
							targetUserId = ProfileId,
							currentUserId = UseLocalUserIdResult
						})):andThen(function()
							-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
							UseDispatchResult(SetCurrentToastMessageFunction({
								isLocalized = true,
								toastMessage = UseLocalizationResult.friendAcceptedToast,
								toastIcon = Images["icons/actions/friends/friendAdd"]
							}))
							
							return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
						end)
					end
				},
				[EnumsModule.ProfileActions.AcceptOffNetworkFriendRequest] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.AcceptOffNetworkFriendRequest],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), UseProfileWrapperContextModuleResult (upval), UseDispatchResult (upval), NetworkingFriendsModule (upval), ProfileId (upval), UseLocalUserIdResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonAddFriendFromContacts, {
							shareLinkId = UseProfileWrapperContextModuleResult.sourceInfo.shareLinkId
						})
						
						return UseDispatchResult(NetworkingFriendsModule.AcceptFriendRequestWithToken.API({
							targetUserId = ProfileId,
							currentUserId = UseLocalUserIdResult,
							friendingToken = UseProfileWrapperContextModuleResult.offNetworkFriendRequestToken
						})):andThen(function()
							-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
							UseDispatchResult(SetCurrentToastMessageFunction({
								isLocalized = true,
								toastMessage = UseLocalizationResult.friendAcceptedToast,
								toastIcon = Images["icons/actions/friends/friendAdd"]
							}))
							
							return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
						end)
					end
				},
				[EnumsModule.ProfileActions.AddFriend] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.AddFriend],
					variant = ButtonVariant.Emphasis,
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseProfileWrapperContextModuleResult (upval), EnumsModule (upval), FriendRequestNicknamesIXP (upval), UseFriendRequestNicknamesResult (upval), AppPage (upval), ProfileId (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), NetworkingFriendsModule (upval), UseLocalUserIdResult (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval), setErrorToast (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonAddFriend, {
							buttonSurface = ButtonSurface,
							absolutePosition = UseProfileWrapperContextModuleResult.sourceInfo.homepageCarouselAbsolutePosition,
							isHomePageCarousel = UseProfileWrapperContextModuleResult.sourceInfo.source == EnumsModule.Sources.HomepageFriendsCarousel,
							isRecommendation = UseProfileWrapperContextModuleResult.sourceInfo.isRecommendation,
							source = UseProfileWrapperContextModuleResult.sourceInfo.source,
							contextualInfoType = UseProfileWrapperContextModuleResult.sourceInfo.contextualInfoType,
							recommendationContextType = UseProfileWrapperContextModuleResult.sourceInfo.recommendationContextType,
							recommendationRank = UseProfileWrapperContextModuleResult.sourceInfo.recommendationRank,
							recommendationSessionId = UseProfileWrapperContextModuleResult.sourceInfo.recommendationSessionId
						})
						
						if FriendRequestNicknamesIXP.FFlagFriendRequestNicknames and UseFriendRequestNicknamesResult then
							local config = {
								name = AppPage.SetNicknameModal,
								extraProps = {
									friendRequestParams = {
										targetUserId = ProfileId,
										source = UseProfileWrapperContextModuleResult.sourceInfo.friendshipOriginSourceType
									}
								}
							}
							
							return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else UseDispatchResult(NavigateDownFunction(config))
						else
							UseDispatchResult(SetCurrentToastMessageFunction({
								isLocalized = true,
								toastMessage = UseLocalizationResult.friendRequestSentToast,
								toastIcon = Images["icons/actions/friends/friendAdd"]
							}))
							
							return UseDispatchResult(NetworkingFriendsModule.RequestFriendshipFromUserId.API({
								targetUserId = ProfileId,
								currentUserId = UseLocalUserIdResult,
								friendshipOriginSourceType = UseProfileWrapperContextModuleResult.sourceInfo.friendshipOriginSourceType
							})):andThen(function()
								-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
								return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
							end):catch(function(Err)
								-- upvalues: setErrorToast (upval), EnumsModule (upval)
								setErrorToast(EnumsModule.ProfileActions.AddFriend, Err)
							end)
						end
					end
				},
				[EnumsModule.ProfileActions.AddFriendFromContacts] = {
					buttonType = ButtonType.PrimaryContextual,
					variant = ButtonVariant.Emphasis,
					text = UseLocalizationResult[EnumsModule.ProfileActions.AddFriendFromContacts],
					onActivated = function()
						-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), NetworkingFriendsModule (upval), UseLocalUserIdResult (upval), ProfileId (upval), ContextualInfoTypes (upval), RefreshProfilePlatformModule (upval), ProfileType (upval), EnumsModule (upval), setErrorToast (upval)
						UseDispatchResult(SetCurrentToastMessageFunction({
							isLocalized = true,
							toastMessage = UseLocalizationResult.friendRequestSentToast,
							toastIcon = Images["icons/actions/friends/friendAdd"]
						}))
						
						return UseDispatchResult(NetworkingFriendsModule.RequestFriendshipFromContactId.API({
							currentUserId = UseLocalUserIdResult,
							contactId = ProfileId,
							contextType = ContextualInfoTypes.Contacts
						})):andThen(function()
							-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), EnumsModule (upval)
							return UseDispatchResult(RefreshProfilePlatformModule({
								profileType = ProfileType,
								profileId = ProfileId,
								components = {
									EnumsModule.Components.ContactProfileHeader,
									EnumsModule.Components.Actions,
									EnumsModule.Components.ContactDescription
								}
							}))
						end):catch(function(Err)
							-- upvalues: setErrorToast (upval), EnumsModule (upval)
							setErrorToast(EnumsModule.ProfileActions.AddFriendFromContacts, Err)
						end)
					end
				},
				[EnumsModule.ProfileActions.AddFriendFromContactsSent] = {
					isDisabled = true,
					buttonType = ButtonType.Secondary,
					variant = ButtonVariant.Subtle,
					text = UseLocalizationResult[EnumsModule.ProfileActions.AddFriendFromContactsSent],
					onActivated = function() end
				},
				[EnumsModule.ProfileActions.Block] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.Block],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseNavigationResult (upval), AppPage (upval), ProfileId (upval), UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonBlock, { buttonSurface = ButtonSurface })
						UseNavigationResult.push(AppPage.BlockingModal, {
							navProps = {
								userId = ProfileId,
								onBlockSuccess = function()
									-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
									UseDispatchResult(SetCurrentToastMessageFunction({
										isLocalized = true,
										toastMessage = UseLocalizationResult.userBlockedToast,
										toastIcon = Images["icons/actions/block"]
									}))
									UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
								end
							}
						})
					end
				},
				[EnumsModule.ProfileActions.CannotAddFriend] = {
					isDisabled = true,
					text = UseLocalizationResult[EnumsModule.ProfileActions.CannotAddFriend],
					onActivated = function() end
				},
				[EnumsModule.ProfileActions.Chat] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.Chat],
					variant = ButtonVariant.Standard,
					onActivated = function()
						-- upvalues: ButtonSurface (upval), EnumsModule (upval), UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), UseDispatchResult (upval), EnteredChatFromEntryPointModule (upval), ChatEntryPointNames (upval), GuiService (upval), ProfileId (upval), NotificationTypeList (upval)
						if ButtonSurface == EnumsModule.ButtonSurface.ContextualMenu then
							UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonChat, { buttonSurface = ButtonSurface })
						else
							UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonChat, { buttonSurface = ButtonSurface })
						end
						UseDispatchResult(EnteredChatFromEntryPointModule(ChatEntryPointNames.ProfilePeekView))
						GuiService:BroadcastNotification(ProfileId, NotificationTypeList.LAUNCH_CONVERSATION)
					end
				},
				[EnumsModule.ProfileActions.EditAlias] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.EditAlias],
					onActivated = function()
						-- upvalues: SocialStopwatchModule (upval), UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseNavigationResult (upval), EnumsModule (upval), ProfileId (upval), SetAliasModule (upval)
						SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.CustomizeNameOpened)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonSetAlias, { buttonSurface = ButtonSurface })
						UseNavigationResult.navigate(EnumsModule.Screens.SetAliasModal, {
							profileUserId = ProfileId,
							origin = SetAliasModule.Analytics.EntryPoints.ContextualMenu
						})
					end
				},
				[EnumsModule.ProfileActions.EditAppearance] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = UseLocalizationResult[EnumsModule.ProfileActions.EditAppearance],
					variant = ButtonVariant.Emphasis,
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonEditAppearance, { buttonSurface = ButtonSurface })
					end
				} else nil,
				[EnumsModule.ProfileActions.EditAvatar] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.EditAvatar],
					icon = if FFlagProfilePlatformEnableEditAppearanceMenuModule then IconName.Person else nil,
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), FFlagProfilePlatformEnableEditAppearanceMenuModule (upval), EventNamesModule (upval), ButtonSurface (upval), EditAvatarFunction (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(if FFlagProfilePlatformEnableEditAppearanceMenuModule then EventNamesModule.EditAppearanceMenuEditAvatar else EventNamesModule.CTAButtonEditAvatar, { buttonSurface = ButtonSurface })
						EditAvatarFunction()
					end
				},
				[EnumsModule.ProfileActions.EditLook] = if FFlagProfilePlatformEnableEditLookModule then {
					text = UseLocalizationResult[EnumsModule.ProfileActions.EditLook],
					icon = IconName.Person,
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), EditAvatarFunction (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonEditLook, { buttonSurface = ButtonSurface })
						EditAvatarFunction()
					end
				} else nil,
				[EnumsModule.ProfileActions.EditEmotes] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = UseLocalizationResult[EnumsModule.ProfileActions.EditEmotes],
					icon = IconName.SquareFaceWavingHand,
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), EditEmotes (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.EditAppearanceMenuEditEmote, { buttonSurface = ButtonSurface })
						EditEmotes()
					end
				} else nil,
				[EnumsModule.ProfileActions.SwitchAvatar] = if FFlagProfilePlatformEnableEditAppearanceMenuModule then {
					text = UseLocalizationResult[EnumsModule.ProfileActions.SwitchAvatar],
					icon = IconName.PersonStandingArrowReverse,
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), SwitchAvatar (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.EditAppearanceMenuSwitchAvatar, { buttonSurface = ButtonSurface })
						SwitchAvatar()
					end
				} else nil,
				[EnumsModule.ProfileActions.EditBackground] = getEditBackgroundAction(),
				[EnumsModule.ProfileActions.EditProfile] = {
					component = FoundationModule.Button,
					buttonType = ButtonType.PrimarySystem,
					variant = ButtonVariant.Standard,
					text = UseLocalizationResult[EnumsModule.ProfileActions.EditProfile],
					onActivated = function()
						-- upvalues: SocialStopwatchModule (upval), UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseNavigationResult (upval), EnumsModule (upval), FFlagAXEnableProfileTab (upval), UseProfileWrapperContextModuleResult (upval), EditUsernameFunction (upval), UseDispatchResult (upval), RefreshProfilePlatformUserInfoModule (upval), ProfileId (upval), FFlagMoveInExperienceModeToEditProfile (upval)
						SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.EditProfileOpened)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonOpenEditProfilePage, { buttonSurface = ButtonSurface })
						UseNavigationResult.navigate(EnumsModule.Screens.EditProfilePage, {
							profileScreens = EnumsModule.Screens,
							fullBleed = if FFlagAXEnableProfileTab then UseProfileWrapperContextModuleResult.forceFullView == true else nil,
							navigateToEditUsername = function(ShowToast)
								-- upvalues: EditUsernameFunction (upval), UseDispatchResult (upval), RefreshProfilePlatformUserInfoModule (upval), ProfileId (upval)
								EditUsernameFunction({
									showToast = ShowToast,
									onUsernameChanged = function()
										-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformUserInfoModule (upval), ProfileId (upval)
										UseDispatchResult(RefreshProfilePlatformUserInfoModule(ProfileId))
									end
								})
							end,
							onIdentityChange = function()
								-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformUserInfoModule (upval), ProfileId (upval)
								UseDispatchResult(RefreshProfilePlatformUserInfoModule(ProfileId))
							end,
							onToggleInExperienceMode = if FFlagMoveInExperienceModeToEditProfile then function()
								-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformUserInfoModule (upval), ProfileId (upval), UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval)
								UseDispatchResult(RefreshProfilePlatformUserInfoModule(ProfileId))
								UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ToggleInExperienceModeButton, {})
							end else nil
						})
					end
				},
				[EnumsModule.ProfileActions.IgnoreFriendRequest] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.IgnoreFriendRequest],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseDispatchResult (upval), NetworkingFriendsModule (upval), ProfileId (upval), UseLocalUserIdResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonIgnoreFriendRequest, { buttonSurface = ButtonSurface })
						
						return UseDispatchResult(NetworkingFriendsModule.DeclineFriendRequestFromUserId.API({
							targetUserId = ProfileId,
							currentUserId = UseLocalUserIdResult
						})):andThen(function()
							-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
							UseDispatchResult(SetCurrentToastMessageFunction({
								isLocalized = true,
								toastMessage = UseLocalizationResult.friendRequestIgnoredToast,
								toastIcon = Images["icons/actions/reject"]
							}))
							
							return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
						end)
					end
				},
				[EnumsModule.ProfileActions.JoinExperience] = {
					buttonType = ButtonType.PrimaryContextual,
					variant = ButtonVariant.Emphasis,
					isLoading = UseJoinUserInExperienceResult.isLoading,
					isDisabled = not UseJoinUserInExperienceResult.isInExperience,
					text = UseLocalizationResult[EnumsModule.ProfileActions.JoinExperience],
					onActivated = function()
						-- upvalues: UseJoinUserInExperienceResult (upval)
						UseJoinUserInExperienceResult.joinExperience()
					end
				},
				[EnumsModule.ProfileActions.PendingFriendRequest] = {
					isDisabled = true,
					buttonType = ButtonType.Secondary,
					variant = ButtonVariant.Subtle,
					text = UseLocalizationResult[EnumsModule.ProfileActions.PendingFriendRequest],
					onActivated = function() end
				},
				[EnumsModule.ProfileActions.QrCode] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.QrCode],
					icon = IconName.SquaresGridQr,
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), QRCodePageFunction (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonShareProfileQRCode, { buttonSurface = ButtonSurface })
						QRCodePageFunction()
					end
				},
				[EnumsModule.ProfileActions.ShareProfile] = {
					component = FoundationModule.Button,
					buttonType = ButtonType.PrimarySystem,
					variant = ButtonVariant.Standard,
					text = UseLocalizationResult[EnumsModule.ProfileActions.ShareProfile],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), IsPolicyMatch (upval), Default (upval), Contexts (upval), UseMemoResult (upval), ProfileId (upval), UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), TextKeysModule (upval), UseProfileShareLinkResult (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonShareProfile, { buttonSurface = ButtonSurface })
						
						if IsPolicyMatch then
							Default:setClipboardText({
								context = Contexts.ProfileCard,
								text = string.format("%s/%s", UseMemoResult, ProfileId)
							})
							UseDispatchResult(SetCurrentToastMessageFunction({ toastMessage = TextKeysModule.LinkCopied }))
							
							return
						else
							UseProfileShareLinkResult.onActivated()
						end
					end
				},
				[EnumsModule.ProfileActions.Report] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.Report],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), ProfileType (upval), EnumsModule (upval), FFlagEnableAbuseReportRevampFlow (upval), FFlagEnableAbuseReportRevampProfileAndGroupModule (upval), AbuseVectorModule (upval), UseDispatchResult (upval), OpenDynamicAbuseReportModule (upval), ProfileId (upval), CloseCentralOverlayFunction (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval), AppPage (upval), Url (upval), TextKeysModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonReport, { buttonSurface = ButtonSurface })
						local v1: string? = nil
						
						if ProfileType == EnumsModule.ProfileTypes.User then
							v1 = "userprofile"
						elseif ProfileType == EnumsModule.ProfileTypes.Community then
							v1 = "group"
						end
						if FFlagEnableAbuseReportRevampFlow and FFlagEnableAbuseReportRevampProfileAndGroupModule then
							UseDispatchResult(OpenDynamicAbuseReportModule({
								abuseVector = if ProfileType == EnumsModule.ProfileTypes.Community then AbuseVectorModule.Group else AbuseVectorModule.UserProfile,
								targetId = ProfileId,
								onClose = function()
									-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
									UseDispatchResult(CloseCentralOverlayFunction())
									UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
								end
							}))
							
							return
						end
						local config = {
							name = AppPage.GenericWebPage,
							detail = `{Url.BASE_URL}abusereport/{v1}?id={ProfileId}`,
							extraProps = { titleKey = TextKeysModule.Report }
						}
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
							
							return
						else
							UseDispatchResult(NavigateDownFunction(config))
						end
					end
				},
				[EnumsModule.ProfileActions.Unblock] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.Unblock],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseDispatchResult (upval), MyUserBlockingNetworkingModule (upval), ProfileId (upval), UseLocalUserIdResult (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval), USERBLOCKINGERRORS (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonUnblock, { buttonSurface = ButtonSurface })
						
						return UseDispatchResult(MyUserBlockingNetworkingModule.UnblockUserById.API({ userId = ProfileId, currentUserId = UseLocalUserIdResult })):andThen(function()
							-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
							return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
						end):catch(function(Err)
							-- upvalues: USERBLOCKINGERRORS (upval), UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule (upval)
							if Err ~= nil and tonumber(Err.Body) == USERBLOCKINGERRORS.PARENT_BLOCKED_TARGET_USER_ERROR then
								UseDispatchResult(SetCurrentToastMessageFunction({
									isLocalized = true,
									toastMessage = UseLocalizationResult.unblockTargetParentManagedToast
								}))
								
								return
							end
							if Err ~= nil and tonumber(Err.Body) == USERBLOCKINGERRORS.UNBLOCK_TARGET_NOT_BLOCKED_ERROR then
								UseDispatchResult(SetCurrentToastMessageFunction({
									isLocalized = true,
									toastMessage = UseLocalizationResult.unblockTargetNotBlockedToast
								}))
								
								return
							end
							if FFlagProfilePlatformEnableBlockedOnPlatformUnblockErrorMessageModule and Err ~= nil and tonumber(Err.Body) == USERBLOCKINGERRORS.UNBLOCK_TARGET_BLOCKED_ON_PLATFORM then
								UseDispatchResult(SetCurrentToastMessageFunction({
									isLocalized = true,
									toastMessage = UseLocalizationResult.blockedOnPlatformToast
								}))
								
								return
							else
								UseDispatchResult(SetCurrentToastMessageFunction({
									isLocalized = true,
									toastMessage = UseLocalizationResult.somethingIsWrongToast
								}))
							end
						end)
					end
				},
				[EnumsModule.ProfileActions.Unfriend] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.Unfriend],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseDispatchResult (upval), NetworkingFriendsModule (upval), ProfileId (upval), UseLocalUserIdResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonUnfriend, { buttonSurface = ButtonSurface })
						
						return UseDispatchResult(NetworkingFriendsModule.UnfriendTargetUserId.API({
							targetUserId = ProfileId,
							currentUserId = UseLocalUserIdResult
						})):andThen(function()
							-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
							UseDispatchResult(SetCurrentToastMessageFunction({
								isLocalized = true,
								toastMessage = UseLocalizationResult.friendRemovedToast,
								toastIcon = Images["icons/actions/friends/friendRemove"]
							}))
							
							return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
						end)
					end
				},
				[EnumsModule.ProfileActions.CopyLink] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.CopyLink],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), Default (upval), Contexts (upval), ShareName (upval), ProfileId (upval), UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), TextKeysModule (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonCopyLink, { buttonSurface = ButtonSurface })
						Default:setClipboardText({
							context = Contexts.ProfileCard,
							text = string.format(ShareName, ProfileId)
						})
						UseDispatchResult(SetCurrentToastMessageFunction({ toastMessage = TextKeysModule.LinkCopied }))
					end
				},
				[EnumsModule.ProfileActions.JoinCommunity] = {
					buttonType = ButtonType.PrimaryContextual,
					variant = ButtonVariant.Emphasis,
					text = UseLocalizationResult[EnumsModule.ProfileActions.JoinCommunity],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseProfileWrapperContextModuleResult (upval), UseDispatchResult (upval), GroupsNetworkingModule (upval), ProfileId (upval), GetProfilePlatformModule (upval), ProfileType (upval), GetAvailableCommunityComponentsModule (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonJoinCommunity, {
							buttonSurface = ButtonSurface,
							btnContext = UseProfileWrapperContextModuleResult.sourceInfo.source
						})
						
						return UseDispatchResult(GroupsNetworkingModule.JoinGroup.API({ groupId = ProfileId })):andThen(function()
							-- upvalues: UseDispatchResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), GetAvailableCommunityComponentsModule (upval)
							UseDispatchResult(GetProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = ProfileType,
								profileId = ProfileId,
								components = GetAvailableCommunityComponentsModule()
							}))
						end)
					end
				},
				[EnumsModule.ProfileActions.CancelJoinCommunityRequest] = {
					buttonType = ButtonType.PrimarySystem,
					variant = ButtonVariant.Standard,
					text = UseLocalizationResult[EnumsModule.ProfileActions.CancelJoinCommunityRequest],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseProfileWrapperContextModuleResult (upval), UseDispatchResult (upval), GroupsNetworkingModule (upval), ProfileId (upval), UseLocalUserIdResult (upval), RefreshProfilePlatformModule (upval), ProfileType (upval), EnumsModule (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonCancelJoinCommunityRequest, {
							buttonSurface = ButtonSurface,
							btnContext = UseProfileWrapperContextModuleResult.sourceInfo.source
						})
						
						return UseDispatchResult(GroupsNetworkingModule.CancelJoinGroupRequest.API({ groupId = ProfileId, userId = UseLocalUserIdResult })):andThen(function()
							-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), EnumsModule (upval)
							UseDispatchResult(RefreshProfilePlatformModule({
								profileType = ProfileType,
								profileId = ProfileId,
								components = { EnumsModule.Components.Actions }
							}))
						end)
					end
				},
				[EnumsModule.ProfileActions.ViewCommunity] = {
					buttonType = ButtonType.PrimarySystem,
					variant = ButtonVariant.SubEmphasis,
					text = UseLocalizationResult[EnumsModule.ProfileActions.ViewCommunity],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseProfileWrapperContextModuleResult (upval), AppPage (upval), UrlBuilder (upval), ProfileId (upval), TextKeysModule (upval), UseDispatchResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), GetAvailableCommunityComponentsModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonViewCommunity, {
							buttonSurface = ButtonSurface,
							btnContext = UseProfileWrapperContextModuleResult.sourceInfo.source
						})
						local config = {
							name = AppPage.GenericWebPage,
							detail = UrlBuilder.user.group({ groupId = ProfileId }),
							extraProps = {
								titleKey = TextKeysModule.Community,
								onClose = function()
									-- upvalues: UseDispatchResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), GetAvailableCommunityComponentsModule (upval)
									UseDispatchResult(GetProfilePlatformModule.API({
										includeComponentOrdering = true,
										profileType = ProfileType,
										profileId = ProfileId,
										components = GetAvailableCommunityComponentsModule()
									}))
								end
							}
						}
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
							
							return
						else
							UseDispatchResult(NavigateDownFunction(config))
						end
					end
				},
				[EnumsModule.ProfileActions.ViewFullProfile] = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule then {
					buttonType = ButtonType.PrimarySystem,
					variant = ButtonVariant.SubEmphasis,
					text = UseLocalizationResult[EnumsModule.ProfileActions.ViewFullProfile],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseProfileWrapperContextModuleResult (upval), AppPage (upval), UrlBuilder (upval), UrlBase (upval), ProfileId (upval), TextKeysModule (upval), UseDispatchResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), GetAvailableCommunityComponentsModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonViewFullProfile, {
							buttonSurface = ButtonSurface,
							btnContext = UseProfileWrapperContextModuleResult.sourceInfo.source
						})
						local config = {
							name = AppPage.GenericWebPage,
							detail = UrlBuilder.new({ base = UrlBase.WWW, path = `profiles/{ProfileId}` })(),
							extraProps = {
								titleKey = TextKeysModule.Profile,
								onClose = function()
									-- upvalues: UseDispatchResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), GetAvailableCommunityComponentsModule (upval)
									UseDispatchResult(GetProfilePlatformModule.API({
										includeComponentOrdering = true,
										profileType = ProfileType,
										profileId = ProfileId,
										components = GetAvailableCommunityComponentsModule()
									}))
								end
							}
						}
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
							
							return
						else
							UseDispatchResult(NavigateDownFunction(config))
						end
					end
				} else nil,
				[EnumsModule.ProfileActions.LeaveCommunity] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.LeaveCommunity],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseProfileWrapperContextModuleResult (upval), UseDispatchResult (upval), GroupsNetworkingModule (upval), ProfileId (upval), UseLocalUserIdResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), GetAvailableCommunityComponentsModule (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonLeaveCommunity, {
							buttonSurface = ButtonSurface,
							btnContext = UseProfileWrapperContextModuleResult.sourceInfo.source
						})
						
						return UseDispatchResult(GroupsNetworkingModule.LeaveGroup.API({ groupId = ProfileId, userId = UseLocalUserIdResult })):andThen(function()
							-- upvalues: UseDispatchResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), GetAvailableCommunityComponentsModule (upval)
							UseDispatchResult(GetProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = ProfileType,
								profileId = ProfileId,
								components = GetAvailableCommunityComponentsModule()
							}))
						end)
					end
				},
				[EnumsModule.ProfileActions.MakePrimaryCommunity] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.MakePrimaryCommunity],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseProfileWrapperContextModuleResult (upval), UseDispatchResult (upval), GroupsNetworkingModule (upval), ProfileId (upval), RefreshProfilePlatformModule (upval), ProfileType (upval), EnumsModule (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonMakePrimaryCommunity, {
							buttonSurface = ButtonSurface,
							btnContext = UseProfileWrapperContextModuleResult.sourceInfo.source
						})
						
						return UseDispatchResult(GroupsNetworkingModule.MakePrimaryGroup.API({ groupId = ProfileId })):andThen(function()
							-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), EnumsModule (upval)
							UseDispatchResult(RefreshProfilePlatformModule({
								profileType = ProfileType,
								profileId = ProfileId,
								components = { EnumsModule.Components.Actions }
							}))
						end)
					end
				},
				[EnumsModule.ProfileActions.RemovePrimaryCommunity] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.RemovePrimaryCommunity],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseProfileWrapperContextModuleResult (upval), UseDispatchResult (upval), GroupsNetworkingModule (upval), RefreshProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), EnumsModule (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonRemovePrimaryCommunity, {
							buttonSurface = ButtonSurface,
							btnContext = UseProfileWrapperContextModuleResult.sourceInfo.source
						})
						
						return UseDispatchResult(GroupsNetworkingModule.RemovePrimaryGroup.API()):andThen(function()
							-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), EnumsModule (upval)
							UseDispatchResult(RefreshProfilePlatformModule({
								profileType = ProfileType,
								profileId = ProfileId,
								components = { EnumsModule.Components.Actions }
							}))
						end)
					end
				},
				[EnumsModule.ProfileActions.Follow] = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule and ProfileType == EnumsModule.ProfileTypes.Community then {
					buttonType = ButtonType.PrimaryContextual,
					variant = ButtonVariant.Standard,
					text = UseLocalizationResult[EnumsModule.ProfileActions.Follow],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseDispatchResult (upval), GroupsNetworkingModule (upval), ProfileId (upval), GetProfilePlatformModule (upval), ProfileType (upval), GetAvailableCommunityComponentsModule (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonFollow, { buttonSurface = ButtonSurface })
						
						return UseDispatchResult(GroupsNetworkingModule.JoinGroup.API({ groupId = ProfileId })):andThen(function()
							-- upvalues: UseDispatchResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), GetAvailableCommunityComponentsModule (upval)
							UseDispatchResult(GetProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = ProfileType,
								profileId = ProfileId,
								components = GetAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[EnumsModule.ProfileActions.Unfollow] = if FFlagProfilePlatformUpdateUXForNonSocialCommunitiesModule and ProfileType == EnumsModule.ProfileTypes.Community then {
					text = UseLocalizationResult[EnumsModule.ProfileActions.Unfollow],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseDispatchResult (upval), GroupsNetworkingModule (upval), ProfileId (upval), UseLocalUserIdResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), GetAvailableCommunityComponentsModule (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonUnfollow, { buttonSurface = ButtonSurface })
						
						return UseDispatchResult(GroupsNetworkingModule.LeaveGroup.API({ groupId = ProfileId, userId = UseLocalUserIdResult })):andThen(function()
							-- upvalues: UseDispatchResult (upval), GetProfilePlatformModule (upval), ProfileType (upval), ProfileId (upval), GetAvailableCommunityComponentsModule (upval)
							UseDispatchResult(GetProfilePlatformModule.API({
								includeComponentOrdering = true,
								profileType = ProfileType,
								profileId = ProfileId,
								components = GetAvailableCommunityComponentsModule()
							}))
						end)
					end
				} else nil,
				[EnumsModule.ProfileActions.RemoveTrustedConnection] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.RemoveTrustedConnection],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), GetResult (upval), ProfileId (upval), UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonRemoveTrustedConnection, { buttonSurface = ButtonSurface })
						
						return GetResult.removeTrustedConnectionRequest(ProfileId):andThen(function()
							-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), Images (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
							UseDispatchResult(SetCurrentToastMessageFunction({
								isLocalized = true,
								toastMessage = UseLocalizationResult.trustedConnectionRemovedToast,
								toastIcon = Images["icons/actions/friends/friendRemove"]
							}))
							
							return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
						end)
					end
				},
				[EnumsModule.ProfileActions.AddTrustedConnection] = if FFlagProfilePlatformAddTC then {
					text = UseLocalizationResult[EnumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseNavigationResult (upval), AppPage (upval), ProfileId (upval), Sources (upval), UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonAddTrustedConnection, { buttonSurface = ButtonSurface })
						UseNavigationResult.push(AppPage.TrustedContactsModal, {
							props = {
								userId = ProfileId,
								source = Sources.ProfilePlatform,
								onRequestSent = function()
									-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
									return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
								end
							}
						})
					end
				} else nil,
				[EnumsModule.ProfileActions.AddTrustedConnectionViaLink] = {
					text = UseLocalizationResult[EnumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), Sources (upval), UseNavigationResult (upval), AppPage (upval), ProfileId (upval), UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonAddTrustedConnection, {
							buttonSurface = ButtonSurface,
							modalVariantOverride = Sources.ShareLinkSender
						})
						UseNavigationResult.push(AppPage.TrustedContactsModal, {
							props = {
								userId = ProfileId,
								source = Sources.ProfilePlatform,
								modalVariantOverride = Sources.ShareLinkSender,
								onRequestSent = function()
									-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
									return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
								end
							}
						})
					end
				},
				[EnumsModule.ProfileActions.AddIncomingTrustedConnection] = if FFlagProfilePlatformAddTC then {
					text = UseLocalizationResult[EnumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseNavigationResult (upval), AppPage (upval), ProfileId (upval), UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonAddIncomingTrustedConnection, { buttonSurface = ButtonSurface })
						UseNavigationResult.push(AppPage.TrustedContactsModal, {
							props = {
								userId = ProfileId,
								onRequestAccepted = function()
									-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
									return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
								end
							}
						})
					end
				} else nil,
				[EnumsModule.ProfileActions.PendingTrustedConnection] = if FFlagProfilePlatformAddTC then {
					isDisabled = true,
					text = UseLocalizationResult[EnumsModule.ProfileActions.AddTrustedConnection],
					onActivated = function() end
				} else nil,
				[EnumsModule.ProfileActions.PendingIncomingTrustedConnection] = if FFlagPendingIncomingTrustedConnectionModule then {
					isDisabled = true,
					text = UseLocalizationResult[EnumsModule.ProfileActions.AddIncomingTrustedConnection],
					onActivated = function() end
				} else nil,
				[EnumsModule.ProfileActions.ViewAbout] = if FFlagProfilePlatformNewProfileHeader then {
					text = UseLocalizationResult[EnumsModule.ProfileActions.ViewAbout],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), UseProfileWrapperContextModuleResult (upval), AppPage (upval), AboutSections (upval), FFlagProfileAboutDetailsUseSheet (upval), ProfileName (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonViewFullProfile, {
							buttonSurface = ButtonSurface,
							btnContext = UseProfileWrapperContextModuleResult.sourceInfo.source
						})
						local config = {
							name = AppPage.AboutDetailsSheet,
							extraProps = {
								sections = AboutSections,
								profileName = if FFlagProfileAboutDetailsUseSheet then ProfileName else nil
							}
						}
						
						if FFlagSignalsNavP3Dispatch then
							NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
							
							return
						else
							UseDispatchResult(NavigateDownFunction(config))
						end
					end
				} else nil,
				[EnumsModule.ProfileActions.ViewPlatformProfile] = if FFlagEnablePlatformProfileContextualMenuOption then {
					text = UseLocalizationResult[EnumsModule.ProfileActions.ViewPlatformProfile],
					onActivated = function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), ButtonSurface (upval), GetPlatformFriendsServiceModule (upval), ProfilePlatformId (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonViewPlatformProfile, { buttonSurface = ButtonSurface })
						GetPlatformFriendsServiceModule:ShowProfile(ProfilePlatformId)
					end
				} else nil,
				[EnumsModule.ProfileActions.CurrencyTransfer] = if FFlagProfilePlatformEnableCurrencyTransfer then {
					text = UseLocalizationResult[EnumsModule.ProfileActions.CurrencyTransfer],
					onActivated = function()
						-- upvalues: ButtonSurface (upval), EnumsModule (upval), UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), NavigateToTransfer (upval), ProfileId (upval), TransferDirection (upval), TransferOrigination (upval)
						if ButtonSurface == EnumsModule.ButtonSurface.ContextualMenu then
							UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButtonCurrencyTransfer, { buttonSurface = ButtonSurface })
						else
							UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CTAButtonCurrencyTransfer, { buttonSurface = ButtonSurface })
						end
						if NavigateToTransfer then
							NavigateToTransfer({
								recipientUserId = ProfileId,
								direction = TransferDirection.Send,
								transferOrigination = TransferOrigination.Profile
							})
						end
					end
				} else nil
			}
		end
		local t = {}
		
		for i, value in ProfileActionsModule do
			local v1 = value(Config)
			
			if v1 ~= nil then
				t[i] = v1
			end
		end
		return t
	end, {
		UseDispatchResult, ProfileId, UseProfileWrapperContextModuleResult,
		if FFlagProfilePlatformEnableCurrencyTransfer then NavigateToTransfer else nil,
		QRCodePageFunction, UseLocalizationResult, UseLocalUserIdResult,
		UseNavigationResult, EditUsernameFunction,
		UseJoinUserInExperienceResult.joinExperience,
		UseJoinUserInExperienceResult.isLoading,
		UseProfileAnalyticsContextModuleResult, UseFriendRequestNicknamesResult,
		ButtonSurface,
		if FFlagProfilePlatformNewProfileHeader then AboutSections else nil,
		if FFlagProfileAboutDetailsUseSheet then ProfileName else nil, ProfileType,
		EditAvatarFunction,
		if FFlagProfilePlatformEnableEditAppearanceMenuModule then EditEmotes else nil,
		if FFlagProfilePlatformEnableEditAppearanceMenuModule then SwitchAvatar else nil,
		if FFlagProfilePlatformCTAsRefactorModule then UseMemoResult else nil,
		if FFlagProfilePlatformCTAsRefactorModule then UseJoinUserInExperienceResult.isInExperience else nil,
		if FFlagProfilePlatformCTAsRefactorModule then Config else nil,
		if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then UseActionsComponentRequestModuleResult else nil
	}))
end
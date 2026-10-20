local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local View = require(Parent.Foundation).View
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local SocialIdentityContainerModule = require(ProfilePlatform.Components.UserProfileHeader.SocialIdentityContainer)
local ContextualInformationModule = require(ProfilePlatform.Components.UserProfileHeader.ContextualInformation)
local SocialChipCountsRowContainer = require(ProfilePlatform.Components.UserProfileHeader.SocialChipCountsRow).SocialChipCountsRowContainer
local UserProfileAvatarModule = require(ProfilePlatform.Components.UserProfileHeader.UserProfileAvatar)
local UserProfileSettingsToggleModule = require(ProfilePlatform.Components.UserProfileHeader.UserProfileSettingsToggle)
local AvatarHeadshotComponentModule = require(ProfilePlatform.Components.UserProfileHeader.AvatarHeadshotComponent)
local InspectAvatarTooltipModule = require(ProfilePlatform.Components.InspectAvatar.InspectAvatarTooltip)
local FFlagMoveInExperienceModeToEditProfile = require(Parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local DisableStreamerModeToggle = game:DefineFastFlag("DisableStreamerModeToggle", false)
local FFlagProfilePlatformNewProfileHeader = SharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local FFlagSwitchProfileWidthHookToSocialCommon = SharedFlagsModule.FFlagSwitchProfileWidthHookToSocialCommon
local FFlagAddPlatformNameToProfileHeader = SharedFlagsModule.FFlagAddPlatformNameToProfileHeader
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local UseProfileCardWidthModule = require(ProfilePlatform.Hooks.useProfileCardWidth)
local UseProfileCardWidthFunction = require(Parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local UseShouldShowContextualInformationModule = require(ProfilePlatform.Hooks.useShouldShowContextualInformation)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseShouldResizeAvatarModule = require(ProfilePlatform.Hooks.useShouldResizeAvatar)
local FFlagProfilePlatformMeTabMobileProfileHero = SharedFlagsModule.FFlagProfilePlatformMeTabMobileProfileHero
local PresenceModule = require(ProfilePlatform.Rodux.Presence)
local ConvertPresenceEnumModule = require(ProfilePlatform.Utils.convertPresenceEnum)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectOnMountFunction = RoactUtilsModule.Hooks.useEffectOnMount
local NetworkingPresenceModule = require(ProfilePlatform.Networking.NetworkingPresence)
local FFlagSocialEnableProfileInspectAndBuy = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local FFlagProfileInspectAvatarCWEntryModule = require(ProfilePlatform.Flags.FFlagProfileInspectAvatarCWEntry)
local FFlagSocialEnableProfileInspectAndBuyAnalytics = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics
local FFlagEnableSocialTabsPage = require(Parent.SharedFlags).FFlagEnableSocialTabsPage
local FFlagProfilePlatformPresenceStoreMigrationModule = require(ProfilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local UseGetPresenceByUserId = if FFlagProfilePlatformPresenceStoreMigrationModule then require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local GetResult = if FFlagProfilePlatformPresenceStoreMigrationModule then require(Parent.DataHydration).Presence.PresenceStore.get() else nil
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local config = { skipFetch = true }

return function(p1)
	-- upvalues: FFlagSocialEnableProfileInspectAndBuy (copy), UseLocalUserIdFunction (copy), UseNavigationFunction (copy), ReactModule (copy), FFlagSocialEnableProfileInspectAndBuyAnalytics (copy), UseProfileAnalyticsContextModule (copy), UseProfileWrapperContextModule (copy), EventNamesModule (copy), EnumsModule (copy), FFlagProfilePlatformNewProfileHeader (copy), UseProfileFormFactorModule (copy), FFlagSwitchProfileWidthHookToSocialCommon (copy), UseProfileCardWidthFunction (copy), UseProfileCardWidthModule (copy), FFlagProfilePlatformPresenceStoreMigrationModule (copy), UseEffectOnMountFunction (copy), GetResult (copy), UseGetPresenceByUserId (copy), config (copy), ConvertPresenceEnumModule (copy), PresenceModule (copy), UseDispatchFunction (copy), NetworkingPresenceModule (copy), UseSelectorFunction (copy), UseShouldShowContextualInformationModule (copy), FFlagProfilePlatformMeTabMobileProfileHero (copy), UseShouldResizeAvatarModule (copy), ConstantsModule (copy), View (copy), UserProfileAvatarModule (copy), FFlagProfileInspectAvatarCWEntryModule (copy), InspectAvatarTooltipModule (copy), AvatarHeadshotComponentModule (copy), FFlagAddPlatformNameToProfileHeader (copy), ContextualInformationModule (copy), SocialChipCountsRowContainer (copy), FFlagEnableSocialTabsPage (copy), SocialIdentityContainerModule (copy), FFlagMoveInExperienceModeToEditProfile (copy), DisableStreamerModeToggle (copy), UserProfileSettingsToggleModule (copy)
	local UserThumbnail = p1.userThumbnail
	local IsPeekView: boolean? = nil
	local Height = nil
	local LayoutVariant = nil
	local v1 = false
	local UserPresenceType = nil
	local UseLocalUserIdResult = if FFlagSocialEnableProfileInspectAndBuy then UseLocalUserIdFunction() else nil
	local IsTextMatch = if FFlagSocialEnableProfileInspectAndBuy then tostring(p1.userId) == tostring(UseLocalUserIdResult) else nil
	local UseNavigationResult = if FFlagSocialEnableProfileInspectAndBuy then UseNavigationFunction() else nil
	local UseRefResult = if FFlagSocialEnableProfileInspectAndBuy then ReactModule.useRef(nil) else nil
	local UseRefResult1 = if FFlagSocialEnableProfileInspectAndBuy then ReactModule.useRef(nil) else nil
	local UseProfileAnalyticsContextModuleResult = if FFlagSocialEnableProfileInspectAndBuyAnalytics then UseProfileAnalyticsContextModule() else nil
	local ProfileSessionId = if FFlagSocialEnableProfileInspectAndBuyAnalytics then UseProfileWrapperContextModule().profileSessionId else nil
	local UseResult = if FFlagSocialEnableProfileInspectAndBuy then ReactModule.useCallback(function()
		-- upvalues: FFlagSocialEnableProfileInspectAndBuyAnalytics (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), ProfileSessionId (copy), UseRefResult1 (copy), UseNavigationResult (copy), EnumsModule (upval)
		if FFlagSocialEnableProfileInspectAndBuyAnalytics then
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.InspectAvatarOpened, { profileSessionId = ProfileSessionId })
		end
		if UseRefResult1.current then
			UseRefResult1.current.onDismiss()
		end
		UseNavigationResult.navigate(EnumsModule.Screens.InspectAvatarSheet)
	end, {
		UseProfileAnalyticsContextModuleResult,
		ProfileSessionId,
		UseNavigationResult,
		UseRefResult1
	}) else nil
	
	if FFlagProfilePlatformNewProfileHeader then
		local UseProfileFormFactorModuleResult = UseProfileFormFactorModule()
		IsPeekView = UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.PeekView
		local IsFormFactorMatch = UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.Wide
		local UseProfileCardWidthResult = if FFlagSwitchProfileWidthHookToSocialCommon then UseProfileCardWidthFunction() else UseProfileCardWidthModule(IsFormFactorMatch)
		local ProfileId = UseProfileWrapperContextModule().profileId
		
		if FFlagProfilePlatformPresenceStoreMigrationModule then
			UseEffectOnMountFunction(function()
				-- upvalues: GetResult (upval), ProfileId (copy)
				GetResult.RefreshPresenceByUserId((tostring(ProfileId)))
			end)
			local UseGetPresenceByUserIdResult = UseGetPresenceByUserId(ProfileId, config)
			UserPresenceType = ConvertPresenceEnumModule(if UseGetPresenceByUserIdResult then UseGetPresenceByUserIdResult.userPresenceType else PresenceModule.Enums.PresenceType.Offline, if UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.universeId ~= "" then tonumber(UseGetPresenceByUserIdResult.universeId) else nil)
		else
			local UseDispatchResult = UseDispatchFunction()
			UseEffectOnMountFunction(function()
				-- upvalues: UseDispatchResult (copy), NetworkingPresenceModule (upval), ProfileId (copy)
				UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API({ ProfileId })):catch(function(_) end)
			end)
			local UseSelectorResult = UseSelectorFunction(function(p2)
				-- upvalues: PresenceModule (upval), ProfileId (copy)
				return PresenceModule.Selectors.getUserPresenceByUserId(p2, ProfileId) or {
					lastLocation = "",
					userPresenceType = PresenceModule.Enums.PresenceType.Offline
				}
			end)
			UserPresenceType = ConvertPresenceEnumModule(UseSelectorResult.userPresenceType, UseSelectorResult.universeId)
		end
		v1 = UseShouldShowContextualInformationModule(UserPresenceType)
		local UseShouldResizeAvatarModuleResult = if FFlagProfilePlatformMeTabMobileProfileHero then UseShouldResizeAvatarModule() else false
		Height = if FFlagProfilePlatformMeTabMobileProfileHero and UseShouldResizeAvatarModuleResult then UseProfileCardWidthResult * (ConstantsModule.ME_TAB_MOBILE_AVATAR_HEIGHT_ASPECT + ConstantsModule.ME_TAB_MOBILE_TOP_BACKGROUND_INSET_RATIO) else UseProfileCardWidthResult * 0.75
		LayoutVariant = if FFlagProfilePlatformMeTabMobileProfileHero and UseShouldResizeAvatarModuleResult then EnumsModule.ProfileAvatarLayoutVariant.MeTabMobile else nil
	end
	return if FFlagProfilePlatformNewProfileHeader then ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y",
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder
	}, {
		UserProfileAvatar = if FFlagSocialEnableProfileInspectAndBuy and not IsTextMatch then ReactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 0, Height or 0),
			BackgroundTransparency = 1,
			Text = "",
			LayoutOrder = 1,
			[ReactModule.Event.Activated] = UseResult
		}, {
			Avatar = ReactModule.createElement(UserProfileAvatarModule, {
				layoutOrder = 1,
				userThumbnail = UserThumbnail,
				userId = p1.userId,
				isPeekView = IsPeekView,
				height = Height,
				layoutVariant = LayoutVariant
			}),
			TooltipAnchor = if FFlagProfileInspectAvatarCWEntryModule then nil else ReactModule.createElement(View, {
				tag = "position-center-center anchor-center-center size-50",
				BackgroundTransparency = 1,
				ref = UseRefResult
			}),
			Tooltip = if FFlagProfileInspectAvatarCWEntryModule then nil else ReactModule.createElement(InspectAvatarTooltipModule, { anchorRef = UseRefResult, ref = UseRefResult1 })
		}) else ReactModule.createElement(UserProfileAvatarModule, {
			layoutOrder = 1,
			userThumbnail = UserThumbnail,
			userId = p1.userId,
			isPeekView = IsPeekView,
			height = Height,
			layoutVariant = LayoutVariant
		}),
		AvatarHeadshotContainer = ReactModule.createElement(View, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			tag = { ["size-full-0 auto-y"] = true }
		}, {
			AvatarHeadshotComponent = ReactModule.createElement(AvatarHeadshotComponentModule, {
				layoutOrder = 1,
				userId = tostring(p1.userId),
				primaryName = p1.primaryName,
				username = p1.username,
				userPresenceType = UserPresenceType,
				isPremium = p1.isPremium,
				isVerified = p1.isVerified,
				isRobloxAdmin = p1.isRobloxAdmin,
				platformName = if FFlagAddPlatformNameToProfileHeader then p1.platformName else nil
			})
		}),
		ContextualInformation = if v1 then ReactModule.createElement(ContextualInformationModule, { layoutOrder = 3, size = UDim2.fromScale(1, 0) }) else nil,
		SocialCountsRow = if p1.shouldDisplayCounts then ReactModule.createElement(SocialChipCountsRowContainer, {
			layoutOrder = 4,
			size = UDim2.fromScale(1, 0),
			title = if FFlagEnableSocialTabsPage then `@{p1.username}` else nil
		}) else nil
	}) else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, ConstantsModule.USER_PROFILE_HEADER_HEIGHT),
		LayoutOrder = p1.layoutOrder
	}, {
		UserProfileAvatar = if FFlagSocialEnableProfileInspectAndBuy and not IsTextMatch then ReactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			[ReactModule.Event.Activated] = UseResult
		}, {
			Avatar = ReactModule.createElement(UserProfileAvatarModule, { userThumbnail = UserThumbnail, userId = p1.userId }),
			TooltipAnchor = if FFlagProfileInspectAvatarCWEntryModule then nil else ReactModule.createElement(View, {
				tag = "position-center-center anchor-center-center size-50",
				BackgroundTransparency = 1,
				ref = UseRefResult
			}),
			Tooltip = if FFlagProfileInspectAvatarCWEntryModule then nil else ReactModule.createElement(InspectAvatarTooltipModule, { anchorRef = UseRefResult, ref = UseRefResult1 })
		}) else ReactModule.createElement(UserProfileAvatarModule, { userThumbnail = UserThumbnail, userId = p1.userId }),
		ProfileTextFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 10,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}, {
			UIListLayoutOrder = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 8)
			}),
			SocialIdentity = ReactModule.createElement(SocialIdentityContainerModule, {
				layoutOrder = 1,
				size = UDim2.fromScale(1, 0),
				primaryName = p1.primaryName,
				username = p1.username,
				isPremium = p1.isPremium,
				isVerified = p1.isVerified,
				isRobloxAdmin = p1.isRobloxAdmin,
				isEdited = p1.isEdited,
				openEditName = p1.openEditName,
				platformName = if FFlagAddPlatformNameToProfileHeader then p1.platformName else nil
			}),
			UserProfileSettingsToggle = if FFlagMoveInExperienceModeToEditProfile or (DisableStreamerModeToggle or not p1.shouldDisplayUserProfileSettings) then nil else ReactModule.createElement(UserProfileSettingsToggleModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 0, 30),
				isInExperienceNameEnabled = p1.isInExperienceNameEnabled
			}),
			ContextualInformation = ReactModule.createElement(ContextualInformationModule, {
				size = UDim2.fromScale(1, 0),
				layoutOrder = if FFlagMoveInExperienceModeToEditProfile then 2 else 3
			}),
			SocialCountsRow = if p1.shouldDisplayCounts then ReactModule.createElement(SocialChipCountsRowContainer, {
				size = UDim2.fromScale(1, 0),
				layoutOrder = if FFlagMoveInExperienceModeToEditProfile then 3 else 4,
				title = if FFlagEnableSocialTabsPage then `@{p1.username}` else nil
			}) else nil
		})
	})
end
local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local view = require(parent.Foundation).View
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)
local socialIdentityContainerModule = require(profilePlatform.Components.UserProfileHeader.SocialIdentityContainer)
local contextualInformationModule = require(profilePlatform.Components.UserProfileHeader.ContextualInformation)
local socialChipCountsRowContainer = require(profilePlatform.Components.UserProfileHeader.SocialChipCountsRow).SocialChipCountsRowContainer
local userProfileAvatarModule = require(profilePlatform.Components.UserProfileHeader.UserProfileAvatar)
local userProfileSettingsToggleModule = require(profilePlatform.Components.UserProfileHeader.UserProfileSettingsToggle)
local avatarHeadshotComponentModule = require(profilePlatform.Components.UserProfileHeader.AvatarHeadshotComponent)
local inspectAvatarTooltipModule = require(profilePlatform.Components.InspectAvatar.InspectAvatarTooltip)
local fFlagMoveInExperienceModeToEditProfile = require(parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local disableStreamerModeToggle = game:DefineFastFlag("DisableStreamerModeToggle", false)
local fFlagProfilePlatformNewProfileHeader = sharedFlagsModule.FFlagProfilePlatformNewProfileHeader
local fFlagSwitchProfileWidthHookToSocialCommon = sharedFlagsModule.FFlagSwitchProfileWidthHookToSocialCommon
local fFlagAddPlatformNameToProfileHeader = sharedFlagsModule.FFlagAddPlatformNameToProfileHeader
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local useProfileCardWidthModule = require(profilePlatform.Hooks.useProfileCardWidth)
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local useShouldShowContextualInformationModule = require(profilePlatform.Hooks.useShouldShowContextualInformation)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useShouldResizeAvatarModule = require(profilePlatform.Hooks.useShouldResizeAvatar)
local fFlagProfilePlatformMeTabMobileProfileHero = sharedFlagsModule.FFlagProfilePlatformMeTabMobileProfileHero
local presenceModule = require(profilePlatform.Rodux.Presence)
local convertPresenceEnumModule = require(profilePlatform.Utils.convertPresenceEnum)
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffectOnMount = roactUtilsModule.Hooks.useEffectOnMount
local networkingPresenceModule = require(profilePlatform.Networking.NetworkingPresence)
local fFlagSocialEnableProfileInspectAndBuy = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuy
local fFlagSocialEnableProfileInspectAndBuyAnalytics = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics
local fFlagEnableSocialTabsPage = require(parent.SharedFlags).FFlagEnableSocialTabsPage
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local var1 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var2 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
local useNavigation = require(parent.Navigation).useNavigation
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local t = { skipFetch = true }

return function(p1)
	-- upvalues: fFlagSocialEnableProfileInspectAndBuy (ref), useLocalUserId (ref), useNavigation (ref), reactModule (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), useProfileAnalyticsContextModule (ref), useProfileWrapperContextModule (ref), eventNamesModule (ref), enumsModule (ref), fFlagProfilePlatformNewProfileHeader (ref), useProfileFormFactorModule (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useEffectOnMount (ref), var2 (ref), var1 (ref), t (ref), convertPresenceEnumModule (ref), presenceModule (ref), useDispatch (ref), networkingPresenceModule (ref), useSelector (ref), useShouldShowContextualInformationModule (ref), fFlagProfilePlatformMeTabMobileProfileHero (ref), useShouldResizeAvatarModule (ref), constantsModule (ref), view (ref), userProfileAvatarModule (ref), inspectAvatarTooltipModule (ref), avatarHeadshotComponentModule (ref), fFlagAddPlatformNameToProfileHeader (ref), contextualInformationModule (ref), socialChipCountsRowContainer (ref), fFlagEnableSocialTabsPage (ref), socialIdentityContainerModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), disableStreamerModeToggle (ref), userProfileSettingsToggleModule (ref)
	local var3
	local userThumbnail = p1.userThumbnail
	local var4 = nil
	local var5 = nil
	local var6 = nil
	local var7 = false
	local var8 = nil
	local var9 = if fFlagSocialEnableProfileInspectAndBuy then useLocalUserId() else nil
	
	if fFlagSocialEnableProfileInspectAndBuy then
		var3 = tostring(p1.userId) == tostring(var9)
		var3 = nil
	else
		var3 = nil
	end
	local var10
	local var11 = if fFlagSocialEnableProfileInspectAndBuy then useNavigation() else nil
	local var12 = if fFlagSocialEnableProfileInspectAndBuy then reactModule.useRef(nil) else nil
	local var13 = if fFlagSocialEnableProfileInspectAndBuy then reactModule.useRef(nil) else nil
	local var14 = if fFlagSocialEnableProfileInspectAndBuyAnalytics then useProfileAnalyticsContextModule() else nil
	local var15 = if fFlagSocialEnableProfileInspectAndBuyAnalytics then useProfileWrapperContextModule().profileSessionId else nil
	local var16 = if fFlagSocialEnableProfileInspectAndBuy then reactModule.useCallback(function()
		-- upvalues: fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var14 (ref), eventNamesModule (copy), var15 (ref), var13 (ref), var11 (ref), enumsModule (copy)
		if fFlagSocialEnableProfileInspectAndBuyAnalytics then
			var14.fireAnalyticsEvent(eventNamesModule.InspectAvatarOpened, { profileSessionId = var15 })
		end
		if var13.current then
			var13.current.onDismiss()
		end
		var11.navigate(enumsModule.Screens.InspectAvatarSheet)
	end, { var14, var15, var11, var13 }) else nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var17 = useProfileFormFactorModule()
		var4 = var17.formFactor == enumsModule.ProfileFormFactor.PeekView
		local var18 = if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var17.formFactor == enumsModule.ProfileFormFactor.Wide)
		local profileId = useProfileWrapperContextModule().profileId
		
		if fFlagProfilePlatformPresenceStoreMigrationModule then
			useEffectOnMount(function()
				-- upvalues: var2 (copy), profileId (ref)
				var2.RefreshPresenceByUserId(tostring(profileId))
			end)
			var10 = var1(profileId, t)
			var8 = convertPresenceEnumModule(if var10 then var10.userPresenceType else presenceModule.Enums.PresenceType.Offline, if var10 and var10.universeId ~= "" then tonumber(var10.universeId) else nil)
		else
			local var19 = useDispatch()
			useEffectOnMount(function()
				-- upvalues: var19 (ref), networkingPresenceModule (copy), profileId (ref)
				var19(networkingPresenceModule.GetPresencesFromUserIds.API({ profileId })):catch(function(_) end)
			end)
			local var20 = useSelector(function(p2)
				-- upvalues: presenceModule (copy), profileId (ref)
				return presenceModule.Selectors.getUserPresenceByUserId(p2, profileId) or {
					lastLocation = "",
					userPresenceType = presenceModule.Enums.PresenceType.Offline
				}
			end)
			var8 = convertPresenceEnumModule(var20.userPresenceType, var20.universeId)
		end
		var7 = useShouldShowContextualInformationModule(var8)
		var10 = if fFlagProfilePlatformMeTabMobileProfileHero then useShouldResizeAvatarModule() else false
		var5 = if fFlagProfilePlatformMeTabMobileProfileHero and var10 then var18 * (constantsModule.ME_TAB_MOBILE_AVATAR_HEIGHT_ASPECT + constantsModule.ME_TAB_MOBILE_TOP_BACKGROUND_INSET_RATIO) else var18 * 0.75
		var6 = if fFlagProfilePlatformMeTabMobileProfileHero and var10 then enumsModule.ProfileAvatarLayoutVariant.MeTabMobile else nil
	end
	if fFlagProfilePlatformNewProfileHeader then
		return reactModule.createElement(view, {
			tag = "col gap-large size-full-0 auto-y",
			BackgroundTransparency = 1,
			LayoutOrder = p1.layoutOrder
		}, {
			UserProfileAvatar = if fFlagSocialEnableProfileInspectAndBuy and not var3 then reactModule.createElement("TextButton", {
				Size = UDim2.new(1, 0, 0, var5 or 0),
				BackgroundTransparency = 1,
				Text = "",
				LayoutOrder = 1,
				[reactModule.Event.Activated] = var16
			}, {
				Avatar = reactModule.createElement(userProfileAvatarModule, {
					layoutOrder = 1,
					userThumbnail = userThumbnail,
					userId = p1.userId,
					isPeekView = var4,
					height = var5,
					layoutVariant = var6
				}),
				TooltipAnchor = reactModule.createElement(view, {
					tag = "position-center-center anchor-center-center size-50",
					BackgroundTransparency = 1,
					ref = var12
				}),
				Tooltip = reactModule.createElement(inspectAvatarTooltipModule, { anchorRef = var12, ref = var13 })
			}) else reactModule.createElement(userProfileAvatarModule, {
				layoutOrder = 1,
				userThumbnail = userThumbnail,
				userId = p1.userId,
				isPeekView = var4,
				height = var5,
				layoutVariant = var6
			}),
			AvatarHeadshotContainer = reactModule.createElement(view, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				tag = { ["size-full-0 auto-y"] = true }
			}, {
				AvatarHeadshotComponent = reactModule.createElement(avatarHeadshotComponentModule, {
					layoutOrder = 1,
					userId = tostring(p1.userId),
					primaryName = p1.primaryName,
					username = p1.username,
					userPresenceType = var8,
					isPremium = p1.isPremium,
					isVerified = p1.isVerified,
					isRobloxAdmin = p1.isRobloxAdmin,
					platformName = if fFlagAddPlatformNameToProfileHeader then p1.platformName else nil
				})
			}),
			ContextualInformation = if var7 then reactModule.createElement(contextualInformationModule, { layoutOrder = 3, size = UDim2.fromScale(1, 0) }) else nil,
			SocialCountsRow = if p1.shouldDisplayCounts then reactModule.createElement(socialChipCountsRowContainer, {
				layoutOrder = 4,
				size = UDim2.fromScale(1, 0),
				title = if fFlagEnableSocialTabsPage then `@{p1.username}` else nil
			}) else nil
		})
	end
	local createElement = reactModule.createElement
	local var21 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constantsModule.USER_PROFILE_HEADER_HEIGHT),
		LayoutOrder = p1.layoutOrder
	}
	local t_2 = {
		UserProfileAvatar = if fFlagSocialEnableProfileInspectAndBuy and not var3 then reactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			[reactModule.Event.Activated] = var16
		}, {
			Avatar = reactModule.createElement(userProfileAvatarModule, { userThumbnail = userThumbnail, userId = p1.userId }),
			TooltipAnchor = reactModule.createElement(view, {
				tag = "position-center-center anchor-center-center size-50",
				BackgroundTransparency = 1,
				ref = var12
			}),
			Tooltip = reactModule.createElement(inspectAvatarTooltipModule, { anchorRef = var12, ref = var13 })
		}) else reactModule.createElement(userProfileAvatarModule, { userThumbnail = userThumbnail, userId = p1.userId })
	}
	var10 = "Frame"
	t_2.ProfileTextFrame = reactModule.createElement(var10, {
		BackgroundTransparency = 1,
		ZIndex = 10,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1)
	}, {
		UIListLayoutOrder = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8)
		}),
		SocialIdentity = reactModule.createElement(socialIdentityContainerModule, {
			layoutOrder = 1,
			size = UDim2.fromScale(1, 0),
			primaryName = p1.primaryName,
			username = p1.username,
			isPremium = p1.isPremium,
			isVerified = p1.isVerified,
			isRobloxAdmin = p1.isRobloxAdmin,
			isEdited = p1.isEdited,
			openEditName = p1.openEditName,
			platformName = if fFlagAddPlatformNameToProfileHeader then p1.platformName else nil
		}),
		UserProfileSettingsToggle = if fFlagMoveInExperienceModeToEditProfile or disableStreamerModeToggle or not p1.shouldDisplayUserProfileSettings then nil else reactModule.createElement(userProfileSettingsToggleModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 0, 30),
			isInExperienceNameEnabled = p1.isInExperienceNameEnabled
		}),
		ContextualInformation = reactModule.createElement(contextualInformationModule, {
			size = UDim2.fromScale(1, 0),
			layoutOrder = if fFlagMoveInExperienceModeToEditProfile then 2 else 3
		}),
		SocialCountsRow = if p1.shouldDisplayCounts then reactModule.createElement(socialChipCountsRowContainer, {
			size = UDim2.fromScale(1, 0),
			layoutOrder = if fFlagMoveInExperienceModeToEditProfile then 3 else 4,
			title = if fFlagEnableSocialTabsPage then `@{p1.username}` else nil
		}) else nil
	})
	
	return createElement(var21, t_1, t_2)
end
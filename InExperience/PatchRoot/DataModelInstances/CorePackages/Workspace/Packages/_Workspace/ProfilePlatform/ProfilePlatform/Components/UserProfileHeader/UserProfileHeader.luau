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
local var22 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var23 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
local useNavigation = require(parent.Navigation).useNavigation
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local t = { skipFetch = true }

return function(p0) --[[ line: 80 | named "UserProfileHeader" ]]
	-- upvalues: fFlagSocialEnableProfileInspectAndBuy (ref), useLocalUserId (ref), useNavigation (ref), reactModule (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), useProfileAnalyticsContextModule (ref), useProfileWrapperContextModule (ref), eventNamesModule (ref), enumsModule (ref), fFlagProfilePlatformNewProfileHeader (ref), useProfileFormFactorModule (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useEffectOnMount (ref), var23 (ref), var22 (ref), t (ref), convertPresenceEnumModule (ref), presenceModule (ref), useDispatch (ref), networkingPresenceModule (ref), useSelector (ref), useShouldShowContextualInformationModule (ref), fFlagProfilePlatformMeTabMobileProfileHero (ref), useShouldResizeAvatarModule (ref), constantsModule (ref), view (ref), userProfileAvatarModule (ref), inspectAvatarTooltipModule (ref), avatarHeadshotComponentModule (ref), fFlagAddPlatformNameToProfileHeader (ref), contextualInformationModule (ref), socialChipCountsRowContainer (ref), fFlagEnableSocialTabsPage (ref), socialIdentityContainerModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), disableStreamerModeToggle (ref), userProfileSettingsToggleModule (ref)
	local var33
	local userThumbnail = p0.userThumbnail
	local var27 = nil
	local var28 = nil
	local var29 = nil
	local var30 = false
	local var31 = nil
	local var32 = if fFlagSocialEnableProfileInspectAndBuy then useLocalUserId() else nil
	
	if fFlagSocialEnableProfileInspectAndBuy then
		var33 = tostring(p0.userId) == tostring(var32)
		var33 = nil
	else
		var33 = nil
	end
	local var44
	local var34 = if fFlagSocialEnableProfileInspectAndBuy then useNavigation() else nil
	local var35 = if fFlagSocialEnableProfileInspectAndBuy then reactModule.useRef(nil) else nil
	local var36 = if fFlagSocialEnableProfileInspectAndBuy then reactModule.useRef(nil) else nil
	local var37 = if fFlagSocialEnableProfileInspectAndBuyAnalytics then useProfileAnalyticsContextModule() else nil
	local var38 = if fFlagSocialEnableProfileInspectAndBuyAnalytics then useProfileWrapperContextModule().profileSessionId else nil
	local var39 = if fFlagSocialEnableProfileInspectAndBuy then reactModule.useCallback(function() --[[ line: 111 ]]
		-- upvalues: fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var37 (ref), eventNamesModule (copy), var38 (ref), var36 (ref), var34 (ref), enumsModule (copy)
		if fFlagSocialEnableProfileInspectAndBuyAnalytics then
			var37.fireAnalyticsEvent(eventNamesModule.InspectAvatarOpened, { profileSessionId = var38 })
		end
		if var36.current then
			var36.current.onDismiss()
		end
		var34.navigate(enumsModule.Screens.InspectAvatarSheet)
	end, { var37, var38, var34, var36 }) else nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var40 = useProfileFormFactorModule()
		var27 = var40.formFactor == enumsModule.ProfileFormFactor.PeekView
		local var41 = if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var40.formFactor == enumsModule.ProfileFormFactor.Wide)
		local profileId = useProfileWrapperContextModule().profileId
		
		if fFlagProfilePlatformPresenceStoreMigrationModule then
			useEffectOnMount(function() --[[ line: 138 ]]
				-- upvalues: var23 (copy), profileId (ref)
				var23.RefreshPresenceByUserId(tostring(profileId))
			end)
			var44 = var22(profileId, t)
			var31 = convertPresenceEnumModule(if var44 then var44.userPresenceType else presenceModule.Enums.PresenceType.Offline, if var44 and var44.universeId ~= "" then tonumber(var44.universeId) else nil)
		else
			local var42 = useDispatch()
			useEffectOnMount(function() --[[ line: 149 ]]
				-- upvalues: var42 (ref), networkingPresenceModule (copy), profileId (ref)
				var42(networkingPresenceModule.GetPresencesFromUserIds.API({ profileId })):catch(function(_) --[[ line: 150 ]] end)
			end)
			local var43 = useSelector(function(p1) --[[ line: 153 ]]
				-- upvalues: presenceModule (copy), profileId (ref)
				return presenceModule.Selectors.getUserPresenceByUserId(p1, profileId) or {
					lastLocation = "",
					userPresenceType = presenceModule.Enums.PresenceType.Offline
				}
			end)
			var31 = convertPresenceEnumModule(var43.userPresenceType, var43.universeId)
		end
		var30 = useShouldShowContextualInformationModule(var31)
		var44 = if fFlagProfilePlatformMeTabMobileProfileHero then useShouldResizeAvatarModule() else false
		var28 = if fFlagProfilePlatformMeTabMobileProfileHero and var44 then var41 * (constantsModule.ME_TAB_MOBILE_AVATAR_HEIGHT_ASPECT + constantsModule.ME_TAB_MOBILE_TOP_BACKGROUND_INSET_RATIO) else var41 * 0.75
		var29 = if fFlagProfilePlatformMeTabMobileProfileHero and var44 then enumsModule.ProfileAvatarLayoutVariant.MeTabMobile else nil
	end
	if fFlagProfilePlatformNewProfileHeader then
		return reactModule.createElement(view, {
			tag = "col gap-large size-full-0 auto-y",
			BackgroundTransparency = 1,
			LayoutOrder = p0.layoutOrder
		}, {
			UserProfileAvatar = if fFlagSocialEnableProfileInspectAndBuy and not var33 then reactModule.createElement("TextButton", {
				Size = UDim2.new(1, 0, 0, var28 or 0),
				BackgroundTransparency = 1,
				Text = "",
				LayoutOrder = 1,
				[reactModule.Event.Activated] = var39
			}, {
				Avatar = reactModule.createElement(userProfileAvatarModule, {
					layoutOrder = 1,
					userThumbnail = userThumbnail,
					userId = p0.userId,
					isPeekView = var27,
					height = var28,
					layoutVariant = var29
				}),
				TooltipAnchor = reactModule.createElement(view, {
					tag = "position-center-center anchor-center-center size-50",
					BackgroundTransparency = 1,
					ref = var35
				}),
				Tooltip = reactModule.createElement(inspectAvatarTooltipModule, { anchorRef = var35, ref = var36 })
			}) else reactModule.createElement(userProfileAvatarModule, {
				layoutOrder = 1,
				userThumbnail = userThumbnail,
				userId = p0.userId,
				isPeekView = var27,
				height = var28,
				layoutVariant = var29
			}),
			AvatarHeadshotContainer = reactModule.createElement(view, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				tag = { ["size-full-0 auto-y"] = true }
			}, {
				AvatarHeadshotComponent = reactModule.createElement(avatarHeadshotComponentModule, {
					layoutOrder = 1,
					userId = tostring(p0.userId),
					primaryName = p0.primaryName,
					username = p0.username,
					userPresenceType = var31,
					isPremium = p0.isPremium,
					isVerified = p0.isVerified,
					isRobloxAdmin = p0.isRobloxAdmin,
					platformName = if fFlagAddPlatformNameToProfileHeader then p0.platformName else nil
				})
			}),
			ContextualInformation = if var30 then reactModule.createElement(contextualInformationModule, { layoutOrder = 3, size = UDim2.fromScale(1, 0) }) else nil,
			SocialCountsRow = if p0.shouldDisplayCounts then reactModule.createElement(socialChipCountsRowContainer, {
				layoutOrder = 4,
				size = UDim2.fromScale(1, 0),
				title = if fFlagEnableSocialTabsPage then `@{p0.username}` else nil
			}) else nil
		})
	end
	local createElement = reactModule.createElement
	local var45 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constantsModule.USER_PROFILE_HEADER_HEIGHT),
		LayoutOrder = p0.layoutOrder
	}
	local t_2 = {
		UserProfileAvatar = if fFlagSocialEnableProfileInspectAndBuy and not var33 then reactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			[reactModule.Event.Activated] = var39
		}, {
			Avatar = reactModule.createElement(userProfileAvatarModule, { userThumbnail = userThumbnail, userId = p0.userId }),
			TooltipAnchor = reactModule.createElement(view, {
				tag = "position-center-center anchor-center-center size-50",
				BackgroundTransparency = 1,
				ref = var35
			}),
			Tooltip = reactModule.createElement(inspectAvatarTooltipModule, { anchorRef = var35, ref = var36 })
		}) else reactModule.createElement(userProfileAvatarModule, { userThumbnail = userThumbnail, userId = p0.userId })
	}
	var44 = "Frame"
	t_2.ProfileTextFrame = reactModule.createElement(var44, {
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
			primaryName = p0.primaryName,
			username = p0.username,
			isPremium = p0.isPremium,
			isVerified = p0.isVerified,
			isRobloxAdmin = p0.isRobloxAdmin,
			isEdited = p0.isEdited,
			openEditName = p0.openEditName,
			platformName = if fFlagAddPlatformNameToProfileHeader then p0.platformName else nil
		}),
		UserProfileSettingsToggle = if fFlagMoveInExperienceModeToEditProfile or disableStreamerModeToggle or not p0.shouldDisplayUserProfileSettings then nil else reactModule.createElement(userProfileSettingsToggleModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 0, 30),
			isInExperienceNameEnabled = p0.isInExperienceNameEnabled
		}),
		ContextualInformation = reactModule.createElement(contextualInformationModule, {
			size = UDim2.fromScale(1, 0),
			layoutOrder = if fFlagMoveInExperienceModeToEditProfile then 2 else 3
		}),
		SocialCountsRow = if p0.shouldDisplayCounts then reactModule.createElement(socialChipCountsRowContainer, {
			size = UDim2.fromScale(1, 0),
			layoutOrder = if fFlagMoveInExperienceModeToEditProfile then 3 else 4,
			title = if fFlagEnableSocialTabsPage then `@{p0.username}` else nil
		}) else nil
	})
	
	return createElement(var45, t_1, t_2)
end
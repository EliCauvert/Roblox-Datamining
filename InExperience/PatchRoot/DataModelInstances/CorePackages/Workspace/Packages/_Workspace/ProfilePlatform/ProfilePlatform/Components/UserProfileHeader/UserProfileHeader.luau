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
local useNavigation = require(parent.Navigation).useNavigation
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)

return function(p0) --[[ line: 68 | named "UserProfileHeader" ]]
	-- upvalues: fFlagSocialEnableProfileInspectAndBuy (ref), useLocalUserId (ref), useNavigation (ref), reactModule (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), useProfileAnalyticsContextModule (ref), useProfileWrapperContextModule (ref), eventNamesModule (ref), enumsModule (ref), fFlagProfilePlatformNewProfileHeader (ref), useProfileFormFactorModule (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), useDispatch (ref), useEffectOnMount (ref), networkingPresenceModule (ref), useSelector (ref), presenceModule (ref), convertPresenceEnumModule (ref), useShouldShowContextualInformationModule (ref), view (ref), userProfileAvatarModule (ref), inspectAvatarTooltipModule (ref), avatarHeadshotComponentModule (ref), fFlagAddPlatformNameToProfileHeader (ref), contextualInformationModule (ref), socialChipCountsRowContainer (ref), fFlagEnableSocialTabsPage (ref), constantsModule (ref), socialIdentityContainerModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), disableStreamerModeToggle (ref), userProfileSettingsToggleModule (ref)
	local var27
	local userThumbnail = p0.userThumbnail
	local var22 = nil
	local var23 = nil
	local var24 = false
	local var25 = nil
	local var26 = if fFlagSocialEnableProfileInspectAndBuy then useLocalUserId() else nil
	
	if fFlagSocialEnableProfileInspectAndBuy then
		var27 = tostring(p0.userId) == tostring(var26)
		var27 = nil
	else
		var27 = nil
	end
	local var28 = if fFlagSocialEnableProfileInspectAndBuy then useNavigation() else nil
	local var29 = if fFlagSocialEnableProfileInspectAndBuy then reactModule.useRef(nil) else nil
	local var30 = if fFlagSocialEnableProfileInspectAndBuy then reactModule.useRef(nil) else nil
	local var31 = if fFlagSocialEnableProfileInspectAndBuyAnalytics then useProfileAnalyticsContextModule() else nil
	local var32 = if fFlagSocialEnableProfileInspectAndBuyAnalytics then useProfileWrapperContextModule().profileSessionId else nil
	local var33 = if fFlagSocialEnableProfileInspectAndBuy then reactModule.useCallback(function() --[[ line: 98 ]]
		-- upvalues: fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var31 (ref), eventNamesModule (copy), var32 (ref), var30 (ref), var28 (ref), enumsModule (copy)
		if fFlagSocialEnableProfileInspectAndBuyAnalytics then
			var31.fireAnalyticsEvent(eventNamesModule.InspectAvatarOpened, { profileSessionId = var32 })
		end
		if var30.current then
			var30.current.onDismiss()
		end
		var28.navigate(enumsModule.Screens.InspectAvatarSheet)
	end, { var31, var32, var28, var30 }) else nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var34 = useProfileFormFactorModule()
		var22 = var34.formFactor == enumsModule.ProfileFormFactor.PeekView
		local var35 = if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var34.formFactor == enumsModule.ProfileFormFactor.Wide)
		local profileId = useProfileWrapperContextModule().profileId
		local var36 = useDispatch()
		useEffectOnMount(function() --[[ line: 125 ]]
			-- upvalues: var36 (ref), networkingPresenceModule (copy), profileId (ref)
			var36(networkingPresenceModule.GetPresencesFromUserIds.API({ profileId })):catch(function(_) --[[ line: 126 ]] end)
		end)
		local var37 = useSelector(function(p1) --[[ line: 129 ]]
			-- upvalues: presenceModule (copy), profileId (ref)
			return presenceModule.Selectors.getUserPresenceByUserId(p1, profileId) or {
				lastLocation = "",
				userPresenceType = presenceModule.Enums.PresenceType.Offline
			}
		end)
		var25 = convertPresenceEnumModule(var37.userPresenceType, var37.universeId)
		var24 = useShouldShowContextualInformationModule(var25)
		var23 = var35 * 0.75
	end
	return if fFlagProfilePlatformNewProfileHeader then reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y",
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder
	}, {
		UserProfileAvatar = if fFlagSocialEnableProfileInspectAndBuy and not var27 then reactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 0, var23 or 0),
			BackgroundTransparency = 1,
			Text = "",
			LayoutOrder = 1,
			[reactModule.Event.Activated] = var33
		}, {
			Avatar = reactModule.createElement(userProfileAvatarModule, {
				layoutOrder = 1,
				userThumbnail = userThumbnail,
				userId = p0.userId,
				isPeekView = var22,
				height = var23
			}),
			TooltipAnchor = reactModule.createElement(view, {
				tag = "position-center-center anchor-center-center size-50",
				BackgroundTransparency = 1,
				ref = var29
			}),
			Tooltip = reactModule.createElement(inspectAvatarTooltipModule, { anchorRef = var29, ref = var30 })
		}) else reactModule.createElement(userProfileAvatarModule, {
			layoutOrder = 1,
			userThumbnail = userThumbnail,
			userId = p0.userId,
			isPeekView = var22,
			height = var23
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
				userPresenceType = var25,
				isPremium = p0.isPremium,
				isVerified = p0.isVerified,
				isRobloxAdmin = p0.isRobloxAdmin,
				platformName = if fFlagAddPlatformNameToProfileHeader then p0.platformName else nil
			})
		}),
		ContextualInformation = if var24 then reactModule.createElement(contextualInformationModule, { layoutOrder = 3, size = UDim2.fromScale(1, 0) }) else nil,
		SocialCountsRow = if p0.shouldDisplayCounts then reactModule.createElement(socialChipCountsRowContainer, {
			layoutOrder = 4,
			size = UDim2.fromScale(1, 0),
			title = if fFlagEnableSocialTabsPage then `@{p0.username}` else nil
		}) else nil
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constantsModule.USER_PROFILE_HEADER_HEIGHT),
		LayoutOrder = p0.layoutOrder
	}, {
		UserProfileAvatar = if fFlagSocialEnableProfileInspectAndBuy and not var27 then reactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			[reactModule.Event.Activated] = var33
		}, {
			Avatar = reactModule.createElement(userProfileAvatarModule, { userThumbnail = userThumbnail, userId = p0.userId }),
			TooltipAnchor = reactModule.createElement(view, {
				tag = "position-center-center anchor-center-center size-50",
				BackgroundTransparency = 1,
				ref = var29
			}),
			Tooltip = reactModule.createElement(inspectAvatarTooltipModule, { anchorRef = var29, ref = var30 })
		}) else reactModule.createElement(userProfileAvatarModule, { userThumbnail = userThumbnail, userId = p0.userId }),
		ProfileTextFrame = reactModule.createElement("Frame", {
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
	})
end
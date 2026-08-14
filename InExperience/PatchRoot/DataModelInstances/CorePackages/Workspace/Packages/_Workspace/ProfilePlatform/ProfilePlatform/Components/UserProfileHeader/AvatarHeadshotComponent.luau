local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local copy = require(parent.FoundationImages).Images["icons/actions/edit/copy"]
local constantsModule = require(profilePlatform.Common.Constants)
local enumsModule = require(profilePlatform.Common.Enums)
local useCurrentProfileFriendStatusModule = require(profilePlatform.Hooks.useCurrentProfileFriendStatus)
local convertToFoundationPresenceEnum = require(parent.SocialCommon).Utils.convertToFoundationPresenceEnum
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local textKeysModule = require(profilePlatform.Common.TextKeys)
local fFlagEnableFontStylisticAlternativesOnSocialScreens = require(parent.SharedFlags).FFlagEnableFontStylisticAlternativesOnSocialScreens
local fFlagUserTileTextTCIndicator = require(parent.SharedFlags).FFlagUserTileTextTCIndicator
local fFlagAddPlatformNameToProfileHeader = require(parent.SharedFlags).FFlagAddPlatformNameToProfileHeader
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagDisableCopyUsernameOnConsole = require(parent.SharedFlags).FFlagDisableCopyUsernameOnConsole
local fFlagEnableUserRecentActivityEntryPoint = require(parent.SharedFlags).FFlagEnableUserRecentActivityEntryPoint
local responsiveModule = require(parent.Responsive)
local appPage = require(parent.RobloxAppEnums).AppPage
local useNavigation = require(parent.Navigation).useNavigation
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local getBuilderIconForCurrentPlatform = foundationModule.Utility.getBuilderIconForCurrentPlatform

return function(p0) --[[ line: 54 | named "AvatarHeadshotComponent" ]]
	-- upvalues: useTokens (ref), useDynamicSizeMarginModule (ref), useLocalUserId (ref), convertToFoundationPresenceEnum (ref), fFlagEnableFontStylisticAlternativesOnSocialScreens (ref), useDispatch (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), fFlagAddPlatformNameToProfileHeader (ref), getBuilderIconForCurrentPlatform (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), fFlagDisableCopyUsernameOnConsole (ref), responsiveModule (ref), fFlagEnableUserRecentActivityEntryPoint (ref), useCurrentProfileFriendStatusModule (ref), enumsModule (ref), useNavigation (ref), appPage (ref), default (ref), contexts (ref), setCurrentToastMessage (ref), copy (ref), constantsModule (ref), userTile (ref), layoutMode (ref), fFlagUserTileTextTCIndicator (ref)
	local var19
	local var9 = useTokens()
	local var10, var11 = useDynamicSizeMarginModule()
	local userId = p0.userId
	local var12 = userId == tostring(useLocalUserId())
	local var13 = if var12 or not p0.userPresenceType then nil else convertToFoundationPresenceEnum(p0.userPresenceType)
	local var14 = if p0.username and p0.username ~= "" then if fFlagEnableFontStylisticAlternativesOnSocialScreens then `<font features="zero, ss03">@{p0.username}</font>` else "@" .. p0.username else ""
	local var15 = useDispatch()
	local var16 = useLocalization({
		usernameCopied = textKeysModule.UsernameCopied,
		viewRecentActivity = textKeysModule.ViewRecentActivity
	})
	local var17 = reactModule.useMemo(function() --[[ line: 78 ]]
		-- upvalues: fFlagAddPlatformNameToProfileHeader (copy), getBuilderIconForCurrentPlatform (copy)
		return if fFlagAddPlatformNameToProfileHeader then getBuilderIconForCurrentPlatform() else nil
	end, {})
	local var18 = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(userId) else nil
	
	if fFlagDisableCopyUsernameOnConsole then
		var19 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
		var19 = nil
	else
		var19 = false
	end
	local var21
	local var20 = if fFlagEnableUserRecentActivityEntryPoint then useCurrentProfileFriendStatusModule() else nil
	
	if fFlagEnableUserRecentActivityEntryPoint then
		var21 = var12
		
		if not var21 then
			var21 = var20 == enumsModule.FriendStatus.Friends
			var21 = nil
		end
	else
		var21 = false
	end
	local var22 = if fFlagEnableUserRecentActivityEntryPoint then useNavigation() else nil
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, constantsModule.AVATAR_HEADSHOT_HEIGHT),
		Position = UDim2.new(0, 0, 0, (-(constantsModule.AVATAR_HEADSHOT_HEIGHT / 2)) - var9.Gap.Large),
		LayoutOrder = p0.layoutOrder,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = var11
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var10),
			PaddingRight = UDim.new(0, var10)
		}),
		UserTile = reactModule.createElement(userTile, {
			layoutOrder = 1,
			userId = p0.userId,
			title = p0.primaryName,
			isVerified = p0.isVerified,
			isPremium = p0.isPremium,
			isRobloxAdmin = p0.isRobloxAdmin,
			subtitle = var14,
			contextualInfo = if fFlagAddPlatformNameToProfileHeader then p0.platformName else nil,
			contextualInfoIcon = if fFlagAddPlatformNameToProfileHeader then var17 else nil,
			layoutMode = layoutMode.wide,
			userPresenceType = var13,
			titleStyle = var9.Typography.HeadingSmall,
			subtitleStyle = var9.Typography.BodyMedium,
			onSubtitleClicked = if var19 then nil else reactModule.useCallback(function() --[[ line: 108 ]]
				-- upvalues: default (copy), contexts (copy), p0 (ref), var15 (ref), setCurrentToastMessage (copy), var16 (ref), copy (copy)
				default:setClipboardText({ context = contexts.ProfileCard, text = p0.username })
				var15(setCurrentToastMessage({
					isLocalized = true,
					toastMessage = var16.usernameCopied,
					toastIcon = copy
				}))
			end),
			trustedConnectionIndicatorEnabled = if fFlagUserTileTextTCIndicator then true else nil,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var18 else nil,
			extraInfo = if var21 then var16.viewRecentActivity else nil,
			onExtraInfoClicked = if var21 then if fFlagEnableUserRecentActivityEntryPoint then reactModule.useCallback(function() --[[ line: 100 ]]
				-- upvalues: var22 (ref), appPage (copy), p0 (ref)
				var22.navigate(appPage.UserRecentActivity, { userId = p0.userId, primaryName = p0.primaryName })
			end, { var22, p0.userId, p0.primaryName }) else nil else nil
		})
	})
end
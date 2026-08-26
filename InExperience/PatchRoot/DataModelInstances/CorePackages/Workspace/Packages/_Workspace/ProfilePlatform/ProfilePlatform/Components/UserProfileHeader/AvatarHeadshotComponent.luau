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

return function(p1)
	-- upvalues: useTokens (ref), useDynamicSizeMarginModule (ref), useLocalUserId (ref), convertToFoundationPresenceEnum (ref), fFlagEnableFontStylisticAlternativesOnSocialScreens (ref), useDispatch (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), fFlagAddPlatformNameToProfileHeader (ref), getBuilderIconForCurrentPlatform (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), fFlagDisableCopyUsernameOnConsole (ref), responsiveModule (ref), fFlagEnableUserRecentActivityEntryPoint (ref), useCurrentProfileFriendStatusModule (ref), enumsModule (ref), useNavigation (ref), appPage (ref), default (ref), contexts (ref), setCurrentToastMessage (ref), copy (ref), constantsModule (ref), userTile (ref), layoutMode (ref), fFlagUserTileTextTCIndicator (ref)
	local var1
	local var2 = useTokens()
	local var3, var4 = useDynamicSizeMarginModule()
	local userId = p1.userId
	local var5 = userId == tostring(useLocalUserId())
	local var6 = if var5 or not p1.userPresenceType then nil else convertToFoundationPresenceEnum(p1.userPresenceType)
	local var7 = if p1.username and p1.username ~= "" then if fFlagEnableFontStylisticAlternativesOnSocialScreens then `<font features="zero, ss03">@{p1.username}</font>` else "@" .. p0.username else ""
	local var8 = useDispatch()
	local var9 = useLocalization({
		usernameCopied = textKeysModule.UsernameCopied,
		viewRecentActivity = textKeysModule.ViewRecentActivity
	})
	local var10 = reactModule.useMemo(function()
		-- upvalues: fFlagAddPlatformNameToProfileHeader (copy), getBuilderIconForCurrentPlatform (copy)
		return if fFlagAddPlatformNameToProfileHeader then getBuilderIconForCurrentPlatform() else nil
	end, {})
	local var11 = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(userId) else nil
	
	if fFlagDisableCopyUsernameOnConsole then
		var1 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
		var1 = nil
	else
		var1 = false
	end
	local var12
	local var13 = if fFlagEnableUserRecentActivityEntryPoint then useCurrentProfileFriendStatusModule() else nil
	
	if fFlagEnableUserRecentActivityEntryPoint then
		var12 = var5
		
		if not var12 then
			var12 = var13 == enumsModule.FriendStatus.Friends
			var12 = nil
		end
	else
		var12 = false
	end
	local var14 = if fFlagEnableUserRecentActivityEntryPoint then useNavigation() else nil
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, constantsModule.AVATAR_HEADSHOT_HEIGHT),
		Position = UDim2.new(0, 0, 0, (-(constantsModule.AVATAR_HEADSHOT_HEIGHT / 2)) - var2.Gap.Large),
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = var4
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var3),
			PaddingRight = UDim.new(0, var3)
		}),
		UserTile = reactModule.createElement(userTile, {
			layoutOrder = 1,
			userId = p1.userId,
			title = p1.primaryName,
			isVerified = p1.isVerified,
			isPremium = p1.isPremium,
			isRobloxAdmin = p1.isRobloxAdmin,
			subtitle = var7,
			contextualInfo = if fFlagAddPlatformNameToProfileHeader then p1.platformName else nil,
			contextualInfoIcon = if fFlagAddPlatformNameToProfileHeader then var10 else nil,
			layoutMode = layoutMode.wide,
			userPresenceType = var6,
			titleStyle = var2.Typography.HeadingSmall,
			subtitleStyle = var2.Typography.BodyMedium,
			onSubtitleClicked = if var1 then nil else reactModule.useCallback(function()
				-- upvalues: default (copy), contexts (copy), p1 (ref), var8 (ref), setCurrentToastMessage (copy), var9 (ref), copy (copy)
				default:setClipboardText({ context = contexts.ProfileCard, text = p1.username })
				var8(setCurrentToastMessage({
					isLocalized = true,
					toastMessage = var9.usernameCopied,
					toastIcon = copy
				}))
			end),
			trustedConnectionIndicatorEnabled = if fFlagUserTileTextTCIndicator then true else nil,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var11 else nil,
			extraInfo = if var12 then var9.viewRecentActivity else nil,
			onExtraInfoClicked = if var12 then if fFlagEnableUserRecentActivityEntryPoint then reactModule.useCallback(function()
				-- upvalues: var14 (ref), appPage (copy), p1 (ref)
				var14.navigate(appPage.UserRecentActivity, { userId = p1.userId, primaryName = p1.primaryName })
			end, { var14, p1.userId, p1.primaryName }) else nil else nil
		})
	})
end
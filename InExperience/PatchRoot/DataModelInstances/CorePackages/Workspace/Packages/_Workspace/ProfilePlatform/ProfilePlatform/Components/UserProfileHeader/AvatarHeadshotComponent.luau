local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local copy = require(parent.FoundationImages).Images["icons/actions/edit/copy"]
local constantsModule = require(profilePlatform.Common.Constants)
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
local responsiveModule = require(parent.Responsive)
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local getBuilderIconForCurrentPlatform = foundationModule.Utility.getBuilderIconForCurrentPlatform

return function(p0) --[[ line: 49 | named "AvatarHeadshotComponent" ]]
	-- upvalues: useTokens (ref), useDynamicSizeMarginModule (ref), useLocalUserId (ref), convertToFoundationPresenceEnum (ref), fFlagEnableFontStylisticAlternativesOnSocialScreens (ref), useDispatch (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), fFlagAddPlatformNameToProfileHeader (ref), getBuilderIconForCurrentPlatform (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), fFlagDisableCopyUsernameOnConsole (ref), responsiveModule (ref), default (ref), contexts (ref), setCurrentToastMessage (ref), copy (ref), constantsModule (ref), userTile (ref), layoutMode (ref), fFlagUserTileTextTCIndicator (ref)
	local var16
	local var7 = useTokens()
	local var8, var9 = useDynamicSizeMarginModule()
	local userId = p0.userId
	local var10 = if userId == tostring(useLocalUserId()) or not p0.userPresenceType then nil else convertToFoundationPresenceEnum(p0.userPresenceType)
	local var11 = if p0.username and p0.username ~= "" then if fFlagEnableFontStylisticAlternativesOnSocialScreens then `<font features="zero, ss03">@{p0.username}</font>` else "@" .. p0.username else ""
	local var12 = useDispatch()
	local var13 = useLocalization({ usernameCopied = textKeysModule.UsernameCopied })
	local var14 = reactModule.useMemo(function() --[[ line: 72 ]]
		-- upvalues: fFlagAddPlatformNameToProfileHeader (copy), getBuilderIconForCurrentPlatform (copy)
		return if fFlagAddPlatformNameToProfileHeader then getBuilderIconForCurrentPlatform() else nil
	end, {})
	local var15 = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(userId) else nil
	
	if fFlagDisableCopyUsernameOnConsole then
		var16 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
		var16 = nil
	else
		var16 = false
	end
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, constantsModule.AVATAR_HEADSHOT_HEIGHT),
		Position = UDim2.new(0, 0, 0, (-(constantsModule.AVATAR_HEADSHOT_HEIGHT / 2)) - var7.Gap.Large),
		LayoutOrder = p0.layoutOrder,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = var9
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var8),
			PaddingRight = UDim.new(0, var8)
		}),
		UserTile = reactModule.createElement(userTile, {
			layoutOrder = 1,
			userId = p0.userId,
			title = p0.primaryName,
			isVerified = p0.isVerified,
			isPremium = p0.isPremium,
			isRobloxAdmin = p0.isRobloxAdmin,
			subtitle = var11,
			contextualInfo = if fFlagAddPlatformNameToProfileHeader then p0.platformName else nil,
			contextualInfoIcon = if fFlagAddPlatformNameToProfileHeader then var14 else nil,
			layoutMode = layoutMode.wide,
			userPresenceType = var10,
			titleStyle = var7.Typography.HeadingSmall,
			subtitleStyle = var7.Typography.BodyMedium,
			onSubtitleClicked = if var16 then nil else reactModule.useCallback(function() --[[ line: 85 ]]
				-- upvalues: default (copy), contexts (copy), p0 (ref), var12 (ref), setCurrentToastMessage (copy), var13 (ref), copy (copy)
				default:setClipboardText({ context = contexts.ProfileCard, text = p0.username })
				var12(setCurrentToastMessage({
					isLocalized = true,
					toastMessage = var13.usernameCopied,
					toastIcon = copy
				}))
			end),
			trustedConnectionIndicatorEnabled = if fFlagUserTileTextTCIndicator then true else nil,
			isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var15 else nil
		})
	})
end
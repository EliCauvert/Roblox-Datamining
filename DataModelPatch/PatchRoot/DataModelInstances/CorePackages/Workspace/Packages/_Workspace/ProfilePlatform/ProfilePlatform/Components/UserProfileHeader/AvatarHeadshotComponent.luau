local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local IconsActionsEditCopy = require(Parent.FoundationImages).Images["icons/actions/edit/copy"]
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local ConvertToFoundationPresenceEnumFunction = require(Parent.SocialCommon).Utils.convertToFoundationPresenceEnum
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FFlagEnableFontStylisticAlternativesOnSocialScreens = require(Parent.SharedFlags).FFlagEnableFontStylisticAlternativesOnSocialScreens
local FFlagUserTileTextTCIndicator = require(Parent.SharedFlags).FFlagUserTileTextTCIndicator
local FFlagAddPlatformNameToProfileHeader = require(Parent.SharedFlags).FFlagAddPlatformNameToProfileHeader
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagDisableCopyUsernameOnConsole = require(Parent.SharedFlags).FFlagDisableCopyUsernameOnConsole
local ResponsiveModule = require(Parent.Responsive)
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local GetBuilderIconForCurrentPlatformFunction = FoundationModule.Utility.getBuilderIconForCurrentPlatform

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDynamicSizeMarginModule (copy), UseLocalUserIdFunction (copy), ConvertToFoundationPresenceEnumFunction (copy), FFlagEnableFontStylisticAlternativesOnSocialScreens (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), FFlagAddPlatformNameToProfileHeader (copy), GetBuilderIconForCurrentPlatformFunction (copy), FFlagEnableBlackbirdCheck (copy), UseIsRobloxSubscriberFunction (copy), FFlagDisableCopyUsernameOnConsole (copy), ResponsiveModule (copy), Default (copy), Contexts (copy), SetCurrentToastMessageFunction (copy), IconsActionsEditCopy (copy), ConstantsModule (copy), UserTile (copy), LayoutMode (copy), FFlagUserTileTextTCIndicator (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local UserId = p1.userId
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({ usernameCopied = TextKeysModule.UsernameCopied })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagAddPlatformNameToProfileHeader (upval), GetBuilderIconForCurrentPlatformFunction (upval)
		return if FFlagAddPlatformNameToProfileHeader then GetBuilderIconForCurrentPlatformFunction() else nil
	end, {})
	local UseIsRobloxSubscriberResult = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberFunction(UserId) else nil
	local IsUsePreferredInputResultMatch: boolean = if FFlagDisableCopyUsernameOnConsole then ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional else false
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Default (upval), Contexts (upval), p1 (copy), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), UseLocalizationResult (copy), IconsActionsEditCopy (upval)
		Default:setClipboardText({ context = Contexts.ProfileCard, text = p1.username })
		UseDispatchResult(SetCurrentToastMessageFunction({
			isLocalized = true,
			toastMessage = UseLocalizationResult.usernameCopied,
			toastIcon = IconsActionsEditCopy
		}))
	end)
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, ConstantsModule.AVATAR_HEADSHOT_HEIGHT),
		Position = UDim2.new(0, 0, 0, -(ConstantsModule.AVATAR_HEADSHOT_HEIGHT / 2) - UseTokensResult.Gap.Large),
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = 1,
		[ReactModule.Change.AbsoluteSize] = UseDynamicSizeMarginModuleResult2
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, UseDynamicSizeMarginModuleResult),
			PaddingRight = UDim.new(0, UseDynamicSizeMarginModuleResult)
		}),
		UserTile = ReactModule.createElement(UserTile, {
			layoutOrder = 1,
			userId = p1.userId,
			title = p1.primaryName,
			isVerified = p1.isVerified,
			isPremium = p1.isPremium,
			isRobloxAdmin = p1.isRobloxAdmin,
			subtitle = if p1.username and p1.username ~= "" then if FFlagEnableFontStylisticAlternativesOnSocialScreens then `<font features="zero, ss03">@{p1.username}</font>` else "@" .. p1.username else "",
			contextualInfo = if FFlagAddPlatformNameToProfileHeader then p1.platformName else nil,
			contextualInfoIcon = if FFlagAddPlatformNameToProfileHeader then UseMemoResult else nil,
			layoutMode = LayoutMode.wide,
			userPresenceType = if UserId == tostring((UseLocalUserIdFunction())) or not p1.userPresenceType then nil else ConvertToFoundationPresenceEnumFunction(p1.userPresenceType),
			titleStyle = UseTokensResult.Typography.HeadingSmall,
			subtitleStyle = UseTokensResult.Typography.BodyMedium,
			onSubtitleClicked = if IsUsePreferredInputResultMatch then nil else UseResult,
			trustedConnectionIndicatorEnabled = if FFlagUserTileTextTCIndicator then true else nil,
			isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil
		})
	})
end
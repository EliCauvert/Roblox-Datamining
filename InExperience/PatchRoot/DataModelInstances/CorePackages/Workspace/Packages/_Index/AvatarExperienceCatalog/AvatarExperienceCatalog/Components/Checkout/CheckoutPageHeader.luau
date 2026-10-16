local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AvatarExperienceNavigationModule = require(Parent.AvatarExperienceNavigation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local CanGoBackFunction = require(Parent.Navigation).canGoBack
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local ClearTryOnsFunction = require(Parent.AvatarExperienceRodux).Actions.ClearTryOns
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local FFlagAXEnableExpiredUserLookCheckout = require(Parent.AvatarExperienceFlags).FFlagAXEnableExpiredUserLookCheckout

return ReactModule.memo(function() --[[ Line: 21 | Named "CheckoutPageHeader" ]]
	-- upvalues: FFlagAXEnableExpiredUserLookCheckout (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), FoundationModule (copy), UseAvatarRouteFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), AvatarScreen (copy), ClearTryOnsFunction (copy), CanGoBackFunction (copy)
	local UseDispatchResult = if FFlagAXEnableExpiredUserLookCheckout then UseDispatchFunction() else nil
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = if FFlagAXEnableExpiredUserLookCheckout then UseAvatarRouteFunction() else nil
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-y size-full-0 bg-surface-0 row items-center padding-x-xlarge padding-y-medium gap-medium"
	}, {
		BackButton = ReactModule.createElement(FoundationModule.IconButton, {
			icon = "chevron-large-left",
			tag = "content-emphasis",
			onActivated = ReactModule.useCallback(function() --[[ Line: 31 ]]
				-- upvalues: FFlagAXEnableExpiredUserLookCheckout (upval), UseAvatarRouteResult (copy), AvatarScreen (upval), UseDispatchResult (copy), ClearTryOnsFunction (upval), CanGoBackFunction (upval), UseNavigationResult (copy)
				if FFlagAXEnableExpiredUserLookCheckout and (UseAvatarRouteResult and (UseAvatarRouteResult.current and UseAvatarRouteResult.current.name)) == AvatarScreen.ExpiredUserLookCheckout then
					UseDispatchResult(ClearTryOnsFunction())
				end
				if CanGoBackFunction(UseNavigationResult) then
					UseNavigationResult.goBack()
				end
			end, {
				UseNavigationResult,
				if FFlagAXEnableExpiredUserLookCheckout then UseAvatarRouteResult else nil,
				if FFlagAXEnableExpiredUserLookCheckout then UseDispatchResult else nil
			}),
			size = FoundationModule.Enums.InputSize.Medium
		}),
		Title = ReactModule.createElement(FoundationModule.Text, {
			tag = "grow auto-y text-title-large content-emphasis",
			Text = UseLocalizationFunction({ checkoutTitle = "Feature.Catalog.Header.Checkout" }).checkoutTitle,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		Spacer = ReactModule.createElement(FoundationModule.View, {
			Size = UDim2.fromOffset(FoundationModule.Hooks.useTokens().Size.Size_1000, 0)
		})
	})
end)
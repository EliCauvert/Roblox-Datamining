local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local canGoBack = require(parent.Navigation).canGoBack
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local clearTryOns = require(parent.AvatarExperienceRodux).Actions.ClearTryOns
local useAvatarRoute = avatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local avatarScreen = avatarExperienceNavigationModule.Enums.AvatarScreen
local fFlagAXEnableExpiredUserLookCheckout = avatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout

return reactModule.memo(function() --[[ line: 21 | named "CheckoutPageHeader" ]]
	-- upvalues: fFlagAXEnableExpiredUserLookCheckout (ref), useDispatch (ref), useNavigation (ref), foundationModule (ref), useAvatarRoute (ref), useLocalization (ref), reactModule (ref), avatarScreen (ref), clearTryOns (ref), canGoBack (ref)
	local var4 = if fFlagAXEnableExpiredUserLookCheckout then useDispatch() else nil
	local var5 = useNavigation()
	local var6 = if fFlagAXEnableExpiredUserLookCheckout then useAvatarRoute() else nil
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-y size-full-0 bg-surface-0 row items-center padding-x-xlarge padding-y-medium gap-medium"
	}, {
		BackButton = reactModule.createElement(foundationModule.IconButton, {
			icon = "chevron-large-left",
			tag = "content-emphasis",
			onActivated = reactModule.useCallback(function() --[[ line: 31 ]]
				-- upvalues: fFlagAXEnableExpiredUserLookCheckout (copy), var6 (ref), avatarScreen (copy), var4 (ref), clearTryOns (copy), canGoBack (copy), var5 (ref)
				if fFlagAXEnableExpiredUserLookCheckout and (var6 and (var6.current and var6.current.name)) == avatarScreen.ExpiredUserLookCheckout then
					var4(clearTryOns())
				end
				if canGoBack(var5) then
					var5.goBack()
				end
			end, {
				var5,
				if fFlagAXEnableExpiredUserLookCheckout then var6 else nil,
				if fFlagAXEnableExpiredUserLookCheckout then var4 else nil
			}),
			size = foundationModule.Enums.InputSize.Medium
		}),
		Title = reactModule.createElement(foundationModule.Text, {
			tag = "grow auto-y text-title-large content-emphasis",
			Text = useLocalization({ checkoutTitle = "Feature.Catalog.Header.Checkout" }).checkoutTitle,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		Spacer = reactModule.createElement(foundationModule.View, {
			Size = UDim2.fromOffset(foundationModule.Hooks.useTokens().Size.Size_1000, 0)
		})
	})
end)
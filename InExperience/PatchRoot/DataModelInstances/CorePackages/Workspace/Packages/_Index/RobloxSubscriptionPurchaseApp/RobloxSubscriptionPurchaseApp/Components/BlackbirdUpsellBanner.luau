local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local iconName = foundationModule.Enums.IconName
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagSupportNewBadgeRobloxPlusModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagSupportNewBadgeRobloxPlus)
local useRobloxPlusUpsellBannerNewBadgeInteractionModule = require(robloxSubscriptionPurchaseApp.Hooks.useRobloxPlusUpsellBannerNewBadgeInteraction)
local robloxPlusUpsellBannerCTAModule = require(script.Parent.RobloxPlusUpsellBannerCTA)
local boldBlackbirdUpsellBannerStroke = game:DefineFastFlag("BoldBlackbirdUpsellBannerStroke", false)

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), fFlagSupportNewBadgeRobloxPlusModule (ref), useRobloxPlusUpsellBannerNewBadgeInteractionModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), robloxPlusUpsellBannerCTAModule (ref), boldBlackbirdUpsellBannerStroke (ref)
	local var1 = useTokens()
	local var2 = useLocalization({
		getFreeTrialText = "Feature.RobloxSubscription.Label.FreeTrialText",
		subscribe = "Feature.RobloxSubscription.Action.Subscribe",
		bannerText = {
			"Feature.RobloxSubscription.Label.BlackbirdUpsellBanner",
			discountPercentage = p1.productInfo.initialDiscountPercentage or 10
		}
	})
	local var3 = if fFlagSupportNewBadgeRobloxPlusModule then useRobloxPlusUpsellBannerNewBadgeInteractionModule(p1.onActivated) else nil
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-medium",
		onActivated = if fFlagSupportNewBadgeRobloxPlusModule then var3.onActivated else p1.onActivated,
		LayoutOrder = p1.LayoutOrder
	}, {
		ContentContainer = reactModule.createElement(view, { tag = "row align-y-center gap-small size-full-0 auto-y" }, {
			BlackbirdIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				style = var1.Color.Content.Emphasis,
				name = iconName.RobloxPlus,
				size = iconSize.Medium
			}),
			BannerText = reactModule.createElement(text, {
				TextWrapped = true,
				tag = "text-body-small text-align-x-left content-emphasis",
				LayoutOrder = 2,
				Size = UDim2.new(0.7, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = var2.bannerText
			})
		}),
		SubscribeText = if not fFlagSupportNewBadgeRobloxPlusModule then reactModule.createElement(text, {
			tag = "auto-xy text-body-small content-default",
			RichText = true,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = "<u>" .. reactModule.useCallback(function()
				-- upvalues: p1 (ref), var2 (ref)
				return if p1.productInfo.isFreeTrial then var2.getFreeTrialText else var2.subscribe
			end, {
				p1.productInfo.isFreeTrial,
				var2.getFreeTrialText,
				var2.subscribe
			})() .. "</u>"
		}) else nil,
		SubscribeCTA = if fFlagSupportNewBadgeRobloxPlusModule then reactModule.createElement(robloxPlusUpsellBannerCTAModule, {
			productInfo = p1.productInfo,
			shouldShowNewBadge = var3.shouldShowNewBadge
		}) else nil,
		UIStroke = reactModule.createElement("UIStroke", {
			Color = var1.Color.Stroke.Default.Color3,
			Transparency = var1.Color.Stroke.Default.Transparency,
			Thickness = if boldBlackbirdUpsellBannerStroke then var1.Stroke.Thick else var1.Stroke.Standard
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Medium) })
	})
end
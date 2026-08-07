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

return function(p0) --[[ line: 35 | named "BlackbirdUpsellBanner" ]]
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), fFlagSupportNewBadgeRobloxPlusModule (ref), useRobloxPlusUpsellBannerNewBadgeInteractionModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), robloxPlusUpsellBannerCTAModule (ref), boldBlackbirdUpsellBannerStroke (ref)
	local var7 = useTokens()
	local var8 = useLocalization({
		getFreeTrialText = "Feature.RobloxSubscription.Label.FreeTrialText",
		subscribe = "Feature.RobloxSubscription.Action.Subscribe",
		bannerText = {
			"Feature.RobloxSubscription.Label.BlackbirdUpsellBanner",
			discountPercentage = p0.productInfo.initialDiscountPercentage or 10
		}
	})
	local var9 = if fFlagSupportNewBadgeRobloxPlusModule then useRobloxPlusUpsellBannerNewBadgeInteractionModule(p0.onActivated) else nil
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-medium",
		onActivated = if fFlagSupportNewBadgeRobloxPlusModule then var9.onActivated else p0.onActivated,
		LayoutOrder = p0.LayoutOrder
	}, {
		ContentContainer = reactModule.createElement(view, { tag = "row align-y-center gap-small size-full-0 auto-y" }, {
			BlackbirdIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				style = var7.Color.Content.Emphasis,
				name = iconName.RobloxPlus,
				size = iconSize.Medium
			}),
			BannerText = reactModule.createElement(text, {
				TextWrapped = true,
				tag = "text-body-small text-align-x-left content-emphasis",
				LayoutOrder = 2,
				Size = UDim2.new(0.7, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = var8.bannerText
			})
		}),
		SubscribeText = if not fFlagSupportNewBadgeRobloxPlusModule then reactModule.createElement(text, {
			tag = "auto-xy text-body-small content-default",
			RichText = true,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = "<u>" .. reactModule.useCallback(function() --[[ line: 47 ]]
				-- upvalues: p0 (ref), var8 (ref)
				return if p0.productInfo.isFreeTrial then var8.getFreeTrialText else var8.subscribe
			end, {
				p0.productInfo.isFreeTrial,
				var8.getFreeTrialText,
				var8.subscribe
			})() .. "</u>"
		}) else nil,
		SubscribeCTA = if fFlagSupportNewBadgeRobloxPlusModule then reactModule.createElement(robloxPlusUpsellBannerCTAModule, {
			productInfo = p0.productInfo,
			shouldShowNewBadge = var9.shouldShowNewBadge
		}) else nil,
		UIStroke = reactModule.createElement("UIStroke", {
			Color = var7.Color.Stroke.Default.Color3,
			Transparency = var7.Color.Stroke.Default.Transparency,
			Thickness = if boldBlackbirdUpsellBannerStroke then var7.Stroke.Thick else var7.Stroke.Standard
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Radius.Medium) })
	})
end
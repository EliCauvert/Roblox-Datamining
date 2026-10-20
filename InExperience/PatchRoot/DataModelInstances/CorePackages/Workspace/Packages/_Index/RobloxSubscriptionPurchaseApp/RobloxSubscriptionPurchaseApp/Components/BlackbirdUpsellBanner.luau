local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local IconName = FoundationModule.Enums.IconName
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagSupportNewBadgeRobloxPlusModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagSupportNewBadgeRobloxPlus)
local UseRobloxPlusUpsellBannerNewBadgeInteractionModule = require(RobloxSubscriptionPurchaseApp.Hooks.useRobloxPlusUpsellBannerNewBadgeInteraction)
local RobloxPlusUpsellBannerCTAModule = require(script.Parent.RobloxPlusUpsellBannerCTA)
local FFlagRobloxPlusUpsellBannerUseTryItForFreeModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusUpsellBannerUseTryItForFree)
local BoldBlackbirdUpsellBannerStroke = game:DefineFastFlag("BoldBlackbirdUpsellBannerStroke", false)

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), FFlagRobloxPlusUpsellBannerUseTryItForFreeModule (copy), ReactModule (copy), FFlagSupportNewBadgeRobloxPlusModule (copy), UseRobloxPlusUpsellBannerNewBadgeInteractionModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy), RobloxPlusUpsellBannerCTAModule (copy), BoldBlackbirdUpsellBannerStroke (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		subscribe = "Feature.RobloxSubscription.Action.Subscribe",
		bannerText = {
			"Feature.RobloxSubscription.Label.BlackbirdUpsellBanner",
			discountPercentage = Frame.productInfo.initialDiscountPercentage or 10
		},
		getFreeTrialText = if FFlagRobloxPlusUpsellBannerUseTryItForFreeModule then "Feature.RobloxSubscription.Action.TryItForFree" else "Feature.RobloxSubscription.Label.FreeTrialText"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Frame (copy), UseLocalizationResult (copy)
		return if Frame.productInfo.isFreeTrial then UseLocalizationResult.getFreeTrialText else UseLocalizationResult.subscribe
	end, {
		Frame.productInfo.isFreeTrial,
		UseLocalizationResult.getFreeTrialText,
		UseLocalizationResult.subscribe
	})
	local UseRobloxPlusUpsellBannerNewBadgeInteractionModuleResult = if FFlagSupportNewBadgeRobloxPlusModule then UseRobloxPlusUpsellBannerNewBadgeInteractionModule(Frame.onActivated) else nil
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y padding-medium",
		onActivated = if FFlagSupportNewBadgeRobloxPlusModule then UseRobloxPlusUpsellBannerNewBadgeInteractionModuleResult.onActivated else Frame.onActivated,
		LayoutOrder = Frame.LayoutOrder
	}, {
		ContentContainer = ReactModule.createElement(View, { tag = "row align-y-center gap-small size-full-0 auto-y" }, {
			BlackbirdIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				style = UseTokensResult.Color.Content.Emphasis,
				name = IconName.RobloxPlus,
				size = IconSize.Medium
			}),
			BannerText = ReactModule.createElement(Text, {
				TextWrapped = true,
				tag = "text-body-small text-align-x-left content-emphasis",
				LayoutOrder = 2,
				Size = UDim2.new(0.7, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = UseLocalizationResult.bannerText
			})
		}),
		SubscribeText = if FFlagSupportNewBadgeRobloxPlusModule then nil else ReactModule.createElement(Text, {
			tag = "auto-xy text-body-small content-default",
			RichText = true,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Text = "<u>" .. UseResult() .. "</u>"
		}),
		SubscribeCTA = if FFlagSupportNewBadgeRobloxPlusModule then ReactModule.createElement(RobloxPlusUpsellBannerCTAModule, {
			productInfo = Frame.productInfo,
			shouldShowNewBadge = UseRobloxPlusUpsellBannerNewBadgeInteractionModuleResult.shouldShowNewBadge
		}) else nil,
		UIStroke = ReactModule.createElement("UIStroke", {
			Color = UseTokensResult.Color.Stroke.Default.Color3,
			Transparency = UseTokensResult.Color.Stroke.Default.Transparency,
			Thickness = if BoldBlackbirdUpsellBannerStroke then UseTokensResult.Stroke.Thick else UseTokensResult.Stroke.Standard
		}),
		UICorner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		})
	})
end
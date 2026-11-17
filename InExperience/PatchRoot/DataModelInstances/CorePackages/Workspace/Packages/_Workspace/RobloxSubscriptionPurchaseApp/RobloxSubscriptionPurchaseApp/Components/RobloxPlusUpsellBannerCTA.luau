local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Badge = FoundationModule.Badge
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagRobloxPlusUpsellBannerUseTryItForFreeModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusUpsellBannerUseTryItForFree)
local FFlagTTOnboardingSheetModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagTTOnboardingSheet)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagRobloxPlusUpsellBannerUseTryItForFreeModule (copy), ReactModule (copy), FFlagTTOnboardingSheetModule (copy), View (copy), Badge (copy), BadgeVariant (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		subscribe = "Feature.RobloxSubscription.Action.Subscribe",
		newBadge = "Feature.Catalog.Label.New",
		getFreeTrialText = if FFlagRobloxPlusUpsellBannerUseTryItForFreeModule then "Feature.RobloxSubscription.Action.TryItForFree" else "Feature.RobloxSubscription.Label.FreeTrialText"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagTTOnboardingSheetModule (upval), p1 (copy), UseLocalizationResult (copy)
		return if FFlagTTOnboardingSheetModule and p1.ctaText then p1.ctaText elseif p1.productInfo.isFreeTrial then UseLocalizationResult.getFreeTrialText else UseLocalizationResult.subscribe
	end, {
		p1.productInfo.isFreeTrial,
		UseLocalizationResult.getFreeTrialText,
		UseLocalizationResult.subscribe,
		p1.ctaText
	})
	
	return if p1.shouldShowNewBadge then ReactModule.createElement(View, {
		tag = "row align-y-center gap-xsmall auto-xy",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0)
	}, {
		NewBadge = ReactModule.createElement(Badge, {
			LayoutOrder = 1,
			text = UseLocalizationResult.newBadge,
			variant = BadgeVariant.Contrast
		})
	}) else ReactModule.createElement(View, {
		tag = "auto-xy",
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0)
	}, {
		SubscribeText = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-small content-default",
			RichText = true,
			Text = "<u>" .. UseResult() .. "</u>"
		})
	})
end
local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local useRobloxPlusUpsellBannerViewModelModule = require(robloxSubscriptionPurchaseApp.Hooks.useRobloxPlusUpsellBannerViewModel)

return require(robloxSubscriptionPurchaseApp.Parent.React).memo(function(p1)
	-- upvalues: useRobloxPlusUpsellBannerViewModelModule (ref)
	return p1.renderBanner({
		message = p1.message,
		actionText = useRobloxPlusUpsellBannerViewModelModule({
			subscribeText = p1.subscribeText,
			freeTrialText = p1.freeTrialText
		}).actionText,
		onActivated = p1.onActivated,
		showPlusIcon = p1.showPlusIcon,
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	})
end)
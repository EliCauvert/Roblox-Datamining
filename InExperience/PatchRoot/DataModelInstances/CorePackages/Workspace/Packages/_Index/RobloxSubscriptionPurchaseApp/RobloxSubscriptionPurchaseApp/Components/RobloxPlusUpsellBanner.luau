local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local UseRobloxPlusUpsellBannerViewModelModule = require(RobloxSubscriptionPurchaseApp.Hooks.useRobloxPlusUpsellBannerViewModel)

return require(RobloxSubscriptionPurchaseApp.Parent.React).memo(function(Frame) --[[ Line: 28 | Named "RobloxPlusUpsellBanner" ]]
	-- upvalues: UseRobloxPlusUpsellBannerViewModelModule (copy)
	return Frame.renderBanner({
		message = Frame.message,
		actionText = UseRobloxPlusUpsellBannerViewModelModule({
			subscribeText = Frame.subscribeText,
			freeTrialText = Frame.freeTrialText
		}).actionText,
		onActivated = Frame.onActivated,
		showPlusIcon = Frame.showPlusIcon,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	})
end)
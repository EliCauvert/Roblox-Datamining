local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local parent = flyoutSidePanel.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local iconName = foundationModule.Enums.IconName
local useLocalization = require(parent.Localization).Hooks.useLocalization
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local fIntPlusReferralRewardRobux = require(parent.SharedFlags).FIntPlusReferralRewardRobux
local usePlusReferralFlyoutNewBadgeModule = require(flyoutSidePanel.Hooks.usePlusReferralFlyoutNewBadge)

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), fIntPlusReferralRewardRobux (ref), reactModule (ref), flyoutAnalyticsModule (ref), usePlusReferralFlyoutNewBadgeModule (ref), foundationModule (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var1 = useTokens()
	local var2 = useLocalization({
		newBadgeText = "Feature.RobloxSubscription.Label.New",
		bannerText = {
			"Feature.RobloxSubscription.Heading.ReferralRecipientEntry",
			amount = tostring(fIntPlusReferralRewardRobux)
		}
	})
	local var3 = usePlusReferralFlyoutNewBadgeModule(reactModule.useCallback(function()
		-- upvalues: p1 (ref), flyoutAnalyticsModule (copy)
		p1.closeDrawer()
		
		if p1.onOpenReferralSheet then
			p1.onOpenReferralSheet(p1.referrerId)
		end
		flyoutAnalyticsModule.onFlyoutContentItemClicked({
			integrationId = "PlusReferralRecipient",
			source = "click"
		})
	end, { p1.closeDrawer, p1.referrerId, p1.onOpenReferralSheet }), "RobloxPlusUpsellImpressionCount3")
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-x-medium padding-y-medium",
		testId = "--core-ui-flyout-plus-referral-recipient",
		onActivated = var3.onActivated,
		LayoutOrder = p1.layoutOrder
	}, {
		PlusIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			style = var1.Color.Content.Emphasis,
			name = iconName.RobloxPlus,
			size = iconSize.Medium
		}),
		BannerText = reactModule.createElement(text, {
			tag = "fill auto-y text-body-small text-wrap text-align-x-left content-emphasis",
			LayoutOrder = 2,
			Text = var2.bannerText
		}),
		NewBadge = if var3.shouldShowNewBadge then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-x-xsmall padding-y-xxsmall radius-circle bg-system-contrast",
			LayoutOrder = 3
		}, {
			Text = reactModule.createElement(text, {
				tag = "auto-xy text-title-small",
				Text = var2.newBadgeText,
				textStyle = var1.Color.Surface.Surface_0
			})
		}) else nil
	})
end
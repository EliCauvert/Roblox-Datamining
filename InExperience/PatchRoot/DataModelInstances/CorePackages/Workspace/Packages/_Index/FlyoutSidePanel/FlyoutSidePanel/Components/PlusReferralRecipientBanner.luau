local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local Parent = FlyoutSidePanel.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local IconName = FoundationModule.Enums.IconName
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local FIntPlusReferralRewardRobux = require(Parent.SharedFlags).FIntPlusReferralRewardRobux
local UsePlusReferralFlyoutNewBadgeModule = require(FlyoutSidePanel.Hooks.usePlusReferralFlyoutNewBadge)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), FIntPlusReferralRewardRobux (copy), ReactModule (copy), FlyoutAnalyticsModule (copy), UsePlusReferralFlyoutNewBadgeModule (copy), FoundationModule (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		newBadgeText = "Feature.RobloxSubscription.Label.New",
		bannerText = {
			"Feature.RobloxSubscription.Heading.ReferralRecipientEntry",
			amount = tostring(FIntPlusReferralRewardRobux)
		}
	})
	local RobloxPlusUpsellImpressionCount3 = UsePlusReferralFlyoutNewBadgeModule(ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FlyoutAnalyticsModule (upval)
		p1.closeDrawer()
		
		if p1.onOpenReferralSheet then
			p1.onOpenReferralSheet(p1.referrerId)
		end
		FlyoutAnalyticsModule.onFlyoutContentItemClicked({
			integrationId = "PlusReferralRecipient",
			source = "click"
		})
	end, { p1.closeDrawer, p1.referrerId, p1.onOpenReferralSheet }), "RobloxPlusUpsellImpressionCount3")
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-x-medium padding-y-medium",
		testId = "--core-ui-flyout-plus-referral-recipient",
		onActivated = RobloxPlusUpsellImpressionCount3.onActivated,
		LayoutOrder = p1.layoutOrder
	}, {
		PlusIcon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			style = UseTokensResult.Color.Content.Emphasis,
			name = IconName.RobloxPlus,
			size = IconSize.Medium
		}),
		BannerText = ReactModule.createElement(Text, {
			tag = "fill auto-y text-body-small text-wrap text-align-x-left content-emphasis",
			LayoutOrder = 2,
			Text = UseLocalizationResult.bannerText
		}),
		NewBadge = if RobloxPlusUpsellImpressionCount3.shouldShowNewBadge then ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy padding-x-xsmall padding-y-xxsmall radius-circle bg-system-contrast",
			LayoutOrder = 3
		}, {
			Text = ReactModule.createElement(Text, {
				tag = "auto-xy text-title-small",
				Text = UseLocalizationResult.newBadgeText,
				textStyle = UseTokensResult.Color.Surface.Surface_0
			})
		}) else nil
	})
end
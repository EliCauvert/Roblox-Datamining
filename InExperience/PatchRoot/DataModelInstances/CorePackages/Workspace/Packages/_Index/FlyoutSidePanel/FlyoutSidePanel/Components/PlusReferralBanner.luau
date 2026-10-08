local flyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local parent = flyoutSidePanel.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local fIntPlusReferralRewardRobux = sharedFlagsModule.FIntPlusReferralRewardRobux
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local iconName = foundationModule.Enums.IconName
local useLocalization = require(parent.Localization).Hooks.useLocalization
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local usePlusReferralFlyoutNewBadgeModule = require(flyoutSidePanel.Hooks.usePlusReferralFlyoutNewBadge)

return function(p1)
	-- upvalues: useTokens (ref), useDispatch (ref), useLocalization (ref), fIntPlusReferralRewardRobux (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), flyoutAnalyticsModule (ref), usePlusReferralFlyoutNewBadgeModule (ref), foundationModule (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var2 = useTokens()
	local var3 = useDispatch()
	local var4 = useLocalization({
		newBadgeText = "Feature.RobloxSubscription.Label.New",
		bannerText = {
			"Feature.RobloxSubscription.Heading.ReferralEntry",
			amount = fIntPlusReferralRewardRobux
		}
	})
	local var5 = usePlusReferralFlyoutNewBadgeModule(reactModule.useCallback(function()
		-- upvalues: p1 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (ref), navigateDown (copy), flyoutAnalyticsModule (copy)
		p1.closeDrawer()
		local t = { name = appPage.PlusReferralDashboard }
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
		else
			var3(navigateDown(t))
		end
		flyoutAnalyticsModule.onFlyoutContentItemClicked({ integrationId = "PlusReferral", source = "click" })
	end, { p1.closeDrawer, var3 }), "RobloxPlusUpsellImpressionCount1")
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-x-medium padding-y-medium",
		testId = "--core-ui-flyout-plus-referral",
		onActivated = var5.onActivated,
		LayoutOrder = p1.layoutOrder
	}, {
		PlusIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			style = var2.Color.Content.Emphasis,
			name = iconName.RobloxPlus,
			size = iconSize.Medium
		}),
		BannerText = reactModule.createElement(text, {
			tag = "fill auto-y text-body-small text-wrap text-align-x-left content-emphasis",
			LayoutOrder = 2,
			Text = var4.bannerText
		}),
		NewBadge = if var5.shouldShowNewBadge then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-x-xsmall padding-y-xxsmall radius-circle bg-system-contrast",
			LayoutOrder = 3
		}, {
			Text = reactModule.createElement(text, {
				tag = "auto-xy text-title-small",
				Text = var4.newBadgeText,
				textStyle = var2.Color.Surface.Surface_0
			})
		}) else nil
	})
end
local FlyoutSidePanel = script:FindFirstAncestor("FlyoutSidePanel")
local Parent = FlyoutSidePanel.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FIntPlusReferralRewardRobux = SharedFlagsModule.FIntPlusReferralRewardRobux
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local IconName = FoundationModule.Enums.IconName
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local UsePlusReferralFlyoutNewBadgeModule = require(FlyoutSidePanel.Hooks.usePlusReferralFlyoutNewBadge)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), FIntPlusReferralRewardRobux (copy), ReactModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FlyoutAnalyticsModule (copy), UsePlusReferralFlyoutNewBadgeModule (copy), FoundationModule (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		newBadgeText = "Feature.RobloxSubscription.Label.New",
		bannerText = {
			"Feature.RobloxSubscription.Heading.ReferralEntry",
			amount = FIntPlusReferralRewardRobux
		}
	})
	local RobloxPlusUpsellImpressionCount1 = UsePlusReferralFlyoutNewBadgeModule(ReactModule.useCallback(function()
		-- upvalues: p1 (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), FlyoutAnalyticsModule (upval)
		p1.closeDrawer()
		local config = { name = AppPage.PlusReferralDashboard }
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
		FlyoutAnalyticsModule.onFlyoutContentItemClicked({ integrationId = "PlusReferral", source = "click" })
	end, { p1.closeDrawer, UseDispatchResult }), "RobloxPlusUpsellImpressionCount1")
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-x-medium padding-y-medium",
		testId = "--core-ui-flyout-plus-referral",
		onActivated = RobloxPlusUpsellImpressionCount1.onActivated,
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
		NewBadge = if RobloxPlusUpsellImpressionCount1.shouldShowNewBadge then ReactModule.createElement(FoundationModule.View, {
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
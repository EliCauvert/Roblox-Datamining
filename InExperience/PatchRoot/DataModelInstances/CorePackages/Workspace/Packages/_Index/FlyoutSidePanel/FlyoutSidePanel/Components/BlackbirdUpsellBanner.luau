local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local IconName = FoundationModule.Enums.IconName
local UsePlaceholderLocalizationModule = require(script.Parent.Parent.Hooks.usePlaceholderLocalization)
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local FlyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagBlackbirdUpdateStringFlyoutMenu = require(Parent.SharedFlags).FFlagBlackbirdUpdateStringFlyoutMenu
local FixFlyoutMenuTextWrap = game:DefineFastFlag("FixFlyoutMenuTextWrap", false)
local FlyoutBlackbirdBannerFlexLayout = game:DefineFastFlag("FlyoutBlackbirdBannerFlexLayout", false)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), FFlagBlackbirdUpdateStringFlyoutMenu (copy), UseLocalizationFunction (copy), UsePlaceholderLocalizationModule (copy), ReactModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FlyoutContentSettingsModule (copy), FlyoutAnalyticsModule (copy), FixFlyoutMenuTextWrap (copy), FlyoutBlackbirdBannerFlexLayout (copy), FoundationModule (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = if FFlagBlackbirdUpdateStringFlyoutMenu then UseLocalizationFunction({
		bannerText = "Feature.RobloxSubscription.Description.ExclusiveBenefits"
	}) else UsePlaceholderLocalizationModule({
		bannerText = "Feature.RobloxSubscription.Description.ExclusiveBenefits"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), FlyoutContentSettingsModule (upval), FlyoutAnalyticsModule (upval)
		p1.closeDrawer()
		local config = { name = AppPage.Blackbird }
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
		local Blackbird = FlyoutContentSettingsModule.ItemType.Blackbird
		
		if Blackbird then
			FlyoutAnalyticsModule.onFlyoutContentItemClicked({ source = "click", integrationId = Blackbird })
		end
	end, { p1.closeDrawer })
	
	return if FixFlyoutMenuTextWrap and FlyoutBlackbirdBannerFlexLayout then ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-x-medium padding-y-xlarge",
		testId = "--core-ui-flyout-blackbird-upsell",
		onActivated = UseResult,
		LayoutOrder = p1.layoutOrder
	}, {
		BlackbirdIcon = ReactModule.createElement(Icon, {
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
		ChevronIcon = ReactModule.createElement(Icon, {
			LayoutOrder = 3,
			name = IconName.ChevronLargeRight,
			size = IconSize.Medium,
			style = UseTokensResult.Color.Content.Default
		})
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-0 auto-y padding-x-medium padding-y-xlarge",
		testId = "--core-ui-flyout-blackbird-upsell",
		onActivated = UseResult,
		LayoutOrder = p1.layoutOrder
	}, {
		ContentContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "position-center-left anchor-center-left auto-xy align-y-center row gap-medium"
		}, {
			BlackbirdIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				style = UseTokensResult.Color.Content.Emphasis,
				name = IconName.RobloxPlus,
				size = IconSize.Medium
			}),
			BannerText = ReactModule.createElement(Text, {
				tag = "text-body-small text-align-x-left text-wrap content-emphasis",
				LayoutOrder = 2,
				Size = if FixFlyoutMenuTextWrap then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0.65, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = UseLocalizationResult.bannerText
			})
		}),
		ChevronIcon = ReactModule.createElement(Icon, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			name = IconName.ChevronLargeRight,
			size = IconSize.Medium,
			style = UseTokensResult.Color.Content.Default
		})
	})
end
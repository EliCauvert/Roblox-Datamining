local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local iconName = foundationModule.Enums.IconName
local usePlaceholderLocalizationModule = require(script.Parent.Parent.Hooks.usePlaceholderLocalization)
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagBlackbirdUpdateStringFlyoutMenu = require(parent.SharedFlags).FFlagBlackbirdUpdateStringFlyoutMenu
local fixFlyoutMenuTextWrap = game:DefineFastFlag("FixFlyoutMenuTextWrap", false)
local flyoutBlackbirdBannerFlexLayout = game:DefineFastFlag("FlyoutBlackbirdBannerFlexLayout", false)

return function(p0) --[[ line: 32 | named "BlackbirdUpsellBanner" ]]
	-- upvalues: useTokens (ref), useDispatch (ref), fFlagBlackbirdUpdateStringFlyoutMenu (ref), useLocalization (ref), usePlaceholderLocalizationModule (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), flyoutContentSettingsModule (ref), flyoutAnalyticsModule (ref), fixFlyoutMenuTextWrap (ref), flyoutBlackbirdBannerFlexLayout (ref), foundationModule (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var8 = useTokens()
	local var9 = useDispatch()
	local var10 = if fFlagBlackbirdUpdateStringFlyoutMenu then useLocalization({
		bannerText = "Feature.RobloxSubscription.Description.ExclusiveBenefits"
	}) else usePlaceholderLocalizationModule({
		bannerText = "Feature.RobloxSubscription.Description.ExclusiveBenefits"
	})
	local var11 = reactModule.useCallback(function() --[[ line: 44 ]]
		-- upvalues: p0 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var9 (ref), navigateDown (copy), flyoutContentSettingsModule (copy), flyoutAnalyticsModule (copy)
		p0.closeDrawer()
		local t = { name = appPage.Blackbird }
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
		else
			var9(navigateDown(t))
		end
		local blackbird = flyoutContentSettingsModule.ItemType.Blackbird
		
		if blackbird then
			flyoutAnalyticsModule.onFlyoutContentItemClicked({ source = "click", integrationId = blackbird })
		end
	end, { p0.closeDrawer })
	
	return if fixFlyoutMenuTextWrap and flyoutBlackbirdBannerFlexLayout then reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-x-medium padding-y-xlarge",
		onActivated = var11,
		LayoutOrder = p0.layoutOrder
	}, {
		BlackbirdIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			style = var8.Color.Content.Emphasis,
			name = iconName.RobloxPlus,
			size = iconSize.Medium
		}),
		BannerText = reactModule.createElement(text, {
			tag = "fill auto-y text-body-small text-wrap text-align-x-left content-emphasis",
			LayoutOrder = 2,
			Text = var10.bannerText
		}),
		ChevronIcon = reactModule.createElement(icon, {
			LayoutOrder = 3,
			name = iconName.ChevronLargeRight,
			size = iconSize.Medium,
			style = var8.Color.Content.Default
		})
	}) else reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y padding-x-medium padding-y-xlarge",
		onActivated = var11,
		LayoutOrder = p0.layoutOrder
	}, {
		ContentContainer = reactModule.createElement(foundationModule.View, {
			tag = "position-center-left anchor-center-left auto-xy align-y-center row gap-medium"
		}, {
			BlackbirdIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				style = var8.Color.Content.Emphasis,
				name = iconName.RobloxPlus,
				size = iconSize.Medium
			}),
			BannerText = reactModule.createElement(text, {
				tag = "text-body-small text-align-x-left text-wrap content-emphasis",
				LayoutOrder = 2,
				Size = if fixFlyoutMenuTextWrap then UDim2.new(0.75, 0, 0, 0) else UDim2.new(0.65, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = var10.bannerText
			})
		}),
		ChevronIcon = reactModule.createElement(icon, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			name = iconName.ChevronLargeRight,
			size = iconSize.Medium,
			style = var8.Color.Content.Default
		})
	})
end
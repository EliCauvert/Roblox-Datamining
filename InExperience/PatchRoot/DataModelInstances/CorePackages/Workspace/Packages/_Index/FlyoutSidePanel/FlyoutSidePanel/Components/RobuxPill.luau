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
local Button = FoundationModule.Button
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FlyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local FlyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableFlyoutMenuRobuxCardRefactor = SharedFlagsModule.FFlagEnableFlyoutMenuRobuxCardRefactor
local FFlagEnableSharedFlyoutRobuxPill = SharedFlagsModule.FFlagEnableSharedFlyoutRobuxPill
local RobuxPill = if FFlagEnableSharedFlyoutRobuxPill then require(Parent.RobuxPill).RobuxPill else nil

local function _(p1)
	return tostring(p1):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FlyoutContentSettingsModule (copy), FlyoutAnalyticsModule (copy), FFlagEnableSharedFlyoutRobuxPill (copy), RobuxPill (copy), FFlagEnableFlyoutMenuRobuxCardRefactor (copy), FoundationModule (copy), Icon (copy), IconSize (copy), Text (copy), Button (copy), InputSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({ buyRobux = "IAPExperience.RobuxUpsell.Action.BuyRobux" })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), FlyoutContentSettingsModule (upval), FlyoutAnalyticsModule (upval)
		p1.closeDrawer()
		local config = { name = AppPage.PurchaseRobux }
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
		FlyoutAnalyticsModule.onFlyoutContentItemClicked({
			source = "click",
			integrationId = FlyoutContentSettingsModule.ItemType.RobuxPill
		})
	end, { p1.closeDrawer, UseDispatchResult })
	
	return if FFlagEnableSharedFlyoutRobuxPill then ReactModule.createElement(RobuxPill, {
		layoutOrder = p1.layoutOrder,
		robuxBalance = p1.robuxBalance,
		buyButtonText = UseLocalizationResult.buyRobux,
		onBuyActivated = UseResult,
		showBorder = not FFlagEnableFlyoutMenuRobuxCardRefactor
	}) else ReactModule.createElement(FoundationModule.View, {
		testId = "--core-ui-flyout-robux-pill",
		tag = if FFlagEnableFlyoutMenuRobuxCardRefactor then "size-full-0 auto-y padding-x-medium padding-y-xlarge" else "size-full-0 auto-y padding-xlarge",
		onActivated = UseResult,
		LayoutOrder = p1.layoutOrder
	}, {
		RobuxContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "position-center-left anchor-center-left auto-xy align-y-center row gap-small"
		}, {
			RobuxIcon = ReactModule.createElement(Icon, {
				name = "icons/common/goldrobux",
				LayoutOrder = 1,
				size = IconSize.Medium
			}),
			RobuxAmount = ReactModule.createElement(Text, {
				tag = "text-title-large text-align-x-left content-emphasis text-truncate-end",
				LayoutOrder = 2,
				Size = UDim2.new(0.5, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = tostring(p1.robuxBalance):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
			})
		}),
		BuyRobuxButton = ReactModule.createElement(Button, {
			testId = "--core-ui-flyout-button-buy-robux",
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			text = UseLocalizationResult.buyRobux,
			size = InputSize.Small,
			onActivated = UseResult
		}),
		UIStroke = if FFlagEnableFlyoutMenuRobuxCardRefactor then nil else ReactModule.createElement("UIStroke", {
			Color = UseTokensResult.Color.Stroke.Default.Color3,
			Transparency = UseTokensResult.Color.Stroke.Default.Transparency,
			Thickness = UseTokensResult.Stroke.Standard
		}),
		UICorner = if FFlagEnableFlyoutMenuRobuxCardRefactor then nil else ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		})
	})
end)
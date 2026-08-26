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
local button = foundationModule.Button
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local flyoutAnalyticsModule = require(script.Parent.Parent.Analytics.FlyoutAnalytics)
local flyoutContentSettingsModule = require(script.Parent.Parent.Config.FlyoutContentSettings)
local fFlagEnableFlyoutMenuRobuxCardRefactor = require(parent.SharedFlags).FFlagEnableFlyoutMenuRobuxCardRefactor

local function _(p1)
	return tostring(p1):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useDispatch (ref), useLocalization (ref), reactModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), flyoutContentSettingsModule (ref), flyoutAnalyticsModule (ref), fFlagEnableFlyoutMenuRobuxCardRefactor (ref), foundationModule (ref), icon (ref), iconSize (ref), text (ref), button (ref), inputSize (ref)
	local var2 = useTokens()
	local var3 = useDispatch()
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var3 (ref), navigateDown (copy), flyoutContentSettingsModule (copy), flyoutAnalyticsModule (copy)
		p1.closeDrawer()
		local t = { name = appPage.PurchaseRobux }
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
		else
			var3(navigateDown(t))
		end
		flyoutAnalyticsModule.onFlyoutContentItemClicked({
			source = "click",
			integrationId = flyoutContentSettingsModule.ItemType.RobuxPill
		})
	end, { p1.closeDrawer, var3 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = if fFlagEnableFlyoutMenuRobuxCardRefactor then "size-full-0 auto-y padding-x-medium padding-y-xlarge" else "size-full-0 auto-y padding-xlarge",
		onActivated = var4,
		LayoutOrder = p1.layoutOrder
	}, {
		RobuxContainer = reactModule.createElement(foundationModule.View, {
			tag = "position-center-left anchor-center-left auto-xy align-y-center row gap-small"
		}, {
			RobuxIcon = reactModule.createElement(icon, {
				name = "icons/common/goldrobux",
				LayoutOrder = 1,
				size = iconSize.Medium
			}),
			RobuxAmount = reactModule.createElement(text, {
				tag = "text-title-large text-align-x-left content-emphasis text-truncate-end",
				LayoutOrder = 2,
				Size = UDim2.new(0.5, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = tostring(p1.robuxBalance):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
			})
		}),
		BuyRobuxButton = reactModule.createElement(button, {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			text = useLocalization({ buyRobux = "IAPExperience.RobuxUpsell.Action.BuyRobux" }).buyRobux,
			size = inputSize.Small,
			onActivated = var4
		}),
		UIStroke = if not fFlagEnableFlyoutMenuRobuxCardRefactor then reactModule.createElement("UIStroke", {
			Color = var2.Color.Stroke.Default.Color3,
			Transparency = var2.Color.Stroke.Default.Transparency,
			Thickness = var2.Stroke.Standard
		}) else nil,
		UICorner = if not fFlagEnableFlyoutMenuRobuxCardRefactor then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var2.Radius.Medium) }) else nil
	})
end)
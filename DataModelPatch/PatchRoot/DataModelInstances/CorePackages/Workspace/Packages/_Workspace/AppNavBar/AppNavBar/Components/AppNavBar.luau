local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local UIBloxModule = require(Parent1.UIBlox)
local UseAppPolicyFunction = require(Parent1.UniversalAppPolicy).useAppPolicy
local UseRoactServiceFunction = require(Parent1.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent1.RoactServiceTags)
local NavigationBar = UIBloxModule.App.Navigation.NavigationBar
local NavigationRailV2 = UIBloxModule.App.Navigation.NavigationRailV2
local NavigationBarAlignment = UIBloxModule.App.Navigation.Enum.NavigationBarAlignment
local NavigationRailAlignment = UIBloxModule.App.Navigation.Enum.NavigationRailAlignment
local PlacementModule = require(Parent.Enum.Placement)
local AppNavItemModule = require(Parent.Components.AppNavItem)
local StudioCTAIconModule = require(Parent.Components.StudioCTAIcon)
local ConstantsModule = require(Parent.Constants)
local VisibilityControlModule = require(Parent.VisibilityControl)
local GetScrollAwayEnabledModule = require(Parent.getScrollAwayEnabled)
local AppNavTelemetryModule = require(Parent.Telemetry.AppNavTelemetry)
local WebViewRedesignEnabledEngineFeature = game:GetEngineFeature("WebViewRedesignEnabled")
local FFlagAddGamepadBumperNavigation = require(Parent1.SharedFlags).FFlagAddGamepadBumperNavigation
local FFlagShrinkAppNavBar = require(Parent1.SharedFlags).FFlagShrinkAppNavBar
local config = {
	selectedIndex = 1,
	isVisible = true,
	clipsDescendants = true
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseAppPolicyFunction (copy), UseRoactServiceFunction (copy), RoactServiceTagsModule (copy), ReactModule (copy), StudioCTAIconModule (copy), WebViewRedesignEnabledEngineFeature (copy), ConstantsModule (copy), AppNavItemModule (copy), FFlagShrinkAppNavBar (copy), GetScrollAwayEnabledModule (copy), VisibilityControlModule (copy), AppNavTelemetryModule (copy), PlacementModule (copy), NavigationBar (copy), NavigationBarAlignment (copy), NavigationRailV2 (copy), NavigationRailAlignment (copy), FFlagAddGamepadBumperNavigation (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local Items = JoinResult.items
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getShowStudioCTA()
	end)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactServiceTagsModule.AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactServiceTagsModule.AppLinking)
	local UseResult = ReactModule.useCallback(function(_, ControlState)
		-- upvalues: ReactModule (upval), StudioCTAIconModule (upval), WebViewRedesignEnabledEngineFeature (upval), p1 (copy)
		return ReactModule.createElement(StudioCTAIconModule, {
			controlState = ControlState,
			showTooltip = if WebViewRedesignEnabledEngineFeature then p1.showTooltip else nil
		})
	end, {
		if WebViewRedesignEnabledEngineFeature then p1.showTooltip else nil
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRoactServiceResult (copy), ConstantsModule (upval), JoinResult (copy), UseRoactServiceResult1 (copy)
		UseRoactServiceResult:setRBXEventStream(ConstantsModule.STUDIO_CTA_EVENT_CONTEXT, ConstantsModule.STUDIO_CTA_EVENT_NAME_OPEN)
		UseRoactServiceResult1:openURL((JoinResult.buildCreatorWebNavUrl({ utm_content = "side_bar_blue_icon" })))
	end, {
		UseRoactServiceResult,
		UseRoactServiceResult1,
		JoinResult.buildCreatorWebNavUrl
	})
	
	if UseAppPolicyResult then
		Items = CryoModule.List.join(Items)
		table.insert(Items, {
			isSecondary = true,
			renderIcon = UseResult,
			onActivated = UseResult1
		})
	end
	local Element = nil
	local UseResult2 = ReactModule.useCallback(function(Item, IsChecked)
		-- upvalues: ReactModule (upval), AppNavItemModule (upval), FFlagShrinkAppNavBar (upval), JoinResult (copy)
		return ReactModule.createElement(AppNavItemModule, {
			isCenterPositioned = true,
			hasLabel = true,
			item = Item,
			isChecked = IsChecked,
			systemBarLabelTextSizeBinding = if FFlagShrinkAppNavBar then nil else JoinResult.systemBarLabelTextSizeBinding
		})
	end, { JoinResult.systemBarLabelTextSizeBinding })
	local UseResult21 = ReactModule.useCallback(function(Item, IsChecked)
		-- upvalues: ReactModule (upval), AppNavItemModule (upval), FFlagShrinkAppNavBar (upval), JoinResult (copy)
		return ReactModule.createElement(AppNavItemModule, {
			isCenterPositioned = false,
			hasLabel = true,
			item = Item,
			isChecked = IsChecked,
			systemBarLabelTextSizeBinding = if FFlagShrinkAppNavBar then nil else JoinResult.systemBarLabelTextSizeBinding
		})
	end, { JoinResult.systemBarLabelTextSizeBinding })
	local FooterBinding = nil
	
	if GetScrollAwayEnabledModule() then
		FooterBinding = VisibilityControlModule.getFooterBinding()
		ReactModule.useEffect(function()
			-- upvalues: VisibilityControlModule (upval), JoinResult (copy)
			VisibilityControlModule.setFooterVisible(JoinResult.isVisible)
		end, { JoinResult.isVisible })
	end
	ReactModule.useEffect(function()
		-- upvalues: JoinResult (copy), AppNavTelemetryModule (upval)
		local Item = JoinResult.items[JoinResult.selectedIndex]
		
		if Item ~= nil and Item.page ~= nil then
			AppNavTelemetryModule.logSwitchTabEnd(Item.page)
		end
	end, { JoinResult.items, JoinResult.selectedIndex })
	ReactModule.useEffect(function()
		-- upvalues: AppNavTelemetryModule (upval), JoinResult (copy)
		AppNavTelemetryModule.logVisibilityEnd(JoinResult.isVisible)
	end, { JoinResult.isVisible })
	ReactModule.useEffect(function()
		-- upvalues: AppNavTelemetryModule (upval), JoinResult (copy)
		AppNavTelemetryModule.logPlacement(JoinResult.placement)
	end, { JoinResult.placement })
	
	if JoinResult.placement == PlacementModule.Bottom then
		Element = ReactModule.createElement(NavigationBar, {
			animated = true,
			active = true,
			alignment = NavigationBarAlignment.EvenlyDistributed,
			items = Items,
			isVisible = JoinResult.isVisible,
			size = JoinResult.size,
			renderItem = UseResult2,
			position = JoinResult.position,
			selection = JoinResult.selectedIndex,
			clipsDescendants = JoinResult.clipsDescendants,
			visibility = FooterBinding
		})
		
		return Element
	end
	if JoinResult.placement == PlacementModule.Left then
		Element = ReactModule.createElement(NavigationRailV2, {
			animated = true,
			alignment = NavigationRailAlignment.Justified,
			items = Items,
			renderItem = UseResult21,
			size = JoinResult.size,
			isVisible = JoinResult.isVisible,
			position = JoinResult.position,
			selection = JoinResult.selectedIndex,
			clipsDescendants = JoinResult.clipsDescendants,
			leadingComponent = if FFlagAddGamepadBumperNavigation then JoinResult.leadingComponent else nil,
			trailingComponent = if FFlagAddGamepadBumperNavigation then JoinResult.trailingComponent else nil
		})
	end
	return Element
end)
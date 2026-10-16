local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local FoundationModule = require(Parent1.Foundation)
local UIBloxModule = require(Parent1.UIBlox)
local UseAppPolicyFunction = require(Parent1.UniversalAppPolicy).useAppPolicy
local UseRoactServiceFunction = require(Parent1.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent1.RoactServiceTags)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
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
local FFlagEnableFlyoutOnNavRail = require(Parent1.SharedFlags).FFlagEnableFlyoutOnNavRail
local FFlagEnableNavRailTooltipAndTruncation = require(Parent1.SharedFlags).FFlagEnableNavRailTooltipAndTruncation
local AppNavBarGateFooterVisibleOnPlacement = game:DefineFastFlag("AppNavBarGateFooterVisibleOnPlacement", false)
local AppNavBarFooterVisibleWithoutScrollAway = game:DefineFastFlag("AppNavBarFooterVisibleWithoutScrollAway", false)

local function _(p1, p2, p3, p4) --[[ Line: 62 | Named "addItems" ]]
	-- upvalues: CryoModule (copy)
	return CryoModule.List.join(p1, p3, p2), p4 + #p1
end

local config = {
	selectedIndex = 1,
	isVisible = true,
	clipsDescendants = true
}

return ReactModule.memo(function(p1) --[[ Line: 79 | Named "AppNavBar" ]]
	-- upvalues: CryoModule (copy), config (copy), FFlagEnableNavRailTooltipAndTruncation (copy), UseTokensFunction (copy), UseAppPolicyFunction (copy), UseRoactServiceFunction (copy), RoactServiceTagsModule (copy), ReactModule (copy), StudioCTAIconModule (copy), WebViewRedesignEnabledEngineFeature (copy), ConstantsModule (copy), FFlagEnableFlyoutOnNavRail (copy), AppNavItemModule (copy), FFlagShrinkAppNavBar (copy), PopoverSide (copy), PopoverAlign (copy), GetScrollAwayEnabledModule (copy), AppNavBarFooterVisibleWithoutScrollAway (copy), VisibilityControlModule (copy), AppNavBarGateFooterVisibleOnPlacement (copy), PlacementModule (copy), AppNavTelemetryModule (copy), NavigationBar (copy), NavigationBarAlignment (copy), NavigationRailV2 (copy), NavigationRailAlignment (copy), FFlagAddGamepadBumperNavigation (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTokensResult = if FFlagEnableNavRailTooltipAndTruncation then UseTokensFunction() else nil
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 85 ]]
		return p2.getShowStudioCTA()
	end)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactServiceTagsModule.AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactServiceTagsModule.AppLinking)
	local UseResult = ReactModule.useCallback(function(_, ControlState) --[[ Line: 90 ]]
		-- upvalues: ReactModule (upval), StudioCTAIconModule (upval), WebViewRedesignEnabledEngineFeature (upval), p1 (copy)
		return ReactModule.createElement(StudioCTAIconModule, {
			controlState = ControlState,
			showTooltip = if WebViewRedesignEnabledEngineFeature then p1.showTooltip else nil
		})
	end, {
		if WebViewRedesignEnabledEngineFeature then p1.showTooltip else nil
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 96 ]]
		-- upvalues: UseRoactServiceResult (copy), ConstantsModule (upval), JoinResult (copy), UseRoactServiceResult1 (copy)
		UseRoactServiceResult:setRBXEventStream(ConstantsModule.STUDIO_CTA_EVENT_CONTEXT, ConstantsModule.STUDIO_CTA_EVENT_NAME_OPEN)
		UseRoactServiceResult1:openURL((JoinResult.buildCreatorWebNavUrl({ utm_content = "side_bar_blue_icon" })))
	end, {
		UseRoactServiceResult,
		UseRoactServiceResult1,
		JoinResult.buildCreatorWebNavUrl
	})
	local Items = nil
	local SelectedIndex = nil
	
	if FFlagEnableFlyoutOnNavRail then
		local List = {}
		local List1 = {}
		
		if JoinResult.menuItem ~= nil then
			table.insert(List, JoinResult.menuItem)
		end
		if UseAppPolicyResult then
			table.insert(List1, {
				isSecondary = true,
				renderIcon = UseResult,
				onActivated = UseResult1
			})
		end
		Items = CryoModule.List.join(List, JoinResult.items, List1)
		SelectedIndex = JoinResult.selectedIndex + #List
	else
		Items = JoinResult.items
		SelectedIndex = JoinResult.selectedIndex
		
		if UseAppPolicyResult then
			Items = CryoModule.List.join(Items)
			table.insert(Items, {
				isSecondary = true,
				renderIcon = UseResult,
				onActivated = UseResult1
			})
		end
	end
	local Element = nil
	local UseResult2 = ReactModule.useCallback(function(Item, IsChecked) --[[ Line: 138 ]]
		-- upvalues: ReactModule (upval), AppNavItemModule (upval), FFlagShrinkAppNavBar (upval), JoinResult (copy), FFlagEnableNavRailTooltipAndTruncation (upval)
		return ReactModule.createElement(AppNavItemModule, {
			isCenterPositioned = true,
			hasLabel = true,
			item = Item,
			isChecked = IsChecked,
			systemBarLabelTextSizeBinding = if FFlagShrinkAppNavBar then nil else JoinResult.systemBarLabelTextSizeBinding,
			fillWidth = if FFlagEnableNavRailTooltipAndTruncation then true else nil,
			enableTooltip = not FFlagEnableNavRailTooltipAndTruncation and nil
		})
	end, { JoinResult.systemBarLabelTextSizeBinding })
	local UseResult3 = ReactModule.useCallback(function(Item, IsChecked) --[[ Line: 150 ]]
		-- upvalues: ReactModule (upval), AppNavItemModule (upval), FFlagShrinkAppNavBar (upval), JoinResult (copy), FFlagEnableNavRailTooltipAndTruncation (upval), PopoverSide (upval), PopoverAlign (upval)
		return ReactModule.createElement(AppNavItemModule, {
			isCenterPositioned = false,
			hasLabel = true,
			item = Item,
			isChecked = IsChecked,
			systemBarLabelTextSizeBinding = if FFlagShrinkAppNavBar then nil else JoinResult.systemBarLabelTextSizeBinding,
			width = if FFlagEnableNavRailTooltipAndTruncation then UDim.new(1, 0) else nil,
			enableTooltip = if FFlagEnableNavRailTooltipAndTruncation then Item.labelText ~= nil else nil,
			tooltipSide = if FFlagEnableNavRailTooltipAndTruncation then PopoverSide.Right else nil,
			tooltipAlign = if FFlagEnableNavRailTooltipAndTruncation then PopoverAlign.Center else nil
		})
	end, { JoinResult.systemBarLabelTextSizeBinding })
	local FooterBinding = nil
	
	if GetScrollAwayEnabledModule() or AppNavBarFooterVisibleWithoutScrollAway then
		FooterBinding = VisibilityControlModule.getFooterBinding()
		ReactModule.useEffect(function() --[[ Line: 168 ]]
			-- upvalues: AppNavBarGateFooterVisibleOnPlacement (upval), JoinResult (copy), PlacementModule (upval), VisibilityControlModule (upval)
			VisibilityControlModule.setFooterVisible(if AppNavBarGateFooterVisibleOnPlacement then JoinResult.isVisible and JoinResult.placement == PlacementModule.Bottom else JoinResult.isVisible)
		end, {
			JoinResult.isVisible,
			if AppNavBarGateFooterVisibleOnPlacement then JoinResult.placement else nil
		})
	end
	ReactModule.useEffect(function() --[[ Line: 178 ]]
		-- upvalues: FFlagEnableFlyoutOnNavRail (upval), Items (ref), SelectedIndex (ref), JoinResult (copy), AppNavTelemetryModule (upval)
		local Item = if FFlagEnableFlyoutOnNavRail then Items[SelectedIndex] else JoinResult.items[JoinResult.selectedIndex]
		
		if Item ~= nil and Item.page ~= nil then
			AppNavTelemetryModule.logSwitchTabEnd(Item.page)
		end
	end, if FFlagEnableFlyoutOnNavRail then { Items, SelectedIndex } else { JoinResult.items, JoinResult.selectedIndex })
	ReactModule.useEffect(function() --[[ Line: 199 ]]
		-- upvalues: AppNavTelemetryModule (upval), JoinResult (copy)
		AppNavTelemetryModule.logVisibilityEnd(JoinResult.isVisible)
	end, { JoinResult.isVisible })
	ReactModule.useEffect(function() --[[ Line: 202 ]]
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
			selection = SelectedIndex,
			clipsDescendants = JoinResult.clipsDescendants,
			visibility = FooterBinding,
			spacing = if FFlagEnableNavRailTooltipAndTruncation then UDim.new(0, UseTokensResult.Gap.Small) else nil
		})
	elseif JoinResult.placement == PlacementModule.Left then
		Element = ReactModule.createElement(NavigationRailV2, {
			animated = true,
			alignment = NavigationRailAlignment.Justified,
			items = Items,
			renderItem = UseResult3,
			size = JoinResult.size,
			isVisible = JoinResult.isVisible,
			position = JoinResult.position,
			selection = SelectedIndex,
			clipsDescendants = JoinResult.clipsDescendants,
			leadingComponent = if FFlagAddGamepadBumperNavigation then JoinResult.leadingComponent else nil,
			trailingComponent = if FFlagAddGamepadBumperNavigation then JoinResult.trailingComponent else nil,
			spacing = if FFlagEnableNavRailTooltipAndTruncation then UDim.new(0, UseTokensResult.Gap.Small) else nil
		})
	end
	return Element
end)
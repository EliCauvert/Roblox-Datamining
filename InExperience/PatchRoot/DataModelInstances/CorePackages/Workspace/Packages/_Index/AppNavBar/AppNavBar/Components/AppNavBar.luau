local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local UIBloxModule = require(parent_1.UIBlox)
local useAppPolicy = require(parent_1.UniversalAppPolicy).useAppPolicy
local useRoactService = require(parent_1.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent_1.RoactServiceTags)
local useTokens = foundationModule.Hooks.useTokens
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local navigationBar = UIBloxModule.App.Navigation.NavigationBar
local navigationRailV2 = UIBloxModule.App.Navigation.NavigationRailV2
local navigationBarAlignment = UIBloxModule.App.Navigation.Enum.NavigationBarAlignment
local navigationRailAlignment = UIBloxModule.App.Navigation.Enum.NavigationRailAlignment
local placementModule = require(parent.Enum.Placement)
local appNavItemModule = require(parent.Components.AppNavItem)
local studioCTAIconModule = require(parent.Components.StudioCTAIcon)
local constantsModule = require(parent.Constants)
local visibilityControlModule = require(parent.VisibilityControl)
local getScrollAwayEnabledModule = require(parent.getScrollAwayEnabled)
local appNavTelemetryModule = require(parent.Telemetry.AppNavTelemetry)
local webViewRedesignEnabledEngineFeature = game:GetEngineFeature("WebViewRedesignEnabled")
local fFlagAddGamepadBumperNavigation = require(parent_1.SharedFlags).FFlagAddGamepadBumperNavigation
local fFlagShrinkAppNavBar = require(parent_1.SharedFlags).FFlagShrinkAppNavBar
local fFlagEnableFlyoutOnNavRail = require(parent_1.SharedFlags).FFlagEnableFlyoutOnNavRail
local fFlagEnableNavRailTooltipAndTruncation = require(parent_1.SharedFlags).FFlagEnableNavRailTooltipAndTruncation
local appNavBarGateFooterVisibleOnPlacement = game:DefineFastFlag("AppNavBarGateFooterVisibleOnPlacement", false)
local appNavBarFooterVisibleWithoutScrollAway = game:DefineFastFlag("AppNavBarFooterVisibleWithoutScrollAway", false)

local function _(p1, p2, p3, p4)
	-- upvalues: cryoModule (ref)
	return cryoModule.List.join(p1, p3, p2), p4 + #p1
end

local t = {
	selectedIndex = 1,
	isVisible = true,
	clipsDescendants = true
}

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), fFlagEnableNavRailTooltipAndTruncation (ref), useTokens (ref), useAppPolicy (ref), useRoactService (ref), roactServiceTagsModule (ref), reactModule (ref), studioCTAIconModule (ref), webViewRedesignEnabledEngineFeature (ref), constantsModule (ref), fFlagEnableFlyoutOnNavRail (ref), appNavItemModule (ref), fFlagShrinkAppNavBar (ref), popoverSide (ref), popoverAlign (ref), getScrollAwayEnabledModule (ref), appNavBarFooterVisibleWithoutScrollAway (ref), visibilityControlModule (ref), appNavBarGateFooterVisibleOnPlacement (ref), placementModule (ref), appNavTelemetryModule (ref), navigationBar (ref), navigationBarAlignment (ref), navigationRailV2 (ref), navigationRailAlignment (ref), fFlagAddGamepadBumperNavigation (ref)
	local items, selectedIndex
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = if fFlagEnableNavRailTooltipAndTruncation then useTokens() else nil
	local var3 = useAppPolicy(function(p2)
		return p2.getShowStudioCTA()
	end)
	local var4 = useRoactService(roactServiceTagsModule.AppEventIngestService)
	local var5 = useRoactService(roactServiceTagsModule.AppLinking)
	local var6 = reactModule.useCallback(function(_, p2)
		-- upvalues: reactModule (copy), studioCTAIconModule (copy), webViewRedesignEnabledEngineFeature (copy), p1 (ref)
		return reactModule.createElement(studioCTAIconModule, {
			controlState = p2,
			showTooltip = if webViewRedesignEnabledEngineFeature then p1.showTooltip else nil
		})
	end, {
		if webViewRedesignEnabledEngineFeature then p1.showTooltip else nil
	})
	local var7 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), constantsModule (copy), var1 (ref), var5 (ref)
		var4:setRBXEventStream(constantsModule.STUDIO_CTA_EVENT_CONTEXT, constantsModule.STUDIO_CTA_EVENT_NAME_OPEN)
		var5:openURL(var1.buildCreatorWebNavUrl({ utm_content = "side_bar_blue_icon" }))
	end, { var4, var5, var1.buildCreatorWebNavUrl })
	local _ = nil
	local _ = nil
	
	if fFlagEnableFlyoutOnNavRail then
		local t_1 = {}
		local t_2 = {}
		
		if var1.menuItem ~= nil then
			table.insert(t_1, var1.menuItem)
		end
		if var3 then
			table.insert(t_2, {
				isSecondary = true,
				renderIcon = var6,
				onActivated = var7
			})
		end
		items = cryoModule.List.join(t_1, var1.items, t_2)
		selectedIndex = var1.selectedIndex + #t_1
	else
		items = var1.items
		selectedIndex = var1.selectedIndex
		
		if var3 then
			items = cryoModule.List.join(items)
			table.insert(items, {
				isSecondary = true,
				renderIcon = var6,
				onActivated = var7
			})
		end
	end
	local var8 = nil
	local var9 = reactModule.useCallback(function(p2, p3)
		-- upvalues: reactModule (copy), appNavItemModule (copy), fFlagShrinkAppNavBar (copy), var1 (ref), fFlagEnableNavRailTooltipAndTruncation (copy)
		return reactModule.createElement(appNavItemModule, {
			isCenterPositioned = true,
			hasLabel = true,
			item = p2,
			isChecked = p3,
			systemBarLabelTextSizeBinding = if fFlagShrinkAppNavBar then nil else var1.systemBarLabelTextSizeBinding,
			fillWidth = if fFlagEnableNavRailTooltipAndTruncation then true else nil,
			enableTooltip = if fFlagEnableNavRailTooltipAndTruncation then false else nil
		})
	end, { var1.systemBarLabelTextSizeBinding })
	local var10 = reactModule.useCallback(function(p2, p3)
		-- upvalues: reactModule (copy), appNavItemModule (copy), fFlagShrinkAppNavBar (copy), var1 (ref), fFlagEnableNavRailTooltipAndTruncation (copy), popoverSide (copy), popoverAlign (copy)
		local var11
		local createElement = reactModule.createElement
		local t = {
			isCenterPositioned = false,
			hasLabel = true,
			item = p2,
			isChecked = p3,
			systemBarLabelTextSizeBinding = if fFlagShrinkAppNavBar then nil else var1.systemBarLabelTextSizeBinding,
			width = if fFlagEnableNavRailTooltipAndTruncation then UDim.new(1, 0) else nil
		}
		
		if fFlagEnableNavRailTooltipAndTruncation then
			var11 = p2.labelText ~= nil
			var11 = nil
		else
			var11 = nil
		end
		t.enableTooltip = var11
		t.tooltipSide = if fFlagEnableNavRailTooltipAndTruncation then popoverSide.Right else nil
		t.tooltipAlign = if fFlagEnableNavRailTooltipAndTruncation then popoverAlign.Center else nil
		
		return createElement(appNavItemModule, t)
	end, { var1.systemBarLabelTextSizeBinding })
	local footerBinding = nil
	
	if getScrollAwayEnabledModule() or appNavBarFooterVisibleWithoutScrollAway then
		footerBinding = visibilityControlModule.getFooterBinding()
		reactModule.useEffect(function()
			-- upvalues: appNavBarGateFooterVisibleOnPlacement (copy), var1 (ref), placementModule (copy), visibilityControlModule (copy)
			local isVisible
			if appNavBarGateFooterVisibleOnPlacement then
				isVisible = var1.isVisible
				
				if isVisible then
					isVisible = var1.placement == placementModule.Bottom
					isVisible = nil
				end
			else
				isVisible = var1.isVisible
			end
			visibilityControlModule.setFooterVisible(isVisible)
		end, {
			var1.isVisible,
			if appNavBarGateFooterVisibleOnPlacement then var1.placement else nil
		})
	end
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableFlyoutOnNavRail (copy), items (write), selectedIndex (write), var1 (ref), appNavTelemetryModule (copy)
		local var11 = if fFlagEnableFlyoutOnNavRail then items[selectedIndex] else var1.items[var1.selectedIndex]
		
		if var11 ~= nil and var11.page ~= nil then
			appNavTelemetryModule.logSwitchTabEnd(var11.page)
		end
	end, if fFlagEnableFlyoutOnNavRail then { items, selectedIndex } else { var1.items, var1.selectedIndex })
	reactModule.useEffect(function()
		-- upvalues: appNavTelemetryModule (copy), var1 (ref)
		appNavTelemetryModule.logVisibilityEnd(var1.isVisible)
	end, { var1.isVisible })
	reactModule.useEffect(function()
		-- upvalues: appNavTelemetryModule (copy), var1 (ref)
		appNavTelemetryModule.logPlacement(var1.placement)
	end, { var1.placement })
	
	if var1.placement == placementModule.Bottom then
		var8 = reactModule.createElement(navigationBar, {
			animated = true,
			active = true,
			alignment = navigationBarAlignment.EvenlyDistributed,
			items = items,
			isVisible = var1.isVisible,
			size = var1.size,
			renderItem = var9,
			position = var1.position,
			selection = selectedIndex,
			clipsDescendants = var1.clipsDescendants,
			visibility = footerBinding,
			spacing = if fFlagEnableNavRailTooltipAndTruncation then UDim.new(0, var2.Gap.Small) else nil
		})
	elseif var1.placement == placementModule.Left then
		var8 = reactModule.createElement(navigationRailV2, {
			animated = true,
			alignment = navigationRailAlignment.Justified,
			items = items,
			renderItem = var10,
			size = var1.size,
			isVisible = var1.isVisible,
			position = var1.position,
			selection = selectedIndex,
			clipsDescendants = var1.clipsDescendants,
			leadingComponent = if fFlagAddGamepadBumperNavigation then var1.leadingComponent else nil,
			trailingComponent = if fFlagAddGamepadBumperNavigation then var1.trailingComponent else nil,
			spacing = if fFlagEnableNavRailTooltipAndTruncation then UDim.new(0, var2.Gap.Small) else nil
		})
	end
	return var8
end)
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local UIBloxModule = require(parent_1.UIBlox)
local useAppPolicy = require(parent_1.UniversalAppPolicy).useAppPolicy
local useRoactService = require(parent_1.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent_1.RoactServiceTags)
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
	-- upvalues: cryoModule (ref), t (ref), useAppPolicy (ref), useRoactService (ref), roactServiceTagsModule (ref), reactModule (ref), studioCTAIconModule (ref), webViewRedesignEnabledEngineFeature (ref), constantsModule (ref), fFlagEnableFlyoutOnNavRail (ref), appNavItemModule (ref), fFlagShrinkAppNavBar (ref), getScrollAwayEnabledModule (ref), appNavBarFooterVisibleWithoutScrollAway (ref), visibilityControlModule (ref), appNavBarGateFooterVisibleOnPlacement (ref), placementModule (ref), appNavTelemetryModule (ref), navigationBar (ref), navigationBarAlignment (ref), navigationRailV2 (ref), navigationRailAlignment (ref), fFlagAddGamepadBumperNavigation (ref)
	local items, selectedIndex
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useAppPolicy(function(p2)
		return p2.getShowStudioCTA()
	end)
	local var3 = useRoactService(roactServiceTagsModule.AppEventIngestService)
	local var4 = useRoactService(roactServiceTagsModule.AppLinking)
	local var5 = reactModule.useCallback(function(_, p2)
		-- upvalues: reactModule (copy), studioCTAIconModule (copy), webViewRedesignEnabledEngineFeature (copy), p1 (ref)
		return reactModule.createElement(studioCTAIconModule, {
			controlState = p2,
			showTooltip = if webViewRedesignEnabledEngineFeature then p1.showTooltip else nil
		})
	end, {
		if webViewRedesignEnabledEngineFeature then p1.showTooltip else nil
	})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), constantsModule (copy), var1 (ref), var4 (ref)
		var3:setRBXEventStream(constantsModule.STUDIO_CTA_EVENT_CONTEXT, constantsModule.STUDIO_CTA_EVENT_NAME_OPEN)
		var4:openURL(var1.buildCreatorWebNavUrl({ utm_content = "side_bar_blue_icon" }))
	end, { var3, var4, var1.buildCreatorWebNavUrl })
	local _ = nil
	local _ = nil
	
	if fFlagEnableFlyoutOnNavRail then
		local t_1 = {}
		local t_2 = {}
		
		if var1.menuItem ~= nil then
			table.insert(t_1, var1.menuItem)
		end
		if var2 then
			table.insert(t_2, {
				isSecondary = true,
				renderIcon = var5,
				onActivated = var6
			})
		end
		items = cryoModule.List.join(t_1, var1.items, t_2)
		selectedIndex = var1.selectedIndex + #t_1
	else
		items = var1.items
		selectedIndex = var1.selectedIndex
		
		if var2 then
			items = cryoModule.List.join(items)
			table.insert(items, {
				isSecondary = true,
				renderIcon = var5,
				onActivated = var6
			})
		end
	end
	local var7 = nil
	local var8 = reactModule.useCallback(function(p2, p3)
		-- upvalues: reactModule (copy), appNavItemModule (copy), fFlagShrinkAppNavBar (copy), var1 (ref)
		return reactModule.createElement(appNavItemModule, {
			isCenterPositioned = true,
			hasLabel = true,
			item = p2,
			isChecked = p3,
			systemBarLabelTextSizeBinding = if fFlagShrinkAppNavBar then nil else var1.systemBarLabelTextSizeBinding
		})
	end, { var1.systemBarLabelTextSizeBinding })
	local var9 = reactModule.useCallback(function(p2, p3)
		-- upvalues: reactModule (copy), appNavItemModule (copy), fFlagShrinkAppNavBar (copy), var1 (ref)
		return reactModule.createElement(appNavItemModule, {
			isCenterPositioned = false,
			hasLabel = true,
			item = p2,
			isChecked = p3,
			systemBarLabelTextSizeBinding = if fFlagShrinkAppNavBar then nil else var1.systemBarLabelTextSizeBinding
		})
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
		local var10 = if fFlagEnableFlyoutOnNavRail then items[selectedIndex] else var1.items[var1.selectedIndex]
		
		if var10 ~= nil and var10.page ~= nil then
			appNavTelemetryModule.logSwitchTabEnd(var10.page)
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
		var7 = reactModule.createElement(navigationBar, {
			animated = true,
			active = true,
			alignment = navigationBarAlignment.EvenlyDistributed,
			items = items,
			isVisible = var1.isVisible,
			size = var1.size,
			renderItem = var8,
			position = var1.position,
			selection = selectedIndex,
			clipsDescendants = var1.clipsDescendants,
			visibility = footerBinding
		})
	elseif var1.placement == placementModule.Left then
		var7 = reactModule.createElement(navigationRailV2, {
			animated = true,
			alignment = navigationRailAlignment.Justified,
			items = items,
			renderItem = var9,
			size = var1.size,
			isVisible = var1.isVisible,
			position = var1.position,
			selection = selectedIndex,
			clipsDescendants = var1.clipsDescendants,
			leadingComponent = if fFlagAddGamepadBumperNavigation then var1.leadingComponent else nil,
			trailingComponent = if fFlagAddGamepadBumperNavigation then var1.trailingComponent else nil
		})
	end
	return var7
end)
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

local function _(p0, p1, p2, p3) --[[ line: 56 | named "addItems" ]]
	-- upvalues: cryoModule (ref)
	return cryoModule.List.join(p0, p2, p1), p3 + #p0
end

local t = {
	selectedIndex = 1,
	isVisible = true,
	clipsDescendants = true
}

return reactModule.memo(function(p4) --[[ line: 73 | named "AppNavBar" ]]
	-- upvalues: cryoModule (ref), t (ref), useAppPolicy (ref), useRoactService (ref), roactServiceTagsModule (ref), reactModule (ref), studioCTAIconModule (ref), webViewRedesignEnabledEngineFeature (ref), constantsModule (ref), fFlagEnableFlyoutOnNavRail (ref), appNavItemModule (ref), fFlagShrinkAppNavBar (ref), getScrollAwayEnabledModule (ref), appNavBarFooterVisibleWithoutScrollAway (ref), visibilityControlModule (ref), appNavBarGateFooterVisibleOnPlacement (ref), placementModule (ref), appNavTelemetryModule (ref), navigationBar (ref), navigationBarAlignment (ref), navigationRailV2 (ref), navigationRailAlignment (ref), fFlagAddGamepadBumperNavigation (ref)
	local items, selectedIndex
	local var15 = cryoModule.Dictionary.join(t, p4)
	local var16 = useAppPolicy(function(p5) --[[ line: 77 ]]
		return p5.getShowStudioCTA()
	end)
	local var17 = useRoactService(roactServiceTagsModule.AppEventIngestService)
	local var18 = useRoactService(roactServiceTagsModule.AppLinking)
	local var19 = reactModule.useCallback(function(_, p6) --[[ line: 82 ]]
		-- upvalues: reactModule (copy), studioCTAIconModule (copy), webViewRedesignEnabledEngineFeature (copy), p4 (ref)
		return reactModule.createElement(studioCTAIconModule, {
			controlState = p6,
			showTooltip = if webViewRedesignEnabledEngineFeature then p4.showTooltip else nil
		})
	end, {
		if webViewRedesignEnabledEngineFeature then p4.showTooltip else nil
	})
	local var20 = reactModule.useCallback(function() --[[ line: 88 ]]
		-- upvalues: var17 (ref), constantsModule (copy), var15 (ref), var18 (ref)
		var17:setRBXEventStream(constantsModule.STUDIO_CTA_EVENT_CONTEXT, constantsModule.STUDIO_CTA_EVENT_NAME_OPEN)
		var18:openURL(var15.buildCreatorWebNavUrl({ utm_content = "side_bar_blue_icon" }))
	end, { var17, var18, var15.buildCreatorWebNavUrl })
	local _ = nil
	local _ = nil
	
	if fFlagEnableFlyoutOnNavRail then
		local t_1 = {}
		local t_2 = {}
		
		if var15.menuItem ~= nil then
			table.insert(t_1, var15.menuItem)
		end
		if var16 then
			table.insert(t_2, {
				isSecondary = true,
				renderIcon = var19,
				onActivated = var20
			})
		end
		items = cryoModule.List.join(t_1, var15.items, t_2)
		selectedIndex = var15.selectedIndex + #t_1
	else
		items = var15.items
		selectedIndex = var15.selectedIndex
		
		if var16 then
			items = cryoModule.List.join(items)
			table.insert(items, {
				isSecondary = true,
				renderIcon = var19,
				onActivated = var20
			})
		end
	end
	local var23 = nil
	local var24 = reactModule.useCallback(function(p7, p8) --[[ line: 130 ]]
		-- upvalues: reactModule (copy), appNavItemModule (copy), fFlagShrinkAppNavBar (copy), var15 (ref)
		return reactModule.createElement(appNavItemModule, {
			isCenterPositioned = true,
			hasLabel = true,
			item = p7,
			isChecked = p8,
			systemBarLabelTextSizeBinding = if fFlagShrinkAppNavBar then nil else var15.systemBarLabelTextSizeBinding
		})
	end, { var15.systemBarLabelTextSizeBinding })
	local var25 = reactModule.useCallback(function(p9, p10) --[[ line: 140 ]]
		-- upvalues: reactModule (copy), appNavItemModule (copy), fFlagShrinkAppNavBar (copy), var15 (ref)
		return reactModule.createElement(appNavItemModule, {
			isCenterPositioned = false,
			hasLabel = true,
			item = p9,
			isChecked = p10,
			systemBarLabelTextSizeBinding = if fFlagShrinkAppNavBar then nil else var15.systemBarLabelTextSizeBinding
		})
	end, { var15.systemBarLabelTextSizeBinding })
	local footerBinding = nil
	
	if getScrollAwayEnabledModule() or appNavBarFooterVisibleWithoutScrollAway then
		footerBinding = visibilityControlModule.getFooterBinding()
		reactModule.useEffect(function() --[[ line: 154 ]]
			-- upvalues: appNavBarGateFooterVisibleOnPlacement (copy), var15 (ref), placementModule (copy), visibilityControlModule (copy)
			local isVisible
			if appNavBarGateFooterVisibleOnPlacement then
				isVisible = var15.isVisible
				
				if isVisible then
					isVisible = var15.placement == placementModule.Bottom
					isVisible = nil
				end
			else
				isVisible = var15.isVisible
			end
			visibilityControlModule.setFooterVisible(isVisible)
		end, {
			var15.isVisible,
			if appNavBarGateFooterVisibleOnPlacement then var15.placement else nil
		})
	end
	reactModule.useEffect(function() --[[ line: 164 ]]
		-- upvalues: fFlagEnableFlyoutOnNavRail (copy), items (write), selectedIndex (write), var15 (ref), appNavTelemetryModule (copy)
		local var27 = if fFlagEnableFlyoutOnNavRail then items[selectedIndex] else var15.items[var15.selectedIndex]
		
		if var27 ~= nil and var27.page ~= nil then
			appNavTelemetryModule.logSwitchTabEnd(var27.page)
		end
	end, if fFlagEnableFlyoutOnNavRail then { items, selectedIndex } else { var15.items, var15.selectedIndex })
	reactModule.useEffect(function() --[[ line: 185 ]]
		-- upvalues: appNavTelemetryModule (copy), var15 (ref)
		appNavTelemetryModule.logVisibilityEnd(var15.isVisible)
	end, { var15.isVisible })
	reactModule.useEffect(function() --[[ line: 188 ]]
		-- upvalues: appNavTelemetryModule (copy), var15 (ref)
		appNavTelemetryModule.logPlacement(var15.placement)
	end, { var15.placement })
	
	if var15.placement == placementModule.Bottom then
		var23 = reactModule.createElement(navigationBar, {
			animated = true,
			active = true,
			alignment = navigationBarAlignment.EvenlyDistributed,
			items = items,
			isVisible = var15.isVisible,
			size = var15.size,
			renderItem = var24,
			position = var15.position,
			selection = selectedIndex,
			clipsDescendants = var15.clipsDescendants,
			visibility = footerBinding
		})
	elseif var15.placement == placementModule.Left then
		var23 = reactModule.createElement(navigationRailV2, {
			animated = true,
			alignment = navigationRailAlignment.Justified,
			items = items,
			renderItem = var25,
			size = var15.size,
			isVisible = var15.isVisible,
			position = var15.position,
			selection = selectedIndex,
			clipsDescendants = var15.clipsDescendants,
			leadingComponent = if fFlagAddGamepadBumperNavigation then var15.leadingComponent else nil,
			trailingComponent = if fFlagAddGamepadBumperNavigation then var15.trailingComponent else nil
		})
	end
	return var23
end)
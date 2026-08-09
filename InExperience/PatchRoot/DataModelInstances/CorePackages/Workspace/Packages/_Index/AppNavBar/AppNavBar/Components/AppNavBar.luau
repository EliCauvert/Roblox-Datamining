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
local t = {
	selectedIndex = 1,
	isVisible = true,
	clipsDescendants = true
}

return reactModule.memo(function(p0) --[[ line: 57 | named "AppNavBar" ]]
	-- upvalues: cryoModule (ref), t (ref), useAppPolicy (ref), useRoactService (ref), roactServiceTagsModule (ref), reactModule (ref), studioCTAIconModule (ref), webViewRedesignEnabledEngineFeature (ref), constantsModule (ref), appNavItemModule (ref), fFlagShrinkAppNavBar (ref), getScrollAwayEnabledModule (ref), visibilityControlModule (ref), appNavTelemetryModule (ref), placementModule (ref), navigationBar (ref), navigationBarAlignment (ref), navigationRailV2 (ref), navigationRailAlignment (ref), fFlagAddGamepadBumperNavigation (ref)
	local var13 = cryoModule.Dictionary.join(t, p0)
	local items = var13.items
	local var14 = useAppPolicy(function(p1) --[[ line: 62 ]]
		return p1.getShowStudioCTA()
	end)
	local var15 = useRoactService(roactServiceTagsModule.AppEventIngestService)
	local var16 = useRoactService(roactServiceTagsModule.AppLinking)
	local var17 = reactModule.useCallback(function(_, p2) --[[ line: 67 ]]
		-- upvalues: reactModule (copy), studioCTAIconModule (copy), webViewRedesignEnabledEngineFeature (copy), p0 (ref)
		return reactModule.createElement(studioCTAIconModule, {
			controlState = p2,
			showTooltip = if webViewRedesignEnabledEngineFeature then p0.showTooltip else nil
		})
	end, {
		if webViewRedesignEnabledEngineFeature then p0.showTooltip else nil
	})
	local var18 = reactModule.useCallback(function() --[[ line: 73 ]]
		-- upvalues: var15 (ref), constantsModule (copy), var13 (ref), var16 (ref)
		var15:setRBXEventStream(constantsModule.STUDIO_CTA_EVENT_CONTEXT, constantsModule.STUDIO_CTA_EVENT_NAME_OPEN)
		var16:openURL(var13.buildCreatorWebNavUrl({ utm_content = "side_bar_blue_icon" }))
	end, { var15, var16, var13.buildCreatorWebNavUrl })
	
	if var14 then
		items = cryoModule.List.join(items)
		table.insert(items, {
			isSecondary = true,
			renderIcon = var17,
			onActivated = var18
		})
	end
	local var19 = nil
	local var20 = reactModule.useCallback(function(p3, p4) --[[ line: 91 ]]
		-- upvalues: reactModule (copy), appNavItemModule (copy), fFlagShrinkAppNavBar (copy), var13 (ref)
		return reactModule.createElement(appNavItemModule, {
			isCenterPositioned = true,
			hasLabel = true,
			item = p3,
			isChecked = p4,
			systemBarLabelTextSizeBinding = if fFlagShrinkAppNavBar then nil else var13.systemBarLabelTextSizeBinding
		})
	end, { var13.systemBarLabelTextSizeBinding })
	local var21 = reactModule.useCallback(function(p5, p6) --[[ line: 101 ]]
		-- upvalues: reactModule (copy), appNavItemModule (copy), fFlagShrinkAppNavBar (copy), var13 (ref)
		return reactModule.createElement(appNavItemModule, {
			isCenterPositioned = false,
			hasLabel = true,
			item = p5,
			isChecked = p6,
			systemBarLabelTextSizeBinding = if fFlagShrinkAppNavBar then nil else var13.systemBarLabelTextSizeBinding
		})
	end, { var13.systemBarLabelTextSizeBinding })
	local footerBinding = nil
	
	if getScrollAwayEnabledModule() then
		footerBinding = visibilityControlModule.getFooterBinding()
		reactModule.useEffect(function() --[[ line: 114 ]]
			-- upvalues: visibilityControlModule (copy), var13 (ref)
			visibilityControlModule.setFooterVisible(var13.isVisible)
		end, { var13.isVisible })
	end
	reactModule.useEffect(function() --[[ line: 118 ]]
		-- upvalues: var13 (ref), appNavTelemetryModule (copy)
		local selectedIndex = var13.items[var13.selectedIndex]
		
		if selectedIndex ~= nil and selectedIndex.page ~= nil then
			appNavTelemetryModule.logSwitchTabEnd(selectedIndex.page)
		end
	end, { var13.items, var13.selectedIndex })
	reactModule.useEffect(function() --[[ line: 124 ]]
		-- upvalues: appNavTelemetryModule (copy), var13 (ref)
		appNavTelemetryModule.logVisibilityEnd(var13.isVisible)
	end, { var13.isVisible })
	reactModule.useEffect(function() --[[ line: 127 ]]
		-- upvalues: appNavTelemetryModule (copy), var13 (ref)
		appNavTelemetryModule.logPlacement(var13.placement)
	end, { var13.placement })
	
	if var13.placement == placementModule.Bottom then
		var19 = reactModule.createElement(navigationBar, {
			animated = true,
			active = true,
			alignment = navigationBarAlignment.EvenlyDistributed,
			items = items,
			isVisible = var13.isVisible,
			size = var13.size,
			renderItem = var20,
			position = var13.position,
			selection = var13.selectedIndex,
			clipsDescendants = var13.clipsDescendants,
			visibility = footerBinding
		})
		
		return var19
	elseif var13.placement == placementModule.Left then
		var19 = reactModule.createElement(navigationRailV2, {
			animated = true,
			alignment = navigationRailAlignment.Justified,
			items = items,
			renderItem = var21,
			size = var13.size,
			isVisible = var13.isVisible,
			position = var13.position,
			selection = var13.selectedIndex,
			clipsDescendants = var13.clipsDescendants,
			leadingComponent = if fFlagAddGamepadBumperNavigation then var13.leadingComponent else nil,
			trailingComponent = if fFlagAddGamepadBumperNavigation then var13.trailingComponent else nil
		})
	end
	return var19
end)
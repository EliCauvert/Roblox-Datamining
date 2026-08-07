local coreGuiService = game:GetService("CoreGui")
local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local coreScriptsCommonModule = require(parent.CoreScriptsCommon)
local displayModule = require(parent.Display)
local drawerModule = require(parent.Drawer)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local responsiveModule = require(parent.Responsive)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local divider = foundationModule.Divider
local drawerContainer = drawerModule.DrawerContainer
local experienceDetailsRowModule = require(inExperienceSideSheet.Components.ExperienceDetailsRow)
local footerModule = require(inExperienceSideSheet.Components.Footer)
local scrollView = foundationModule.ScrollView
local gridListModule = require(inExperienceSideSheet.Components.GridList)
local verticalListModule = require(inExperienceSideSheet.Components.VerticalList)
local view = foundationModule.View
local focusRoot = focusNavigationUtilsModule.FocusRoot
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local useDrawerShouldMount = drawerModule.Hooks.useDrawerShouldMount
local useTokens = foundationModule.Hooks.useTokens
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local useBackgroundStyleModule = require(inExperienceSideSheet.Hooks.useBackgroundStyle)
local useSideSheetFocusNavScrollViewAnimationModule = require(inExperienceSideSheet.Hooks.useSideSheetFocusNavScrollViewAnimation)
local getIntegrationsStoreModule = require(inExperienceSideSheet.Stores.GetIntegrationsStore)
local getSideSheetConfigStoreModule = require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)
local wrapWithProvidersModule = require(inExperienceSideSheet.Utils.wrapWithProviders)
local getSideSheetVisibilityModule = require(inExperienceSideSheet.Utils.getSideSheetVisibility)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMountUnmountSideSheet = require(inExperienceSideSheet.Flags).FFlagMountUnmountSideSheet
local fIntSideSheetVariant = sharedFlagsModule.FIntSideSheetVariant
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagEnableWhatsNew = sharedFlagsModule.FFlagEnableWhatsNew
local fFlagUseAnimateScrollViewToSelectionHelper = sharedFlagsModule.FFlagUseAnimateScrollViewToSelectionHelper
local var24 = if fFlagEnableWhatsNew then require(parent.WhatsNew).WhatsNewAnchor else nil
local t = {}
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local mouseIconOverrideService = coreScriptsCommonModule.MouseIconOverrideService
local usePreferredInput = responsiveModule.usePreferredInput

local function getDeviceSafePadding(p0) --[[ line: 87 ]]
	-- upvalues: displayModule (ref)
	return displayModule.GetDisplayStore(p0).getDeviceSafePadding(p0)
end

local function getToggleIntegrations(p1) --[[ line: 91 ]]
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getToggleIntegrations(p1)
end

local var28 = function(p2) --[[ line: 95 ]]
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p2).getPageIntegrations(p2)
end

local t_1 = nil
local useFocusGuiObject = nil

if fFlagSideSheetFocusNav then
	t_1 = { IntegrationsList = 0, PageList = 1 }
	useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
end
local var30 = nil

local function SideSheetContent(p3) --[[ line: 110 ]]
	-- upvalues: useTokens (ref), useStyleSheet (ref), useBackgroundStyleModule (ref), signalsReactModule (ref), getDeviceSafePadding (ref), fFlagMountUnmountSideSheet (ref), useDrawerShouldMount (ref), getToggleIntegrations (ref), reactModule (ref), sidesheetAnalyticsModule (ref), fFlagSideSheetFocusNav (ref), useFocusGuiObject (write), getSideSheetConfigStoreModule (ref), usePreferredInput (ref), signalsModule (ref), getSideSheetVisibilityModule (ref), responsiveModule (ref), mouseIconOverrideService (ref), fFlagUseAnimateScrollViewToSelectionHelper (ref), useSideSheetFocusNavScrollViewAnimationModule (ref), fIntSideSheetVariant (ref), t_1 (write), experienceDetailsRowModule (ref), view (ref), divider (ref), gridListModule (ref), verticalListModule (ref), var28 (ref), scrollView (ref), footerModule (ref), fFlagEnableWhatsNew (ref), var24 (ref), drawerContainer (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var32 = useTokens()
	local var33 = useStyleSheet()
	local var34 = useBackgroundStyleModule()
	local var35 = signalsReactModule.useSignalState(getDeviceSafePadding)
	local var36 = if fFlagMountUnmountSideSheet then useDrawerShouldMount() else true
	local var37 = signalsReactModule.useSignalState(getToggleIntegrations)
	local var38 = reactModule.useCallback(function(p4) --[[ line: 118 ]]
		-- upvalues: sidesheetAnalyticsModule (copy)
		sidesheetAnalyticsModule.logSidesheetClosed(p4.source)
	end, {})
	local _ = nil
	local var39 = nil
	
	if fFlagSideSheetFocusNav then
		local var40 = useFocusGuiObject()
		var39 = reactModule.useCallback(function(p5) --[[ line: 125 ]]
			-- upvalues: var40 (write)
			var40(p5)
		end, { var40 })
	end
	local var41 = if fFlagSideSheetFocusNav then reactModule.useRef(nil) else nil
	local var42 = reactModule.useCallback(function(p6) --[[ line: 132 ]]
		-- upvalues: getSideSheetConfigStoreModule (copy)
		return getSideSheetConfigStoreModule().onHeightChanged(p6.AbsoluteSize.Y)
	end, {})
	local var43 = reactModule.useRef(false)
	local var44 = reactModule.useRef(false)
	local var45 = usePreferredInput()
	reactModule.useEffect(function() --[[ line: 140 ]]
		-- upvalues: signalsModule (copy), getSideSheetVisibilityModule (copy), p3 (ref), var43 (ref), var45 (ref), responsiveModule (copy), var44 (ref), mouseIconOverrideService (copy)
		local var50 = signalsModule.createEffect(function(p7) --[[ line: 141 ]]
			-- upvalues: getSideSheetVisibilityModule (copy), p3 (copy), var43 (copy), var45 (copy), responsiveModule (copy), var44 (copy), mouseIconOverrideService (copy)
			local var52 = getSideSheetVisibilityModule(p7)
			
			if p3.ChatSelector then
				if var52 then
					var43.current = p3.ChatSelector:GetVisibility()
					p3.ChatSelector:SetVisible(false)
				elseif var43.current then
					p3.ChatSelector:SetVisible(true)
					var43.current = false
				end
			end
			if var45 == responsiveModule.Input.Pointer then
				if var52 and not var44.current then
					mouseIconOverrideService.push("InExperienceSideSheet", Enum.OverrideMouseIconBehavior.ForceShow)
					var44.current = true
					
					return
				elseif not var52 and var44.current then
					mouseIconOverrideService.pop("InExperienceSideSheet")
					var44.current = false
				end
			end
		end)
		local var51 = if p3.ChatSelector then p3.ChatSelector.VisibilityStateChanged:connect(function(p8) --[[ line: 169 ]]
			-- upvalues: getSideSheetVisibilityModule (copy), var43 (copy)
			if getSideSheetVisibilityModule() and p8 then
				var43.current = false
			end
		end) else nil
		
		return function() --[[ line: 176 ]]
			-- upvalues: var50 (ref), var51 (write)
			var50()
			
			if var51 ~= nil then
				var51:disconnect()
			end
		end
	end, { p3.ChatSelector, var45 })
	local var46 = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then useSideSheetFocusNavScrollViewAnimationModule() else nil
	local var47 = nil
	
	if fFlagSideSheetFocusNav then
		var47 = if fIntSideSheetVariant == 2 or #var37 <= 0 then t_1.PageList else t_1.IntegrationsList
	end
	if not var36 then
		return nil
	end
	local var49
	local t = {
		ExperienceDetailsRow = reactModule.createElement(experienceDetailsRowModule, { layoutOrder = 0 }),
		HeaderDivider = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-right-xlarge",
			LayoutOrder = 1
		}, { Divider = reactModule.createElement(divider) })
	}
	
	if #var37 <= 0 then
		var49 = nil
	elseif fIntSideSheetVariant == 0 then
		var49 = reactModule.createElement
		var49 = var49(gridListModule, {
			layoutOrder = 2,
			integrationsGetter = getToggleIntegrations,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var47 == t_1.IntegrationsList then var39 else nil
		})
	else
		var49 = reactModule.createElement
		var49 = var49(verticalListModule, {
			layoutOrder = if fIntSideSheetVariant == 2 then 4 else 2,
			integrationsGetter = getToggleIntegrations,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var47 == t_1.IntegrationsList then var39 else nil
		})
	end
	t.IntegrationsList = var49
	t.PageDivider = if #var37 > 0 then reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-right-xlarge",
		LayoutOrder = 3
	}, { Divider = reactModule.createElement(divider) }) else nil
	t.PageList = reactModule.createElement(verticalListModule, {
		layoutOrder = if fIntSideSheetVariant == 2 then 2 else 4,
		integrationsGetter = var28,
		firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var47 == t_1.PageList then var39 else nil
	})
	local createElement = reactModule.createElement
	createElement = createElement(view, {
		tag = "col size-full",
		onAbsoluteSizeChanged = var42,
		ref = if fFlagSideSheetFocusNav then var41 else nil
	}, {
		ScrollableContent = reactModule.createElement(scrollView, {
			tag = "fill size-full-0",
			LayoutOrder = 1,
			scroll = {
				ScrollingDirection = Enum.ScrollingDirection.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(0, 0)
			},
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			},
			selection = if fFlagSideSheetFocusNav then { Selectable = false } else nil,
			scrollingFrameRef = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then var46 else nil
		}, t),
		Footer = reactModule.createElement(footerModule, { layoutOrder = 2 })
	})
	
	if fFlagEnableWhatsNew then
		createElement = reactModule.createElement(var24, { anchorId = "sideSheet", tag = "size-full" }, { SideSheetPanel = createElement })
	end
	return reactModule.createElement(drawerContainer, {
		displayOrder = 12,
		scrimIsModal = true,
		menuWidth = 300 - var32.Padding.XLarge,
		leftOffset = var35.left + var32.Padding.XLarge,
		topOffset = var35.top,
		bottomOffset = var35.bottom,
		backgroundStyle = var34,
		onDrawerClosedAnalytics = var38
	}, {
		FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var33 }),
		if fFlagSideSheetFocusNav then reactModule.createElement(focusRoot, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
		}, { Content = createElement }) else createElement
	})
end

function t.createSideSheet(p9, p10, p11) --[[ line: 311 ]]
	-- upvalues: var30 (write), coreGuiService (ref), wrapWithProvidersModule (ref), reactModule (ref), SideSheetContent (ref), reactRobloxModule (ref)
	if not var30 then
		local inExperienceSideSheet = Instance.new("Folder")
		inExperienceSideSheet.Name = "InExperienceSideSheet"
		inExperienceSideSheet.Parent = coreGuiService
		var30 = reactRobloxModule.createRoot(inExperienceSideSheet)
		var30:render(wrapWithProvidersModule({
			SideSheetContent = reactModule.createElement(SideSheetContent, p10)
		}, p9, p11))
	end
	return var30
end

return t
local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local chromeModule = require(parent.Chrome)
local coreScriptsCommonModule = require(parent.CoreScriptsCommon)
local displayModule = require(parent.Display)
local drawerModule = require(parent.Drawer)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local responsiveModule = require(parent.Responsive)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local switchServerModule = require(parent.SwitchServer)
local divider = foundationModule.Divider
local drawerContainer = drawerModule.DrawerContainer
local experienceDetailsRowModule = require(inExperienceSideSheet.Components.ExperienceDetailsRow)
local footerModule = require(inExperienceSideSheet.Components.Footer)
local userProfileRowModule = require(inExperienceSideSheet.Components.UserProfileRow)
local scrollView = foundationModule.ScrollView
local sideSheetWidgetListModule = require(inExperienceSideSheet.Components.SideSheetWidgetList)
local verticalListModule = require(inExperienceSideSheet.Components.VerticalList)
local view = foundationModule.View
local focusRoot = focusNavigationUtilsModule.FocusRoot
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local sidesheetAnalyticsModule = require(inExperienceSideSheet.Analytics.SidesheetAnalytics)
local useDrawerShouldMount = drawerModule.Hooks.useDrawerShouldMount
local useTokens = foundationModule.Hooks.useTokens
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local useBackgroundStyleModule = require(inExperienceSideSheet.Hooks.useBackgroundStyle)
local useSideSheetFocusNavScrollViewAnimationModule = require(inExperienceSideSheet.Hooks.useSideSheetFocusNavScrollViewAnimation)
local getIntegrationsStoreModule = require(inExperienceSideSheet.Stores.GetIntegrationsStore)
local getSideSheetConfigStoreModule = require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)
local getSwitchServerStore = switchServerModule.GetSwitchServerStore
local wrapWithProvidersModule = require(inExperienceSideSheet.Utils.wrapWithProviders)
local getSideSheetVisibilityModule = require(inExperienceSideSheet.Utils.getSideSheetVisibility)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMountUnmountSideSheet = require(inExperienceSideSheet.Flags).FFlagMountUnmountSideSheet
local fFlagEnableSideSheetWidgets = sharedFlagsModule.FFlagEnableSideSheetWidgets
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagEnableWhatsNew = sharedFlagsModule.FFlagEnableWhatsNew
local fFlagUseAnimateScrollViewToSelectionHelper = sharedFlagsModule.FFlagUseAnimateScrollViewToSelectionHelper
local fFlagShowSwitchServerButton = sharedFlagsModule.FFlagShowSwitchServerButton
local fFlagEnableSideSheetWidgets_1 = fFlagEnableSideSheetWidgets or isPioneerLaunch()
local var1 = if fFlagEnableWhatsNew then require(parent.WhatsNew).WhatsNewAnchor else nil
local switchServerTelemetry = switchServerModule.SwitchServerTelemetry
local list = {
	Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.Up, Enum.KeyCode.Down,
	Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D
}
local t = {
	ExperienceDetails = 0,
	HeaderDivider = 1,
	Widgets = 2,
	PrimaryList = if fFlagEnableSideSheetWidgets_1 then 3 else 2,
	ListDivider = if fFlagEnableSideSheetWidgets_1 then 4 else 3,
	SecondaryList = if fFlagEnableSideSheetWidgets_1 then 5 else 4
}
local t_1 = {}
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local mouseIconOverrideService = coreScriptsCommonModule.MouseIconOverrideService
local usePreferredInput = responsiveModule.usePreferredInput

local function getDeviceSafePadding(p1)
	-- upvalues: displayModule (ref)
	return displayModule.GetDisplayStore(p1).getDeviceSafePadding(p1)
end

local function getToggleIntegrations(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getToggleIntegrations(p1)
end

local var2 = function(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getPageIntegrations(p1)
end

local function getScrollableWidgetIntegrations(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getScrollableWidgetIntegrations(p1)
end

local function getFixedFooterWidgetIntegrations(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getFixedFooterWidgetIntegrations(p1)
end

local var3 = if fFlagSideSheetFocusNav then require(parent.ReactFocusNavigation).useFocusGuiObject else nil
local var4 = nil

local function SideSheetContent(p1)
	-- upvalues: useTokens (ref), useStyleSheet (ref), useBackgroundStyleModule (ref), signalsReactModule (ref), getDeviceSafePadding (ref), fFlagMountUnmountSideSheet (ref), useDrawerShouldMount (ref), getToggleIntegrations (ref), reactModule (ref), sidesheetAnalyticsModule (ref), fFlagSideSheetFocusNav (ref), var3 (write), useLastInputMode (ref), getSideSheetConfigStoreModule (ref), usePreferredInput (ref), fFlagShowSwitchServerButton (ref), signalsModule (ref), getSideSheetVisibilityModule (ref), responsiveModule (ref), mouseIconOverrideService (ref), getSwitchServerStore (ref), switchServerTelemetry (ref), contextActionService (ref), list (ref), toggleSideSheetModule (ref), fFlagUseAnimateScrollViewToSelectionHelper (ref), useSideSheetFocusNavScrollViewAnimationModule (ref), isPioneerLaunch (ref), userProfileRowModule (ref), t (ref), experienceDetailsRowModule (ref), view (ref), divider (ref), fFlagEnableSideSheetWidgets_1 (ref), sideSheetWidgetListModule (ref), getScrollableWidgetIntegrations (ref), chromeModule (ref), verticalListModule (ref), var2 (ref), scrollView (ref), footerModule (ref), getFixedFooterWidgetIntegrations (ref), fFlagEnableWhatsNew (ref), var1 (ref), drawerContainer (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var5 = useTokens()
	local var6 = useStyleSheet()
	local var7 = useBackgroundStyleModule()
	local var8 = signalsReactModule.useSignalState(getDeviceSafePadding)
	local var9 = if fFlagMountUnmountSideSheet then useDrawerShouldMount() else true
	local var10 = signalsReactModule.useSignalState(getToggleIntegrations)
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: sidesheetAnalyticsModule (copy)
		sidesheetAnalyticsModule.logSidesheetClosed(p2.source)
	end, {})
	local var12 = nil
	local _ = nil
	local _ = nil
	local var13 = nil
	
	if fFlagSideSheetFocusNav then
		var12 = reactModule.useRef(nil)
		local var14 = var3()
		local var15 = useLastInputMode()
		var13 = reactModule.useCallback(function(p2)
			-- upvalues: var15 (write), var12 (write), var14 (write)
			if var15 == "Focus" and var12 and var12.current == false then
				var12.current = true
				var14(p2)
			end
		end, { var14, var15 })
	end
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: getSideSheetConfigStoreModule (copy)
		return getSideSheetConfigStoreModule().onHeightChanged(p2.AbsoluteSize.Y)
	end, {})
	local var17 = reactModule.useRef(false)
	local var18 = reactModule.useRef(false)
	local var19 = usePreferredInput()
	local var20 = if fFlagShowSwitchServerButton then reactModule.useRef(false) else nil
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), getSideSheetVisibilityModule (copy), p1 (ref), var17 (ref), var19 (ref), responsiveModule (copy), var18 (ref), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var12 (write), fFlagShowSwitchServerButton (copy), getSwitchServerStore (copy), var20 (write), switchServerTelemetry (copy)
		local var21 = signalsModule.createEffect(function(p2)
			-- upvalues: getSideSheetVisibilityModule (copy), p1 (copy), var17 (copy), var19 (copy), responsiveModule (copy), var18 (copy), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var12 (copy), fFlagShowSwitchServerButton (copy), getSwitchServerStore (copy), var20 (copy), switchServerTelemetry (copy)
			local var22 = getSideSheetVisibilityModule(p2)
			
			if p1.ChatSelector then
				if var22 then
					var17.current = p1.ChatSelector:GetVisibility()
					p1.ChatSelector:SetVisible(false)
				elseif var17.current then
					p1.ChatSelector:SetVisible(true)
					var17.current = false
				end
			end
			if var19 == responsiveModule.Input.Pointer then
				if var22 and not var18.current then
					mouseIconOverrideService.push("InExperienceSideSheet", Enum.OverrideMouseIconBehavior.ForceShow)
					var18.current = true
				elseif not var22 and var18.current then
					mouseIconOverrideService.pop("InExperienceSideSheet")
					var18.current = false
				end
			end
			if fFlagSideSheetFocusNav then
				if var22 then
					var12.current = false
				else
					var12.current = nil
				end
			end
			if var22 and fFlagShowSwitchServerButton and (getSwitchServerStore(p2).shouldEnableSwitchServer(p2) and not var20.current) then
				var20.current = true
				switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
			end
		end)
		local var22 = if p1.ChatSelector then p1.ChatSelector.VisibilityStateChanged:connect(function(p2)
			-- upvalues: getSideSheetVisibilityModule (copy), var17 (copy)
			if getSideSheetVisibilityModule() and p2 then
				var17.current = false
			end
		end) else nil
		
		return function()
			-- upvalues: var21 (ref), var22 (write)
			var21()
			
			if var22 ~= nil then
				var22:disconnect()
			end
		end
	end, { p1.ChatSelector, var19 })
	
	if fFlagSideSheetFocusNav then
		reactModule.useEffect(function()
			-- upvalues: contextActionService (copy), var12 (write), list (copy), getSideSheetVisibilityModule (copy), toggleSideSheetModule (copy)
			contextActionService:BindCoreAction("SideSheetBlockInputAction", function(_, p2, _)
				-- upvalues: var12 (copy)
				return if p2 == Enum.UserInputState.Begin then if var12.current == nil then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
			end, false, unpack(list))
			contextActionService:BindCoreAction("SideSheetSinkR2Action", function(_, _, _)
				-- upvalues: getSideSheetVisibilityModule (copy)
				return if getSideSheetVisibilityModule() then Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonR2)
			contextActionService:BindCoreAction("SideSheetCloseAction", function(_, _, _)
				-- upvalues: getSideSheetVisibilityModule (copy), toggleSideSheetModule (copy)
				if getSideSheetVisibilityModule() then
					toggleSideSheetModule(false)
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
			
			return function()
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("SideSheetBlockInputAction")
				contextActionService:UnbindCoreAction("SideSheetSinkR2Action")
				contextActionService:UnbindCoreAction("SideSheetCloseAction")
			end
		end, {})
	end
	local var21 = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then useSideSheetFocusNavScrollViewAnimationModule() else nil
	
	if not var9 then
		return nil
	end
	local createElement = reactModule.createElement
	createElement = createElement(view, { tag = "col size-full", onAbsoluteSizeChanged = var16 }, {
		ScrollableContent = reactModule.createElement(scrollView, {
			LayoutOrder = 1,
			tag = {
				["fill size-full-0"] = true,
				["padding-left-small"] = fFlagSideSheetFocusNav or fFlagEnableSideSheetWidgets_1
			},
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
			scrollingFrameRef = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then var21 else nil
		}, {
			HeaderRow = if isPioneerLaunch() then reactModule.createElement(userProfileRowModule, { layoutOrder = t.ExperienceDetails }) else reactModule.createElement(experienceDetailsRowModule, { layoutOrder = t.ExperienceDetails }),
			HeaderDivider = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-right-xlarge",
				LayoutOrder = t.HeaderDivider
			}, { Divider = reactModule.createElement(divider) }),
			Widgets = if fFlagEnableSideSheetWidgets_1 then reactModule.createElement(sideSheetWidgetListModule, {
				integrationsGetter = getScrollableWidgetIntegrations,
				layoutOrder = t.Widgets,
				placement = chromeModule.Enums.SideSheetPlacement.ScrollableContentTop
			}) else nil,
			IntegrationsList = if #var10 <= 0 then nil else reactModule.createElement(verticalListModule, {
				layoutOrder = t.SecondaryList,
				integrationsGetter = getToggleIntegrations
			}),
			PageDivider = if #var10 > 0 then reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-right-xlarge",
				LayoutOrder = t.ListDivider
			}, { Divider = reactModule.createElement(divider) }) else nil,
			PageList = reactModule.createElement(verticalListModule, {
				layoutOrder = t.PrimaryList,
				integrationsGetter = var2,
				firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav then var13 else nil
			})
		}),
		Footer = reactModule.createElement(footerModule, {
			layoutOrder = 2,
			integrationsGetter = getFixedFooterWidgetIntegrations
		})
	})
	
	if fFlagEnableWhatsNew then
		createElement = reactModule.createElement(var1, { anchorId = "sideSheet", tag = "size-full" }, { SideSheetPanel = createElement })
	end
	local var22 = 300 - var5.Padding.XLarge
	
	if fFlagSideSheetFocusNav or fFlagEnableSideSheetWidgets_1 then
		var22 += var5.Padding.Small
	end
	return reactModule.createElement(drawerContainer, {
		displayOrder = 12,
		scrimIsModal = true,
		menuWidth = var22,
		leftOffset = var8.left + var5.Padding.XLarge,
		topOffset = var8.top,
		bottomOffset = var8.bottom,
		backgroundStyle = var7,
		onDrawerClosedAnalytics = var11
	}, {
		FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var6 }),
		if fFlagSideSheetFocusNav then reactModule.createElement(focusRoot, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
		}, { Content = createElement }) else createElement
	})
end

function t_1.createSideSheet(p1, p2, p3)
	-- upvalues: var4 (write), coreGuiService (ref), wrapWithProvidersModule (ref), reactModule (ref), SideSheetContent (ref), reactRobloxModule (ref)
	if not var4 then
		local inExperienceSideSheet = Instance.new("Folder")
		inExperienceSideSheet.Name = "InExperienceSideSheet"
		inExperienceSideSheet.Parent = coreGuiService
		var4 = reactRobloxModule.createRoot(inExperienceSideSheet)
		var4:render(wrapWithProvidersModule({
			SideSheetContent = reactModule.createElement(SideSheetContent, p2)
		}, p1, p3))
	end
	return var4
end

return t_1
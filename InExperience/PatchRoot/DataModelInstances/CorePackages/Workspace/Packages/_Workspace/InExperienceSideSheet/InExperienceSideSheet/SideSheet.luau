local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
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
	TopWidgets = 2,
	PrimaryList = if fFlagEnableSideSheetWidgets_1 then 3 else 2,
	ListDivider = if fFlagEnableSideSheetWidgets_1 then 4 else 3,
	SecondaryList = if fFlagEnableSideSheetWidgets_1 then 5 else 4,
	BottomWidgets = if fFlagEnableSideSheetWidgets_1 then 6 else 5
}
local t_1 = {}
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local mouseIconOverrideService = coreScriptsCommonModule.MouseIconOverrideService
local usePreferredInput = responsiveModule.usePreferredInput

local function getDeviceSafePadding(p1)
	-- upvalues: displayModule (ref)
	return displayModule.GetDisplayStore(p1).getDeviceSafePadding(p1)
end

local function getAboveFoldIntegrations(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getAboveFoldIntegrations(p1)
end

local function getBelowFoldIntegrations(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getBelowFoldIntegrations(p1)
end

local function getScrollableContentTopWidgetIntegrations(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getScrollableContentTopWidgetIntegrations(p1)
end

local function getScrollableContentBottomWidgetIntegrations(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getScrollableContentBottomWidgetIntegrations(p1)
end

local var2 = if fFlagSideSheetFocusNav then require(parent.ReactFocusNavigation).useFocusGuiObject else nil
local var3 = nil

local function SideSheetContent(p1)
	-- upvalues: useTokens (ref), useStyleSheet (ref), useBackgroundStyleModule (ref), signalsReactModule (ref), getDeviceSafePadding (ref), fFlagMountUnmountSideSheet (ref), useDrawerShouldMount (ref), getScrollableContentTopWidgetIntegrations (ref), fFlagEnableSideSheetWidgets_1 (ref), reactModule (ref), sidesheetAnalyticsModule (ref), fFlagSideSheetFocusNav (ref), var2 (write), useLastInputMode (ref), usePreferredInput (ref), fFlagShowSwitchServerButton (ref), signalsModule (ref), getSideSheetVisibilityModule (ref), guiService (ref), responsiveModule (ref), mouseIconOverrideService (ref), getSwitchServerStore (ref), switchServerTelemetry (ref), contextActionService (ref), list (ref), toggleSideSheetModule (ref), fFlagUseAnimateScrollViewToSelectionHelper (ref), useSideSheetFocusNavScrollViewAnimationModule (ref), isPioneerLaunch (ref), userProfileRowModule (ref), t (ref), experienceDetailsRowModule (ref), view (ref), divider (ref), sideSheetWidgetListModule (ref), chromeModule (ref), verticalListModule (ref), getAboveFoldIntegrations (ref), getBelowFoldIntegrations (ref), getScrollableContentBottomWidgetIntegrations (ref), scrollView (ref), footerModule (ref), fFlagEnableWhatsNew (ref), var1 (ref), drawerContainer (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var4 = useTokens()
	local var5 = useStyleSheet()
	local var6 = useBackgroundStyleModule()
	local var7 = signalsReactModule.useSignalState(getDeviceSafePadding)
	local var8 = if fFlagMountUnmountSideSheet then useDrawerShouldMount() else true
	local var9 = fFlagEnableSideSheetWidgets_1 and #signalsReactModule.useSignalState(getScrollableContentTopWidgetIntegrations) > 0
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: sidesheetAnalyticsModule (copy)
		sidesheetAnalyticsModule.logSidesheetClosed(p2.source)
	end, {})
	local var11 = nil
	local _ = nil
	local _ = nil
	local var12 = nil
	
	if fFlagSideSheetFocusNav then
		var11 = reactModule.useRef(nil)
		local var13 = var2()
		local var14 = useLastInputMode()
		var12 = reactModule.useCallback(function(p2)
			-- upvalues: var14 (write), var11 (write), var13 (write)
			if var14 == "Focus" and var11 and var11.current == false then
				var11.current = true
				var13(p2)
			end
		end, { var13, var14 })
	end
	local var15 = reactModule.useRef(false)
	local var16 = reactModule.useRef(false)
	local var17 = usePreferredInput()
	local var18 = if fFlagShowSwitchServerButton then reactModule.useRef(false) else nil
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), getSideSheetVisibilityModule (copy), guiService (copy)
		local var19 = signalsModule.createEffect(function(p2)
			-- upvalues: getSideSheetVisibilityModule (copy), guiService (copy)
			guiService:SetMenuIsOpen(getSideSheetVisibilityModule(p2), "InExperienceSideSheet")
		end)
		
		return function()
			-- upvalues: var19 (ref), guiService (copy)
			var19()
			
			if guiService.MenuIsOpen then
				guiService:SetMenuIsOpen(false, "InExperienceSideSheet")
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), getSideSheetVisibilityModule (copy), p1 (ref), var15 (ref), var17 (ref), responsiveModule (copy), var16 (ref), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var11 (write), fFlagShowSwitchServerButton (copy), getSwitchServerStore (copy), var18 (write), switchServerTelemetry (copy)
		local var19 = signalsModule.createEffect(function(p2)
			-- upvalues: getSideSheetVisibilityModule (copy), p1 (copy), var15 (copy), var17 (copy), responsiveModule (copy), var16 (copy), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var11 (copy), fFlagShowSwitchServerButton (copy), getSwitchServerStore (copy), var18 (copy), switchServerTelemetry (copy)
			local var20 = getSideSheetVisibilityModule(p2)
			
			if p1.ChatSelector then
				if var20 then
					var15.current = p1.ChatSelector:GetVisibility()
					p1.ChatSelector:SetVisible(false)
				elseif var15.current then
					p1.ChatSelector:SetVisible(true)
					var15.current = false
				end
			end
			if var17 == responsiveModule.Input.Pointer then
				if var20 and not var16.current then
					mouseIconOverrideService.push("InExperienceSideSheet", Enum.OverrideMouseIconBehavior.ForceShow)
					var16.current = true
				elseif not var20 and var16.current then
					mouseIconOverrideService.pop("InExperienceSideSheet")
					var16.current = false
				end
			end
			if fFlagSideSheetFocusNav then
				if var20 then
					var11.current = false
				else
					var11.current = nil
				end
			end
			if var20 and fFlagShowSwitchServerButton and (getSwitchServerStore(p2).shouldEnableSwitchServer(p2) and not var18.current) then
				var18.current = true
				switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
			end
		end)
		local var20 = if p1.ChatSelector then p1.ChatSelector.VisibilityStateChanged:connect(function(p2)
			-- upvalues: getSideSheetVisibilityModule (copy), var15 (copy)
			if getSideSheetVisibilityModule() and p2 then
				var15.current = false
			end
		end) else nil
		
		return function()
			-- upvalues: var19 (ref), var20 (write)
			var19()
			
			if var20 ~= nil then
				var20:disconnect()
			end
		end
	end, { p1.ChatSelector, var17 })
	
	if fFlagSideSheetFocusNav then
		reactModule.useEffect(function()
			-- upvalues: contextActionService (copy), var11 (write), list (copy), getSideSheetVisibilityModule (copy), toggleSideSheetModule (copy)
			contextActionService:BindCoreAction("SideSheetBlockInputAction", function(_, p2, _)
				-- upvalues: var11 (copy)
				return if p2 == Enum.UserInputState.Begin then if var11.current == nil then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
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
	local var19 = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then useSideSheetFocusNavScrollViewAnimationModule() else nil
	
	if not var8 then
		return nil
	end
	local createElement = reactModule.createElement
	createElement = createElement(view, { tag = "col size-full" }, {
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
			scrollingFrameRef = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then var19 else nil
		}, {
			HeaderRow = if isPioneerLaunch() then reactModule.createElement(userProfileRowModule, { layoutOrder = t.ExperienceDetails }) else reactModule.createElement(experienceDetailsRowModule, { layoutOrder = t.ExperienceDetails }),
			HeaderDivider = if var9 then nil else reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-right-xlarge",
				LayoutOrder = t.HeaderDivider
			}, { Divider = reactModule.createElement(divider) }),
			TopWidgets = if fFlagEnableSideSheetWidgets_1 then reactModule.createElement(sideSheetWidgetListModule, {
				integrationsGetter = getScrollableContentTopWidgetIntegrations,
				layoutOrder = t.TopWidgets,
				placement = chromeModule.Enums.SideSheetPlacement.ScrollableContentTop
			}) else nil,
			AboveFoldList = reactModule.createElement(verticalListModule, {
				layoutOrder = t.PrimaryList,
				integrationsGetter = getAboveFoldIntegrations,
				firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav then var12 else nil
			}),
			FoldDivider = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-right-xlarge",
				LayoutOrder = t.ListDivider
			}, { Divider = reactModule.createElement(divider) }),
			BelowFoldList = reactModule.createElement(verticalListModule, {
				layoutOrder = t.SecondaryList,
				integrationsGetter = getBelowFoldIntegrations
			}),
			BottomWidgets = if fFlagEnableSideSheetWidgets_1 then reactModule.createElement(sideSheetWidgetListModule, {
				integrationsGetter = getScrollableContentBottomWidgetIntegrations,
				layoutOrder = t.BottomWidgets,
				placement = chromeModule.Enums.SideSheetPlacement.ScrollableContentBottom
			}) else nil
		}),
		Footer = reactModule.createElement(footerModule, { layoutOrder = 2 })
	})
	
	if fFlagEnableWhatsNew then
		createElement = reactModule.createElement(var1, { anchorId = "sideSheet", tag = "size-full" }, { SideSheetPanel = createElement })
	end
	local var20 = 300 - var4.Padding.XLarge
	
	if fFlagSideSheetFocusNav or fFlagEnableSideSheetWidgets_1 then
		var20 += var4.Padding.Small
	end
	return reactModule.createElement(drawerContainer, {
		displayOrder = 12,
		scrimIsModal = true,
		menuWidth = var20,
		leftOffset = var7.left + var4.Padding.XLarge,
		topOffset = var7.top,
		bottomOffset = var7.bottom,
		backgroundStyle = var6,
		onDrawerClosedAnalytics = var10
	}, {
		FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var5 }),
		if fFlagSideSheetFocusNav then reactModule.createElement(focusRoot, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
		}, { Content = createElement }) else createElement
	})
end

function t_1.createSideSheet(p1, p2, p3)
	-- upvalues: var3 (write), coreGuiService (ref), wrapWithProvidersModule (ref), reactModule (ref), SideSheetContent (ref), reactRobloxModule (ref)
	if not var3 then
		local inExperienceSideSheet = Instance.new("Folder")
		inExperienceSideSheet.Name = "InExperienceSideSheet"
		inExperienceSideSheet.Parent = coreGuiService
		var3 = reactRobloxModule.createRoot(inExperienceSideSheet)
		var3:render(wrapWithProvidersModule({
			SideSheetContent = reactModule.createElement(SideSheetContent, p2)
		}, p1, p3))
	end
	return var3
end

return t_1
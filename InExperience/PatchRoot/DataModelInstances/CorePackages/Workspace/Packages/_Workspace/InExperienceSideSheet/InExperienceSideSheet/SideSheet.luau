local contextActionService = game:GetService("ContextActionService")
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
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
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
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMountUnmountSideSheet = require(inExperienceSideSheet.Flags).FFlagMountUnmountSideSheet
local fIntSideSheetVariant = sharedFlagsModule.FIntSideSheetVariant
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagEnableWhatsNew = sharedFlagsModule.FFlagEnableWhatsNew
local fFlagUseAnimateScrollViewToSelectionHelper = sharedFlagsModule.FFlagUseAnimateScrollViewToSelectionHelper
local var1 = if fFlagEnableWhatsNew then require(parent.WhatsNew).WhatsNewAnchor else nil
local list = {
	Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.Up, Enum.KeyCode.Down,
	Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D
}
local t = {}
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

local t_1 = nil
local useFocusGuiObject = nil

if fFlagSideSheetFocusNav then
	t_1 = { IntegrationsList = 0, PageList = 1 }
	useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
end
local var3 = nil

local function SideSheetContent(p1)
	-- upvalues: useTokens (ref), useStyleSheet (ref), useBackgroundStyleModule (ref), signalsReactModule (ref), getDeviceSafePadding (ref), fFlagMountUnmountSideSheet (ref), useDrawerShouldMount (ref), getToggleIntegrations (ref), reactModule (ref), sidesheetAnalyticsModule (ref), fFlagSideSheetFocusNav (ref), useFocusGuiObject (write), useLastInputMode (ref), getSideSheetConfigStoreModule (ref), usePreferredInput (ref), signalsModule (ref), getSideSheetVisibilityModule (ref), responsiveModule (ref), mouseIconOverrideService (ref), contextActionService (ref), list (ref), toggleSideSheetModule (ref), fFlagUseAnimateScrollViewToSelectionHelper (ref), useSideSheetFocusNavScrollViewAnimationModule (ref), fIntSideSheetVariant (ref), t_1 (write), experienceDetailsRowModule (ref), view (ref), divider (ref), gridListModule (ref), verticalListModule (ref), var2 (ref), scrollView (ref), footerModule (ref), fFlagEnableWhatsNew (ref), var1 (ref), drawerContainer (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var4 = useTokens()
	local var5 = useStyleSheet()
	local var6 = useBackgroundStyleModule()
	local var7 = signalsReactModule.useSignalState(getDeviceSafePadding)
	local var8 = if fFlagMountUnmountSideSheet then useDrawerShouldMount() else true
	local var9 = signalsReactModule.useSignalState(getToggleIntegrations)
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
		local var13 = useFocusGuiObject()
		local var14 = useLastInputMode()
		var12 = reactModule.useCallback(function(p2)
			-- upvalues: var14 (write), var11 (write), var13 (write)
			if var14 == "Focus" and var11 and var11.current == false then
				var11.current = true
				var13(p2)
			end
		end, { var13, var14 })
	end
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: getSideSheetConfigStoreModule (copy)
		return getSideSheetConfigStoreModule().onHeightChanged(p2.AbsoluteSize.Y)
	end, {})
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useRef(false)
	local var18 = usePreferredInput()
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), getSideSheetVisibilityModule (copy), p1 (ref), var16 (ref), var18 (ref), responsiveModule (copy), var17 (ref), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var11 (write)
		local var19 = signalsModule.createEffect(function(p2)
			-- upvalues: getSideSheetVisibilityModule (copy), p1 (copy), var16 (copy), var18 (copy), responsiveModule (copy), var17 (copy), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var11 (copy)
			local var20 = getSideSheetVisibilityModule(p2)
			
			if p1.ChatSelector then
				if var20 then
					var16.current = p1.ChatSelector:GetVisibility()
					p1.ChatSelector:SetVisible(false)
				elseif var16.current then
					p1.ChatSelector:SetVisible(true)
					var16.current = false
				end
			end
			if var18 == responsiveModule.Input.Pointer then
				if var20 and not var17.current then
					mouseIconOverrideService.push("InExperienceSideSheet", Enum.OverrideMouseIconBehavior.ForceShow)
					var17.current = true
				elseif not var20 and var17.current then
					mouseIconOverrideService.pop("InExperienceSideSheet")
					var17.current = false
				end
			end
			if fFlagSideSheetFocusNav then
				if var20 then
					var11.current = false
					
					return
				end
				var11.current = nil
			end
		end)
		local var20 = if p1.ChatSelector then p1.ChatSelector.VisibilityStateChanged:connect(function(p2)
			-- upvalues: getSideSheetVisibilityModule (copy), var16 (copy)
			if getSideSheetVisibilityModule() and p2 then
				var16.current = false
			end
		end) else nil
		
		return function()
			-- upvalues: var19 (ref), var20 (write)
			var19()
			
			if var20 ~= nil then
				var20:disconnect()
			end
		end
	end, { p1.ChatSelector, var18 })
	
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
	local var20 = nil
	
	if fFlagSideSheetFocusNav then
		var20 = if fIntSideSheetVariant == 2 or #var9 <= 0 then t_1.PageList else t_1.IntegrationsList
	end
	if not var8 then
		return nil
	end
	local var21
	local t = {
		ExperienceDetailsRow = reactModule.createElement(experienceDetailsRowModule, { layoutOrder = 0 }),
		HeaderDivider = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-right-xlarge",
			LayoutOrder = 1
		}, { Divider = reactModule.createElement(divider) })
	}
	
	if #var9 <= 0 then
		var21 = nil
	elseif fIntSideSheetVariant == 0 then
		var21 = reactModule.createElement
		var21 = var21(gridListModule, {
			layoutOrder = 2,
			integrationsGetter = getToggleIntegrations,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var20 == t_1.IntegrationsList then var12 else nil
		})
	else
		var21 = reactModule.createElement
		var21 = var21(verticalListModule, {
			layoutOrder = if fIntSideSheetVariant == 2 then 4 else 2,
			integrationsGetter = getToggleIntegrations,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var20 == t_1.IntegrationsList then var12 else nil
		})
	end
	t.IntegrationsList = var21
	t.PageDivider = if #var9 > 0 then reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-right-xlarge",
		LayoutOrder = 3
	}, { Divider = reactModule.createElement(divider) }) else nil
	t.PageList = reactModule.createElement(verticalListModule, {
		layoutOrder = if fIntSideSheetVariant == 2 then 2 else 4,
		integrationsGetter = var2,
		firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var20 == t_1.PageList then var12 else nil
	})
	local createElement = reactModule.createElement
	createElement = createElement(view, { tag = "col size-full", onAbsoluteSizeChanged = var15 }, {
		ScrollableContent = reactModule.createElement(scrollView, {
			LayoutOrder = 1,
			tag = {
				["fill size-full-0"] = true,
				["padding-left-small"] = fFlagSideSheetFocusNav
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
		}, t),
		Footer = reactModule.createElement(footerModule, { layoutOrder = 2 })
	})
	
	if fFlagEnableWhatsNew then
		createElement = reactModule.createElement(var1, { anchorId = "sideSheet", tag = "size-full" }, { SideSheetPanel = createElement })
	end
	local var22 = 300 - var4.Padding.XLarge
	
	if fFlagSideSheetFocusNav then
		var22 += var4.Padding.Small
	end
	return reactModule.createElement(drawerContainer, {
		displayOrder = 12,
		scrimIsModal = true,
		menuWidth = var22,
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

function t.createSideSheet(p1, p2, p3)
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

return t
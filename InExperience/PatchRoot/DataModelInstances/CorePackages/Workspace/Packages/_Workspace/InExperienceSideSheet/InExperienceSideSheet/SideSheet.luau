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
local var26 = if fFlagEnableWhatsNew then require(parent.WhatsNew).WhatsNewAnchor else nil
local list = {
	Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.Up, Enum.KeyCode.Down,
	Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D
}
local t = {}
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local mouseIconOverrideService = coreScriptsCommonModule.MouseIconOverrideService
local usePreferredInput = responsiveModule.usePreferredInput

local function getDeviceSafePadding(p0)
	-- upvalues: displayModule (ref)
	return displayModule.GetDisplayStore(p0).getDeviceSafePadding(p0)
end

local function getToggleIntegrations(p1)
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getToggleIntegrations(p1)
end

local var31 = function(p2)
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p2).getPageIntegrations(p2)
end

local t_1 = nil
local useFocusGuiObject = nil

if fFlagSideSheetFocusNav then
	t_1 = { IntegrationsList = 0, PageList = 1 }
	useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
end
local var33 = nil

local function SideSheetContent(p3)
	-- upvalues: useTokens (ref), useStyleSheet (ref), useBackgroundStyleModule (ref), signalsReactModule (ref), getDeviceSafePadding (ref), fFlagMountUnmountSideSheet (ref), useDrawerShouldMount (ref), getToggleIntegrations (ref), reactModule (ref), sidesheetAnalyticsModule (ref), fFlagSideSheetFocusNav (ref), useFocusGuiObject (write), useLastInputMode (ref), getSideSheetConfigStoreModule (ref), usePreferredInput (ref), signalsModule (ref), getSideSheetVisibilityModule (ref), responsiveModule (ref), mouseIconOverrideService (ref), contextActionService (ref), list (ref), toggleSideSheetModule (ref), fFlagUseAnimateScrollViewToSelectionHelper (ref), useSideSheetFocusNavScrollViewAnimationModule (ref), fIntSideSheetVariant (ref), t_1 (write), experienceDetailsRowModule (ref), view (ref), divider (ref), gridListModule (ref), verticalListModule (ref), var31 (ref), scrollView (ref), footerModule (ref), fFlagEnableWhatsNew (ref), var26 (ref), drawerContainer (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var35 = useTokens()
	local var36 = useStyleSheet()
	local var37 = useBackgroundStyleModule()
	local var38 = signalsReactModule.useSignalState(getDeviceSafePadding)
	local var39 = if fFlagMountUnmountSideSheet then useDrawerShouldMount() else true
	local var40 = signalsReactModule.useSignalState(getToggleIntegrations)
	local var41 = reactModule.useCallback(function(p4)
		-- upvalues: sidesheetAnalyticsModule (copy)
		sidesheetAnalyticsModule.logSidesheetClosed(p4.source)
	end, {})
	local var42 = nil
	local _ = nil
	local _ = nil
	local var43 = nil
	
	if fFlagSideSheetFocusNav then
		var42 = reactModule.useRef(nil)
		local var44 = useFocusGuiObject()
		local var45 = useLastInputMode()
		var43 = reactModule.useCallback(function(p5)
			-- upvalues: var45 (write), var42 (write), var44 (write)
			if var45 == "Focus" and var42 and var42.current == false then
				var42.current = true
				var44(p5)
			end
		end, { var44, var45 })
	end
	local var46 = reactModule.useCallback(function(p6)
		-- upvalues: getSideSheetConfigStoreModule (copy)
		return getSideSheetConfigStoreModule().onHeightChanged(p6.AbsoluteSize.Y)
	end, {})
	local var47 = reactModule.useRef(false)
	local var48 = reactModule.useRef(false)
	local var49 = usePreferredInput()
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), getSideSheetVisibilityModule (copy), p3 (ref), var47 (ref), var49 (ref), responsiveModule (copy), var48 (ref), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var42 (write)
		local var55 = signalsModule.createEffect(function(p7)
			-- upvalues: getSideSheetVisibilityModule (copy), p3 (copy), var47 (copy), var49 (copy), responsiveModule (copy), var48 (copy), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var42 (copy)
			local var57 = getSideSheetVisibilityModule(p7)
			
			if p3.ChatSelector then
				if var57 then
					var47.current = p3.ChatSelector:GetVisibility()
					p3.ChatSelector:SetVisible(false)
				elseif var47.current then
					p3.ChatSelector:SetVisible(true)
					var47.current = false
				end
			end
			if var49 == responsiveModule.Input.Pointer then
				if var57 and not var48.current then
					mouseIconOverrideService.push("InExperienceSideSheet", Enum.OverrideMouseIconBehavior.ForceShow)
					var48.current = true
				elseif not var57 and var48.current then
					mouseIconOverrideService.pop("InExperienceSideSheet")
					var48.current = false
				end
			end
			if fFlagSideSheetFocusNav then
				if var57 then
					var42.current = false
					
					return
				end
				var42.current = nil
			end
		end)
		local var56 = if p3.ChatSelector then p3.ChatSelector.VisibilityStateChanged:connect(function(p8)
			-- upvalues: getSideSheetVisibilityModule (copy), var47 (copy)
			if getSideSheetVisibilityModule() and p8 then
				var47.current = false
			end
		end) else nil
		
		return function()
			-- upvalues: var55 (ref), var56 (write)
			var55()
			
			if var56 ~= nil then
				var56:disconnect()
			end
		end
	end, { p3.ChatSelector, var49 })
	
	if fFlagSideSheetFocusNav then
		reactModule.useEffect(function()
			-- upvalues: contextActionService (copy), var42 (write), list (copy), getSideSheetVisibilityModule (copy), toggleSideSheetModule (copy)
			contextActionService:BindCoreAction("SideSheetBlockInputAction", function(_, p9, _)
				-- upvalues: var42 (copy)
				return if p9 == Enum.UserInputState.Begin then if var42.current == nil then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
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
			end, false, Enum.KeyCode.ButtonB)
			
			return function()
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("SideSheetBlockInputAction")
				contextActionService:UnbindCoreAction("SideSheetSinkR2Action")
				contextActionService:UnbindCoreAction("SideSheetCloseAction")
			end
		end, {})
	end
	local var50 = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then useSideSheetFocusNavScrollViewAnimationModule() else nil
	local var51 = nil
	
	if fFlagSideSheetFocusNav then
		var51 = if fIntSideSheetVariant == 2 or #var40 <= 0 then t_1.PageList else t_1.IntegrationsList
	end
	if not var39 then
		return nil
	end
	local var53
	local t = {
		ExperienceDetailsRow = reactModule.createElement(experienceDetailsRowModule, { layoutOrder = 0 }),
		HeaderDivider = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-right-xlarge",
			LayoutOrder = 1
		}, { Divider = reactModule.createElement(divider) })
	}
	
	if #var40 <= 0 then
		var53 = nil
	elseif fIntSideSheetVariant == 0 then
		var53 = reactModule.createElement
		var53 = var53(gridListModule, {
			layoutOrder = 2,
			integrationsGetter = getToggleIntegrations,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var51 == t_1.IntegrationsList then var43 else nil
		})
	else
		var53 = reactModule.createElement
		var53 = var53(verticalListModule, {
			layoutOrder = if fIntSideSheetVariant == 2 then 4 else 2,
			integrationsGetter = getToggleIntegrations,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var51 == t_1.IntegrationsList then var43 else nil
		})
	end
	t.IntegrationsList = var53
	t.PageDivider = if #var40 > 0 then reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-right-xlarge",
		LayoutOrder = 3
	}, { Divider = reactModule.createElement(divider) }) else nil
	t.PageList = reactModule.createElement(verticalListModule, {
		layoutOrder = if fIntSideSheetVariant == 2 then 2 else 4,
		integrationsGetter = var31,
		firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var51 == t_1.PageList then var43 else nil
	})
	local createElement = reactModule.createElement
	createElement = createElement(view, { tag = "col size-full", onAbsoluteSizeChanged = var46 }, {
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
			scrollingFrameRef = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then var50 else nil
		}, t),
		Footer = reactModule.createElement(footerModule, { layoutOrder = 2 })
	})
	
	if fFlagEnableWhatsNew then
		createElement = reactModule.createElement(var26, { anchorId = "sideSheet", tag = "size-full" }, { SideSheetPanel = createElement })
	end
	local var54 = 300 - var35.Padding.XLarge
	
	if fFlagSideSheetFocusNav then
		var54 += var35.Padding.Small
	end
	return reactModule.createElement(drawerContainer, {
		displayOrder = 12,
		scrimIsModal = true,
		menuWidth = var54,
		leftOffset = var38.left + var35.Padding.XLarge,
		topOffset = var38.top,
		bottomOffset = var38.bottom,
		backgroundStyle = var37,
		onDrawerClosedAnalytics = var41
	}, {
		FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var36 }),
		if fFlagSideSheetFocusNav then reactModule.createElement(focusRoot, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
		}, { Content = createElement }) else createElement
	})
end

function t.createSideSheet(p10, p11, p12)
	-- upvalues: var33 (write), coreGuiService (ref), wrapWithProvidersModule (ref), reactModule (ref), SideSheetContent (ref), reactRobloxModule (ref)
	if not var33 then
		local inExperienceSideSheet = Instance.new("Folder")
		inExperienceSideSheet.Name = "InExperienceSideSheet"
		inExperienceSideSheet.Parent = coreGuiService
		var33 = reactRobloxModule.createRoot(inExperienceSideSheet)
		var33:render(wrapWithProvidersModule({
			SideSheetContent = reactModule.createElement(SideSheetContent, p11)
		}, p10, p12))
	end
	return var33
end

return t
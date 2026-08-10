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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMountUnmountSideSheet = require(inExperienceSideSheet.Flags).FFlagMountUnmountSideSheet
local fIntSideSheetVariant = sharedFlagsModule.FIntSideSheetVariant
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagEnableWhatsNew = sharedFlagsModule.FFlagEnableWhatsNew
local fFlagUseAnimateScrollViewToSelectionHelper = sharedFlagsModule.FFlagUseAnimateScrollViewToSelectionHelper
local var25 = if fFlagEnableWhatsNew then require(parent.WhatsNew).WhatsNewAnchor else nil
local list = {
	Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.Up, Enum.KeyCode.Down,
	Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D
}
local t = {}
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local mouseIconOverrideService = coreScriptsCommonModule.MouseIconOverrideService
local usePreferredInput = responsiveModule.usePreferredInput

local function getDeviceSafePadding(p0) --[[ line: 100 ]]
	-- upvalues: displayModule (ref)
	return displayModule.GetDisplayStore(p0).getDeviceSafePadding(p0)
end

local function getToggleIntegrations(p1) --[[ line: 104 ]]
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p1).getToggleIntegrations(p1)
end

local var30 = function(p2) --[[ line: 108 ]]
	-- upvalues: getIntegrationsStoreModule (ref)
	return getIntegrationsStoreModule(p2).getPageIntegrations(p2)
end

local t_1 = nil
local useFocusGuiObject = nil

if fFlagSideSheetFocusNav then
	t_1 = { IntegrationsList = 0, PageList = 1 }
	useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
end
local var32 = nil

local function SideSheetContent(p3) --[[ line: 123 ]]
	-- upvalues: useTokens (ref), useStyleSheet (ref), useBackgroundStyleModule (ref), signalsReactModule (ref), getDeviceSafePadding (ref), fFlagMountUnmountSideSheet (ref), useDrawerShouldMount (ref), getToggleIntegrations (ref), reactModule (ref), sidesheetAnalyticsModule (ref), fFlagSideSheetFocusNav (ref), useFocusGuiObject (write), useLastInputMode (ref), getSideSheetConfigStoreModule (ref), usePreferredInput (ref), signalsModule (ref), getSideSheetVisibilityModule (ref), responsiveModule (ref), mouseIconOverrideService (ref), contextActionService (ref), list (ref), fFlagUseAnimateScrollViewToSelectionHelper (ref), useSideSheetFocusNavScrollViewAnimationModule (ref), fIntSideSheetVariant (ref), t_1 (write), experienceDetailsRowModule (ref), view (ref), divider (ref), gridListModule (ref), verticalListModule (ref), var30 (ref), scrollView (ref), footerModule (ref), fFlagEnableWhatsNew (ref), var25 (ref), drawerContainer (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var34 = useTokens()
	local var35 = useStyleSheet()
	local var36 = useBackgroundStyleModule()
	local var37 = signalsReactModule.useSignalState(getDeviceSafePadding)
	local var38 = if fFlagMountUnmountSideSheet then useDrawerShouldMount() else true
	local var39 = signalsReactModule.useSignalState(getToggleIntegrations)
	local var40 = reactModule.useCallback(function(p4) --[[ line: 131 ]]
		-- upvalues: sidesheetAnalyticsModule (copy)
		sidesheetAnalyticsModule.logSidesheetClosed(p4.source)
	end, {})
	local var41 = nil
	local _ = nil
	local _ = nil
	local var42 = nil
	
	if fFlagSideSheetFocusNav then
		var41 = reactModule.useRef(nil)
		local var43 = useFocusGuiObject()
		local var44 = useLastInputMode()
		var42 = reactModule.useCallback(function(p5) --[[ line: 140 ]]
			-- upvalues: var44 (write), var41 (write), var43 (write)
			if var44 == "Focus" and var41 and var41.current == false then
				var41.current = true
				var43(p5)
			end
		end, { var43, var44 })
	end
	local var45 = reactModule.useCallback(function(p6) --[[ line: 148 ]]
		-- upvalues: getSideSheetConfigStoreModule (copy)
		return getSideSheetConfigStoreModule().onHeightChanged(p6.AbsoluteSize.Y)
	end, {})
	local var46 = reactModule.useRef(false)
	local var47 = reactModule.useRef(false)
	local var48 = usePreferredInput()
	reactModule.useEffect(function() --[[ line: 156 ]]
		-- upvalues: signalsModule (copy), getSideSheetVisibilityModule (copy), p3 (ref), var46 (ref), var48 (ref), responsiveModule (copy), var47 (ref), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var41 (write)
		local var54 = signalsModule.createEffect(function(p7) --[[ line: 157 ]]
			-- upvalues: getSideSheetVisibilityModule (copy), p3 (copy), var46 (copy), var48 (copy), responsiveModule (copy), var47 (copy), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var41 (copy)
			local var56 = getSideSheetVisibilityModule(p7)
			
			if p3.ChatSelector then
				if var56 then
					var46.current = p3.ChatSelector:GetVisibility()
					p3.ChatSelector:SetVisible(false)
				elseif var46.current then
					p3.ChatSelector:SetVisible(true)
					var46.current = false
				end
			end
			if var48 == responsiveModule.Input.Pointer then
				if var56 and not var47.current then
					mouseIconOverrideService.push("InExperienceSideSheet", Enum.OverrideMouseIconBehavior.ForceShow)
					var47.current = true
				elseif not var56 and var47.current then
					mouseIconOverrideService.pop("InExperienceSideSheet")
					var47.current = false
				end
			end
			if fFlagSideSheetFocusNav then
				if var56 then
					var41.current = false
					
					return
				end
				var41.current = nil
			end
		end)
		local var55 = if p3.ChatSelector then p3.ChatSelector.VisibilityStateChanged:connect(function(p8) --[[ line: 193 ]]
			-- upvalues: getSideSheetVisibilityModule (copy), var46 (copy)
			if getSideSheetVisibilityModule() and p8 then
				var46.current = false
			end
		end) else nil
		
		return function() --[[ line: 200 ]]
			-- upvalues: var54 (ref), var55 (write)
			var54()
			
			if var55 ~= nil then
				var55:disconnect()
			end
		end
	end, { p3.ChatSelector, var48 })
	
	if fFlagSideSheetFocusNav then
		reactModule.useEffect(function() --[[ line: 209 ]]
			-- upvalues: contextActionService (copy), var41 (write), list (copy)
			contextActionService:BindCoreAction("SideSheetBlockInputAction", function(_, p9, _) --[[ line: 210 ]]
				-- upvalues: var41 (copy)
				return if p9 == Enum.UserInputState.Begin then if var41.current == nil then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
			end, false, unpack(list))
			
			return function() --[[ line: 220 ]]
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("SideSheetBlockInputAction")
			end
		end, {})
	end
	local var49 = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then useSideSheetFocusNavScrollViewAnimationModule() else nil
	local var50 = nil
	
	if fFlagSideSheetFocusNav then
		var50 = if fIntSideSheetVariant == 2 or #var39 <= 0 then t_1.PageList else t_1.IntegrationsList
	end
	if not var38 then
		return nil
	end
	local var52
	local t = {
		ExperienceDetailsRow = reactModule.createElement(experienceDetailsRowModule, { layoutOrder = 0 }),
		HeaderDivider = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-right-xlarge",
			LayoutOrder = 1
		}, { Divider = reactModule.createElement(divider) })
	}
	
	if #var39 <= 0 then
		var52 = nil
	elseif fIntSideSheetVariant == 0 then
		var52 = reactModule.createElement
		var52 = var52(gridListModule, {
			layoutOrder = 2,
			integrationsGetter = getToggleIntegrations,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var50 == t_1.IntegrationsList then var42 else nil
		})
	else
		var52 = reactModule.createElement
		var52 = var52(verticalListModule, {
			layoutOrder = if fIntSideSheetVariant == 2 then 4 else 2,
			integrationsGetter = getToggleIntegrations,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var50 == t_1.IntegrationsList then var42 else nil
		})
	end
	t.IntegrationsList = var52
	t.PageDivider = if #var39 > 0 then reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-right-xlarge",
		LayoutOrder = 3
	}, { Divider = reactModule.createElement(divider) }) else nil
	t.PageList = reactModule.createElement(verticalListModule, {
		layoutOrder = if fIntSideSheetVariant == 2 then 2 else 4,
		integrationsGetter = var30,
		firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var50 == t_1.PageList then var42 else nil
	})
	local createElement = reactModule.createElement
	createElement = createElement(view, { tag = "col size-full", onAbsoluteSizeChanged = var45 }, {
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
			scrollingFrameRef = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then var49 else nil
		}, t),
		Footer = reactModule.createElement(footerModule, { layoutOrder = 2 })
	})
	
	if fFlagEnableWhatsNew then
		createElement = reactModule.createElement(var25, { anchorId = "sideSheet", tag = "size-full" }, { SideSheetPanel = createElement })
	end
	local var53 = 300 - var34.Padding.XLarge
	
	if fFlagSideSheetFocusNav then
		var53 += var34.Padding.Small
	end
	return reactModule.createElement(drawerContainer, {
		displayOrder = 12,
		scrimIsModal = true,
		menuWidth = var53,
		leftOffset = var37.left + var34.Padding.XLarge,
		topOffset = var37.top,
		bottomOffset = var37.bottom,
		backgroundStyle = var36,
		onDrawerClosedAnalytics = var40
	}, {
		FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var35 }),
		if fFlagSideSheetFocusNav then reactModule.createElement(focusRoot, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
		}, { Content = createElement }) else createElement
	})
end

function t.createSideSheet(p10, p11, p12) --[[ line: 360 ]]
	-- upvalues: var32 (write), coreGuiService (ref), wrapWithProvidersModule (ref), reactModule (ref), SideSheetContent (ref), reactRobloxModule (ref)
	if not var32 then
		local inExperienceSideSheet = Instance.new("Folder")
		inExperienceSideSheet.Name = "InExperienceSideSheet"
		inExperienceSideSheet.Parent = coreGuiService
		var32 = reactRobloxModule.createRoot(inExperienceSideSheet)
		var32:render(wrapWithProvidersModule({
			SideSheetContent = reactModule.createElement(SideSheetContent, p11)
		}, p10, p12))
	end
	return var32
end

return t
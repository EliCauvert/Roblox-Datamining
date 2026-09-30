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
local useScaledValue = foundationModule.Hooks.useScaledValue
local useStyleSheet = foundationModule.Hooks.useStyleSheet
local useBackgroundStyleModule = require(inExperienceSideSheet.Hooks.useBackgroundStyle)
local useSideSheetFocusNavScrollViewAnimationModule = require(inExperienceSideSheet.Hooks.useSideSheetFocusNavScrollViewAnimation)
local getIntegrationsStoreModule = require(inExperienceSideSheet.Stores.GetIntegrationsStore)
local getSideSheetConfigStoreModule = require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)
local getSwitchServerStore = switchServerModule.GetSwitchServerStore
local wrapWithProvidersModule = require(inExperienceSideSheet.Utils.wrapWithProviders)
local closePeoplePageOpenedWithSideSheetModule = require(inExperienceSideSheet.Utils.closePeoplePageOpenedWithSideSheet)
local getDidSideSheetOpenWithPeoplePageModule = require(inExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local getIsPeoplePageOpenModule = require(inExperienceSideSheet.Utils.getIsPeoplePageOpen)
local getSideSheetVisibilityModule = require(inExperienceSideSheet.Utils.getSideSheetVisibility)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)
local flagsModule = require(inExperienceSideSheet.Flags)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagMountUnmountSideSheet = flagsModule.FFlagMountUnmountSideSheet
local fFlagSideSheetOpenPeoplePage = flagsModule.FFlagSideSheetOpenPeoplePage
local fFlagSideSheetOpenPeoplePageRestoreChat = flagsModule.FFlagSideSheetOpenPeoplePageRestoreChat
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
	-- upvalues: useScaledValue (ref), useStyleSheet (ref), useBackgroundStyleModule (ref), signalsReactModule (ref), getDeviceSafePadding (ref), fFlagMountUnmountSideSheet (ref), useDrawerShouldMount (ref), fFlagSideSheetOpenPeoplePage (ref), getSideSheetVisibilityModule (ref), getIsPeoplePageOpenModule (ref), getDidSideSheetOpenWithPeoplePageModule (ref), getScrollableContentTopWidgetIntegrations (ref), fFlagEnableSideSheetWidgets_1 (ref), reactModule (ref), sidesheetAnalyticsModule (ref), fFlagSideSheetFocusNav (ref), var2 (write), useLastInputMode (ref), fFlagSideSheetOpenPeoplePageRestoreChat (ref), usePreferredInput (ref), signalsModule (ref), guiService (ref), responsiveModule (ref), mouseIconOverrideService (ref), fFlagShowSwitchServerButton (ref), isPioneerLaunch (ref), getSwitchServerStore (ref), switchServerTelemetry (ref), contextActionService (ref), list (ref), toggleSideSheetModule (ref), fFlagUseAnimateScrollViewToSelectionHelper (ref), useSideSheetFocusNavScrollViewAnimationModule (ref), getSideSheetConfigStoreModule (ref), closePeoplePageOpenedWithSideSheetModule (ref), userProfileRowModule (ref), t (ref), experienceDetailsRowModule (ref), view (ref), divider (ref), sideSheetWidgetListModule (ref), chromeModule (ref), verticalListModule (ref), getAboveFoldIntegrations (ref), getBelowFoldIntegrations (ref), getScrollableContentBottomWidgetIntegrations (ref), scrollView (ref), footerModule (ref), fFlagEnableWhatsNew (ref), var1 (ref), drawerContainer (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var4 = useScaledValue(320)
	local var5 = useStyleSheet()
	local var6 = useBackgroundStyleModule()
	local var7 = signalsReactModule.useSignalState(getDeviceSafePadding)
	local var8 = if fFlagMountUnmountSideSheet then useDrawerShouldMount() else true
	local var9 = if fFlagSideSheetOpenPeoplePage then signalsReactModule.useSignalState(getSideSheetVisibilityModule) else false
	local var10 = (if fFlagSideSheetOpenPeoplePage then signalsReactModule.useSignalState(getDidSideSheetOpenWithPeoplePageModule) else false) and (var9 and (if fFlagSideSheetOpenPeoplePage then signalsReactModule.useSignalState(getIsPeoplePageOpenModule) else false))
	local var11 = fFlagEnableSideSheetWidgets_1 and #signalsReactModule.useSignalState(getScrollableContentTopWidgetIntegrations) > 0
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: sidesheetAnalyticsModule (copy)
		sidesheetAnalyticsModule.logSidesheetClosed(p2.source)
	end, {})
	local var13 = nil
	local _ = nil
	local _ = nil
	local var14 = nil
	
	if fFlagSideSheetFocusNav then
		var13 = reactModule.useRef(nil)
		local var15 = var2()
		local var16 = useLastInputMode()
		var14 = reactModule.useCallback(function(p2)
			-- upvalues: var16 (write), var13 (write), var15 (write)
			if var16 == "Focus" and var13 and var13.current == false then
				var13.current = true
				var15(p2)
			end
		end, { var15, var16 })
	end
	local var17 = reactModule.useRef(false)
	local var18 = if fFlagSideSheetOpenPeoplePageRestoreChat then reactModule.useRef(nil) else nil
	local var19 = reactModule.useRef(false)
	local var20 = usePreferredInput()
	local var21 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), getSideSheetVisibilityModule (copy), fFlagSideSheetOpenPeoplePageRestoreChat (copy), var18 (ref), p1 (ref), guiService (copy), var17 (ref)
		local var22 = signalsModule.createEffect(function(p2)
			-- upvalues: getSideSheetVisibilityModule (copy), fFlagSideSheetOpenPeoplePageRestoreChat (copy), var18 (copy), p1 (copy), guiService (copy), var17 (copy)
			local var23 = getSideSheetVisibilityModule(p2)
			
			if fFlagSideSheetOpenPeoplePageRestoreChat and var18 and (p1.ChatSelector and var23) and not var18.current then
				local visibility = p1.ChatSelector:GetVisibility()
				
				if guiService.MenuIsOpen and not visibility then
					var17.current = UserSettings().GameSettings.ChatVisible
				else
					var17.current = visibility
				end
			end
			guiService:SetMenuIsOpen(var23, "InExperienceSideSheet")
			
			if fFlagSideSheetOpenPeoplePageRestoreChat and var18 and p1.ChatSelector then
				if var23 then
					if var18.current then
						var18.current:Disconnect()
						var18.current = nil
					end
					p1.ChatSelector:SetVisible(false)
					
					return
				elseif var17.current and not var18.current then
					local function restoreChat()
						-- upvalues: var18 (copy), p1 (copy), var17 (copy)
						if var18.current then
							var18.current:Disconnect()
						end
						var18.current = nil
						p1.ChatSelector:SetVisible(true)
						var17.current = false
					end
					
					if guiService.MenuIsOpen then
						var18.current = guiService.MenuClosed:Once(restoreChat)
						
						return
					elseif var18.current then
						var18.current:Disconnect()
					end
					var18.current = nil
					p1.ChatSelector:SetVisible(true)
					var17.current = false
				end
			end
		end)
		
		return function()
			-- upvalues: var22 (ref), fFlagSideSheetOpenPeoplePageRestoreChat (copy), var18 (copy), guiService (copy)
			var22()
			
			if fFlagSideSheetOpenPeoplePageRestoreChat and var18 and var18.current then
				var18.current:Disconnect()
				var18.current = nil
			end
			if guiService.MenuIsOpen then
				guiService:SetMenuIsOpen(false, "InExperienceSideSheet")
			end
		end
	end, {
		if fFlagSideSheetOpenPeoplePageRestoreChat then p1.ChatSelector else nil
	})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), getSideSheetVisibilityModule (copy), fFlagSideSheetOpenPeoplePageRestoreChat (copy), p1 (ref), var17 (ref), var20 (ref), responsiveModule (copy), var19 (ref), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var13 (write), fFlagShowSwitchServerButton (copy), isPioneerLaunch (copy), getSwitchServerStore (copy), var21 (ref), switchServerTelemetry (copy)
		local var22 = signalsModule.createEffect(function(p2)
			-- upvalues: getSideSheetVisibilityModule (copy), fFlagSideSheetOpenPeoplePageRestoreChat (copy), p1 (copy), var17 (copy), var20 (copy), responsiveModule (copy), var19 (copy), mouseIconOverrideService (copy), fFlagSideSheetFocusNav (copy), var13 (copy), fFlagShowSwitchServerButton (copy), isPioneerLaunch (copy), getSwitchServerStore (copy), var21 (copy), switchServerTelemetry (copy)
			local var23 = getSideSheetVisibilityModule(p2)
			
			if not fFlagSideSheetOpenPeoplePageRestoreChat and p1.ChatSelector then
				if var23 then
					var17.current = p1.ChatSelector:GetVisibility()
					p1.ChatSelector:SetVisible(false)
				elseif var17.current then
					p1.ChatSelector:SetVisible(true)
					var17.current = false
				end
			end
			if var20 == responsiveModule.Input.Pointer then
				if var23 and not var19.current then
					mouseIconOverrideService.push("InExperienceSideSheet", Enum.OverrideMouseIconBehavior.ForceShow)
					var19.current = true
				elseif not var23 and var19.current then
					mouseIconOverrideService.pop("InExperienceSideSheet")
					var19.current = false
				end
			end
			if fFlagSideSheetFocusNav then
				if var23 then
					var13.current = false
				else
					var13.current = nil
				end
			end
			if var23 and (fFlagShowSwitchServerButton or isPioneerLaunch()) and (getSwitchServerStore(p2).shouldEnableSwitchServer(p2) and not var21.current) then
				var21.current = true
				switchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
			end
		end)
		local var23 = if p1.ChatSelector then p1.ChatSelector.VisibilityStateChanged:connect(function(p2)
			-- upvalues: getSideSheetVisibilityModule (copy), var17 (copy)
			if getSideSheetVisibilityModule() and p2 then
				var17.current = false
			end
		end) else nil
		
		return function()
			-- upvalues: var22 (ref), var23 (write)
			var22()
			
			if var23 ~= nil then
				var23:disconnect()
			end
		end
	end, { p1.ChatSelector, var20 })
	
	if fFlagSideSheetFocusNav then
		reactModule.useEffect(function()
			-- upvalues: contextActionService (copy), var13 (write), list (copy), getSideSheetVisibilityModule (copy), fFlagSideSheetOpenPeoplePage (copy), toggleSideSheetModule (copy)
			contextActionService:BindCoreAction("SideSheetBlockInputAction", function(_, p2, _)
				-- upvalues: var13 (copy)
				return if p2 == Enum.UserInputState.Begin then if var13.current == nil then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
			end, false, unpack(list))
			contextActionService:BindCoreAction("SideSheetSinkR2Action", function(_, _, _)
				-- upvalues: getSideSheetVisibilityModule (copy)
				return if getSideSheetVisibilityModule() then Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonR2)
			contextActionService:BindCoreAction("SideSheetCloseAction", function(_, p2, _)
				-- upvalues: fFlagSideSheetOpenPeoplePage (copy), getSideSheetVisibilityModule (copy), toggleSideSheetModule (copy)
				if fFlagSideSheetOpenPeoplePage and p2 ~= Enum.UserInputState.Begin then
					return Enum.ContextActionResult.Pass
				elseif getSideSheetVisibilityModule() then
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
	local var22 = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then useSideSheetFocusNavScrollViewAnimationModule() else nil
	local left = var7.left
	
	if fFlagSideSheetOpenPeoplePage then
		reactModule.useEffect(function()
			-- upvalues: getSideSheetConfigStoreModule (copy), var4 (ref)
			getSideSheetConfigStoreModule(false).setSideSheetDrawerWidth(var4)
		end, { var4 })
		reactModule.useEffect(function()
			-- upvalues: var9 (ref), closePeoplePageOpenedWithSideSheetModule (copy)
			return if var9 then function()
				-- upvalues: closePeoplePageOpenedWithSideSheetModule (copy)
				closePeoplePageOpenedWithSideSheetModule()
			end else nil
		end, { var9 })
	end
	if not var8 then
		return nil
	end
	local var23
	local t_1 = {
		HeaderRow = if isPioneerLaunch() then reactModule.createElement(userProfileRowModule, { layoutOrder = t.ExperienceDetails }) else reactModule.createElement(experienceDetailsRowModule, { layoutOrder = t.ExperienceDetails }),
		HeaderDivider = if var11 then nil else reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			LayoutOrder = t.HeaderDivider
		}, { Divider = reactModule.createElement(divider) })
	}
	
	if fFlagEnableSideSheetWidgets_1 then
		var23 = reactModule.createElement
		var23 = var23(sideSheetWidgetListModule, {
			integrationsGetter = getScrollableContentTopWidgetIntegrations,
			layoutOrder = t.TopWidgets,
			placement = chromeModule.Enums.SideSheetPlacement.ScrollableContentTop,
			firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and var11 then var14 else nil
		})
	else
		var23 = nil
	end
	t_1.TopWidgets = var23
	t_1.AboveFoldList = reactModule.createElement(verticalListModule, {
		layoutOrder = t.PrimaryList,
		integrationsGetter = getAboveFoldIntegrations,
		firstIntegrationToFocusCallback = if fFlagSideSheetFocusNav and not var11 then var14 else nil,
		allowRightFocusEscape = var10
	})
	t_1.FoldDivider = reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-y-xxlarge",
		LayoutOrder = t.ListDivider
	}, { Divider = reactModule.createElement(divider) })
	t_1.BelowFoldList = reactModule.createElement(verticalListModule, {
		layoutOrder = t.SecondaryList,
		integrationsGetter = getBelowFoldIntegrations,
		allowRightFocusEscape = var10
	})
	t_1.BottomWidgets = if fFlagEnableSideSheetWidgets_1 then reactModule.createElement(sideSheetWidgetListModule, {
		integrationsGetter = getScrollableContentBottomWidgetIntegrations,
		layoutOrder = t.BottomWidgets,
		placement = chromeModule.Enums.SideSheetPlacement.ScrollableContentBottom
	}) else nil
	local createElement = reactModule.createElement
	createElement = createElement(view, { tag = "col size-full" }, {
		ScrollableContent = reactModule.createElement(scrollView, {
			tag = "fill size-full-0 padding-x-xlarge",
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
			scrollingFrameRef = if fFlagSideSheetFocusNav and fFlagUseAnimateScrollViewToSelectionHelper then var22 else nil
		}, t_1),
		Footer = reactModule.createElement(footerModule, { layoutOrder = 2 })
	})
	
	if fFlagEnableWhatsNew then
		createElement = reactModule.createElement(var1, { anchorId = "sideSheet", tag = "size-full" }, { SideSheetPanel = createElement })
	end
	return reactModule.createElement(drawerContainer, {
		displayOrder = 12,
		menuWidth = var4,
		leftOffset = left,
		topOffset = var7.top,
		bottomOffset = var7.bottom,
		backgroundStyle = var6,
		onDrawerClosedAnalytics = var12,
		allowOutsideInteraction = if fFlagSideSheetOpenPeoplePage then var10 else nil,
		scrimIsModal = if fFlagSideSheetOpenPeoplePage then not var10 else true
	}, {
		FoundationStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var5 }),
		if fFlagSideSheetFocusNav then reactModule.createElement(focusRoot, {
			isIsolated = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
			frameProps = if var10 then { SelectionBehaviorRight = Enum.SelectionBehavior.Escape } else nil
		}, { Content = createElement }) else createElement
	})
end

function t_1.createSideSheet(p2, p3, p4)
	-- upvalues: var3 (write), coreGuiService (ref), wrapWithProvidersModule (ref), reactModule (ref), SideSheetContent (ref), reactRobloxModule (ref)
	if not var3 then
		local inExperienceSideSheet = Instance.new("Folder")
		inExperienceSideSheet.Name = "InExperienceSideSheet"
		inExperienceSideSheet.Parent = coreGuiService
		var3 = reactRobloxModule.createRoot(inExperienceSideSheet)
		var3:render(wrapWithProvidersModule({
			SideSheetContent = reactModule.createElement(SideSheetContent, p3)
		}, p2, p4))
	end
	return var3
end

return t_1
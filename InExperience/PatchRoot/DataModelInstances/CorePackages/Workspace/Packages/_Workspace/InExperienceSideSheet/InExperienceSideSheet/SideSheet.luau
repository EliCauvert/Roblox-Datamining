local ContextActionService = game:GetService("ContextActionService")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ChromeModule = require(Parent.Chrome)
local CoreScriptsCommonModule = require(Parent.CoreScriptsCommon)
local DisplayModule = require(Parent.Display)
local DrawerModule = require(Parent.Drawer)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local IsPioneerLaunchFunction = require(Parent.PioneerUtils).isPioneerLaunch
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ResponsiveModule = require(Parent.Responsive)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local SwitchServerModule = require(Parent.SwitchServer)
local Divider = FoundationModule.Divider
local DrawerContainer = DrawerModule.DrawerContainer
local ExperienceDetailsRowModule = require(InExperienceSideSheet.Components.ExperienceDetailsRow)
local FooterModule = require(InExperienceSideSheet.Components.Footer)
local UserProfileRowModule = require(InExperienceSideSheet.Components.UserProfileRow)
local ScrollView = FoundationModule.ScrollView
local SideSheetWidgetListModule = require(InExperienceSideSheet.Components.SideSheetWidgetList)
local VerticalListModule = require(InExperienceSideSheet.Components.VerticalList)
local View = FoundationModule.View
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local UseLastInputModeFunction = FocusNavigationUtilsModule.useLastInputMode
local SidesheetAnalyticsModule = require(InExperienceSideSheet.Analytics.SidesheetAnalytics)
local UseDrawerShouldMountFunction = DrawerModule.Hooks.useDrawerShouldMount
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet
local UseBackgroundStyleModule = require(InExperienceSideSheet.Hooks.useBackgroundStyle)
local UseSideSheetFocusNavScrollViewAnimationModule = require(InExperienceSideSheet.Hooks.useSideSheetFocusNavScrollViewAnimation)
local GetIntegrationsStoreModule = require(InExperienceSideSheet.Stores.GetIntegrationsStore)
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local GetSwitchServerStoreFunction = SwitchServerModule.GetSwitchServerStore
local WrapWithProvidersModule = require(InExperienceSideSheet.Utils.wrapWithProviders)
local ClosePeoplePageOpenedWithSideSheetModule = require(InExperienceSideSheet.Utils.closePeoplePageOpenedWithSideSheet)
local GetDidSideSheetOpenWithPeoplePageModule = require(InExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local GetIsPeoplePageOpenModule = require(InExperienceSideSheet.Utils.getIsPeoplePageOpen)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local FlagsModule = require(InExperienceSideSheet.Flags)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMountUnmountSideSheet = FlagsModule.FFlagMountUnmountSideSheet
local FFlagSideSheetOpenPeoplePage = FlagsModule.FFlagSideSheetOpenPeoplePage
local FFlagSideSheetOpenPeoplePageRestoreChat = FlagsModule.FFlagSideSheetOpenPeoplePageRestoreChat
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav
local FFlagEnableWhatsNew = SharedFlagsModule.FFlagEnableWhatsNew
local FFlagUseAnimateScrollViewToSelectionHelper = SharedFlagsModule.FFlagUseAnimateScrollViewToSelectionHelper
local FFlagShowSwitchServerButton = SharedFlagsModule.FFlagShowSwitchServerButton
local FFlagEnableSideSheetWidgets = SharedFlagsModule.FFlagEnableSideSheetWidgets or IsPioneerLaunchFunction()
local WhatsNewAnchor = if FFlagEnableWhatsNew then require(Parent.WhatsNew).WhatsNewAnchor else nil
local SwitchServerTelemetry = SwitchServerModule.SwitchServerTelemetry
local list = {
	Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.Up, Enum.KeyCode.Down,
	Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D
}
local config = {
	ExperienceDetails = 0,
	HeaderDivider = 1,
	TopWidgets = 2,
	PrimaryList = if FFlagEnableSideSheetWidgets then 3 else 2,
	ListDivider = if FFlagEnableSideSheetWidgets then 4 else 3,
	SecondaryList = if FFlagEnableSideSheetWidgets then 5 else 4,
	BottomWidgets = if FFlagEnableSideSheetWidgets then 6 else 5
}
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local MouseIconOverrideService = CoreScriptsCommonModule.MouseIconOverrideService
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput

local function getDeviceSafePadding(p1)
	-- upvalues: DisplayModule (copy)
	return DisplayModule.GetDisplayStore(p1).getDeviceSafePadding(p1)
end

local function getAboveFoldIntegrations(p1)
	-- upvalues: GetIntegrationsStoreModule (copy)
	return GetIntegrationsStoreModule(p1).getAboveFoldIntegrations(p1)
end

local function getBelowFoldIntegrations(p1)
	-- upvalues: GetIntegrationsStoreModule (copy)
	return GetIntegrationsStoreModule(p1).getBelowFoldIntegrations(p1)
end

local function getScrollableContentTopWidgetIntegrations(p1)
	-- upvalues: GetIntegrationsStoreModule (copy)
	return GetIntegrationsStoreModule(p1).getScrollableContentTopWidgetIntegrations(p1)
end

local function getScrollableContentBottomWidgetIntegrations(p1)
	-- upvalues: GetIntegrationsStoreModule (copy)
	return GetIntegrationsStoreModule(p1).getScrollableContentBottomWidgetIntegrations(p1)
end

local UseFocusGuiObject = if FFlagSideSheetFocusNav then require(Parent.ReactFocusNavigation).useFocusGuiObject else nil
local Root = nil

local function SideSheetContent(p1)
	-- upvalues: UseScaledValueFunction (copy), UseStyleSheetFunction (copy), UseBackgroundStyleModule (copy), SignalsReactModule (copy), getDeviceSafePadding (copy), FFlagMountUnmountSideSheet (copy), UseDrawerShouldMountFunction (copy), FFlagSideSheetOpenPeoplePage (copy), GetSideSheetVisibilityModule (copy), GetIsPeoplePageOpenModule (copy), GetDidSideSheetOpenWithPeoplePageModule (copy), getScrollableContentTopWidgetIntegrations (copy), FFlagEnableSideSheetWidgets (copy), ReactModule (copy), SidesheetAnalyticsModule (copy), FFlagSideSheetFocusNav (copy), UseFocusGuiObject (ref), UseLastInputModeFunction (copy), FFlagSideSheetOpenPeoplePageRestoreChat (copy), UsePreferredInputFunction (copy), SignalsModule (copy), GuiService (copy), ResponsiveModule (copy), MouseIconOverrideService (copy), FFlagShowSwitchServerButton (copy), IsPioneerLaunchFunction (copy), GetSwitchServerStoreFunction (copy), SwitchServerTelemetry (copy), ContextActionService (copy), list (copy), ToggleSideSheetModule (copy), FFlagUseAnimateScrollViewToSelectionHelper (copy), UseSideSheetFocusNavScrollViewAnimationModule (copy), GetSideSheetConfigStoreModule (copy), ClosePeoplePageOpenedWithSideSheetModule (copy), UserProfileRowModule (copy), config (copy), ExperienceDetailsRowModule (copy), View (copy), Divider (copy), SideSheetWidgetListModule (copy), ChromeModule (copy), VerticalListModule (copy), getAboveFoldIntegrations (copy), getBelowFoldIntegrations (copy), getScrollableContentBottomWidgetIntegrations (copy), ScrollView (copy), FooterModule (copy), FFlagEnableWhatsNew (copy), WhatsNewAnchor (copy), DrawerContainer (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseScaledValueResult = UseScaledValueFunction(320)
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseBackgroundStyleModuleResult = UseBackgroundStyleModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(getDeviceSafePadding)
	local NoFFlagMountUnmountSideSheet = not FFlagMountUnmountSideSheet or UseDrawerShouldMountFunction()
	local UseSignalStateResult1 = if FFlagSideSheetOpenPeoplePage then SignalsReactModule.useSignalState(GetSideSheetVisibilityModule) else false
	local UseSignalStateResult2 = if FFlagSideSheetOpenPeoplePage then SignalsReactModule.useSignalState(GetIsPeoplePageOpenModule) else false
	local UseSignalStateResult2_1 = (if FFlagSideSheetOpenPeoplePage then SignalsReactModule.useSignalState(GetDidSideSheetOpenWithPeoplePageModule) else false) and (UseSignalStateResult1 and UseSignalStateResult2)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(getScrollableContentTopWidgetIntegrations)
	local v1: boolean = FFlagEnableSideSheetWidgets and #UseSignalStateResult3 > 0
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: SidesheetAnalyticsModule (upval)
		SidesheetAnalyticsModule.logSidesheetClosed(p2.source)
	end, {})
	local UseRefResult = nil
	local UseFocusGuiObjectResult = nil
	local UseLastInputModeResult = nil
	local UseResult1 = nil
	
	if FFlagSideSheetFocusNav then
		UseRefResult = ReactModule.useRef(nil)
		UseFocusGuiObjectResult = UseFocusGuiObject()
		UseLastInputModeResult = UseLastInputModeFunction()
		UseResult1 = ReactModule.useCallback(function(p2)
			-- upvalues: UseLastInputModeResult (ref), UseRefResult (ref), UseFocusGuiObjectResult (ref)
			if UseLastInputModeResult == "Focus" and UseRefResult and UseRefResult.current == false then
				UseRefResult.current = true
				UseFocusGuiObjectResult(p2)
			end
		end, { UseFocusGuiObjectResult, UseLastInputModeResult })
	end
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = if FFlagSideSheetOpenPeoplePageRestoreChat then ReactModule.useRef(nil) else nil
	local UseRefResult3 = ReactModule.useRef(false)
	local UsePreferredInputResult = UsePreferredInputFunction()
	local UseRefResult4 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), GetSideSheetVisibilityModule (upval), FFlagSideSheetOpenPeoplePageRestoreChat (upval), UseRefResult2 (copy), p1 (copy), GuiService (upval), UseRefResult1 (copy)
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: GetSideSheetVisibilityModule (upval), FFlagSideSheetOpenPeoplePageRestoreChat (upval), UseRefResult2 (upval), p1 (upval), GuiService (upval), UseRefResult1 (upval)
			local SideSheetVisibilityModule = GetSideSheetVisibilityModule(p2)
			
			if FFlagSideSheetOpenPeoplePageRestoreChat and UseRefResult2 and p1.ChatSelector and SideSheetVisibilityModule and not UseRefResult2.current then
				local Visibility = p1.ChatSelector:GetVisibility()
				
				if GuiService.MenuIsOpen and not Visibility then
					UseRefResult1.current = UserSettings().GameSettings.ChatVisible
				else
					UseRefResult1.current = Visibility
				end
			end
			GuiService:SetMenuIsOpen(SideSheetVisibilityModule, "InExperienceSideSheet")
			
			if FFlagSideSheetOpenPeoplePageRestoreChat and UseRefResult2 and p1.ChatSelector then
				if SideSheetVisibilityModule then
					if UseRefResult2.current then
						UseRefResult2.current:Disconnect()
						UseRefResult2.current = nil
					end
					p1.ChatSelector:SetVisible(false)
					
					return
				else
					if UseRefResult1.current and not UseRefResult2.current then
						local function restoreChat()
							-- upvalues: UseRefResult2 (upval), p1 (upval), UseRefResult1 (upval)
							if UseRefResult2.current then
								UseRefResult2.current:Disconnect()
							end
							UseRefResult2.current = nil
							p1.ChatSelector:SetVisible(true)
							UseRefResult1.current = false
						end
						
						if GuiService.MenuIsOpen then
							UseRefResult2.current = GuiService.MenuClosed:Once(restoreChat)
							
							return
						end
						if UseRefResult2.current then
							UseRefResult2.current:Disconnect()
						end
						UseRefResult2.current = nil
						p1.ChatSelector:SetVisible(true)
						UseRefResult1.current = false
					end
				end
			end
		end)
		
		return function()
			-- upvalues: Effect (copy), FFlagSideSheetOpenPeoplePageRestoreChat (upval), UseRefResult2 (upval), GuiService (upval)
			Effect()
			
			if FFlagSideSheetOpenPeoplePageRestoreChat and UseRefResult2 and UseRefResult2.current then
				UseRefResult2.current:Disconnect()
				UseRefResult2.current = nil
			end
			if GuiService.MenuIsOpen then
				GuiService:SetMenuIsOpen(false, "InExperienceSideSheet")
			end
		end
	end, {
		if FFlagSideSheetOpenPeoplePageRestoreChat then p1.ChatSelector else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), GetSideSheetVisibilityModule (upval), FFlagSideSheetOpenPeoplePageRestoreChat (upval), p1 (copy), UseRefResult1 (copy), UsePreferredInputResult (copy), ResponsiveModule (upval), UseRefResult3 (copy), MouseIconOverrideService (upval), FFlagSideSheetFocusNav (upval), UseRefResult (ref), FFlagShowSwitchServerButton (upval), IsPioneerLaunchFunction (upval), GetSwitchServerStoreFunction (upval), UseRefResult4 (copy), SwitchServerTelemetry (upval)
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: GetSideSheetVisibilityModule (upval), FFlagSideSheetOpenPeoplePageRestoreChat (upval), p1 (upval), UseRefResult1 (upval), UsePreferredInputResult (upval), ResponsiveModule (upval), UseRefResult3 (upval), MouseIconOverrideService (upval), FFlagSideSheetFocusNav (upval), UseRefResult (upval), FFlagShowSwitchServerButton (upval), IsPioneerLaunchFunction (upval), GetSwitchServerStoreFunction (upval), UseRefResult4 (upval), SwitchServerTelemetry (upval)
			local SideSheetVisibilityModule = GetSideSheetVisibilityModule(p2)
			
			if not FFlagSideSheetOpenPeoplePageRestoreChat and p1.ChatSelector then
				if SideSheetVisibilityModule then
					UseRefResult1.current = p1.ChatSelector:GetVisibility()
					p1.ChatSelector:SetVisible(false)
				elseif UseRefResult1.current then
					p1.ChatSelector:SetVisible(true)
					UseRefResult1.current = false
				end
			end
			if UsePreferredInputResult == ResponsiveModule.Input.Pointer then
				if SideSheetVisibilityModule and not UseRefResult3.current then
					MouseIconOverrideService.push("InExperienceSideSheet", Enum.OverrideMouseIconBehavior.ForceShow)
					UseRefResult3.current = true
				elseif not SideSheetVisibilityModule and UseRefResult3.current then
					MouseIconOverrideService.pop("InExperienceSideSheet")
					UseRefResult3.current = false
				end
			end
			if FFlagSideSheetFocusNav then
				if SideSheetVisibilityModule then
					UseRefResult.current = false
				else
					UseRefResult.current = nil
				end
			end
			if SideSheetVisibilityModule and (FFlagShowSwitchServerButton or IsPioneerLaunchFunction()) and (GetSwitchServerStoreFunction(p2).shouldEnableSwitchServer(p2) and not UseRefResult4.current) then
				UseRefResult4.current = true
				SwitchServerTelemetry.sendSwitchServerButtonActions({ event_type = "impression" })
			end
		end)
		local VisibilityStateChangedConnection = if p1.ChatSelector then p1.ChatSelector.VisibilityStateChanged:connect(function(p2)
			-- upvalues: GetSideSheetVisibilityModule (upval), UseRefResult1 (upval)
			if GetSideSheetVisibilityModule() and p2 then
				UseRefResult1.current = false
			end
		end) else nil
		
		return function()
			-- upvalues: Effect (copy), VisibilityStateChangedConnection (ref)
			Effect()
			
			if VisibilityStateChangedConnection ~= nil then
				VisibilityStateChangedConnection:disconnect()
			end
		end
	end, { p1.ChatSelector, UsePreferredInputResult })
	
	if FFlagSideSheetFocusNav then
		ReactModule.useEffect(function()
			-- upvalues: ContextActionService (upval), UseRefResult (ref), list (upval), GetSideSheetVisibilityModule (upval), FFlagSideSheetOpenPeoplePage (upval), ToggleSideSheetModule (upval)
			ContextActionService:BindCoreAction("SideSheetBlockInputAction", function(_, UserInputState, _)
				-- upvalues: UseRefResult (upval)
				return if UserInputState == Enum.UserInputState.Begin then if UseRefResult.current == nil then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
			end, false, unpack(list))
			ContextActionService:BindCoreAction("SideSheetSinkR2Action", function(_, _, _)
				-- upvalues: GetSideSheetVisibilityModule (upval)
				return if GetSideSheetVisibilityModule() then Enum.ContextActionResult.Sink else Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonR2)
			ContextActionService:BindCoreAction("SideSheetCloseAction", function(_, UserInputState, _)
				-- upvalues: FFlagSideSheetOpenPeoplePage (upval), GetSideSheetVisibilityModule (upval), ToggleSideSheetModule (upval)
				if FFlagSideSheetOpenPeoplePage and UserInputState ~= Enum.UserInputState.Begin then
					return Enum.ContextActionResult.Pass
				elseif GetSideSheetVisibilityModule() then
					ToggleSideSheetModule(false)
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonStart)
			
			return function()
				-- upvalues: ContextActionService (upval)
				ContextActionService:UnbindCoreAction("SideSheetBlockInputAction")
				ContextActionService:UnbindCoreAction("SideSheetSinkR2Action")
				ContextActionService:UnbindCoreAction("SideSheetCloseAction")
			end
		end, {})
	end
	local UseSideSheetFocusNavScrollViewAnimationModuleResult = if FFlagSideSheetFocusNav and FFlagUseAnimateScrollViewToSelectionHelper then UseSideSheetFocusNavScrollViewAnimationModule() else nil
	local Left = UseSignalStateResult.left
	
	if FFlagSideSheetOpenPeoplePage then
		ReactModule.useEffect(function()
			-- upvalues: GetSideSheetConfigStoreModule (upval), UseScaledValueResult (copy)
			GetSideSheetConfigStoreModule(false).setSideSheetDrawerWidth(UseScaledValueResult)
		end, { UseScaledValueResult })
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult1 (copy), ClosePeoplePageOpenedWithSideSheetModule (upval)
			return if UseSignalStateResult1 then function()
				-- upvalues: ClosePeoplePageOpenedWithSideSheetModule (upval)
				ClosePeoplePageOpenedWithSideSheetModule()
			end else nil
		end, { UseSignalStateResult1 })
	end
	if not NoFFlagMountUnmountSideSheet then
		return nil
	end
	local Element = ReactModule.createElement(View, { tag = "col size-full" }, {
		ScrollableContent = ReactModule.createElement(ScrollView, {
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
			selection = if FFlagSideSheetFocusNav then { Selectable = false } else nil,
			scrollingFrameRef = if FFlagSideSheetFocusNav and FFlagUseAnimateScrollViewToSelectionHelper then UseSideSheetFocusNavScrollViewAnimationModuleResult else nil
		}, {
			HeaderRow = if IsPioneerLaunchFunction() then ReactModule.createElement(UserProfileRowModule, { layoutOrder = config.ExperienceDetails }) else ReactModule.createElement(ExperienceDetailsRowModule, { layoutOrder = config.ExperienceDetails }),
			HeaderDivider = if v1 then nil else ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = config.HeaderDivider
			}, { Divider = ReactModule.createElement(Divider) }),
			TopWidgets = if FFlagEnableSideSheetWidgets then ReactModule.createElement(SideSheetWidgetListModule, {
				integrationsGetter = getScrollableContentTopWidgetIntegrations,
				layoutOrder = config.TopWidgets,
				placement = ChromeModule.Enums.SideSheetPlacement.ScrollableContentTop,
				firstIntegrationToFocusCallback = if FFlagSideSheetFocusNav and v1 then UseResult1 else nil
			}) else nil,
			AboveFoldList = ReactModule.createElement(VerticalListModule, {
				layoutOrder = config.PrimaryList,
				integrationsGetter = getAboveFoldIntegrations,
				firstIntegrationToFocusCallback = if FFlagSideSheetFocusNav and not v1 then UseResult1 else nil,
				allowRightFocusEscape = UseSignalStateResult2_1
			}),
			FoldDivider = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-y-xxlarge",
				LayoutOrder = config.ListDivider
			}, { Divider = ReactModule.createElement(Divider) }),
			BelowFoldList = ReactModule.createElement(VerticalListModule, {
				layoutOrder = config.SecondaryList,
				integrationsGetter = getBelowFoldIntegrations,
				allowRightFocusEscape = UseSignalStateResult2_1
			}),
			BottomWidgets = if FFlagEnableSideSheetWidgets then ReactModule.createElement(SideSheetWidgetListModule, {
				integrationsGetter = getScrollableContentBottomWidgetIntegrations,
				layoutOrder = config.BottomWidgets,
				placement = ChromeModule.Enums.SideSheetPlacement.ScrollableContentBottom
			}) else nil
		}),
		Footer = ReactModule.createElement(FooterModule, { layoutOrder = 2 })
	})
	
	if FFlagEnableWhatsNew then
		Element = ReactModule.createElement(WhatsNewAnchor, { anchorId = "sideSheet", tag = "size-full" }, { SideSheetPanel = Element })
	end
	return ReactModule.createElement(DrawerContainer, {
		displayOrder = 12,
		menuWidth = UseScaledValueResult,
		leftOffset = Left,
		topOffset = UseSignalStateResult.top,
		bottomOffset = UseSignalStateResult.bottom,
		backgroundStyle = UseBackgroundStyleModuleResult,
		onDrawerClosedAnalytics = UseResult,
		allowOutsideInteraction = if FFlagSideSheetOpenPeoplePage then UseSignalStateResult2_1 else nil,
		scrimIsModal = not FFlagSideSheetOpenPeoplePage or not UseSignalStateResult2_1
	}, {
		FoundationStyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetResult }),
		if FFlagSideSheetFocusNav then ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			frameProps = if UseSignalStateResult2_1 then { SelectionBehaviorRight = Enum.SelectionBehavior.Escape } else nil
		}, { Content = Element }) else Element
	})
end

return {
	createSideSheet = function(p2, p3, p4)
		-- upvalues: Root (ref), CoreGui (copy), WrapWithProvidersModule (copy), ReactModule (copy), SideSheetContent (copy), ReactRobloxModule (copy)
		if not Root then
			local InExperienceSideSheet = Instance.new("Folder")
			InExperienceSideSheet.Name = "InExperienceSideSheet"
			InExperienceSideSheet.Parent = CoreGui
			local WrapWithProvidersModuleResult = WrapWithProvidersModule({
				SideSheetContent = ReactModule.createElement(SideSheetContent, p3)
			}, p2, p4)
			Root = ReactRobloxModule.createRoot(InExperienceSideSheet)
			Root:render(WrapWithProvidersModuleResult)
		end
		return Root
	end
}
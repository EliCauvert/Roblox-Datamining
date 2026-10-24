local RunService = game:GetService("RunService")
local FocusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local UserInputService = game:GetService("UserInputService")
local SessionService = game:GetService("SessionService")
local Parent = FocusNavigationUtils.Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local MessageBus = require(Parent.MessageBus).MessageBus
local NavigationModule = require(Parent.Navigation)
local ResponsiveModule = require(Parent.Responsive)
local SessionType = require(Parent.Sessionization).SessionType
local UseLastInputMethodModule = require(FocusNavigationUtils.useLastInputMethod)
local UseLastInputModeModule = require(FocusNavigationUtils.useLastInputMode)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local UseFocusedGuiObjectFunction = ReactFocusNavigationModule.useFocusedGuiObject
local UseRegistryEntryFunction = require(FocusNavigationUtils.FocusNavigableSurfaceRegistry).useRegistryEntry
local UseRegistryEntriesFunction = require(FocusNavigationUtils.FocusNavigableSurfaceRegistry).useRegistryEntries
local FocusNavigableSurfaceIdentifierEnumModule = require(FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
local UseAutoFocusModule = require(FocusNavigationUtils.useAutoFocus)
local UseDescendantHasFocusModule = require(FocusNavigationUtils.useDescendantHasFocus)
local UseAnyDescendantHasFocusModule = require(FocusNavigationUtils.useAnyDescendantHasFocus)
local GlobalFocusTelemetryModule = require(FocusNavigationUtils.GlobalFocusTelemetry)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local AutoFocusFailsafeThreshold = game:DefineFastInt("AutoFocusFailsafeThreshold", 5)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagLuaAppResponsiveEnginePreferredInput = SharedFlagsModule.FFlagLuaAppResponsiveEnginePreferredInput
local FFlagLuaAppsDefaultSelection = SharedFlagsModule.FFlagLuaAppsDefaultSelection
local FFlagEnableDrawerFocusNav = SharedFlagsModule.FFlagEnableDrawerFocusNav
local FFlagSearchAllRegistryEntriesForAutoFocus = SharedFlagsModule.FFlagSearchAllRegistryEntriesForAutoFocus
local FFlagFixGlobalFocusPriorityModule = require(script.Parent.FFlagFixGlobalFocusPriority)
local FFlagGamepadDisconnectAutoFocusSuppressionModule = require(script.Parent.Flags.FFlagGamepadDisconnectAutoFocusSuppression)
local config = {
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.MouseButton2] = true,
	[Enum.UserInputType.MouseButton3] = true,
	[Enum.UserInputType.Touch] = true
}
local NewResult = MessageBus.Subscriber.new()

local function gameLeaveMessageValidator(p1): boolean
	return typeof(p1) == "table"
end

local function _(p1)
	-- upvalues: RunService (copy), AutoFocusFailsafeThreshold (copy)
	local v1 = false
	local v2 = 0
	
	return (RunService.Heartbeat:Connect(function(DeltaTime: number)
		-- upvalues: v2 (ref), AutoFocusFailsafeThreshold (upval), v1 (ref), p1 (copy)
		v2 += DeltaTime
		
		if AutoFocusFailsafeThreshold < v2 and not v1 then
			p1()
			v1 = true
			v2 = 0
		end
	end))
end

local function createGameLeaveSubscription(Callback)
	-- upvalues: MessageBus (copy), NewResult (copy), gameLeaveMessageValidator (copy), AutoFocusFailsafeThreshold (copy)
	local GameMessageId = MessageBus.getMessageId("Game", "onGameLeave")
	local DelayedThread = nil
	NewResult:subscribe({
		mid = GameMessageId,
		validateParams = gameLeaveMessageValidator
	}, function(_)
		-- upvalues: DelayedThread (ref), AutoFocusFailsafeThreshold (upval), Callback (copy)
		DelayedThread = task.delay(AutoFocusFailsafeThreshold, function()
			-- upvalues: Callback (upval)
			Callback()
		end)
	end)
	
	return {
		unsubscribe = function()
			-- upvalues: NewResult (upval), GameMessageId (copy), DelayedThread (ref)
			NewResult:unsubscribeWithMsgId(GameMessageId)
			
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	}
end

return function(p1)
	-- upvalues: UseLastInputMethodModule (copy), UseFocusGuiObjectFunction (copy), UseFocusedGuiObjectFunction (copy), ReactModule (copy), UseLastInputModeModule (copy), FFlagLuaAppResponsiveEnginePreferredInput (copy), ResponsiveModule (copy), SessionService (copy), SessionType (copy), GlobalFocusTelemetryModule (copy), UserInputService (copy), config (copy), NavigationModule (copy), UseRegistryEntryFunction (copy), FocusNavigableSurfaceIdentifierEnumModule (copy), FFlagAppIaHomeSubTab (copy), FFlagEnableDrawerFocusNav (copy), UseSelectorFunction (copy), FFlagGamepadDisconnectAutoFocusSuppressionModule (copy), CentralOverlayType (copy), UseAutoFocusModule (copy), UseDescendantHasFocusModule (copy), FFlagSearchAllRegistryEntriesForAutoFocus (copy), UseRegistryEntriesFunction (copy), UseAnyDescendantHasFocusModule (copy), FFlagLuaAppsDefaultSelection (copy), FFlagFixGlobalFocusPriorityModule (copy), RunService (copy), AutoFocusFailsafeThreshold (copy), createGameLeaveSubscription (copy)
	local UseLastInputMethodModuleResult = UseLastInputMethodModule()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseFocusedGuiObjectResult = UseFocusedGuiObjectFunction()
	local UseRefResult = ReactModule.useRef(UseFocusedGuiObjectResult)
	local UseRefResult1 = ReactModule.useRef(false)
	local IsFocus = UseLastInputModeModule() == "Focus"
	local UsePreferredInputResult = if FFlagLuaAppResponsiveEnginePreferredInput then ResponsiveModule.usePreferredInput() else nil
	ReactModule.useEffect(function()
		-- upvalues: UseFocusedGuiObjectResult (copy), UseRefResult (copy), SessionService (upval), SessionType (upval), UseLastInputMethodModuleResult (copy), UseRefResult1 (copy), GlobalFocusTelemetryModule (upval)
		if UseFocusedGuiObjectResult ~= nil and UseRefResult.current == nil then
			SessionService:SetSession(SessionType.StructuralIdentifier.Level1, SessionType.StructuralIdentifier.FocusNavigation, UseLastInputMethodModuleResult)
			UseRefResult.current = UseFocusedGuiObjectResult
		end
		if UseFocusedGuiObjectResult ~= nil and UseRefResult1.current then
			GlobalFocusTelemetryModule.sendAutoFocusRecoveryCounter()
			UseRefResult1.current = false
		end
	end, { UseFocusedGuiObjectResult })
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), FFlagLuaAppResponsiveEnginePreferredInput (upval), UsePreferredInputResult (copy), ResponsiveModule (upval), config (upval), UseRefResult (copy), SessionService (upval), SessionType (upval), UseFocusGuiObjectResult (copy)
		local LastInputTypeChangedConnection = UserInputService.LastInputTypeChanged:Connect(function(LastInputType)
			-- upvalues: FFlagLuaAppResponsiveEnginePreferredInput (upval), UsePreferredInputResult (upval), ResponsiveModule (upval), config (upval), UseRefResult (upval), SessionService (upval), SessionType (upval), UseFocusGuiObjectResult (upval)
			if if FFlagLuaAppResponsiveEnginePreferredInput then UsePreferredInputResult ~= ResponsiveModule.Input.Directional and config[LastInputType] else config[LastInputType] then
				if UseRefResult.current == nil then
					UseFocusGuiObjectResult(nil)
				else
					SessionService:RemoveSession(SessionType.StructuralIdentifier.FocusNavigation)
					UseRefResult.current = nil
					UseFocusGuiObjectResult(nil)
					
					return
				end
			end
		end)
		
		return function()
			-- upvalues: LastInputTypeChangedConnection (copy)
			LastInputTypeChangedConnection:Disconnect()
		end
	end, if FFlagLuaAppResponsiveEnginePreferredInput then { UseFocusGuiObjectResult, UsePreferredInputResult } else { UseFocusGuiObjectResult })
	local UseNavigationResult = NavigationModule.useNavigation()
	local State = if UseNavigationResult then UseNavigationResult.state else nil
	local Index = if State then State.index else nil
	local UseRefResult2 = ReactModule.useRef(Index)
	ReactModule.useEffect(function()
		-- upvalues: IsFocus (copy), UseRefResult2 (copy), Index (copy), UseFocusGuiObjectResult (copy)
		if IsFocus and UseRefResult2.current ~= nil and Index ~= nil and UseRefResult2.current < Index then
			UseRefResult2.current = Index
			UseFocusGuiObjectResult(nil)
		end
	end, { Index, IsFocus })
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	local CurrentRouteState = NavigationModule.getCurrentRouteState(UseNavigationResult)
	local RouteName = if CurrentRouteState then CurrentRouteState.routeName else nil
	ReactModule.useEffect(function()
		-- upvalues: RouteName (copy), UseRefResult3 (copy), UseRefResult4 (copy)
		if RouteName ~= UseRefResult3.current then
			UseRefResult4.current = UseRefResult3.current
			UseRefResult3.current = RouteName
		end
	end, { RouteName })
	local UseRegistryEntryResult = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.NavBar)
	local UseRegistryEntryResult1 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.RouterView)
	local UseRegistryEntryResult2 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.CentralOverlay)
	local UseRegistryEntryResult3 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.ModerationOverlay)
	local UseRegistryEntryResult4 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.PopUp)
	local UseRegistryEntryResult5 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.ContextualMenu)
	local UseRegistryEntryResult6 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local UseRegistryEntryResult7 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.PeekView)
	local UseRegistryEntryResult8 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.SubRouterView)
	local UseRegistryEntryResult9 = UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.Auxiliary)
	local UseRegistryEntryResult10 = if FFlagAppIaHomeSubTab then UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.HeaderView) else nil
	local UseRegistryEntryResult11 = if FFlagEnableDrawerFocusNav then UseRegistryEntryFunction(FocusNavigableSurfaceIdentifierEnumModule.Drawer) else nil
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.CentralOverlay.OverlayType
	end)
	local NoUseRegistryEntryResult: boolean = if FFlagGamepadDisconnectAutoFocusSuppressionModule then UseSelectorResult == CentralOverlayType.GamepadDisconnected and UseRegistryEntryResult3 == nil else false
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseRegistryEntryResult3 (copy), UseRegistryEntryResult2 (copy), UseRegistryEntryResult5 (copy), UseRegistryEntryResult4 (copy), UseRegistryEntryResult7 (copy), FFlagEnableDrawerFocusNav (upval), UseRegistryEntryResult11 (copy), UseRegistryEntryResult1 (copy), UseRegistryEntryResult8 (copy), UseRegistryEntryResult (copy), UseRegistryEntryResult6 (copy), UseRegistryEntryResult9 (copy), FFlagAppIaHomeSubTab (upval), UseRegistryEntryResult10 (copy)
		local List = {}
		
		if UseRegistryEntryResult3 then
			table.insert(List, UseRegistryEntryResult3)
			
			return List
		end
		if UseRegistryEntryResult2 then
			table.insert(List, UseRegistryEntryResult2)
			
			return List
		end
		if UseRegistryEntryResult5 then
			table.insert(List, UseRegistryEntryResult5)
			
			return List
		end
		if UseRegistryEntryResult4 then
			table.insert(List, UseRegistryEntryResult4)
			
			return List
		end
		if UseRegistryEntryResult7 then
			table.insert(List, UseRegistryEntryResult7)
			
			return List
		end
		if FFlagEnableDrawerFocusNav and UseRegistryEntryResult11 then
			table.insert(List, UseRegistryEntryResult11)
			
			return List
		end
		if UseRegistryEntryResult1 then
			table.insert(List, UseRegistryEntryResult1)
		end
		if UseRegistryEntryResult8 then
			table.insert(List, UseRegistryEntryResult8)
		end
		if UseRegistryEntryResult then
			table.insert(List, UseRegistryEntryResult)
		end
		if UseRegistryEntryResult6 then
			table.insert(List, UseRegistryEntryResult6)
		end
		if UseRegistryEntryResult9 then
			table.insert(List, UseRegistryEntryResult9)
		end
		if FFlagAppIaHomeSubTab and UseRegistryEntryResult10 then
			table.insert(List, UseRegistryEntryResult10)
		end
		return List
	end, {
		UseRegistryEntryResult3, UseRegistryEntryResult1, UseRegistryEntryResult,
		UseRegistryEntryResult2, UseRegistryEntryResult5, UseRegistryEntryResult4,
		UseRegistryEntryResult7, UseRegistryEntryResult8, UseRegistryEntryResult9,
		if FFlagAppIaHomeSubTab then UseRegistryEntryResult10 else nil,
		if FFlagEnableDrawerFocusNav then UseRegistryEntryResult6 else nil,
		if FFlagEnableDrawerFocusNav then UseRegistryEntryResult11 else nil
	})
	local UseAutoFocusModuleResult = UseAutoFocusModule(UseMemoResult, 0.1)
	local UseDescendantHasFocusModuleResult = UseDescendantHasFocusModule(UseRegistryEntryResult)
	local UseDescendantHasFocusModuleResult1 = UseDescendantHasFocusModule(UseRegistryEntryResult1)
	local UseAnyDescendantHasFocusModuleResult = if FFlagSearchAllRegistryEntriesForAutoFocus then UseAnyDescendantHasFocusModule((UseRegistryEntriesFunction(FocusNavigableSurfaceIdentifierEnumModule.RouterView))) else nil
	local UseDescendantHasFocusModuleResult2 = UseDescendantHasFocusModule(UseRegistryEntryResult2)
	local UseDescendantHasFocusModuleResult3 = UseDescendantHasFocusModule(UseRegistryEntryResult3)
	local UseDescendantHasFocusModuleResult4 = UseDescendantHasFocusModule(UseRegistryEntryResult5)
	local UseDescendantHasFocusModuleResult5 = UseDescendantHasFocusModule(UseRegistryEntryResult4)
	local UseDescendantHasFocusModuleResult6 = UseDescendantHasFocusModule(UseRegistryEntryResult6)
	local UseDescendantHasFocusModuleResult7 = UseDescendantHasFocusModule(UseRegistryEntryResult8)
	local UseDescendantHasFocusModuleResult8 = UseDescendantHasFocusModule(UseRegistryEntryResult9)
	local UseDescendantHasFocusModuleResult9 = UseDescendantHasFocusModule(UseRegistryEntryResult7)
	local UseDescendantHasFocusModuleResult10 = if FFlagAppIaHomeSubTab then UseDescendantHasFocusModule(UseRegistryEntryResult10) else false
	local UseDescendantHasFocusModuleResult11 = if FFlagEnableDrawerFocusNav then UseDescendantHasFocusModule(UseRegistryEntryResult11) else false
	local UseDescendantHasFocusModuleResult12 = if UseRegistryEntryResult3 then UseDescendantHasFocusModuleResult3 elseif UseRegistryEntryResult2 then UseDescendantHasFocusModuleResult2 elseif UseRegistryEntryResult5 then UseDescendantHasFocusModuleResult4 elseif UseRegistryEntryResult4 then UseDescendantHasFocusModuleResult5 elseif UseRegistryEntryResult7 then UseDescendantHasFocusModuleResult9 elseif FFlagEnableDrawerFocusNav and UseRegistryEntryResult11 then UseDescendantHasFocusModuleResult11 else UseDescendantHasFocusModuleResult or ((if FFlagSearchAllRegistryEntriesForAutoFocus then UseAnyDescendantHasFocusModuleResult else UseDescendantHasFocusModuleResult1) or (UseDescendantHasFocusModuleResult6 or (UseDescendantHasFocusModuleResult7 or (UseDescendantHasFocusModuleResult8 or FFlagAppIaHomeSubTab and UseDescendantHasFocusModuleResult10))))
	local UseRefResult5 = nil
	
	if FFlagLuaAppsDefaultSelection then
		UseRefResult5 = ReactModule.useRef(UseMemoResult)
		local NoFFlagFixGlobalFocusPriorityModule: boolean = if UseRegistryEntryResult3 and not UseDescendantHasFocusModuleResult3 then not FFlagFixGlobalFocusPriorityModule or (if UseRegistryEntryResult3 then not UseDescendantHasFocusModuleResult3 elseif UseRegistryEntryResult2 then not UseDescendantHasFocusModuleResult2 elseif UseRegistryEntryResult5 then not UseDescendantHasFocusModuleResult4 elseif UseRegistryEntryResult4 then not UseDescendantHasFocusModuleResult5 elseif UseRegistryEntryResult7 then not UseDescendantHasFocusModuleResult9 elseif FFlagEnableDrawerFocusNav and UseRegistryEntryResult11 then not UseDescendantHasFocusModuleResult11 elseif UseRegistryEntryResult1 then not UseDescendantHasFocusModuleResult1 elseif UseRegistryEntryResult8 then not UseDescendantHasFocusModuleResult7 elseif UseRegistryEntryResult then not UseDescendantHasFocusModuleResult elseif UseRegistryEntryResult6 then not UseDescendantHasFocusModuleResult6 elseif UseRegistryEntryResult9 then not UseDescendantHasFocusModuleResult8 elseif FFlagAppIaHomeSubTab and UseRegistryEntryResult10 then not UseDescendantHasFocusModuleResult10 else false) elseif FFlagFixGlobalFocusPriorityModule then if UseRegistryEntryResult3 then not UseDescendantHasFocusModuleResult3 elseif UseRegistryEntryResult2 then not UseDescendantHasFocusModuleResult2 elseif UseRegistryEntryResult5 then not UseDescendantHasFocusModuleResult4 elseif UseRegistryEntryResult4 then not UseDescendantHasFocusModuleResult5 elseif UseRegistryEntryResult7 then not UseDescendantHasFocusModuleResult9 elseif FFlagEnableDrawerFocusNav and UseRegistryEntryResult11 then not UseDescendantHasFocusModuleResult11 elseif UseRegistryEntryResult1 then not UseDescendantHasFocusModuleResult1 elseif UseRegistryEntryResult8 then not UseDescendantHasFocusModuleResult7 elseif UseRegistryEntryResult then not UseDescendantHasFocusModuleResult elseif UseRegistryEntryResult6 then not UseDescendantHasFocusModuleResult6 elseif UseRegistryEntryResult9 then not UseDescendantHasFocusModuleResult8 elseif FFlagAppIaHomeSubTab and UseRegistryEntryResult10 then not UseDescendantHasFocusModuleResult10 else false else UseRegistryEntryResult2 and not UseDescendantHasFocusModuleResult2 or (UseRegistryEntryResult5 and not UseDescendantHasFocusModuleResult4 or (UseRegistryEntryResult4 and not UseDescendantHasFocusModuleResult5 or (UseRegistryEntryResult7 and not UseDescendantHasFocusModuleResult9 or (FFlagEnableDrawerFocusNav and UseRegistryEntryResult11 and not UseDescendantHasFocusModuleResult11 or (UseRegistryEntryResult1 and not UseDescendantHasFocusModuleResult1 or (UseRegistryEntryResult8 and not UseDescendantHasFocusModuleResult7 or (UseRegistryEntryResult and not UseDescendantHasFocusModuleResult or (UseRegistryEntryResult6 and not UseDescendantHasFocusModuleResult6 or (UseRegistryEntryResult9 and not UseDescendantHasFocusModuleResult8 or (FFlagAppIaHomeSubTab and UseRegistryEntryResult10 and not UseDescendantHasFocusModuleResult10 or false))))))))))
		ReactModule.useEffect(function()
			-- upvalues: UsePreferredInputResult (copy), ResponsiveModule (upval), UseRefResult5 (ref), UseMemoResult (copy), p1 (copy), NoFFlagFixGlobalFocusPriorityModule (ref), UseFocusGuiObjectResult (copy)
			if UsePreferredInputResult == ResponsiveModule.Input.Directional and UseRefResult5.current ~= UseMemoResult and not p1 and NoFFlagFixGlobalFocusPriorityModule then
				UseFocusGuiObjectResult(nil)
			end
			UseRefResult5.current = UseMemoResult
		end, {
			UseMemoResult,
			UsePreferredInputResult,
			p1,
			NoFFlagFixGlobalFocusPriorityModule,
			UseFocusGuiObjectResult
		})
	end
	local NoNoUseRegistryEntryResult: boolean = if FFlagLuaAppResponsiveEnginePreferredInput then (UsePreferredInputResult == ResponsiveModule.Input.Directional or IsFocus) and (not UseDescendantHasFocusModuleResult12 and (not p1 and not NoUseRegistryEntryResult)) else IsFocus and (not UseDescendantHasFocusModuleResult12 and (not p1 and not NoUseRegistryEntryResult))
	ReactModule.useEffect(function()
		-- upvalues: UseAutoFocusModuleResult (copy), NoNoUseRegistryEntryResult (copy), GlobalFocusTelemetryModule (upval), UseMemoResult (copy), UseFocusedGuiObjectResult (copy), UseRefResult5 (ref), UseRegistryEntryResult3 (copy), UseRegistryEntryResult2 (copy), UseRegistryEntryResult5 (copy), UseRegistryEntryResult4 (copy), UseRegistryEntryResult7 (copy), UseRegistryEntryResult1 (copy), UseRegistryEntryResult8 (copy), UseRegistryEntryResult (copy), UseRegistryEntryResult6 (copy), UseRegistryEntryResult9 (copy), UseRegistryEntryResult10 (copy), UseRefResult4 (copy), UseRefResult3 (copy), UseSelectorResult (copy), UseRefResult1 (copy), RunService (upval), AutoFocusFailsafeThreshold (upval), createGameLeaveSubscription (upval)
		local v1 = nil
		local Connection = nil
		
		local function setAutoFocusing()
			-- upvalues: v1 (ref), UseAutoFocusModuleResult (upval)
			if v1 then
				v1.cancel()
			end
			v1 = UseAutoFocusModuleResult()
		end
		
		if NoNoUseRegistryEntryResult then
			if v1 then
				v1.cancel()
			end
			v1 = UseAutoFocusModuleResult()
			
			local function v91()
				-- upvalues: GlobalFocusTelemetryModule (upval), UseMemoResult (upval), UseFocusedGuiObjectResult (upval), UseRefResult5 (upval), UseRegistryEntryResult3 (upval), UseRegistryEntryResult2 (upval), UseRegistryEntryResult5 (upval), UseRegistryEntryResult4 (upval), UseRegistryEntryResult7 (upval), UseRegistryEntryResult1 (upval), UseRegistryEntryResult8 (upval), UseRegistryEntryResult (upval), UseRegistryEntryResult6 (upval), UseRegistryEntryResult9 (upval), UseRegistryEntryResult10 (upval), UseRefResult4 (upval), UseRefResult3 (upval), UseSelectorResult (upval), UseRefResult1 (upval), v1 (ref), UseAutoFocusModuleResult (upval)
				GlobalFocusTelemetryModule.sendAutoFocusFailureCounter(UseMemoResult)
				GlobalFocusTelemetryModule.sendAutoFocusFailureEvent(UseFocusedGuiObjectResult, if UseRefResult5 then UseRefResult5.current else {}, UseMemoResult, {
					moderationOverlay = UseRegistryEntryResult3,
					centralOverlay = UseRegistryEntryResult2,
					contextualMenu = UseRegistryEntryResult5,
					popUp = UseRegistryEntryResult4,
					peekView = UseRegistryEntryResult7,
					routerView = UseRegistryEntryResult1,
					subRouterView = UseRegistryEntryResult8,
					globalNavBar = UseRegistryEntryResult,
					searchBar = UseRegistryEntryResult6,
					auxiliaryView = UseRegistryEntryResult9,
					headerView = UseRegistryEntryResult10
				}, UseRefResult4.current, UseRefResult3.current, UseSelectorResult)
				UseRefResult1.current = true
				
				if v1 then
					v1.cancel()
				end
				v1 = UseAutoFocusModuleResult()
			end
			
			local v2 = false
			local v3 = 0
			Connection = RunService.Heartbeat:Connect(function(DeltaTime: number)
				-- upvalues: v3 (ref), AutoFocusFailsafeThreshold (upval), v2 (ref), v91 (copy)
				v3 += DeltaTime
				
				if AutoFocusFailsafeThreshold < v3 and not v2 then
					v91()
					v2 = true
					v3 = 0
				end
			end)
		end
		local GameLeaveSubscription = if NoNoUseRegistryEntryResult then createGameLeaveSubscription(setAutoFocusing) else nil
		
		return function()
			-- upvalues: v1 (ref), GameLeaveSubscription (ref), Connection (ref)
			if v1 then
				v1.cancel()
			end
			if GameLeaveSubscription then
				GameLeaveSubscription.unsubscribe()
			end
			if Connection then
				Connection:Disconnect()
			end
		end
	end, {
		NoNoUseRegistryEntryResult,
		UseAutoFocusModuleResult,
		UseMemoResult,
		if FFlagLuaAppsDefaultSelection then UseFocusedGuiObjectResult else nil
	})
end
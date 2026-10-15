local runService = game:GetService("RunService")
local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local userInputService = game:GetService("UserInputService")
local sessionService = game:GetService("SessionService")
local parent = focusNavigationUtils.Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local messageBus = require(parent.MessageBus).MessageBus
local navigationModule = require(parent.Navigation)
local responsiveModule = require(parent.Responsive)
local sessionType = require(parent.Sessionization).SessionType
local useLastInputMethodModule = require(focusNavigationUtils.useLastInputMethod)
local useLastInputModeModule = require(focusNavigationUtils.useLastInputMode)
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local useFocusedGuiObject = reactFocusNavigationModule.useFocusedGuiObject
local useRegistryEntry = require(focusNavigationUtils.FocusNavigableSurfaceRegistry).useRegistryEntry
local useRegistryEntries = require(focusNavigationUtils.FocusNavigableSurfaceRegistry).useRegistryEntries
local focusNavigableSurfaceIdentifierEnumModule = require(focusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
local useAutoFocusModule = require(focusNavigationUtils.useAutoFocus)
local useDescendantHasFocusModule = require(focusNavigationUtils.useDescendantHasFocus)
local useAnyDescendantHasFocusModule = require(focusNavigationUtils.useAnyDescendantHasFocus)
local globalFocusTelemetryModule = require(focusNavigationUtils.GlobalFocusTelemetry)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local autoFocusFailsafeThreshold = game:DefineFastInt("AutoFocusFailsafeThreshold", 5)
local fFlagEnablePeekViewFocusNav = require(parent.SharedFlags).FFlagEnablePeekViewFocusNav
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAppIaHomeSubTab = sharedFlagsModule.FFlagAppIaHomeSubTab
local fFlagLuaAppResponsiveEnginePreferredInput = sharedFlagsModule.FFlagLuaAppResponsiveEnginePreferredInput
local fFlagLuaAppsDefaultSelection = sharedFlagsModule.FFlagLuaAppsDefaultSelection
local fFlagEnableDrawerFocusNav = sharedFlagsModule.FFlagEnableDrawerFocusNav
local fFlagSearchAllRegistryEntriesForAutoFocus = sharedFlagsModule.FFlagSearchAllRegistryEntriesForAutoFocus
local fFlagFixGlobalFocusPriorityModule = require(script.Parent.FFlagFixGlobalFocusPriority)
local t = {
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.MouseButton2] = true,
	[Enum.UserInputType.MouseButton3] = true,
	[Enum.UserInputType.Touch] = true
}
local var1 = messageBus.Subscriber.new()

local function gameLeaveMessageValidator(p1)
	return typeof(p1) == "table"
end

local function _(p1)
	-- upvalues: runService (ref), autoFocusFailsafeThreshold (ref)
	local var2 = false
	local var3 = 0
	
	return runService.Heartbeat:Connect(function(p2)
		-- upvalues: var3 (write), autoFocusFailsafeThreshold (copy), var2 (write), p1 (ref)
		var3 += p2
		
		if autoFocusFailsafeThreshold < var3 and not var2 then
			p1()
			var2 = true
			var3 = 0
		end
	end)
end

local function createGameLeaveSubscription(p1)
	-- upvalues: messageBus (ref), var1 (ref), gameLeaveMessageValidator (ref), autoFocusFailsafeThreshold (ref)
	local game = messageBus.getMessageId("Game", "onGameLeave")
	local var2 = nil
	var1:subscribe({ mid = game, validateParams = gameLeaveMessageValidator }, function(_)
		-- upvalues: var2 (write), autoFocusFailsafeThreshold (copy), p1 (ref)
		var2 = task.delay(autoFocusFailsafeThreshold, function()
			-- upvalues: p1 (copy)
			p1()
		end)
	end)
	
	return {
		unsubscribe = function()
			-- upvalues: var1 (copy), game (ref), var2 (write)
			var1:unsubscribeWithMsgId(game)
			
			if var2 then
				task.cancel(var2)
			end
		end
	}
end

return function(p1)
	-- upvalues: useLastInputMethodModule (ref), useFocusGuiObject (ref), useFocusedGuiObject (ref), reactModule (ref), useLastInputModeModule (ref), fFlagLuaAppResponsiveEnginePreferredInput (ref), responsiveModule (ref), sessionService (ref), sessionType (ref), globalFocusTelemetryModule (ref), userInputService (ref), t (ref), navigationModule (ref), useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnumModule (ref), fFlagEnablePeekViewFocusNav (ref), fFlagAppIaHomeSubTab (ref), fFlagEnableDrawerFocusNav (ref), useAutoFocusModule (ref), useDescendantHasFocusModule (ref), fFlagSearchAllRegistryEntriesForAutoFocus (ref), useRegistryEntries (ref), useAnyDescendantHasFocusModule (ref), fFlagLuaAppsDefaultSelection (ref), fFlagFixGlobalFocusPriorityModule (ref), useSelector (ref), runService (ref), autoFocusFailsafeThreshold (ref), createGameLeaveSubscription (ref)
	local var2
	local var3 = useLastInputMethodModule()
	local var4 = useFocusGuiObject()
	local var5 = useFocusedGuiObject()
	local var6 = reactModule.useRef(var5)
	local var7 = reactModule.useRef(false)
	local isFocus = useLastInputModeModule() == "Focus"
	local var8 = if fFlagLuaAppResponsiveEnginePreferredInput then responsiveModule.usePreferredInput() else nil
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var6 (ref), sessionService (copy), sessionType (copy), var3 (ref), var7 (ref), globalFocusTelemetryModule (copy)
		if var5 ~= nil and var6.current == nil then
			sessionService:SetSession(sessionType.StructuralIdentifier.Level1, sessionType.StructuralIdentifier.FocusNavigation, var3)
			var6.current = var5
		end
		if var5 ~= nil and var7.current then
			globalFocusTelemetryModule.sendAutoFocusRecoveryCounter()
			var7.current = false
		end
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), fFlagLuaAppResponsiveEnginePreferredInput (copy), var8 (ref), responsiveModule (copy), t (copy), var6 (ref), sessionService (copy), sessionType (copy), var4 (ref)
		local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p2)
			-- upvalues: fFlagLuaAppResponsiveEnginePreferredInput (copy), var8 (copy), responsiveModule (copy), t (copy), var6 (copy), sessionService (copy), sessionType (copy), var4 (copy)
			if if fFlagLuaAppResponsiveEnginePreferredInput then var8 ~= responsiveModule.Input.Directional and t[p2] else t[p2] then
				if var6.current == nil then
					var4(nil)
				else
					sessionService:RemoveSession(sessionType.StructuralIdentifier.FocusNavigation)
					var6.current = nil
					var4(nil)
					
					return
				end
			end
		end)
		
		return function()
			-- upvalues: lastInputTypeChangedConnection (ref)
			lastInputTypeChangedConnection:Disconnect()
		end
	end, if fFlagLuaAppResponsiveEnginePreferredInput then { var4, var8 } else { var4 })
	local var9 = navigationModule.useNavigation()
	local var10 = if var9 then var9.state else nil
	local var11 = if var10 then var10.index else nil
	local var12 = reactModule.useRef(var11)
	reactModule.useEffect(function()
		-- upvalues: isFocus (ref), var12 (ref), var11 (ref), var4 (ref)
		if isFocus and var12.current ~= nil and (var11 ~= nil and var12.current < var11) then
			var12.current = var11
			var4(nil)
		end
	end, { var11, isFocus })
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useRef(nil)
	local currentRouteState = navigationModule.getCurrentRouteState(var9)
	local var15 = if currentRouteState then currentRouteState.routeName else nil
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var13 (ref), var14 (ref)
		if var15 ~= var13.current then
			var14.current = var13.current
			var13.current = var15
		end
	end, { var15 })
	local var16 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.NavBar)
	local var17 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.RouterView)
	local var18 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.CentralOverlay)
	local var19 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.ModerationOverlay)
	local var20 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.PopUp)
	local var21 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.ContextualMenu)
	local var22 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local var23 = if fFlagEnablePeekViewFocusNav then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.PeekView) else nil
	local var24 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SubRouterView)
	local var25 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.Auxiliary)
	local var26 = if fFlagAppIaHomeSubTab then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.HeaderView) else nil
	local var27 = if fFlagEnableDrawerFocusNav then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.Drawer) else nil
	local var28 = reactModule.useMemo(function()
		-- upvalues: var19 (ref), var18 (ref), var21 (ref), var20 (ref), var23 (ref), fFlagEnableDrawerFocusNav (copy), var27 (ref), var17 (ref), var24 (ref), var16 (ref), var22 (ref), var25 (ref), fFlagAppIaHomeSubTab (copy), var26 (ref)
		local t = {}
		
		if var19 then
			table.insert(t, var19)
			
			return t
		elseif var18 then
			table.insert(t, var18)
			
			return t
		elseif var21 then
			table.insert(t, var21)
			
			return t
		elseif var20 then
			table.insert(t, var20)
			
			return t
		elseif var23 then
			table.insert(t, var23)
			
			return t
		elseif fFlagEnableDrawerFocusNav and var27 then
			table.insert(t, var27)
			
			return t
		elseif var17 then
			table.insert(t, var17)
		end
		if var24 then
			table.insert(t, var24)
		end
		if var16 then
			table.insert(t, var16)
		end
		if var22 then
			table.insert(t, var22)
		end
		if var25 then
			table.insert(t, var25)
		end
		if fFlagAppIaHomeSubTab and var26 then
			table.insert(t, var26)
		end
		return t
	end, {
		var19, var17, var16, var18, var21, var20, var23, var24, var25,
		if fFlagAppIaHomeSubTab then var26 else nil,
		if fFlagEnableDrawerFocusNav then var22 else nil,
		if fFlagEnableDrawerFocusNav then var27 else nil
	})
	local var29 = useAutoFocusModule(var28, 0.1)
	local var30 = useDescendantHasFocusModule(var16)
	local var31 = useDescendantHasFocusModule(var17)
	local var32 = if fFlagSearchAllRegistryEntriesForAutoFocus then useAnyDescendantHasFocusModule(useRegistryEntries(focusNavigableSurfaceIdentifierEnumModule.RouterView)) else nil
	local var33 = useDescendantHasFocusModule(var18)
	local var34 = useDescendantHasFocusModule(var19)
	local var35 = useDescendantHasFocusModule(var21)
	local var36 = useDescendantHasFocusModule(var20)
	local var37 = useDescendantHasFocusModule(var22)
	local var38 = useDescendantHasFocusModule(var24)
	local var39 = useDescendantHasFocusModule(var25)
	local var40 = if fFlagEnablePeekViewFocusNav then useDescendantHasFocusModule(var23) else false
	local var41 = if fFlagAppIaHomeSubTab then useDescendantHasFocusModule(var26) else false
	local var42 = if fFlagEnableDrawerFocusNav then useDescendantHasFocusModule(var27) else false
	local _ = nil
	local var43 = if var19 then var34 elseif var18 then var33 elseif var21 then var35 elseif var20 then var36 elseif var23 then var40 elseif fFlagEnableDrawerFocusNav and var27 then var42 else var30 or ((if fFlagSearchAllRegistryEntriesForAutoFocus then var32 else var31) or (var37 or (var38 or (var39 or fFlagAppIaHomeSubTab and var41))))
	local var44 = nil
	
	if fFlagLuaAppsDefaultSelection then
		var44 = reactModule.useRef(var28)
		var2 = if var19 and not var34 then true elseif var18 and not var33 then true elseif var21 and not var35 then true elseif var20 and not var36 then true elseif var23 and not var40 then true elseif fFlagEnableDrawerFocusNav and var27 and not var42 then true elseif var17 and not var31 then true elseif var24 and not var38 then true elseif var16 and not var30 then true elseif var22 and not var37 then true elseif var25 and not var39 then true elseif fFlagAppIaHomeSubTab and var26 and not var41 then true else false
		
		if fFlagFixGlobalFocusPriorityModule then
			var2 = if var19 then not var34 elseif var18 then not var33 elseif var21 then not var35 elseif var20 then not var36 elseif var23 then not var40 elseif fFlagEnableDrawerFocusNav and var27 then not var42 elseif var17 then not var31 elseif var24 then not var38 elseif var16 then not var30 elseif var22 then not var37 elseif var25 then not var39 elseif fFlagAppIaHomeSubTab and var26 then not var41 else false
		end
		reactModule.useEffect(function()
			-- upvalues: var8 (ref), responsiveModule (copy), var44 (write), var28 (ref), p1 (ref), var2 (write), var4 (ref)
			if var8 == responsiveModule.Input.Directional and var44.current ~= var28 and (not p1 and var2) then
				var4(nil)
			end
			var44.current = var28
		end, {
			var28,
			var8,
			p1,
			var2,
			var4
		})
	end
	var2 = useSelector(function(p2)
		return p2.CentralOverlay.OverlayType
	end)
	local var45 = if fFlagLuaAppResponsiveEnginePreferredInput then if var8 ~= responsiveModule.Input.Directional then isFocus else true else isFocus
	var45 = var45 and (not var43 and not p1)
	reactModule.useEffect(function()
		-- upvalues: var29 (ref), var45 (ref), globalFocusTelemetryModule (copy), var28 (ref), var5 (ref), var44 (write), var19 (ref), var18 (ref), var21 (ref), var20 (ref), var23 (ref), var17 (ref), var24 (ref), var16 (ref), var22 (ref), var25 (ref), var26 (ref), var14 (ref), var13 (ref), var2 (ref), var7 (ref), runService (copy), autoFocusFailsafeThreshold (copy), createGameLeaveSubscription (copy)
		local var46 = nil
		local heartbeatConnection = nil
		
		local function setAutoFocusing()
			-- upvalues: var46 (write), var29 (copy)
			if var46 then
				var46.cancel()
			end
			var46 = var29()
		end
		
		if var45 then
			var46 = var29()
			
			local var47 = function()
				-- upvalues: globalFocusTelemetryModule (copy), var28 (copy), var5 (copy), var44 (copy), var19 (copy), var18 (copy), var21 (copy), var20 (copy), var23 (copy), var17 (copy), var24 (copy), var16 (copy), var22 (copy), var25 (copy), var26 (copy), var14 (copy), var13 (copy), var2 (copy), var7 (copy), var46 (write), var29 (copy)
				globalFocusTelemetryModule.sendAutoFocusFailureCounter(var28)
				globalFocusTelemetryModule.sendAutoFocusFailureEvent(var5, if var44 then var44.current else {}, var28, {
					moderationOverlay = var19,
					centralOverlay = var18,
					contextualMenu = var21,
					popUp = var20,
					peekView = var23,
					routerView = var17,
					subRouterView = var24,
					globalNavBar = var16,
					searchBar = var22,
					auxiliaryView = var25,
					headerView = var26
				}, var14.current, var13.current, var2)
				var7.current = true
				
				if var46 then
					var46.cancel()
				end
				var46 = var29()
			end
			
			local var48 = false
			local var49 = 0
			heartbeatConnection = runService.Heartbeat:Connect(function(p2)
				-- upvalues: var49 (write), autoFocusFailsafeThreshold (copy), var48 (write), var47 (ref)
				var49 += p2
				
				if autoFocusFailsafeThreshold < var49 and not var48 then
					var47()
					var48 = true
					var49 = 0
				end
			end)
		end
		local var50 = if var45 then createGameLeaveSubscription(setAutoFocusing) else nil
		
		return function()
			-- upvalues: var46 (write), var50 (write), heartbeatConnection (write)
			if var46 then
				var46.cancel()
			end
			if var50 then
				var50.unsubscribe()
			end
			if heartbeatConnection then
				heartbeatConnection:Disconnect()
			end
		end
	end, {
		var45,
		var29,
		var28,
		if fFlagLuaAppsDefaultSelection then var5 else nil
	})
end
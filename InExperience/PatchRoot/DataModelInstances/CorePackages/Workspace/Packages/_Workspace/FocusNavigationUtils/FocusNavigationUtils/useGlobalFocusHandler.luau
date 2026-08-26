local runService = game:GetService("RunService")
local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local userInputService = game:GetService("UserInputService")
local sessionService = game:GetService("SessionService")
local parent = focusNavigationUtils.Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local messageBus = require(parent.MessageBus).MessageBus
local loggingProtocolModule = require(parent.LoggingProtocol)
local navigationModule = require(parent.Navigation)
local mutedError = require(parent.Loggers).mutedError
local responsiveModule = require(parent.Responsive)
local sessionType = require(parent.Sessionization).SessionType
local useLastInputMethodModule = require(focusNavigationUtils.useLastInputMethod)
local useLastInputModeModule = require(focusNavigationUtils.useLastInputMode)
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local useFocusedGuiObject = reactFocusNavigationModule.useFocusedGuiObject
local useRegistryEntry = require(focusNavigationUtils.FocusNavigableSurfaceRegistry).useRegistryEntry
local focusNavigableSurfaceIdentifierEnumModule = require(focusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
local useAutoFocusModule = require(focusNavigationUtils.useAutoFocus)
local useDescendantHasFocusModule = require(focusNavigationUtils.useDescendantHasFocus)
local globalFocusTelemetryModule = require(focusNavigationUtils.GlobalFocusTelemetry)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local tenFootUiCorrectAutoFocusLoggingBehavior = game:DefineFastFlag("TenFootUiCorrectAutoFocusLoggingBehavior", false)
local autoFocusFailsafeThreshold = game:DefineFastInt("AutoFocusFailsafeThreshold", 5)
local fFlagEnablePeekViewFocusNav = require(parent.SharedFlags).FFlagEnablePeekViewFocusNav
local fFlagAXMigrateAXToGlobalAutofocus = require(parent.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAppIaHomeSubTab = sharedFlagsModule.FFlagAppIaHomeSubTab
local fFlagLuaAppResponsiveEnginePreferredInput = sharedFlagsModule.FFlagLuaAppResponsiveEnginePreferredInput
local fFlagLuaAppsDefaultSelection = sharedFlagsModule.FFlagLuaAppsDefaultSelection
local fFlagEnableDrawerFocusNav = sharedFlagsModule.FFlagEnableDrawerFocusNav
local globalFocusFailureTelemetry = game:DefineFastFlag("GlobalFocusFailureTelemetry", false)
local t = {
	[Enum.UserInputType.MouseButton1] = true,
	[Enum.UserInputType.MouseButton2] = true,
	[Enum.UserInputType.MouseButton3] = true,
	[Enum.UserInputType.Touch] = true
}
local var1 = messageBus.Subscriber.new()
local default = loggingProtocolModule.default

local function gameLeaveMessageValidator(p1)
	return typeof(p1) == "table"
end

local function _(p1)
	-- upvalues: globalFocusFailureTelemetry (ref), runService (ref), autoFocusFailsafeThreshold (ref)
	local var2 = if globalFocusFailureTelemetry then false else nil
	local var3 = 0
	
	return runService.Heartbeat:Connect(function(p2)
		-- upvalues: var3 (write), autoFocusFailsafeThreshold (copy), globalFocusFailureTelemetry (copy), var2 (write), p1 (ref)
		var3 += p2
		
		if autoFocusFailsafeThreshold < var3 and (not globalFocusFailureTelemetry or not var2) then
			p1()
			
			if globalFocusFailureTelemetry then
				var2 = true
			end
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
	-- upvalues: useLastInputMethodModule (ref), useFocusGuiObject (ref), useFocusedGuiObject (ref), reactModule (ref), globalFocusFailureTelemetry (ref), useLastInputModeModule (ref), fFlagLuaAppResponsiveEnginePreferredInput (ref), responsiveModule (ref), sessionService (ref), sessionType (ref), globalFocusTelemetryModule (ref), userInputService (ref), t (ref), navigationModule (ref), useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnumModule (ref), fFlagEnablePeekViewFocusNav (ref), fFlagAXMigrateAXToGlobalAutofocus (ref), fFlagAppIaHomeSubTab (ref), fFlagEnableDrawerFocusNav (ref), useAutoFocusModule (ref), useDescendantHasFocusModule (ref), fFlagLuaAppsDefaultSelection (ref), useSelector (ref), tenFootUiCorrectAutoFocusLoggingBehavior (ref), mutedError (ref), default (ref), runService (ref), autoFocusFailsafeThreshold (ref), createGameLeaveSubscription (ref)
	local var2 = useLastInputMethodModule()
	local var3 = useFocusGuiObject()
	local var4 = useFocusedGuiObject()
	local var5 = reactModule.useRef(var4)
	local var6 = if globalFocusFailureTelemetry then reactModule.useRef(false) else nil
	local isFocus = useLastInputModeModule() == "Focus"
	local var7 = if fFlagLuaAppResponsiveEnginePreferredInput then responsiveModule.usePreferredInput() else nil
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var5 (ref), sessionService (copy), sessionType (copy), var2 (ref), globalFocusFailureTelemetry (copy), var6 (ref), globalFocusTelemetryModule (copy)
		if var4 ~= nil and var5.current == nil then
			sessionService:SetSession(sessionType.StructuralIdentifier.Level1, sessionType.StructuralIdentifier.FocusNavigation, var2)
			var5.current = var4
		end
		if globalFocusFailureTelemetry and var4 ~= nil and var6.current then
			globalFocusTelemetryModule.sendAutoFocusRecoveryCounter()
			var6.current = false
		end
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), fFlagLuaAppResponsiveEnginePreferredInput (copy), var7 (ref), responsiveModule (copy), t (copy), var5 (ref), sessionService (copy), sessionType (copy), var3 (ref)
		local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p2)
			-- upvalues: fFlagLuaAppResponsiveEnginePreferredInput (copy), var7 (copy), responsiveModule (copy), t (copy), var5 (copy), sessionService (copy), sessionType (copy), var3 (copy)
			if if fFlagLuaAppResponsiveEnginePreferredInput then var7 ~= responsiveModule.Input.Directional and t[p2] else t[p2] then
				if var5.current == nil then
					var3(nil)
				else
					sessionService:RemoveSession(sessionType.StructuralIdentifier.FocusNavigation)
					var5.current = nil
					var3(nil)
					
					return
				end
			end
		end)
		
		return function()
			-- upvalues: lastInputTypeChangedConnection (ref)
			lastInputTypeChangedConnection:Disconnect()
		end
	end, if fFlagLuaAppResponsiveEnginePreferredInput then { var3, var7 } else { var3 })
	local var8 = navigationModule.useNavigation()
	local var9 = if var8 then var8.state else nil
	local var10 = if var9 then var9.index else nil
	local var11 = reactModule.useRef(var10)
	reactModule.useEffect(function()
		-- upvalues: isFocus (ref), var11 (ref), var10 (ref), var3 (ref)
		if isFocus and var11.current ~= nil and (var10 ~= nil and var11.current < var10) then
			var11.current = var10
			var3(nil)
		end
	end, { var10, isFocus })
	local var12 = nil
	local var13 = nil
	
	if globalFocusFailureTelemetry then
		var12 = reactModule.useRef(nil)
		var13 = reactModule.useRef(nil)
		local currentRouteState = navigationModule.getCurrentRouteState(var8)
		local var14 = if currentRouteState then currentRouteState.routeName else nil
		reactModule.useEffect(function()
			-- upvalues: var14 (ref), var12 (write), var13 (write)
			if var14 ~= var12.current then
				var13.current = var12.current
				var12.current = var14
			end
		end, { var14 })
	end
	local var15 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.NavBar)
	local var16 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.RouterView)
	local var17 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.CentralOverlay)
	local var18 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.ModerationOverlay)
	local var19 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.PopUp)
	local var20 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.ContextualMenu)
	local var21 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local var22 = if fFlagEnablePeekViewFocusNav then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.PeekView) else nil
	local var23 = if fFlagAXMigrateAXToGlobalAutofocus then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SubRouterView) else nil
	local var24 = if fFlagAXMigrateAXToGlobalAutofocus then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.Auxiliary) else nil
	local var25 = if fFlagAppIaHomeSubTab then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.HeaderView) else nil
	local var26 = if fFlagEnableDrawerFocusNav then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.Drawer) else nil
	local var27 = reactModule.useMemo(function()
		-- upvalues: var18 (ref), var17 (ref), var20 (ref), var19 (ref), var22 (ref), fFlagEnableDrawerFocusNav (copy), var26 (ref), var16 (ref), fFlagAXMigrateAXToGlobalAutofocus (copy), var23 (ref), var15 (ref), var21 (ref), var24 (ref), fFlagAppIaHomeSubTab (copy), var25 (ref)
		local t = {}
		
		if var18 then
			table.insert(t, var18)
			
			return t
		elseif var17 then
			table.insert(t, var17)
			
			return t
		elseif var20 then
			table.insert(t, var20)
			
			return t
		elseif var19 then
			table.insert(t, var19)
			
			return t
		elseif var22 then
			table.insert(t, var22)
			
			return t
		elseif fFlagEnableDrawerFocusNav and var26 then
			table.insert(t, var26)
			
			return t
		elseif var16 then
			table.insert(t, var16)
		end
		if fFlagAXMigrateAXToGlobalAutofocus and var23 then
			table.insert(t, var23)
		end
		if var15 then
			table.insert(t, var15)
		end
		if var21 then
			table.insert(t, var21)
		end
		if fFlagAXMigrateAXToGlobalAutofocus and var24 then
			table.insert(t, var24)
		end
		if fFlagAppIaHomeSubTab and var25 then
			table.insert(t, var25)
		end
		return t
	end, {
		var18, var16, var15, var17, var20, var19, var22,
		if fFlagAXMigrateAXToGlobalAutofocus then var23 else nil,
		if fFlagAXMigrateAXToGlobalAutofocus then var24 else nil,
		if fFlagAppIaHomeSubTab then var25 else nil,
		if fFlagEnableDrawerFocusNav then var21 else nil,
		if fFlagEnableDrawerFocusNav then var26 else nil
	})
	local var28 = useAutoFocusModule(var27, 0.1)
	local var29 = useDescendantHasFocusModule(var15)
	local var30 = useDescendantHasFocusModule(var16)
	local var31 = useDescendantHasFocusModule(var17)
	local var32 = useDescendantHasFocusModule(var18)
	local var33 = useDescendantHasFocusModule(var20)
	local var34 = useDescendantHasFocusModule(var19)
	local var35 = useDescendantHasFocusModule(var21)
	local var36 = if fFlagAXMigrateAXToGlobalAutofocus then useDescendantHasFocusModule(var23) else nil
	local var37 = if fFlagAXMigrateAXToGlobalAutofocus then useDescendantHasFocusModule(var24) else nil
	local var38 = if fFlagEnablePeekViewFocusNav then useDescendantHasFocusModule(var22) else false
	local var39 = if fFlagAppIaHomeSubTab then useDescendantHasFocusModule(var25) else false
	local var40 = if fFlagEnableDrawerFocusNav then useDescendantHasFocusModule(var26) else false
	local _ = nil
	local var41 = if var18 then var32 elseif var17 then var31 elseif var20 then var33 elseif var19 then var34 elseif var22 then var38 elseif fFlagEnableDrawerFocusNav and var26 then var40 elseif fFlagAXMigrateAXToGlobalAutofocus then var29 or (var30 or (var35 or (var36 or (var37 or fFlagAppIaHomeSubTab and var39)))) else var29 or (var30 or (var35 or fFlagAppIaHomeSubTab and var39))
	local var42 = nil
	
	if fFlagLuaAppsDefaultSelection then
		var42 = reactModule.useRef(var27)
		local var43 = if var18 and not var32 then true elseif var17 and not var31 then true elseif var20 and not var33 then true elseif var19 and not var34 then true elseif var22 and not var38 then true elseif fFlagEnableDrawerFocusNav and var26 and not var40 then true elseif var16 and not var30 then true elseif fFlagAXMigrateAXToGlobalAutofocus and var23 and not var36 then true elseif var15 and not var29 then true elseif var21 and not var35 then true elseif fFlagAXMigrateAXToGlobalAutofocus and var24 and not var37 then true elseif fFlagAppIaHomeSubTab and var25 and not var39 then true else false
		reactModule.useEffect(function()
			-- upvalues: var7 (ref), responsiveModule (copy), var42 (write), var27 (ref), p1 (ref), var43 (ref), var3 (ref)
			if var7 == responsiveModule.Input.Directional and var42.current ~= var27 and (not p1 and var43) then
				var3(nil)
			end
			var42.current = var27
		end, {
			var27,
			var7,
			p1,
			var43,
			var3
		})
	end
	local var44 = if globalFocusFailureTelemetry then useSelector(function(p2)
		return p2.CentralOverlay.OverlayType
	end) else nil
	local var45 = if fFlagLuaAppResponsiveEnginePreferredInput then if var7 ~= responsiveModule.Input.Directional then isFocus else true else isFocus
	var45 = var45 and (not var41 and not p1)
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var45 (ref), globalFocusFailureTelemetry (copy), globalFocusTelemetryModule (copy), var27 (ref), var4 (ref), var42 (write), var18 (ref), var17 (ref), var20 (ref), var19 (ref), var22 (ref), var16 (ref), var23 (ref), var15 (ref), var21 (ref), var24 (ref), var25 (ref), var13 (write), var12 (write), var44 (ref), var6 (ref), tenFootUiCorrectAutoFocusLoggingBehavior (copy), mutedError (copy), default (copy), runService (copy), autoFocusFailsafeThreshold (copy), createGameLeaveSubscription (copy)
		local var46 = nil
		local heartbeatConnection = nil
		
		local function setAutoFocusing()
			-- upvalues: var46 (write), var28 (copy)
			if var46 then
				var46.cancel()
			end
			var46 = var28()
		end
		
		if var45 then
			var46 = var28()
			
			local var47 = function()
				-- upvalues: globalFocusFailureTelemetry (copy), globalFocusTelemetryModule (copy), var27 (copy), var4 (copy), var42 (copy), var18 (copy), var17 (copy), var20 (copy), var19 (copy), var22 (copy), var16 (copy), var23 (copy), var15 (copy), var21 (copy), var24 (copy), var25 (copy), var13 (copy), var12 (copy), var44 (copy), var6 (copy), tenFootUiCorrectAutoFocusLoggingBehavior (copy), mutedError (copy), default (copy), var46 (write), var28 (copy)
				if globalFocusFailureTelemetry then
					globalFocusTelemetryModule.sendAutoFocusFailureCounter(var27)
					globalFocusTelemetryModule.sendAutoFocusFailureEvent(var4, if var42 then var42.current else {}, var27, {
						moderationOverlay = var18,
						centralOverlay = var17,
						contextualMenu = var20,
						popUp = var19,
						peekView = var22,
						routerView = var16,
						subRouterView = var23,
						globalNavBar = var15,
						searchBar = var21,
						auxiliaryView = var24,
						headerView = var25
					}, if var13 then var13.current else nil, if var12 then var12.current else nil, var44)
					var6.current = true
				elseif tenFootUiCorrectAutoFocusLoggingBehavior then
					mutedError("[useGlobalFocusHandler] globalFocusHandler failed to autofocus with " .. #var27 .. " targets, retrying")
				else
					default:logEvent("GamePadFocusFailsafeActivated", { targetCount = #var27 })
				end
				if var46 then
					var46.cancel()
				end
				var46 = var28()
			end
			
			local var48 = if globalFocusFailureTelemetry then false else nil
			local var49 = 0
			heartbeatConnection = runService.Heartbeat:Connect(function(p2)
				-- upvalues: var49 (write), autoFocusFailsafeThreshold (copy), globalFocusFailureTelemetry (copy), var48 (write), var47 (ref)
				var49 += p2
				
				if autoFocusFailsafeThreshold < var49 and (not globalFocusFailureTelemetry or not var48) then
					var47()
					
					if globalFocusFailureTelemetry then
						var48 = true
					end
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
		var28,
		var27,
		if fFlagLuaAppsDefaultSelection then var4 else nil
	})
end
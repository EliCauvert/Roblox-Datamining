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
local var20 = messageBus.Subscriber.new()
local default = loggingProtocolModule.default

local function gameLeaveMessageValidator(p0)
	return typeof(p0) == "table"
end

local function _(p1)
	-- upvalues: globalFocusFailureTelemetry (ref), runService (ref), autoFocusFailsafeThreshold (ref)
	local var23 = if globalFocusFailureTelemetry then false else nil
	local var24 = 0
	
	return runService.Heartbeat:Connect(function(p2)
		-- upvalues: var24 (write), autoFocusFailsafeThreshold (copy), globalFocusFailureTelemetry (copy), var23 (write), p1 (ref)
		var24 += p2
		
		if autoFocusFailsafeThreshold < var24 and (not globalFocusFailureTelemetry or not var23) then
			p1()
			
			if globalFocusFailureTelemetry then
				var23 = true
			end
			var24 = 0
		end
	end)
end

local function createGameLeaveSubscription(p3)
	-- upvalues: messageBus (ref), var20 (ref), gameLeaveMessageValidator (ref), autoFocusFailsafeThreshold (ref)
	local game = messageBus.getMessageId("Game", "onGameLeave")
	local var26 = nil
	var20:subscribe({ mid = game, validateParams = gameLeaveMessageValidator }, function(_)
		-- upvalues: var26 (write), autoFocusFailsafeThreshold (copy), p3 (ref)
		var26 = task.delay(autoFocusFailsafeThreshold, function()
			-- upvalues: p3 (copy)
			p3()
		end)
	end)
	
	return {
		unsubscribe = function()
			-- upvalues: var20 (copy), game (ref), var26 (write)
			var20:unsubscribeWithMsgId(game)
			
			if var26 then
				task.cancel(var26)
			end
		end
	}
end

return function(p4)
	-- upvalues: useLastInputMethodModule (ref), useFocusGuiObject (ref), useFocusedGuiObject (ref), reactModule (ref), globalFocusFailureTelemetry (ref), useLastInputModeModule (ref), fFlagLuaAppResponsiveEnginePreferredInput (ref), responsiveModule (ref), sessionService (ref), sessionType (ref), globalFocusTelemetryModule (ref), userInputService (ref), t (ref), navigationModule (ref), useRegistryEntry (ref), focusNavigableSurfaceIdentifierEnumModule (ref), fFlagEnablePeekViewFocusNav (ref), fFlagAXMigrateAXToGlobalAutofocus (ref), fFlagAppIaHomeSubTab (ref), fFlagEnableDrawerFocusNav (ref), useAutoFocusModule (ref), useDescendantHasFocusModule (ref), fFlagLuaAppsDefaultSelection (ref), useSelector (ref), tenFootUiCorrectAutoFocusLoggingBehavior (ref), mutedError (ref), default (ref), runService (ref), autoFocusFailsafeThreshold (ref), createGameLeaveSubscription (ref)
	local var27 = useLastInputMethodModule()
	local var28 = useFocusGuiObject()
	local var29 = useFocusedGuiObject()
	local var30 = reactModule.useRef(var29)
	local var31 = if globalFocusFailureTelemetry then reactModule.useRef(false) else nil
	local isFocus = useLastInputModeModule() == "Focus"
	local var33 = if fFlagLuaAppResponsiveEnginePreferredInput then responsiveModule.usePreferredInput() else nil
	reactModule.useEffect(function()
		-- upvalues: var29 (ref), var30 (ref), sessionService (copy), sessionType (copy), var27 (ref), globalFocusFailureTelemetry (copy), var31 (ref), globalFocusTelemetryModule (copy)
		if var29 ~= nil and var30.current == nil then
			sessionService:SetSession(sessionType.StructuralIdentifier.Level1, sessionType.StructuralIdentifier.FocusNavigation, var27)
			var30.current = var29
		end
		if globalFocusFailureTelemetry and var29 ~= nil and var31.current then
			globalFocusTelemetryModule.sendAutoFocusRecoveryCounter()
			var31.current = false
		end
	end, { var29 })
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), fFlagLuaAppResponsiveEnginePreferredInput (copy), var33 (ref), responsiveModule (copy), t (copy), var30 (ref), sessionService (copy), sessionType (copy), var28 (ref)
		local lastInputTypeChangedConnection = userInputService.LastInputTypeChanged:Connect(function(p5)
			-- upvalues: fFlagLuaAppResponsiveEnginePreferredInput (copy), var33 (copy), responsiveModule (copy), t (copy), var30 (copy), sessionService (copy), sessionType (copy), var28 (copy)
			if if fFlagLuaAppResponsiveEnginePreferredInput then var33 ~= responsiveModule.Input.Directional and t[p5] else t[p5] then
				if var30.current == nil then
					var28(nil)
				else
					sessionService:RemoveSession(sessionType.StructuralIdentifier.FocusNavigation)
					var30.current = nil
					var28(nil)
					
					return
				end
			end
		end)
		
		return function()
			-- upvalues: lastInputTypeChangedConnection (ref)
			lastInputTypeChangedConnection:Disconnect()
		end
	end, if fFlagLuaAppResponsiveEnginePreferredInput then { var28, var33 } else { var28 })
	local var34 = navigationModule.useNavigation()
	local var35 = if var34 then var34.state else nil
	local var36 = if var35 then var35.index else nil
	local var37 = reactModule.useRef(var36)
	reactModule.useEffect(function()
		-- upvalues: isFocus (ref), var37 (ref), var36 (ref), var28 (ref)
		if isFocus and var37.current ~= nil and (var36 ~= nil and var37.current < var36) then
			var37.current = var36
			var28(nil)
		end
	end, { var36, isFocus })
	local var38 = nil
	local var39 = nil
	
	if globalFocusFailureTelemetry then
		var38 = reactModule.useRef(nil)
		var39 = reactModule.useRef(nil)
		local currentRouteState = navigationModule.getCurrentRouteState(var34)
		local var41 = if currentRouteState then currentRouteState.routeName else nil
		reactModule.useEffect(function()
			-- upvalues: var41 (ref), var38 (write), var39 (write)
			if var41 ~= var38.current then
				var39.current = var38.current
				var38.current = var41
			end
		end, { var41 })
	end
	local var42 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.NavBar)
	local var43 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.RouterView)
	local var44 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.CentralOverlay)
	local var45 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.ModerationOverlay)
	local var46 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.PopUp)
	local var47 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.ContextualMenu)
	local var48 = useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SearchBar)
	local var49 = if fFlagEnablePeekViewFocusNav then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.PeekView) else nil
	local var50 = if fFlagAXMigrateAXToGlobalAutofocus then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.SubRouterView) else nil
	local var51 = if fFlagAXMigrateAXToGlobalAutofocus then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.Auxiliary) else nil
	local var52 = if fFlagAppIaHomeSubTab then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.HeaderView) else nil
	local var53 = if fFlagEnableDrawerFocusNav then useRegistryEntry(focusNavigableSurfaceIdentifierEnumModule.Drawer) else nil
	local var54 = reactModule.useMemo(function()
		-- upvalues: var45 (ref), var44 (ref), var47 (ref), var46 (ref), var49 (ref), fFlagEnableDrawerFocusNav (copy), var53 (ref), var43 (ref), fFlagAXMigrateAXToGlobalAutofocus (copy), var50 (ref), var42 (ref), var48 (ref), var51 (ref), fFlagAppIaHomeSubTab (copy), var52 (ref)
		local t = {}
		
		if var45 then
			table.insert(t, var45)
			
			return t
		elseif var44 then
			table.insert(t, var44)
			
			return t
		elseif var47 then
			table.insert(t, var47)
			
			return t
		elseif var46 then
			table.insert(t, var46)
			
			return t
		elseif var49 then
			table.insert(t, var49)
			
			return t
		elseif fFlagEnableDrawerFocusNav and var53 then
			table.insert(t, var53)
			
			return t
		elseif var43 then
			table.insert(t, var43)
		end
		if fFlagAXMigrateAXToGlobalAutofocus and var50 then
			table.insert(t, var50)
		end
		if var42 then
			table.insert(t, var42)
		end
		if var48 then
			table.insert(t, var48)
		end
		if fFlagAXMigrateAXToGlobalAutofocus and var51 then
			table.insert(t, var51)
		end
		if fFlagAppIaHomeSubTab and var52 then
			table.insert(t, var52)
		end
		return t
	end, {
		var45, var43, var42, var44, var47, var46, var49,
		if fFlagAXMigrateAXToGlobalAutofocus then var50 else nil,
		if fFlagAXMigrateAXToGlobalAutofocus then var51 else nil,
		if fFlagAppIaHomeSubTab then var52 else nil,
		if fFlagEnableDrawerFocusNav then var48 else nil,
		if fFlagEnableDrawerFocusNav then var53 else nil
	})
	local var55 = useAutoFocusModule(var54, 0.1)
	local var56 = useDescendantHasFocusModule(var42)
	local var57 = useDescendantHasFocusModule(var43)
	local var58 = useDescendantHasFocusModule(var44)
	local var59 = useDescendantHasFocusModule(var45)
	local var60 = useDescendantHasFocusModule(var47)
	local var61 = useDescendantHasFocusModule(var46)
	local var62 = useDescendantHasFocusModule(var48)
	local var63 = if fFlagAXMigrateAXToGlobalAutofocus then useDescendantHasFocusModule(var50) else nil
	local var64 = if fFlagAXMigrateAXToGlobalAutofocus then useDescendantHasFocusModule(var51) else nil
	local var65 = if fFlagEnablePeekViewFocusNav then useDescendantHasFocusModule(var49) else false
	local var66 = if fFlagAppIaHomeSubTab then useDescendantHasFocusModule(var52) else false
	local var67 = if fFlagEnableDrawerFocusNav then useDescendantHasFocusModule(var53) else false
	local _ = nil
	local var68 = if var45 then var59 elseif var44 then var58 elseif var47 then var60 elseif var46 then var61 elseif var49 then var65 elseif fFlagEnableDrawerFocusNav and var53 then var67 elseif fFlagAXMigrateAXToGlobalAutofocus then var56 or (var57 or (var62 or (var63 or (var64 or fFlagAppIaHomeSubTab and var66)))) else var56 or (var57 or (var62 or fFlagAppIaHomeSubTab and var66))
	local var69 = nil
	
	if fFlagLuaAppsDefaultSelection then
		var69 = reactModule.useRef(var54)
		local var70 = if var45 and not var59 then true elseif var44 and not var58 then true elseif var47 and not var60 then true elseif var46 and not var61 then true elseif var49 and not var65 then true elseif fFlagEnableDrawerFocusNav and var53 and not var67 then true elseif var43 and not var57 then true elseif fFlagAXMigrateAXToGlobalAutofocus and var50 and not var63 then true elseif var42 and not var56 then true elseif var48 and not var62 then true elseif fFlagAXMigrateAXToGlobalAutofocus and var51 and not var64 then true elseif fFlagAppIaHomeSubTab and var52 and not var66 then true else false
		reactModule.useEffect(function()
			-- upvalues: var33 (ref), responsiveModule (copy), var69 (write), var54 (ref), p4 (ref), var70 (ref), var28 (ref)
			if var33 == responsiveModule.Input.Directional and var69.current ~= var54 and (not p4 and var70) then
				var28(nil)
			end
			var69.current = var54
		end, {
			var54,
			var33,
			p4,
			var70,
			var28
		})
	end
	local var71 = if globalFocusFailureTelemetry then useSelector(function(p6)
		return p6.CentralOverlay.OverlayType
	end) else nil
	local var72 = if fFlagLuaAppResponsiveEnginePreferredInput then if var33 ~= responsiveModule.Input.Directional then isFocus else true else isFocus
	var72 = var72 and (not var68 and not p4)
	reactModule.useEffect(function()
		-- upvalues: var55 (ref), var72 (ref), globalFocusFailureTelemetry (copy), globalFocusTelemetryModule (copy), var54 (ref), var29 (ref), var69 (write), var45 (ref), var44 (ref), var47 (ref), var46 (ref), var49 (ref), var43 (ref), var50 (ref), var42 (ref), var48 (ref), var51 (ref), var52 (ref), var39 (write), var38 (write), var71 (ref), var31 (ref), tenFootUiCorrectAutoFocusLoggingBehavior (copy), mutedError (copy), default (copy), runService (copy), autoFocusFailsafeThreshold (copy), createGameLeaveSubscription (copy)
		local var75 = nil
		local heartbeatConnection = nil
		
		local function setAutoFocusing()
			-- upvalues: var75 (write), var55 (copy)
			if var75 then
				var75.cancel()
			end
			var75 = var55()
		end
		
		if var72 then
			var75 = var55()
			
			local var78 = function()
				-- upvalues: globalFocusFailureTelemetry (copy), globalFocusTelemetryModule (copy), var54 (copy), var29 (copy), var69 (copy), var45 (copy), var44 (copy), var47 (copy), var46 (copy), var49 (copy), var43 (copy), var50 (copy), var42 (copy), var48 (copy), var51 (copy), var52 (copy), var39 (copy), var38 (copy), var71 (copy), var31 (copy), tenFootUiCorrectAutoFocusLoggingBehavior (copy), mutedError (copy), default (copy), var75 (write), var55 (copy)
				if globalFocusFailureTelemetry then
					globalFocusTelemetryModule.sendAutoFocusFailureCounter(var54)
					globalFocusTelemetryModule.sendAutoFocusFailureEvent(var29, if var69 then var69.current else {}, var54, {
						moderationOverlay = var45,
						centralOverlay = var44,
						contextualMenu = var47,
						popUp = var46,
						peekView = var49,
						routerView = var43,
						subRouterView = var50,
						globalNavBar = var42,
						searchBar = var48,
						auxiliaryView = var51,
						headerView = var52
					}, if var39 then var39.current else nil, if var38 then var38.current else nil, var71)
					var31.current = true
				elseif tenFootUiCorrectAutoFocusLoggingBehavior then
					mutedError("[useGlobalFocusHandler] globalFocusHandler failed to autofocus with " .. #var54 .. " targets, retrying")
				else
					default:logEvent("GamePadFocusFailsafeActivated", { targetCount = #var54 })
				end
				if var75 then
					var75.cancel()
				end
				var75 = var55()
			end
			
			local var79 = if globalFocusFailureTelemetry then false else nil
			local var80 = 0
			heartbeatConnection = runService.Heartbeat:Connect(function(p7)
				-- upvalues: var80 (write), autoFocusFailsafeThreshold (copy), globalFocusFailureTelemetry (copy), var79 (write), var78 (ref)
				var80 += p7
				
				if autoFocusFailsafeThreshold < var80 and (not globalFocusFailureTelemetry or not var79) then
					var78()
					
					if globalFocusFailureTelemetry then
						var79 = true
					end
					var80 = 0
				end
			end)
		end
		local var81 = if var72 then createGameLeaveSubscription(setAutoFocusing) else nil
		
		return function()
			-- upvalues: var75 (write), var81 (write), heartbeatConnection (write)
			if var75 then
				var75.cancel()
			end
			if var81 then
				var81.unsubscribe()
			end
			if heartbeatConnection then
				heartbeatConnection:Disconnect()
			end
		end
	end, {
		var72,
		var55,
		var54,
		if fFlagLuaAppsDefaultSelection then var29 else nil
	})
end
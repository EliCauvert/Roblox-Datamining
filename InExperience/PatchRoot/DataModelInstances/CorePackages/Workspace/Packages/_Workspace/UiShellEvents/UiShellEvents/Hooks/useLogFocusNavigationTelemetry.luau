local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local uiShellEvents = script:FindFirstAncestor("UiShellEvents")
local parent = uiShellEvents.Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigationTelemetryModule = require(uiShellEvents.Analytics.focusNavigationTelemetry)

local function _(p1)
	return string.find(p1, "^HoldTo") ~= nil
end

local _ = function(p1)
	-- upvalues: userInputService (ref)
	return if userInputService.PreferredInput == Enum.PreferredInput.Gamepad then "Gamepad" elseif p1 == "None" then nil else p1
end

local _ = function(p1, p2, p3)
	return if p1 ~= "Focus" then p2 and not p3 else true
end

return function(p1)
	-- upvalues: focusNavigationUtilsModule (ref), reactModule (ref), focusNavigationTelemetryModule (ref), guiService (ref), userInputService (ref), reactFocusNavigationModule (ref)
	local var1, var2 = focusNavigationUtilsModule.useLastInputMode()
	local var3 = focusNavigationUtilsModule.useLastInputMethod()
	local var4 = focusNavigationUtilsModule.useGamepadCursorEnabled()
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var1 (ref), var3 (ref), focusNavigationTelemetryModule (copy)
		if not var5.current and var1 == "Focus" and var3 == "Keyboard" then
			var5.current = true
			focusNavigationTelemetryModule.logKeyboardFocusModeEntered()
		end
	end, { var1, var3 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), guiService (copy), var1 (ref), var4 (ref), var3 (ref), userInputService (copy), focusNavigationTelemetryModule (copy), p1 (ref), var2 (ref)
		local function logFocusNavEntryExit()
			-- upvalues: var6 (copy), guiService (copy), var1 (copy), var4 (copy), var3 (copy), userInputService (copy), focusNavigationTelemetryModule (copy), p1 (copy), var2 (copy)
			local current = var6.current
			local var7 = if var1 ~= "Focus" then guiService.SelectedCoreObject ~= nil and not var4 else true
			local var8 = var3
			local var9 = if userInputService.PreferredInput == Enum.PreferredInput.Gamepad then "Gamepad" elseif var8 == "None" then nil else var8
			
			if var7 and current == nil then
				var6.current = { inputType = var9, startTime = os.clock() }
				focusNavigationTelemetryModule.logFocusNavToggled({
					entry = "enter",
					input_type = var9,
					page = p1,
					keyboard_navigation_trigger = if var9 == "Keyboard" and var2 then var2.Name else nil
				})
				
				return
			elseif not var7 and current ~= nil then
				var6.current = nil
				focusNavigationTelemetryModule.logFocusNavToggled({
					entry = "exit",
					input_type = var9,
					page = p1,
					keyboard_navigation_duration = if current.inputType == "Keyboard" then math.floor((os.clock() - current.startTime) * 1000) else nil
				})
			end
		end
		
		logFocusNavEntryExit()
		local var7 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(logFocusNavEntryExit)
		
		return function()
			-- upvalues: var7 (ref)
			var7:Disconnect()
		end
	end, {
		var1,
		var3,
		var2,
		var4,
		p1
	})
	local var7 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var1 (ref), var4 (ref), focusNavigationTelemetryModule (copy), p1 (ref), focusNavigationUtilsModule (copy)
		if if var1 ~= "Focus" then not var4 else true then
			focusNavigationTelemetryModule.logFocusNavShortcutToggle({
				btn = if p3 then p3.Name else "Unknown",
				action = p2,
				page = p1,
				input_type = if p4 then focusNavigationUtilsModule.getInputMethod(p4) else nil
			})
			
			return
		end
	end, { var1, var4, p1 })
	reactModule.useEffect(function()
		-- upvalues: focusNavigationUtilsModule (copy), var7 (ref)
		local buttonHoldCompletedSignalConnection = focusNavigationUtilsModule.ButtonHoldCompletedSignal:connect(var7)
		
		return function()
			-- upvalues: buttonHoldCompletedSignalConnection (ref)
			buttonHoldCompletedSignalConnection:disconnect()
		end
	end, { var7 })
	reactFocusNavigationModule.useEventDispatched(reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		local eventData = p2.eventData
		
		if not p2.synthetic and eventData and (eventData.UserInputState == Enum.UserInputState.Begin and string.find(p2.eventName, "^HoldTo") == nil) then
			var7(p2.eventName, eventData.KeyCode, eventData.UserInputType)
		end
	end, { var7 }))
end
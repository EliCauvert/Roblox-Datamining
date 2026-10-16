local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local UiShellEvents = script:FindFirstAncestor("UiShellEvents")
local Parent = UiShellEvents.Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigationTelemetryModule = require(UiShellEvents.Analytics.focusNavigationTelemetry)

local function _(Text: string): boolean --[[ Line: 20 | Named "isHoldAction" ]]
	return string.find(Text, "^HoldTo") ~= nil
end

local _ = function(p1) --[[ Line: 24 | Named "getFocusNavEntryExitInputType" ]]
	-- upvalues: UserInputService (copy)
	return if UserInputService.PreferredInput == Enum.PreferredInput.Gamepad then "Gamepad" elseif p1 == "None" then nil else p1
end

local _ = function(p1, p2, p3): boolean --[[ Line: 32 | Named "isFocusNavActive" ]]
	return p1 == "Focus" or p2 and not p3
end

return function(Page) --[[ Line: 36 | Named "useLogFocusNavigationTelemetry" ]]
	-- upvalues: FocusNavigationUtilsModule (copy), ReactModule (copy), FocusNavigationTelemetryModule (copy), GuiService (copy), UserInputService (copy), ReactFocusNavigationModule (copy)
	local UseLastInputModeResult, UseLastInputModeResult2 = FocusNavigationUtilsModule.useLastInputMode()
	local UseLastInputResult = FocusNavigationUtilsModule.useLastInputMethod()
	local UseGamepadCursorEnabledResult = FocusNavigationUtilsModule.useGamepadCursorEnabled()
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 46 ]]
		-- upvalues: UseRefResult (copy), UseLastInputModeResult (copy), UseLastInputResult (copy), FocusNavigationTelemetryModule (upval)
		if not UseRefResult.current and UseLastInputModeResult == "Focus" and UseLastInputResult == "Keyboard" then
			UseRefResult.current = true
			FocusNavigationTelemetryModule.logKeyboardFocusModeEntered()
		end
	end, { UseLastInputModeResult, UseLastInputResult })
	ReactModule.useEffect(function() --[[ Line: 58 ]]
		-- upvalues: UseRefResult1 (copy), GuiService (upval), UseLastInputModeResult (copy), UseGamepadCursorEnabledResult (copy), UseLastInputResult (copy), UserInputService (upval), FocusNavigationTelemetryModule (upval), Page (copy), UseLastInputModeResult2 (copy)
		local function logFocusNavEntryExit() --[[ Line: 59 ]]
			-- upvalues: UseRefResult1 (upval), GuiService (upval), UseLastInputModeResult (upval), UseGamepadCursorEnabledResult (upval), UseLastInputResult (upval), UserInputService (upval), FocusNavigationTelemetryModule (upval), Page (upval), UseLastInputModeResult2 (upval)
			local Current = UseRefResult1.current
			local HasSelectedCoreObject = GuiService.SelectedCoreObject ~= nil
			local IsFocus: boolean = UseLastInputModeResult == "Focus" or HasSelectedCoreObject and not UseGamepadCursorEnabledResult
			local Gamepad = if UserInputService.PreferredInput == Enum.PreferredInput.Gamepad then "Gamepad" elseif UseLastInputResult == "None" then nil else UseLastInputResult
			
			if IsFocus and Current == nil then
				UseRefResult1.current = { inputType = Gamepad, startTime = os.clock() }
				FocusNavigationTelemetryModule.logFocusNavToggled({
					entry = "enter",
					input_type = Gamepad,
					page = Page,
					keyboard_navigation_trigger = if Gamepad == "Keyboard" and UseLastInputModeResult2 then UseLastInputModeResult2.Name else nil
				})
				
				return
			end
			if not IsFocus and Current ~= nil then
				UseRefResult1.current = nil
				FocusNavigationTelemetryModule.logFocusNavToggled({
					entry = "exit",
					input_type = Gamepad,
					page = Page,
					keyboard_navigation_duration = if Current.inputType == "Keyboard" then math.floor((os.clock() - Current.startTime) * 1000) else nil
				})
			end
		end
		
		logFocusNavEntryExit()
		local Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(logFocusNavEntryExit)
		
		return function() --[[ Line: 91 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {
		UseLastInputModeResult,
		UseLastInputResult,
		UseLastInputModeResult2,
		UseGamepadCursorEnabledResult,
		Page
	})
	local UseResult = ReactModule.useCallback(function(Action, p1, p2) --[[ Line: 98 ]]
		-- upvalues: UseLastInputModeResult (copy), UseGamepadCursorEnabledResult (copy), FocusNavigationTelemetryModule (upval), Page (copy), FocusNavigationUtilsModule (upval)
		if UseLastInputModeResult == "Focus" or not UseGamepadCursorEnabledResult then
			FocusNavigationTelemetryModule.logFocusNavShortcutToggle({
				btn = if p1 then p1.Name else "Unknown",
				action = Action,
				page = Page,
				input_type = if p2 then FocusNavigationUtilsModule.getInputMethod(p2) else nil
			})
			
			return
		end
	end, {
		UseLastInputModeResult,
		UseGamepadCursorEnabledResult,
		Page
	})
	ReactModule.useEffect(function() --[[ Line: 113 ]]
		-- upvalues: FocusNavigationUtilsModule (upval), UseResult (copy)
		local ButtonHoldCompletedSignalConnection = FocusNavigationUtilsModule.ButtonHoldCompletedSignal:connect(UseResult)
		
		return function() --[[ Line: 115 ]]
			-- upvalues: ButtonHoldCompletedSignalConnection (copy)
			ButtonHoldCompletedSignalConnection:disconnect()
		end
	end, { UseResult })
	ReactFocusNavigationModule.useEventDispatched((ReactModule.useCallback(function(p1) --[[ Line: 120 ]]
		-- upvalues: UseResult (copy)
		local EventData = p1.eventData
		
		if not p1.synthetic and EventData and EventData.UserInputState == Enum.UserInputState.Begin and string.find(p1.eventName, "^HoldTo") == nil then
			UseResult(p1.eventName, EventData.KeyCode, EventData.UserInputType)
		end
	end, { UseResult })))
end
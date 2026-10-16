local Parent = script:FindFirstAncestor("Moments").Parent
local UserInputService = game:GetService("UserInputService")
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local UseDescendantHasFocusFunction = FocusNavigationUtilsModule.useDescendantHasFocus
local UseAutoFocusFunction = FocusNavigationUtilsModule.useAutoFocus
local UseLastInputModeFunction = FocusNavigationUtilsModule.useLastInputMode
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)
local PagerNavigationModule = require(script.Parent.pagerNavigation)
local PREVIOUSEVENT = PagerNavigationModule.PREVIOUS_EVENT
local NEXTEVENT = PagerNavigationModule.NEXT_EVENT
local KEYBOARDKEYEVENTS = PagerNavigationModule.KEYBOARD_KEY_EVENTS

return function(p1) --[[ Line: 53 | Named "usePagerInputNavigation" ]]
	-- upvalues: ReactModule (copy), UseDescendantHasFocusFunction (copy), UseAutoFocusFunction (copy), UseLastInputModeFunction (copy), PagerNavigationModule (copy), PREVIOUSEVENT (copy), InputHandlersModule (copy), NEXTEVENT (copy), ReactFocusNavigationModule (copy), UserInputService (copy), ConstantsModule (copy), KEYBOARDKEYEVENTS (copy)
	local Active = p1.active
	local KeyboardNavigation = p1.keyboardNavigation
	local UseRefResult = ReactModule.useRef(p1.goNext)
	UseRefResult.current = p1.goNext
	local UseRefResult1 = ReactModule.useRef(p1.goPrevious)
	UseRefResult1.current = p1.goPrevious
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseDescendantHasFocusResult = UseDescendantHasFocusFunction(UseStateResult)
	local UseAutoFocusResult = UseAutoFocusFunction({ UseStateResult }, 0.1)
	local IsFocus = UseLastInputModeFunction() == "Focus"
	local IsFocus1: boolean = Active and (UseStateResult ~= nil and (not UseDescendantHasFocusResult and IsFocus))
	ReactModule.useEffect(function() --[[ Line: 78 ]]
		-- upvalues: IsFocus1 (copy), UseAutoFocusResult (copy)
		local UseAutoFocusResultResult = if IsFocus1 then UseAutoFocusResult() else nil
		
		return function() --[[ Line: 83 ]]
			-- upvalues: UseAutoFocusResultResult (ref)
			if UseAutoFocusResultResult then
				UseAutoFocusResultResult.cancel()
			end
		end
	end, { IsFocus1, UseAutoFocusResult })
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function() --[[ Line: 95 ]]
		-- upvalues: PREVIOUSEVENT (upval), InputHandlersModule (upval), UseRefResult1 (copy), NEXTEVENT (upval), UseRefResult (copy)
		return {
			[PREVIOUSEVENT] = {
				handler = InputHandlersModule.onRelease(function() --[[ Line: 98 ]]
					-- upvalues: UseRefResult1 (upval)
					UseRefResult1.current()
				end)
			},
			[NEXTEVENT] = {
				handler = InputHandlersModule.onRelease(function() --[[ Line: 103 ]]
					-- upvalues: UseRefResult (upval)
					UseRefResult.current()
				end)
			}
		}
	end, {}), (ReactFocusNavigationModule.useEventMap((ReactModule.useMemo(function() --[[ Line: 91 ]]
		-- upvalues: PagerNavigationModule (upval), Active (copy), KeyboardNavigation (copy)
		return PagerNavigationModule.buildEventMap(Active, KeyboardNavigation)
	end, { Active, KeyboardNavigation })))))
	ReactModule.useEffect(function() --[[ Line: 115 ]]
		-- upvalues: Active (copy), UseDescendantHasFocusResult (copy), UserInputService (upval), PagerNavigationModule (upval), ConstantsModule (upval), UseRefResult1 (copy), UseRefResult (copy)
		if not Active or not UseDescendantHasFocusResult then return end
		local v1 = 0
		local InputChangedConnection = UserInputService.InputChanged:Connect(function(Input) --[[ Line: 120 ]]
			-- upvalues: PagerNavigationModule (upval), ConstantsModule (upval), v1 (ref), UseRefResult1 (upval), UseRefResult (upval)
			if Input.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
			local ThumbstickDirectionResult = PagerNavigationModule.thumbstickDirection(Input.Position.Y, ConstantsModule.THUMBSTICK_THRESHOLD)
			
			if ThumbstickDirectionResult == nil then return end
			local ClockTime = os.clock()
			
			if ClockTime - v1 < ConstantsModule.THUMBSTICK_COOLDOWN_SECONDS then return end
			v1 = ClockTime
			
			if ThumbstickDirectionResult == "previous" then
				UseRefResult1.current()
				
				return
			else
				UseRefResult.current()
			end
		end)
		
		return function() --[[ Line: 139 ]]
			-- upvalues: InputChangedConnection (copy)
			InputChangedConnection:Disconnect()
		end
	end, { Active, UseDescendantHasFocusResult })
	ReactModule.useEffect(function() --[[ Line: 145 ]]
		-- upvalues: Active (copy), KeyboardNavigation (copy), UserInputService (upval), KEYBOARDKEYEVENTS (upval), PREVIOUSEVENT (upval), UseRefResult1 (copy), NEXTEVENT (upval), UseRefResult (copy)
		if not Active or KeyboardNavigation ~= "global" then return end
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input, GameProcessed) --[[ Line: 149 ]]
			-- upvalues: KEYBOARDKEYEVENTS (upval), PREVIOUSEVENT (upval), UseRefResult1 (upval), NEXTEVENT (upval), UseRefResult (upval)
			if GameProcessed then return end
			local KEYBOARDKEYEVENT = KEYBOARDKEYEVENTS[Input.KeyCode]
			
			if KEYBOARDKEYEVENT == PREVIOUSEVENT then
				UseRefResult1.current()
				
				return
			end
			if KEYBOARDKEYEVENT == NEXTEVENT then
				UseRefResult.current()
			end
		end)
		
		return function() --[[ Line: 160 ]]
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { Active, KeyboardNavigation })
	
	return ReactModule.useCallback(function(p2) --[[ Line: 169 ]]
		-- upvalues: UseEventHandlerMapResult (copy), UseStateResult2 (copy)
		UseEventHandlerMapResult(p2)
		UseStateResult2(p2)
	end, { UseEventHandlerMapResult })
end
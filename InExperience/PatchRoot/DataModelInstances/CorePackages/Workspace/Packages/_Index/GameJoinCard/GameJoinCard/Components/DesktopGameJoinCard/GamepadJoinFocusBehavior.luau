local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local AppShortcutBarContext = require(Parent.AppShortcutBar).AppShortcutBarContext
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local ButtonHoldStateEnum = FocusNavigationUtilsModule.ButtonHoldStateEnum
local UseButtonHoldFunction = FocusNavigationUtilsModule.useButtonHold
local Constants = require(Parent.HoldToPlay).Constants

return function(p1) --[[ Line: 21 | Named "GamepadJoinFocusBehavior" ]]
	-- upvalues: ReactFocusNavigationModule (copy), ReactModule (copy), UseButtonHoldFunction (copy), Constants (copy), AppShortcutBarContext (copy), ButtonHoldStateEnum (copy), FocusNavigationEventNameEnum (copy)
	local UseFocusedGuiObjectResult = ReactFocusNavigationModule.useFocusedGuiObject()
	local UseRefResult = ReactModule.useRef(p1.joinExperience)
	UseRefResult.current = p1.joinExperience
	local UseButtonHoldResult = UseButtonHoldFunction(Constants.SIGNAL_HOLD_INTENT_SECONDS, Constants.SIGNAL_HOLD_COMPLETE_SECONDS)
	local UseDispatchButtonHoldStartedResult = AppShortcutBarContext.useDispatchButtonHoldStarted()
	local UseDispatchButtonHoldEndedResult = AppShortcutBarContext.useDispatchButtonHoldEnded()
	local UseRefResult1 = ReactModule.useRef(false)
	local IsHoldStateMatch: boolean = UseButtonHoldResult.holdState == ButtonHoldStateEnum.HOLDING or (UseButtonHoldResult.holdState == ButtonHoldStateEnum.JUST_PRESSED or UseButtonHoldResult.holdState == ButtonHoldStateEnum.COMPLETED)
	ReactModule.useEffect(function() --[[ Line: 39 ]]
		-- upvalues: UseRefResult1 (copy), IsHoldStateMatch (copy), UseDispatchButtonHoldStartedResult (copy), FocusNavigationEventNameEnum (upval), UseButtonHoldResult (copy), UseDispatchButtonHoldEndedResult (copy)
		if not UseRefResult1.current and IsHoldStateMatch then
			UseRefResult1.current = true
			UseDispatchButtonHoldStartedResult(FocusNavigationEventNameEnum.HoldToJoinFriend, UseButtonHoldResult.holdProgress)
			
			return
		end
		if UseRefResult1.current and not IsHoldStateMatch then
			UseDispatchButtonHoldEndedResult(FocusNavigationEventNameEnum.HoldToJoinFriend)
			UseRefResult1.current = false
		end
	end, {
		IsHoldStateMatch,
		UseButtonHoldResult.holdProgress,
		UseDispatchButtonHoldStartedResult,
		UseDispatchButtonHoldEndedResult
	})
	local UseRefResult2 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 57 ]]
		-- upvalues: UseButtonHoldResult (copy), ButtonHoldStateEnum (upval), UseRefResult2 (copy), UseRefResult (copy)
		if UseButtonHoldResult.holdState ~= ButtonHoldStateEnum.COMPLETED then
			UseRefResult2.current = false
			
			return
		end
		if UseRefResult2.current then return end
		UseRefResult2.current = true
		UseRefResult.current()
		
		if UseButtonHoldResult.cancelHold then
			UseButtonHoldResult.cancelHold()
		end
	end, {
		UseButtonHoldResult.holdState,
		UseButtonHoldResult.cancelHold
	})
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function() --[[ Line: 78 ]]
		-- upvalues: FocusNavigationEventNameEnum (upval), UseButtonHoldResult (copy)
		return {
			[FocusNavigationEventNameEnum.HoldToJoinFriend] = { handler = UseButtonHoldResult.eventHandler }
		}
	end, { UseButtonHoldResult.eventHandler }), (ReactFocusNavigationModule.useEventMap((ReactModule.useMemo(function() --[[ Line: 72 ]]
		-- upvalues: FocusNavigationEventNameEnum (upval)
		return {
			[Enum.KeyCode.ButtonA] = FocusNavigationEventNameEnum.HoldToJoinFriend
		}
	end, {})))))
	ReactModule.useEffect(function() --[[ Line: 90 ]]
		-- upvalues: UseEventHandlerMapResult (copy), p1 (copy), UseFocusedGuiObjectResult (copy)
		if not UseEventHandlerMapResult then return end
		local Current = p1.tileRef.current
		local Current1 = if p1.cardRef then p1.cardRef.current else nil
		local v1 = nil
		
		if UseFocusedGuiObjectResult then
			local IsUseFocusedGuiObjectResultMatch = Current1 and (UseFocusedGuiObjectResult == Current1 or UseFocusedGuiObjectResult:IsDescendantOf(Current1))
			
			if Current and (UseFocusedGuiObjectResult == Current or UseFocusedGuiObjectResult:IsDescendantOf(Current)) or IsUseFocusedGuiObjectResultMatch then
				v1 = UseFocusedGuiObjectResult
			end
		end
		UseEventHandlerMapResult(v1)
		
		return function() --[[ Line: 105 ]]
			-- upvalues: UseEventHandlerMapResult (upval)
			UseEventHandlerMapResult(nil)
		end
	end, {
		UseEventHandlerMapResult,
		p1.tileRef,
		p1.cardRef,
		UseFocusedGuiObjectResult
	})
	
	return nil
end
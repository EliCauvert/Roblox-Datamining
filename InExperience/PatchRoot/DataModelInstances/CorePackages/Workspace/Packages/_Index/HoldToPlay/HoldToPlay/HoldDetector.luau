local HoldToPlay = script:FindFirstAncestor("HoldToPlay")
local Parent = HoldToPlay.Parent
local ReactModule = require(Parent.React)
local UseSelectedFunction = require(Parent.GuiObjectUtils).useSelected
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local AppShortcutBarContext = require(Parent.AppShortcutBar).AppShortcutBarContext
local UseButtonHoldFunction = FocusNavigationUtilsModule.useButtonHold
local ButtonHoldStateEnum = FocusNavigationUtilsModule.ButtonHoldStateEnum
local ConstantsModule = require(HoldToPlay.Constants)
local FFlagUserSearchCancelTileActivationOnHoldIntent = require(Parent.SharedFlags).FFlagUserSearchCancelTileActivationOnHoldIntent

local function HoldDetectorForSelectedObject(p1)
	-- upvalues: ReactModule (copy), UseButtonHoldFunction (copy), ConstantsModule (copy), AppShortcutBarContext (copy), ButtonHoldStateEnum (copy), FFlagUserSearchCancelTileActivationOnHoldIntent (copy), ReactFocusNavigationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3 = UseStateResult or p1.keyCode
	local UseStateResult1_1 = UseStateResult1 or p1.focusNavigationEventName
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseButtonHoldResult = UseButtonHoldFunction(ConstantsModule.SIGNAL_HOLD_INTENT_SECONDS, ConstantsModule.SIGNAL_HOLD_COMPLETE_SECONDS, true)
	local UseDispatchButtonHoldStartedResult = AppShortcutBarContext.useDispatchButtonHoldStarted()
	local UseDispatchButtonHoldEndedResult = AppShortcutBarContext.useDispatchButtonHoldEnded()
	local IsHoldStateMatch: boolean = UseButtonHoldResult.holdState == ButtonHoldStateEnum.HOLDING or (UseButtonHoldResult.holdState == ButtonHoldStateEnum.JUST_PRESSED or UseButtonHoldResult.holdState == ButtonHoldStateEnum.COMPLETED)
	local IsHoldStateMatch1: boolean = FFlagUserSearchCancelTileActivationOnHoldIntent and (UseButtonHoldResult.holdState == ButtonHoldStateEnum.HOLDING or UseButtonHoldResult.holdState == ButtonHoldStateEnum.COMPLETED)
	local IsDisableRegularActionOnHoldIntent: boolean = FFlagUserSearchCancelTileActivationOnHoldIntent and p1.disableRegularActionOnHoldIntent == true
	ReactModule.useEffect(function()
		-- upvalues: IsDisableRegularActionOnHoldIntent (copy), p1 (copy), IsHoldStateMatch1 (copy), IsHoldStateMatch (copy), FFlagUserSearchCancelTileActivationOnHoldIntent (upval)
		if IsDisableRegularActionOnHoldIntent then
			if p1.setDisabledForHold then
				p1.setDisabledForHold(IsHoldStateMatch1)
			end
		elseif not IsHoldStateMatch and p1.setDisabledForHold then
			p1.setDisabledForHold(false)
		end
		return function()
			-- upvalues: p1 (upval), FFlagUserSearchCancelTileActivationOnHoldIntent (upval), IsDisableRegularActionOnHoldIntent (upval), IsHoldStateMatch1 (upval)
			if p1.setDisabledForHold and (not FFlagUserSearchCancelTileActivationOnHoldIntent or (not IsDisableRegularActionOnHoldIntent or not IsHoldStateMatch1)) then
				p1.setDisabledForHold(false)
			end
		end
	end, {
		IsHoldStateMatch,
		p1.setDisabledForHold,
		if IsDisableRegularActionOnHoldIntent then IsHoldStateMatch1 else false
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), IsHoldStateMatch (copy), p1 (copy), UseDispatchButtonHoldStartedResult (copy), UseButtonHoldResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult1_1 (copy), UseDispatchButtonHoldEndedResult (copy), UseRefResult1 (copy)
		if UseRefResult.current or not IsHoldStateMatch then
			if UseRefResult.current and not IsHoldStateMatch then
				if UseStateResult1_1 then
					UseDispatchButtonHoldEndedResult(UseStateResult1_1)
				end
				UseStateResult2(nil)
				UseStateResult2_1(nil)
				UseRefResult.current = false
				
				if UseRefResult1.current then
					UseRefResult1.current = false
				end
			end
			return
		else
			UseRefResult.current = true
			
			if p1.focusNavigationEventName then
				UseDispatchButtonHoldStartedResult(p1.focusNavigationEventName, UseButtonHoldResult.holdProgress)
			end
			UseStateResult2(p1.keyCode)
			UseStateResult2_1(p1.focusNavigationEventName)
		end
	end, {
		IsHoldStateMatch, UseButtonHoldResult.holdProgress,
		UseDispatchButtonHoldStartedResult, UseDispatchButtonHoldEndedResult,
		p1.focusNavigationEventName, p1.keyCode, UseStateResult1_1, UseStateResult3
	})
	local IsNotCurrent: boolean = UseButtonHoldResult.holdState == ButtonHoldStateEnum.COMPLETED and UseRefResult1.current == false
	ReactModule.useEffect(function()
		-- upvalues: IsNotCurrent (copy), p1 (copy), UseRefResult1 (copy), IsDisableRegularActionOnHoldIntent (copy)
		if IsNotCurrent and p1.onHoldDetected then
			UseRefResult1.current = true
			
			if p1.setDisabledForHold and not IsDisableRegularActionOnHoldIntent then
				p1.setDisabledForHold(true)
			end
			p1.onHoldDetected(p1.guiObject)
		end
	end, {
		IsNotCurrent,
		p1.onHoldDetected,
		p1.guiObject,
		p1.setDisabledForHold,
		IsDisableRegularActionOnHoldIntent
	})
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: UseStateResult1_1 (copy), UseButtonHoldResult (copy)
		return if UseStateResult1_1 then {
			[UseStateResult1_1] = { handler = UseButtonHoldResult.eventHandler }
		} else {}
	end, { UseButtonHoldResult.eventHandler, UseStateResult1_1 }), (ReactFocusNavigationModule.useEventMap((ReactModule.useMemo(function()
		-- upvalues: UseStateResult3 (copy), UseStateResult1_1 (copy)
		return if UseStateResult3 and UseStateResult1_1 then { [UseStateResult3] = UseStateResult1_1 } else {}
	end, { UseStateResult3, UseStateResult1_1 })))))
	ReactModule.useEffect(function()
		-- upvalues: UseEventHandlerMapResult (copy), p1 (copy)
		if UseEventHandlerMapResult then
			UseEventHandlerMapResult(p1.guiObject)
		end
		return function()
			-- upvalues: UseEventHandlerMapResult (upval)
			UseEventHandlerMapResult(nil)
		end
	end, { UseEventHandlerMapResult, p1.guiObject })
	
	return nil
end

return ReactModule.memo(function(p1)
	-- upvalues: UseSelectedFunction (copy), ReactModule (copy), HoldDetectorForSelectedObject (copy)
	return if UseSelectedFunction({ current = p1.guiObject }) then ReactModule.createElement(HoldDetectorForSelectedObject, p1) else nil
end)
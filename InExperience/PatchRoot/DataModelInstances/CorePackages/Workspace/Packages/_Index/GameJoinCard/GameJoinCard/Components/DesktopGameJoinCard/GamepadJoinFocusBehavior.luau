local parent = script:FindFirstAncestor("GameJoinCard").Parent
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local holdToPlayModule = require(parent.HoldToPlay)
local appShortcutBarContext = require(parent.AppShortcutBar).AppShortcutBarContext
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local buttonHoldStateEnum = focusNavigationUtilsModule.ButtonHoldStateEnum
local useButtonHold = focusNavigationUtilsModule.useButtonHold
local constants = holdToPlayModule.Constants

return function(p0) --[[ line: 21 | named "GamepadJoinFocusBehavior" ]]
	-- upvalues: reactFocusNavigationModule (ref), reactModule (ref), useButtonHold (ref), constants (ref), appShortcutBarContext (ref), buttonHoldStateEnum (ref), focusNavigationEventNameEnum (ref)
	local var4 = reactFocusNavigationModule.useFocusedGuiObject()
	local var5 = reactModule.useRef(p0.joinExperience)
	var5.current = p0.joinExperience
	local var6 = useButtonHold(constants.SIGNAL_HOLD_INTENT_SECONDS, constants.SIGNAL_HOLD_COMPLETE_SECONDS)
	local var7 = appShortcutBarContext.useDispatchButtonHoldStarted()
	local var8 = appShortcutBarContext.useDispatchButtonHoldEnded()
	local var9 = reactModule.useRef(false)
	local var10 = if var6.holdState ~= buttonHoldStateEnum.HOLDING then if var6.holdState ~= buttonHoldStateEnum.JUST_PRESSED then var6.holdState == buttonHoldStateEnum.COMPLETED else true else true
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: var9 (ref), var10 (ref), var7 (ref), focusNavigationEventNameEnum (copy), var6 (ref), var8 (ref)
		if not var9.current and var10 then
			var9.current = true
			var7(focusNavigationEventNameEnum.HoldToJoinFriend, var6.holdProgress)
			
			return
		elseif var9.current and not var10 then
			var8(focusNavigationEventNameEnum.HoldToJoinFriend)
			var9.current = false
		end
	end, { var10, var6.holdProgress, var7, var8 })
	local var11 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 57 ]]
		-- upvalues: var6 (ref), buttonHoldStateEnum (copy), var11 (ref), var5 (ref)
		if var6.holdState ~= buttonHoldStateEnum.COMPLETED then
			var11.current = false
			
			return
		elseif var11.current then return end
		var11.current = true
		var5.current()
		
		if var6.cancelHold then
			var6.cancelHold()
		end
	end, { var6.holdState, var6.cancelHold })
	local var12 = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function() --[[ line: 78 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), var6 (ref)
		return {
			[focusNavigationEventNameEnum.HoldToJoinFriend] = { handler = var6.eventHandler }
		}
	end, { var6.eventHandler }), reactFocusNavigationModule.useEventMap(reactModule.useMemo(function() --[[ line: 72 ]]
		-- upvalues: focusNavigationEventNameEnum (copy)
		return {
			[Enum.KeyCode.ButtonA] = focusNavigationEventNameEnum.HoldToJoinFriend
		}
	end, {})))
	reactModule.useEffect(function() --[[ line: 90 ]]
		-- upvalues: var12 (ref), p0 (ref), var4 (ref)
		if not var12 then return end
		local current = p0.tileRef.current
		local var13 = if p0.cardRef then p0.cardRef.current else nil
		local var14 = nil
		
		if var4 then
			if (current and (if var4 ~= current then var4:IsDescendantOf(current) else true)) or (var13 and (if var4 ~= var13 then var4:IsDescendantOf(var13) else true)) then
				var14 = var4
			end
		end
		var12(var14)
		
		return function() --[[ line: 105 ]]
			-- upvalues: var12 (copy)
			var12(nil)
		end
	end, { var12, p0.tileRef, p0.cardRef, var4 })
	
	return nil
end
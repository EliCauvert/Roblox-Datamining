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

return function(p1)
	-- upvalues: reactFocusNavigationModule (ref), reactModule (ref), useButtonHold (ref), constants (ref), appShortcutBarContext (ref), buttonHoldStateEnum (ref), focusNavigationEventNameEnum (ref)
	local var1 = reactFocusNavigationModule.useFocusedGuiObject()
	local var2 = reactModule.useRef(p1.joinExperience)
	var2.current = p1.joinExperience
	local var3 = useButtonHold(constants.SIGNAL_HOLD_INTENT_SECONDS, constants.SIGNAL_HOLD_COMPLETE_SECONDS)
	local var4 = appShortcutBarContext.useDispatchButtonHoldStarted()
	local var5 = appShortcutBarContext.useDispatchButtonHoldEnded()
	local var6 = reactModule.useRef(false)
	local var7 = if var3.holdState ~= buttonHoldStateEnum.HOLDING then if var3.holdState ~= buttonHoldStateEnum.JUST_PRESSED then var3.holdState == buttonHoldStateEnum.COMPLETED else true else true
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var7 (ref), var4 (ref), focusNavigationEventNameEnum (copy), var3 (ref), var5 (ref)
		if not var6.current and var7 then
			var6.current = true
			var4(focusNavigationEventNameEnum.HoldToJoinFriend, var3.holdProgress)
			
			return
		elseif var6.current and not var7 then
			var5(focusNavigationEventNameEnum.HoldToJoinFriend)
			var6.current = false
		end
	end, { var7, var3.holdProgress, var4, var5 })
	local var8 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), buttonHoldStateEnum (copy), var8 (ref), var2 (ref)
		if var3.holdState ~= buttonHoldStateEnum.COMPLETED then
			var8.current = false
			
			return
		elseif var8.current then return end
		var8.current = true
		var2.current()
		
		if var3.cancelHold then
			var3.cancelHold()
		end
	end, { var3.holdState, var3.cancelHold })
	local var9 = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), var3 (ref)
		return {
			[focusNavigationEventNameEnum.HoldToJoinFriend] = { handler = var3.eventHandler }
		}
	end, { var3.eventHandler }), reactFocusNavigationModule.useEventMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy)
		return {
			[Enum.KeyCode.ButtonA] = focusNavigationEventNameEnum.HoldToJoinFriend
		}
	end, {})))
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), p1 (ref), var1 (ref)
		if not var9 then return end
		local current = p1.tileRef.current
		local var10 = if p1.cardRef then p1.cardRef.current else nil
		local var11 = nil
		
		if var1 then
			if (current and (if var1 ~= current then var1:IsDescendantOf(current) else true)) or (var10 and (if var1 ~= var10 then var1:IsDescendantOf(var10) else true)) then
				var11 = var1
			end
		end
		var9(var11)
		
		return function()
			-- upvalues: var9 (copy)
			var9(nil)
		end
	end, { var9, p1.tileRef, p1.cardRef, var1 })
	
	return nil
end
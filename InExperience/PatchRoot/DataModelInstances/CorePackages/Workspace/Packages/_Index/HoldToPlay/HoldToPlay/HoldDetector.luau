local holdToPlay = script:FindFirstAncestor("HoldToPlay")
local parent = holdToPlay.Parent
local reactModule = require(parent.React)
local useSelected = require(parent.GuiObjectUtils).useSelected
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local appShortcutBarContext = require(parent.AppShortcutBar).AppShortcutBarContext
local useButtonHold = focusNavigationUtilsModule.useButtonHold
local buttonHoldStateEnum = focusNavigationUtilsModule.ButtonHoldStateEnum
local constantsModule = require(holdToPlay.Constants)

local function HoldDetectorForSelectedObject(p1)
	-- upvalues: reactModule (ref), useButtonHold (ref), constantsModule (ref), appShortcutBarContext (ref), buttonHoldStateEnum (ref), reactFocusNavigationModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3, var4 = reactModule.useState(nil)
	local var5 = var1 or p1.keyCode
	local var6 = var3 or p1.focusNavigationEventName
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(false)
	local var9 = useButtonHold(constantsModule.SIGNAL_HOLD_INTENT_SECONDS, constantsModule.SIGNAL_HOLD_COMPLETE_SECONDS, true)
	local var10 = appShortcutBarContext.useDispatchButtonHoldStarted()
	local var11 = appShortcutBarContext.useDispatchButtonHoldEnded()
	local var12 = if var9.holdState ~= buttonHoldStateEnum.HOLDING then if var9.holdState ~= buttonHoldStateEnum.JUST_PRESSED then var9.holdState == buttonHoldStateEnum.COMPLETED else true else true
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), p1 (ref)
		if not var12 and p1.setDisabledForHold then
			p1.setDisabledForHold(false)
		end
		return function()
			-- upvalues: p1 (copy)
			if p1.setDisabledForHold then
				p1.setDisabledForHold(false)
			end
		end
	end, { var12, p1.setDisabledForHold })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var12 (ref), p1 (ref), var10 (ref), var9 (ref), var2 (ref), var4 (ref), var6 (ref), var11 (ref), var8 (ref)
		if var7.current or not var12 then
			if var7.current and not var12 then
				if var6 then
					var11(var6)
				end
				var2(nil)
				var4(nil)
				var7.current = false
				
				if var8.current then
					var8.current = false
				end
			end
			return
		else
			var7.current = true
			
			if p1.focusNavigationEventName then
				var10(p1.focusNavigationEventName, var9.holdProgress)
			end
			var2(p1.keyCode)
			var4(p1.focusNavigationEventName)
		end
	end, {
		var12, var9.holdProgress, var10, var11, p1.focusNavigationEventName,
		p1.keyCode, var6, var5
	})
	local var13 = var9.holdState == buttonHoldStateEnum.COMPLETED and var8.current == false
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), p1 (ref), var8 (ref)
		if var13 and p1.onHoldDetected then
			var8.current = true
			
			if p1.setDisabledForHold then
				p1.setDisabledForHold(true)
			end
			p1.onHoldDetected(p1.guiObject)
		end
	end, {
		var13,
		p1.onHoldDetected,
		p1.guiObject,
		p1.setDisabledForHold
	})
	local var14 = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: var6 (ref), var9 (ref)
		return if var6 then { [var6] = { handler = var9.eventHandler } } else {}
	end, { var9.eventHandler, var6 }), reactFocusNavigationModule.useEventMap(reactModule.useMemo(function()
		-- upvalues: var5 (ref), var6 (ref)
		return if var5 and var6 then { [var5] = var6 } else {}
	end, { var5, var6 })))
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), p1 (ref)
		if var14 then
			var14(p1.guiObject)
		end
		return function()
			-- upvalues: var14 (copy)
			var14(nil)
		end
	end, { var14, p1.guiObject })
	
	return nil
end

return reactModule.memo(function(p1)
	-- upvalues: useSelected (ref), reactModule (ref), HoldDetectorForSelectedObject (ref)
	return if useSelected({ current = p1.guiObject }) then reactModule.createElement(HoldDetectorForSelectedObject, p1) else nil
end)
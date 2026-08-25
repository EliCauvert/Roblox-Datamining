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

local function HoldDetectorForSelectedObject(p0)
	-- upvalues: reactModule (ref), useButtonHold (ref), constantsModule (ref), appShortcutBarContext (ref), buttonHoldStateEnum (ref), reactFocusNavigationModule (ref)
	local var6, var7 = reactModule.useState(nil)
	local var8, var9 = reactModule.useState(nil)
	local var6_1 = var6 or p0.keyCode
	local var8_1 = var8 or p0.focusNavigationEventName
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(false)
	local var14 = useButtonHold(constantsModule.SIGNAL_HOLD_INTENT_SECONDS, constantsModule.SIGNAL_HOLD_COMPLETE_SECONDS, true)
	local var15 = appShortcutBarContext.useDispatchButtonHoldStarted()
	local var16 = appShortcutBarContext.useDispatchButtonHoldEnded()
	local var17 = if var14.holdState ~= buttonHoldStateEnum.HOLDING then if var14.holdState ~= buttonHoldStateEnum.JUST_PRESSED then var14.holdState == buttonHoldStateEnum.COMPLETED else true else true
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), p0 (ref)
		if not var17 and p0.setDisabledForHold then
			p0.setDisabledForHold(false)
		end
		return function()
			-- upvalues: p0 (copy)
			if p0.setDisabledForHold then
				p0.setDisabledForHold(false)
			end
		end
	end, { var17, p0.setDisabledForHold })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var17 (ref), p0 (ref), var15 (ref), var14 (ref), var7 (ref), var9 (ref), var8_1 (ref), var16 (ref), var13 (ref)
		if var12.current or not var17 then
			if var12.current and not var17 then
				if var8_1 then
					var16(var8_1)
				end
				var7(nil)
				var9(nil)
				var12.current = false
				
				if var13.current then
					var13.current = false
				end
			end
			return
		else
			var12.current = true
			
			if p0.focusNavigationEventName then
				var15(p0.focusNavigationEventName, var14.holdProgress)
			end
			var7(p0.keyCode)
			var9(p0.focusNavigationEventName)
		end
	end, {
		var17, var14.holdProgress, var15, var16, p0.focusNavigationEventName,
		p0.keyCode, var8_1, var6_1
	})
	local var18 = var14.holdState == buttonHoldStateEnum.COMPLETED and var13.current == false
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), p0 (ref), var13 (ref)
		if var18 and p0.onHoldDetected then
			var13.current = true
			
			if p0.setDisabledForHold then
				p0.setDisabledForHold(true)
			end
			p0.onHoldDetected(p0.guiObject)
		end
	end, {
		var18,
		p0.onHoldDetected,
		p0.guiObject,
		p0.setDisabledForHold
	})
	local var19 = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: var8_1 (ref), var14 (ref)
		return if var8_1 then { [var8_1] = { handler = var14.eventHandler } } else {}
	end, { var14.eventHandler, var8_1 }), reactFocusNavigationModule.useEventMap(reactModule.useMemo(function()
		-- upvalues: var6_1 (ref), var8_1 (ref)
		return if var6_1 and var8_1 then { [var6_1] = var8_1 } else {}
	end, { var6_1, var8_1 })))
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), p0 (ref)
		if var19 then
			var19(p0.guiObject)
		end
		return function()
			-- upvalues: var19 (copy)
			var19(nil)
		end
	end, { var19, p0.guiObject })
	
	return nil
end

return reactModule.memo(function(p1)
	-- upvalues: useSelected (ref), reactModule (ref), HoldDetectorForSelectedObject (ref)
	return if useSelected({ current = p1.guiObject }) then reactModule.createElement(HoldDetectorForSelectedObject, p1) else nil
end)
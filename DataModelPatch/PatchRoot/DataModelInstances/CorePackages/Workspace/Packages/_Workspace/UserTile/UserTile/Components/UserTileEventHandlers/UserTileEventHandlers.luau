local Parent = script:FindFirstAncestor("UserTile").Parent
local ReactModule = require(Parent.React)
local HoldDetector = require(Parent.HoldToPlay).HoldDetector
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.FocusNavigationUtils)
local config = {
	primary = Enum.KeyCode.ButtonA,
	secondary = Enum.KeyCode.ButtonX
}

return function(p1)
	-- upvalues: ReactModule (copy), config (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), HoldDetector (copy)
	local TileRef = p1.tileRef
	local Buttons = p1.buttons
	local OnTileActivatedFunction = p1.onTileActivated
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = Current
	end, {})
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: Buttons (copy)
		if Buttons then
			return Buttons[#Buttons], Buttons[#Buttons - 1]
		else
			return nil, nil
		end
	end, { Buttons })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), OnTileActivatedFunction (copy)
		if not UseRefResult.current then
			OnTileActivatedFunction()
			
			return
		end
	end, { OnTileActivatedFunction })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy)
		if UseMemoResult and UseMemoResult.onActivated then
			UseMemoResult.onActivated()
		end
	end, { UseMemoResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult2 (copy)
		if UseMemoResult2 and UseMemoResult2.onActivated then
			UseMemoResult2.onActivated()
		end
	end, { UseMemoResult2 })
	local UseMemoResult1, UseMemoResult2_1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult2 (copy), config (upval), InputHandlersModule (upval), UseResult3 (copy)
		local FocusEventName = if UseMemoResult2 then UseMemoResult2.focusEventName else nil
		
		if FocusEventName then
			return { [config.secondary] = FocusEventName }, {
				[FocusEventName] = { handler = InputHandlersModule.onRelease(UseResult3) }
			}
		else
			return {}, {}
		end
	end, { UseMemoResult2, UseResult3 })
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(UseMemoResult2_1, (ReactFocusNavigationModule.useEventMap(UseMemoResult1)))
	ReactModule.useEffect(function()
		-- upvalues: UseEventHandlerMapResult (copy), TileRef (copy)
		if UseEventHandlerMapResult and TileRef then
			UseEventHandlerMapResult(TileRef.current)
		end
		return function()
			-- upvalues: UseEventHandlerMapResult (upval)
			UseEventHandlerMapResult(nil)
		end
	end, { UseEventHandlerMapResult })
	local FocusEventName = UseMemoResult and UseMemoResult.focusEventName or nil
	
	return if TileRef.current and FocusEventName then ReactModule.createElement(HoldDetector, {
		guiObject = TileRef.current,
		onHoldDetected = UseResult2,
		onRegularActivated = UseResult1,
		setDisabledForHold = UseResult,
		keyCode = config.primary,
		focusNavigationEventName = FocusEventName
	}) else nil
end
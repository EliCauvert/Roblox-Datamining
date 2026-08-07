local parent = script:FindFirstAncestor("UserTile").Parent
local reactModule = require(parent.React)
local holdDetector = require(parent.HoldToPlay).HoldDetector
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local _ = require(parent.FocusNavigationUtils)
local t = {
	primary = Enum.KeyCode.ButtonA,
	secondary = Enum.KeyCode.ButtonX
}

return function(p0) --[[ line: 30 | named "UserTileEventHandlers" ]]
	-- upvalues: reactModule (ref), t (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), holdDetector (ref)
	local tileRef = p0.tileRef
	local buttons = p0.buttons
	local onTileActivated = p0.onTileActivated
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useCallback(function(p1) --[[ line: 36 ]]
		-- upvalues: var4 (ref)
		var4.current = p1
	end, {})
	local var6, var7 = reactModule.useMemo(function() --[[ line: 40 ]]
		-- upvalues: buttons (ref)
		if buttons then
			return buttons[#buttons], buttons[#buttons - 1]
		end
		return nil, nil
	end, { buttons })
	local var8 = reactModule.useCallback(function() --[[ line: 47 ]]
		-- upvalues: var4 (ref), onTileActivated (ref)
		if var4.current then
			return
		end
		onTileActivated()
	end, { onTileActivated })
	local var9 = reactModule.useCallback(function() --[[ line: 54 ]]
		-- upvalues: var6 (ref)
		if var6 and var6.onActivated then
			var6.onActivated()
		end
	end, { var6 })
	local var10 = reactModule.useCallback(function() --[[ line: 60 ]]
		-- upvalues: var7 (ref)
		if var7 and var7.onActivated then
			var7.onActivated()
		end
	end, { var7 })
	local var11, var12 = reactModule.useMemo(function() --[[ line: 66 ]]
		-- upvalues: var7 (ref), t (copy), inputHandlersModule (copy), var10 (ref)
		local var15 = if var7 then var7.focusEventName else nil
		
		if var15 then
			return { [t.secondary] = var15 }, {
				[var15] = { handler = inputHandlersModule.onRelease(var10) }
			}
		end
		return {}, {}
	end, { var7, var10 })
	local var13 = reactFocusNavigationModule.useEventHandlerMap(var12, reactFocusNavigationModule.useEventMap(var11))
	reactModule.useEffect(function() --[[ line: 87 ]]
		-- upvalues: var13 (ref), tileRef (ref)
		if var13 and tileRef then
			var13(tileRef.current)
		end
		return function() --[[ line: 91 ]]
			-- upvalues: var13 (copy)
			var13(nil)
		end
	end, { var13 })
	local var14 = if var6 then var6.focusEventName else nil
	
	return if tileRef.current and var14 then reactModule.createElement(holdDetector, {
		guiObject = tileRef.current,
		onHoldDetected = var9,
		onRegularActivated = var8,
		setDisabledForHold = var5,
		keyCode = t.primary,
		focusNavigationEventName = var14
	}) else nil
end
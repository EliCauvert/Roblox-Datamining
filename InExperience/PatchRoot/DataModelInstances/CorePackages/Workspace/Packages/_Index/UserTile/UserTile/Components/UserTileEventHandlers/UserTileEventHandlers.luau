local parent = script:FindFirstAncestor("UserTile").Parent
local reactModule = require(parent.React)
local holdDetector = require(parent.HoldToPlay).HoldDetector
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local inputHandlersModule = require(parent.InputHandlers)
local _ = require(parent.FocusNavigationUtils)
local fFlagUserSearchCancelTileActivationOnHoldIntent = require(parent.SharedFlags).FFlagUserSearchCancelTileActivationOnHoldIntent
local t = {
	primary = Enum.KeyCode.ButtonA,
	secondary = Enum.KeyCode.ButtonX
}

return function(p1)
	-- upvalues: reactModule (ref), fFlagUserSearchCancelTileActivationOnHoldIntent (ref), t (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), holdDetector (ref)
	local tileRef = p1.tileRef
	local buttons = p1.buttons
	local onTileActivated = p1.onTileActivated
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), fFlagUserSearchCancelTileActivationOnHoldIntent (copy), p1 (ref)
		var1.current = p2
		
		if fFlagUserSearchCancelTileActivationOnHoldIntent and p1.setDisabledForHold then
			p1.setDisabledForHold(p2)
		end
	end, if fFlagUserSearchCancelTileActivationOnHoldIntent then { p1.setDisabledForHold } else {})
	local var3, var4 = reactModule.useMemo(function()
		-- upvalues: buttons (ref)
		if buttons then
			return buttons[#buttons], buttons[#buttons - 1]
		end
		return nil, nil
	end, { buttons })
	local var5 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), onTileActivated (ref)
		if var1.current then
			return
		end
		onTileActivated()
	end, { onTileActivated })
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		if var3 and var3.onActivated then
			var3.onActivated()
		end
	end, { var3 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		if var4 and var4.onActivated then
			var4.onActivated()
		end
	end, { var4 })
	local var8, var9 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), t (copy), inputHandlersModule (copy), var7 (ref)
		local var10 = if var4 then var4.focusEventName else nil
		
		if var10 then
			return { [t.secondary] = var10 }, {
				[var10] = { handler = inputHandlersModule.onRelease(var7) }
			}
		end
		return {}, {}
	end, { var4, var7 })
	local var10 = reactFocusNavigationModule.useEventHandlerMap(var9, reactFocusNavigationModule.useEventMap(var8))
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), tileRef (ref)
		if var10 and tileRef then
			var10(tileRef.current)
		end
		return function()
			-- upvalues: var10 (copy)
			var10(nil)
		end
	end, {
		var10,
		if fFlagUserSearchCancelTileActivationOnHoldIntent then tileRef else nil
	})
	
	if fFlagUserSearchCancelTileActivationOnHoldIntent then
		reactModule.useEffect(function()
			-- upvalues: tileRef (ref), var1 (ref), p1 (ref), t (copy)
			if not tileRef then return end
			local current = tileRef.current
			
			if current then
				local selectionLostConnection = current.SelectionLost:Connect(function()
					-- upvalues: var1 (copy), p1 (copy)
					if not var1.current then return end
					var1.current = false
					
					if p1.setDisabledForHold then
						p1.setDisabledForHold(false)
					end
				end)
				local inputBeganConnection = current.InputBegan:Connect(function(p2)
					-- upvalues: t (copy), var1 (copy), p1 (copy)
					local userInputType = p2.UserInputType
					
					if p2.UserInputState == Enum.UserInputState.Begin and ((if userInputType ~= Enum.UserInputType.MouseButton1 then userInputType == Enum.UserInputType.Touch else true) or p2.KeyCode == t.primary) then
						if not var1.current then return end
						var1.current = false
						
						if p1.setDisabledForHold then
							p1.setDisabledForHold(false)
						end
					end
				end)
				
				return function()
					-- upvalues: selectionLostConnection (ref), inputBeganConnection (ref)
					selectionLostConnection:Disconnect()
					inputBeganConnection:Disconnect()
				end
			end
		end, { p1.setDisabledForHold, tileRef })
	end
	local var11 = if var3 then var3.focusEventName else nil
	
	return if tileRef.current and var11 then reactModule.createElement(holdDetector, {
		guiObject = tileRef.current,
		onHoldDetected = var6,
		onRegularActivated = var5,
		setDisabledForHold = var2,
		keyCode = t.primary,
		focusNavigationEventName = var11,
		disableRegularActionOnHoldIntent = p1.disableRegularActionOnHoldIntent
	}) else nil
end
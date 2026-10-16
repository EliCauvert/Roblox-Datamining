local Parent = script:FindFirstAncestor("UserTile").Parent
local ReactModule = require(Parent.React)
local HoldDetector = require(Parent.HoldToPlay).HoldDetector
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.FocusNavigationUtils)
local FFlagUserSearchCancelTileActivationOnHoldIntent = require(Parent.SharedFlags).FFlagUserSearchCancelTileActivationOnHoldIntent
local config = {
	primary = Enum.KeyCode.ButtonA,
	secondary = Enum.KeyCode.ButtonX
}

return function(p1) --[[ Line: 34 | Named "UserTileEventHandlers" ]]
	-- upvalues: ReactModule (copy), FFlagUserSearchCancelTileActivationOnHoldIntent (copy), config (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), HoldDetector (copy)
	local TileRef = p1.tileRef
	local Buttons = p1.buttons
	local OnTileActivatedFunction = p1.onTileActivated
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 41 ]]
		-- upvalues: UseRefResult (copy), FFlagUserSearchCancelTileActivationOnHoldIntent (upval), p1 (copy)
		UseRefResult.current = Current
		
		if FFlagUserSearchCancelTileActivationOnHoldIntent and p1.setDisabledForHold then
			p1.setDisabledForHold(Current)
		end
	end, if FFlagUserSearchCancelTileActivationOnHoldIntent then { p1.setDisabledForHold } else {})
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 48 ]]
		-- upvalues: Buttons (copy)
		if Buttons then
			return Buttons[#Buttons], Buttons[#Buttons - 1]
		else
			return nil, nil
		end
	end, { Buttons })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 55 ]]
		-- upvalues: UseRefResult (copy), OnTileActivatedFunction (copy)
		if not UseRefResult.current then
			OnTileActivatedFunction()
			
			return
		end
	end, { OnTileActivatedFunction })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 62 ]]
		-- upvalues: UseMemoResult (copy)
		if UseMemoResult and UseMemoResult.onActivated then
			UseMemoResult.onActivated()
		end
	end, { UseMemoResult })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 68 ]]
		-- upvalues: UseMemoResult2 (copy)
		if UseMemoResult2 and UseMemoResult2.onActivated then
			UseMemoResult2.onActivated()
		end
	end, { UseMemoResult2 })
	local UseMemoResult1, UseMemoResult2_1 = ReactModule.useMemo(function() --[[ Line: 74 ]]
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
	ReactModule.useEffect(function() --[[ Line: 96 ]]
		-- upvalues: UseEventHandlerMapResult (copy), TileRef (copy)
		if UseEventHandlerMapResult and TileRef then
			UseEventHandlerMapResult(TileRef.current)
		end
		return function() --[[ Line: 100 ]]
			-- upvalues: UseEventHandlerMapResult (upval)
			UseEventHandlerMapResult(nil)
		end
	end, {
		UseEventHandlerMapResult,
		if FFlagUserSearchCancelTileActivationOnHoldIntent then TileRef else nil
	})
	
	if FFlagUserSearchCancelTileActivationOnHoldIntent then
		ReactModule.useEffect(function() --[[ Line: 113 ]]
			-- upvalues: TileRef (copy), UseRefResult (copy), p1 (copy), config (upval)
			if not TileRef then return end
			local Current = TileRef.current
			
			if not Current then return end
			local SelectionLostConnection = Current.SelectionLost:Connect(function() --[[ Line: 121 | Named "clearHoldGuard" ]]
				-- upvalues: UseRefResult (upval), p1 (upval)
				if not UseRefResult.current then return end
				UseRefResult.current = false
				
				if p1.setDisabledForHold then
					p1.setDisabledForHold(false)
				end
			end)
			local InputBeganConnection = Current.InputBegan:Connect(function(Input) --[[ Line: 131 ]]
				-- upvalues: config (upval), UseRefResult (upval), p1 (upval)
				local UserInputType = Input.UserInputType
				local IsUserInputTypeMatch: boolean = UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch
				local IsKeyCodeMatch = Input.KeyCode == config.primary
				
				if Input.UserInputState == Enum.UserInputState.Begin and (IsUserInputTypeMatch or IsKeyCodeMatch) then
					if not UseRefResult.current then return end
					UseRefResult.current = false
					
					if p1.setDisabledForHold then
						p1.setDisabledForHold(false)
					end
				end
			end)
			
			return function() --[[ Line: 141 ]]
				-- upvalues: SelectionLostConnection (copy), InputBeganConnection (copy)
				SelectionLostConnection:Disconnect()
				InputBeganConnection:Disconnect()
			end
		end, { p1.setDisabledForHold, TileRef })
	end
	local FocusEventName = UseMemoResult and UseMemoResult.focusEventName or nil
	
	return if TileRef.current and FocusEventName then ReactModule.createElement(HoldDetector, {
		guiObject = TileRef.current,
		onHoldDetected = UseResult2,
		onRegularActivated = UseResult1,
		setDisabledForHold = UseResult,
		keyCode = config.primary,
		focusNavigationEventName = FocusEventName,
		disableRegularActionOnHoldIntent = p1.disableRegularActionOnHoldIntent
	}) else nil
end
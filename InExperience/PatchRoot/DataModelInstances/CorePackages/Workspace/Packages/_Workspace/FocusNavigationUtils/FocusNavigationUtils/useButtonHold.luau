local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent
local argCheckModule = require(parent.ArgCheck)
local buttonHoldStateEnumModule = require(focusNavigationUtils.ButtonHoldStateEnum)
local buttonHoldCompletedSignalModule = require(focusNavigationUtils.ButtonHoldCompletedSignal)
local fFlagEnableFocusNavTelemetry = require(parent.SharedFlags).FFlagEnableFocusNavTelemetry
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)

local function useFakeCancelHoldAfterBlur(p1, p2, p3)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), p3 (ref)
		p2({ eventData = { UserInputState = Enum.UserInputState.End } })
		p3()
	end, { p2, p3 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1 and p1:IsA("GuiObject") then
			local selectionLostConnection = p1.SelectionLost:Connect(var1)
			
			return function()
				-- upvalues: selectionLostConnection (ref)
				selectionLostConnection:Disconnect()
			end
		end
		return function() end
	end, { p1, var1 })
end

return function(p1, p2, p3)
	-- upvalues: argCheckModule (ref), reactModule (ref), buttonHoldStateEnumModule (ref), fFlagEnableFocusNavTelemetry (ref), buttonHoldCompletedSignalModule (ref), inputHandlersModule (ref), useFakeCancelHoldAfterBlur (ref)
	argCheckModule.assert(p1 >= 0, "signalHoldIntentSeconds must be greater than or equal to 0")
	argCheckModule.assert(p2 > 0, "signalHoldCompleteSeconds must be greater than 0")
	argCheckModule.assert(p1 < p2, "signalHoldIntentSeconds should be less than signalHoldCompleteSeconds")
	local var1, var2 = reactModule.useState(buttonHoldStateEnumModule.NOT_HELD)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useBinding(0)
	local var6, var7 = reactModule.useState(nil)
	local var8 = if fFlagEnableFocusNavTelemetry then reactModule.useRef(nil) else nil
	local var9 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref), buttonHoldStateEnumModule (copy)
		var3.current = tick()
		var2(buttonHoldStateEnumModule.JUST_PRESSED)
	end, {})
	local var10 = reactModule.useCallback(function(_)
		-- upvalues: argCheckModule (copy), var3 (ref), var5 (ref), var4 (ref), p1 (ref), var2 (ref), buttonHoldStateEnumModule (copy)
		local currentTime = tick()
		argCheckModule.assert(var3.current ~= nil, "startTime.current should not be nil")
		
		if var3.current then
			argCheckModule.assert(var3.current <= currentTime, "startTime.current should be less than or equal to tick()")
			var5(currentTime - var3.current)
		end
		if p1 <= var4:getValue() then
			var2(buttonHoldStateEnumModule.HOLDING)
		end
	end, { var4, p1 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), p2 (ref), var3 (ref), var2 (ref), buttonHoldStateEnumModule (copy), fFlagEnableFocusNavTelemetry (copy), var8 (write), buttonHoldCompletedSignalModule (copy)
		var5(p2)
		var3.current = nil
		var2(buttonHoldStateEnumModule.COMPLETED)
		
		if fFlagEnableFocusNavTelemetry and var8 and var8.current then
			local current = var8.current
			buttonHoldCompletedSignalModule:fire(current.eventName, current.keyCode, current.userInputType)
		end
	end, { p2 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var3 (ref), var2 (ref), buttonHoldStateEnumModule (copy)
		var5(0)
		var3.current = nil
		var2(buttonHoldStateEnumModule.NOT_HELD)
	end, {})
	local var13 = reactModule.useCallback(inputHandlersModule.handleInput({
		hold = {
			durationSeconds = p2,
			onStep = var10,
			onComplete = var11,
			allowReleaseAfterHold = p3
		},
		onPress = var9,
		onRelease = var12
	}), {
		var12,
		var10,
		var11,
		p2,
		p3
	})
	local var14 = reactModule.useCallback(function(p4)
		-- upvalues: var7 (ref), fFlagEnableFocusNavTelemetry (copy), var8 (write), var13 (ref)
		var7(p4.targetInstance)
		
		if fFlagEnableFocusNavTelemetry and var8 and p4.eventName then
			var8.current = {
				eventName = p4.eventName,
				keyCode = if p4.eventData then p4.eventData.KeyCode else nil,
				userInputType = if p4.eventData then p4.eventData.UserInputType else nil
			}
		end
		var13(p4)
	end, { var13 })
	useFakeCancelHoldAfterBlur(var6, var13, var12)
	
	return {
		eventHandler = var14,
		holdState = var1,
		holdTime = var4,
		holdProgress = var4:map(function(p4)
			-- upvalues: p2 (ref)
			return p4 / p2
		end),
		cancelHold = var12
	}
end
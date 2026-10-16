local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent
local argCheckModule = require(parent.ArgCheck)
local buttonHoldStateEnumModule = require(focusNavigationUtils.ButtonHoldStateEnum)
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
	-- upvalues: argCheckModule (ref), reactModule (ref), buttonHoldStateEnumModule (ref), inputHandlersModule (ref), useFakeCancelHoldAfterBlur (ref)
	argCheckModule.assert(p1 >= 0, "signalHoldIntentSeconds must be greater than or equal to 0")
	argCheckModule.assert(p2 > 0, "signalHoldCompleteSeconds must be greater than 0")
	argCheckModule.assert(p1 < p2, "signalHoldIntentSeconds should be less than signalHoldCompleteSeconds")
	local var1, var2 = reactModule.useState(buttonHoldStateEnumModule.NOT_HELD)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useBinding(0)
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref), buttonHoldStateEnumModule (copy)
		var3.current = tick()
		var2(buttonHoldStateEnumModule.JUST_PRESSED)
	end, {})
	local var9 = reactModule.useCallback(function(_)
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
	local var10 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), p2 (ref), var3 (ref), var2 (ref), buttonHoldStateEnumModule (copy)
		var5(p2)
		var3.current = nil
		var2(buttonHoldStateEnumModule.COMPLETED)
	end, { p2 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var3 (ref), var2 (ref), buttonHoldStateEnumModule (copy)
		var5(0)
		var3.current = nil
		var2(buttonHoldStateEnumModule.NOT_HELD)
	end, {})
	local var12 = reactModule.useCallback(inputHandlersModule.handleInput({
		hold = {
			durationSeconds = p2,
			onStep = var9,
			onComplete = var10,
			allowReleaseAfterHold = p3
		},
		onPress = var8,
		onRelease = var11
	}), {
		var11,
		var9,
		var10,
		p2,
		p3
	})
	local var13 = reactModule.useCallback(function(p4)
		-- upvalues: var7 (ref), var12 (ref)
		var7(p4.targetInstance)
		var12(p4)
	end, { var12 })
	useFakeCancelHoldAfterBlur(var6, var12, var11)
	
	return {
		eventHandler = var13,
		holdState = var1,
		holdTime = var4,
		holdProgress = var4:map(function(p4)
			-- upvalues: p2 (ref)
			return p4 / p2
		end),
		cancelHold = var11
	}
end
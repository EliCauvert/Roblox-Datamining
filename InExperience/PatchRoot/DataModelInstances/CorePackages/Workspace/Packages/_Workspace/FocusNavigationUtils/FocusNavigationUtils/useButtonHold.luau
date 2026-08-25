local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent
local argCheckModule = require(parent.ArgCheck)
local buttonHoldStateEnumModule = require(focusNavigationUtils.ButtonHoldStateEnum)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)

local function useFakeCancelHoldAfterBlur(p0, p1, p2)
	-- upvalues: reactModule (ref)
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), p2 (ref)
		p1({ eventData = { UserInputState = Enum.UserInputState.End } })
		p2()
	end, { p1, p2 })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var6 (ref)
		if p0 and p0:IsA("GuiObject") then
			local selectionLostConnection = p0.SelectionLost:Connect(var6)
			
			return function()
				-- upvalues: selectionLostConnection (ref)
				selectionLostConnection:Disconnect()
			end
		end
		return function() end
	end, { p0, var6 })
end

return function(p3, p4, p5)
	-- upvalues: argCheckModule (ref), reactModule (ref), buttonHoldStateEnumModule (ref), inputHandlersModule (ref), useFakeCancelHoldAfterBlur (ref)
	argCheckModule.assert(p3 >= 0, "signalHoldIntentSeconds must be greater than or equal to 0")
	argCheckModule.assert(p4 > 0, "signalHoldCompleteSeconds must be greater than 0")
	argCheckModule.assert(p3 < p4, "signalHoldIntentSeconds should be less than signalHoldCompleteSeconds")
	local var8, var9 = reactModule.useState(buttonHoldStateEnumModule.NOT_HELD)
	local var10 = reactModule.useRef(nil)
	local var11, var12 = reactModule.useBinding(0)
	local var13, var14 = reactModule.useState(nil)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var9 (ref), buttonHoldStateEnumModule (copy)
		var10.current = tick()
		var9(buttonHoldStateEnumModule.JUST_PRESSED)
	end, {})
	local var16 = reactModule.useCallback(function(_)
		-- upvalues: argCheckModule (copy), var10 (ref), var12 (ref), var11 (ref), p3 (ref), var9 (ref), buttonHoldStateEnumModule (copy)
		local currentTime = tick()
		argCheckModule.assert(var10.current ~= nil, "startTime.current should not be nil")
		
		if var10.current then
			argCheckModule.assert(var10.current <= currentTime, "startTime.current should be less than or equal to tick()")
			var12(currentTime - var10.current)
		end
		if p3 <= var11:getValue() then
			var9(buttonHoldStateEnumModule.HOLDING)
		end
	end, { var11, p3 })
	local var17 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), p4 (ref), var10 (ref), var9 (ref), buttonHoldStateEnumModule (copy)
		var12(p4)
		var10.current = nil
		var9(buttonHoldStateEnumModule.COMPLETED)
	end, { p4 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var10 (ref), var9 (ref), buttonHoldStateEnumModule (copy)
		var12(0)
		var10.current = nil
		var9(buttonHoldStateEnumModule.NOT_HELD)
	end, {})
	local var19 = reactModule.useCallback(inputHandlersModule.handleInput({
		hold = {
			durationSeconds = p4,
			onStep = var16,
			onComplete = var17,
			allowReleaseAfterHold = p5
		},
		onPress = var15,
		onRelease = var18
	}), {
		var18,
		var16,
		var17,
		p4,
		p5
	})
	local var20 = reactModule.useCallback(function(p6)
		-- upvalues: var14 (ref), var19 (ref)
		var14(p6.targetInstance)
		var19(p6)
	end, { var19 })
	useFakeCancelHoldAfterBlur(var13, var19, var18)
	
	return {
		eventHandler = var20,
		holdState = var8,
		holdTime = var11,
		holdProgress = var11:map(function(p7)
			-- upvalues: p4 (ref)
			return p7 / p4
		end),
		cancelHold = var18
	}
end
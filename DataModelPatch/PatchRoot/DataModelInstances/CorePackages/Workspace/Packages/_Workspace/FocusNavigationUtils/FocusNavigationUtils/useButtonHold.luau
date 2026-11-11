local FocusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local Parent = FocusNavigationUtils.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local ButtonHoldStateEnumModule = require(FocusNavigationUtils.ButtonHoldStateEnum)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)

local function useFakeCancelHoldAfterBlur(Frame, Callback, Callback1)
	-- upvalues: ReactModule (copy)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Callback (copy), Callback1 (copy)
		Callback({ eventData = { UserInputState = Enum.UserInputState.End } })
		Callback1()
	end, { Callback, Callback1 })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseResult (copy)
		if Frame and Frame:IsA("GuiObject") then
			local SelectionLostConnection = Frame.SelectionLost:Connect(UseResult)
			
			return function()
				-- upvalues: SelectionLostConnection (copy)
				SelectionLostConnection:Disconnect()
			end
		else
			return function() end
		end
	end, { Frame, UseResult })
end

return function(p1: number, DurationSeconds: number, AllowReleaseAfterHold)
	-- upvalues: ArgCheckModule (copy), ReactModule (copy), ButtonHoldStateEnumModule (copy), InputHandlersModule (copy), useFakeCancelHoldAfterBlur (copy)
	ArgCheckModule.assert(p1 >= 0, "signalHoldIntentSeconds must be greater than or equal to 0")
	ArgCheckModule.assert(DurationSeconds > 0, "signalHoldCompleteSeconds must be greater than 0")
	ArgCheckModule.assert(p1 < DurationSeconds, "signalHoldIntentSeconds should be less than signalHoldCompleteSeconds")
	local UseStateResult, UseStateResult2 = ReactModule.useState(ButtonHoldStateEnumModule.NOT_HELD)
	local UseRefResult = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: ArgCheckModule (upval), UseRefResult (copy), UseBindingResult2 (copy), UseBindingResult (copy), p1 (copy), UseStateResult2 (copy), ButtonHoldStateEnumModule (upval)
		local CurrentTime = tick()
		ArgCheckModule.assert(UseRefResult.current ~= nil, "startTime.current should not be nil")
		
		if UseRefResult.current then
			ArgCheckModule.assert(UseRefResult.current <= CurrentTime, "startTime.current should be less than or equal to tick()")
			UseBindingResult2(CurrentTime - UseRefResult.current)
		end
		if p1 <= UseBindingResult:getValue() then
			UseStateResult2(ButtonHoldStateEnumModule.HOLDING)
		end
	end, { UseBindingResult, p1 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseBindingResult2 (copy), DurationSeconds (copy), UseRefResult (copy), UseStateResult2 (copy), ButtonHoldStateEnumModule (upval)
		UseBindingResult2(DurationSeconds)
		UseRefResult.current = nil
		UseStateResult2(ButtonHoldStateEnumModule.COMPLETED)
	end, { DurationSeconds })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseBindingResult2 (copy), UseRefResult (copy), UseStateResult2 (copy), ButtonHoldStateEnumModule (upval)
		UseBindingResult2(0)
		UseRefResult.current = nil
		UseStateResult2(ButtonHoldStateEnumModule.NOT_HELD)
	end, {})
	local UseResult3 = ReactModule.useCallback(InputHandlersModule.handleInput({
		hold = {
			durationSeconds = DurationSeconds,
			onStep = UseResult,
			onComplete = UseResult1,
			allowReleaseAfterHold = AllowReleaseAfterHold
		},
		onPress = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseStateResult2 (copy), ButtonHoldStateEnumModule (upval)
			UseRefResult.current = tick()
			UseStateResult2(ButtonHoldStateEnumModule.JUST_PRESSED)
		end, {}),
		onRelease = UseResult2
	}), {
		UseResult2,
		UseResult,
		UseResult1,
		DurationSeconds,
		AllowReleaseAfterHold
	})
	local UseResult4 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy), UseResult3 (copy)
		UseStateResult2_1(p2.targetInstance)
		UseResult3(p2)
	end, { UseResult3 })
	useFakeCancelHoldAfterBlur(UseStateResult1, UseResult3, UseResult2)
	
	return {
		eventHandler = UseResult4,
		holdState = UseStateResult,
		holdTime = UseBindingResult,
		holdProgress = UseBindingResult:map(function(p2)
			-- upvalues: DurationSeconds (copy)
			return p2 / DurationSeconds
		end),
		cancelHold = UseResult2
	}
end
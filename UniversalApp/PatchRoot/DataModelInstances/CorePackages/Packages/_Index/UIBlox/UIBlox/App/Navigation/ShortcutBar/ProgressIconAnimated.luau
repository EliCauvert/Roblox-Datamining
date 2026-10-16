local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReactModule = require(script.Parent.Parent.Parent.Parent.Parent.React)
local _ = require(script.Parent.Types)
local ProgressIconModule = require(script.Parent.ProgressIcon)

local function useRenderStepped(p1, p2, p3) --[[ Line: 33 ]]
	-- upvalues: ReactModule (copy), RunService (copy)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(0)
	local IsAnimationRunning = p1.isAnimationRunning
	local IsKeyPressed = p1.isKeyPressed
	local IsKeyHolding = p1.isKeyHolding
	local OnKeyHoldingFunction = p2.onKeyHolding
	local OnAnimationRunningFunction = p2.onAnimationRunning
	local OnCompleteFunction = p2.onComplete
	local OnResetFunction = p2.onReset
	local AnimationTriggerTime = p3.animationTriggerTime
	local AnimationKeyHoldingTime = p3.animationKeyHoldingTime
	local AnimationCoolDownTime = p3.animationCoolDownTime
	local UseResult = ReactModule.useCallback(function(p4) --[[ Line: 54 ]]
		-- upvalues: UseRefResult1 (copy), AnimationTriggerTime (copy), OnKeyHoldingFunction (copy)
		UseRefResult1.current += p4
		
		if AnimationTriggerTime <= UseRefResult1.current then
			OnKeyHoldingFunction()
		end
	end, { OnKeyHoldingFunction, AnimationTriggerTime })
	local UseResult1 = ReactModule.useCallback(function(p4) --[[ Line: 61 ]]
		-- upvalues: UseRefResult (copy), AnimationKeyHoldingTime (copy), OnAnimationRunningFunction (copy), OnCompleteFunction (copy)
		UseRefResult.current = math.clamp(UseRefResult.current + p4 / AnimationKeyHoldingTime, 0, 1)
		OnAnimationRunningFunction(UseRefResult.current)
		
		if UseRefResult.current >= 1 then
			OnCompleteFunction()
		end
	end, {
		OnAnimationRunningFunction,
		AnimationKeyHoldingTime,
		OnCompleteFunction
	})
	local UseResult2 = ReactModule.useCallback(function(p4) --[[ Line: 69 ]]
		-- upvalues: UseRefResult (copy), AnimationCoolDownTime (copy), OnAnimationRunningFunction (copy), OnResetFunction (copy)
		UseRefResult.current = math.clamp(UseRefResult.current - p4 / AnimationCoolDownTime, 0, 1)
		OnAnimationRunningFunction(UseRefResult.current)
		
		if UseRefResult.current <= 0 then
			OnResetFunction()
		end
	end, {
		OnAnimationRunningFunction,
		AnimationCoolDownTime,
		OnResetFunction
	})
	ReactModule.useEffect(function() --[[ Line: 77 ]]
		-- upvalues: IsKeyHolding (copy), UseRefResult (copy), UseResult1 (copy), IsKeyPressed (copy), UseResult (copy), IsAnimationRunning (copy), UseResult2 (copy), RunService (upval), UseRefResult1 (copy)
		local Connection = nil
		local Callback = nil
		
		if IsKeyHolding then
			UseRefResult.current = 0
			Callback = UseResult1
		elseif IsKeyPressed then
			Callback = UseResult
		elseif IsAnimationRunning then
			Callback = UseResult2
		end
		if Callback then
			Connection = RunService.RenderStepped:Connect(Callback)
		end
		return if Connection then function() --[[ Line: 94 ]]
			-- upvalues: IsKeyPressed (upval), UseRefResult1 (upval), Connection (ref)
			if IsKeyPressed then
				UseRefResult1.current = 0
			end
			Connection:Disconnect()
		end else function() --[[ Line: 102 ]] end
	end, {
		IsKeyPressed, IsKeyHolding, IsAnimationRunning, UseResult, UseResult1,
		UseResult2
	})
end

return function(p1) --[[ Line: 113 | Named "ProgressIconAnimated" ]]
	-- upvalues: ReactModule (copy), useRenderStepped (copy), UserInputService (copy), ProgressIconModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(nil)
	useRenderStepped({
		isKeyPressed = UseStateResult,
		isKeyHolding = UseStateResult1,
		isAnimationRunning = UseStateResult3
	}, {
		onKeyHolding = ReactModule.useCallback(function() --[[ Line: 121 ]]
			-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy)
			UseStateResult2_1(true)
			UseStateResult2_2(true)
		end, {}),
		onAnimationRunning = ReactModule.useCallback(function(p2) --[[ Line: 126 ]]
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(p2)
		end, {}),
		onComplete = ReactModule.useCallback(function() --[[ Line: 130 ]]
			-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), p1 (copy)
			UseStateResult2(false)
			UseStateResult2_1(false)
			UseStateResult2_2(false)
			UseStateResult2_3(true)
			
			if p1.onHoldComplete then
				p1.onHoldComplete()
			end
		end, { p1.onHoldComplete }),
		onReset = ReactModule.useCallback(function() --[[ Line: 140 ]]
			-- upvalues: UseStateResult2_2 (copy), UseBindingResult2 (copy)
			UseStateResult2_2(false)
			UseBindingResult2(nil)
		end, {})
	}, {
		animationTriggerTime = p1.animationTriggerTime,
		animationKeyHoldingTime = p1.animationKeyHoldingTime,
		animationCoolDownTime = p1.animationCoolDownTime
	})
	local UseResult = ReactModule.useCallback(function(Input) --[[ Line: 160 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseStateResult2_3 (copy), UseStateResult3 (copy), UseStateResult2_1 (copy), UseBindingResult2 (copy)
		if Input.UserInputType ~= Enum.UserInputType.Keyboard and Input.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		if Input.KeyCode == p1.keyCode then
			if Input.UserInputState == Enum.UserInputState.Begin then
				UseStateResult2(true)
				UseStateResult2_3(false)
				
				if UseStateResult3 then
					UseStateResult2_1(true)
					
					return
				else
					UseBindingResult2(nil)
					
					return
				end
			elseif Input.UserInputState == Enum.UserInputState.End then
				UseStateResult2(false)
				UseStateResult2_1(false)
			end
		end
	end, { p1.keyCode, UseStateResult3 })
	ReactModule.useEffect(function() --[[ Line: 184 ]]
		-- upvalues: p1 (copy), UserInputService (upval), UseResult (copy)
		if p1.progress then
			return function() --[[ Line: 186 ]] end
		else
			local InputBeganConnection = UserInputService.InputBegan:Connect(UseResult)
			local InputEndedConnection = UserInputService.InputEnded:Connect(UseResult)
			
			return function() --[[ Line: 191 ]]
				-- upvalues: InputBeganConnection (copy), InputEndedConnection (copy)
				InputBeganConnection:Disconnect()
				InputEndedConnection:Disconnect()
			end
		end
	end, { UseResult, p1.progress })
	
	return ReactModule.createElement(ProgressIconModule, {
		progress = p1.progress or UseBindingResult,
		icon = p1.icon,
		iconHolding = p1.iconHolding,
		isHolding = if p1.progress or UseStateResult1 or UseStateResult3 or UseStateResult4 then true else false
	})
end
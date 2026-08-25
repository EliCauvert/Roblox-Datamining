local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local reactModule = require(script.Parent.Parent.Parent.Parent.Parent.React)
local _ = require(script.Parent.Types)
local progressIconModule = require(script.Parent.ProgressIcon)

local function useRenderStepped(p0, p1, p2)
	-- upvalues: reactModule (ref), runService (ref)
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useRef(0)
	local isAnimationRunning = p0.isAnimationRunning
	local isKeyPressed = p0.isKeyPressed
	local isKeyHolding = p0.isKeyHolding
	local onKeyHolding = p1.onKeyHolding
	local onAnimationRunning = p1.onAnimationRunning
	local onComplete = p1.onComplete
	local onReset = p1.onReset
	local animationTriggerTime = p2.animationTriggerTime
	local animationKeyHoldingTime = p2.animationKeyHoldingTime
	local animationCoolDownTime = p2.animationCoolDownTime
	local var7 = reactModule.useCallback(function(p3)
		-- upvalues: var6 (ref), animationTriggerTime (ref), onKeyHolding (ref)
		var6.current += p3
		
		if animationTriggerTime <= var6.current then
			onKeyHolding()
		end
	end, { onKeyHolding, animationTriggerTime })
	local var8 = reactModule.useCallback(function(p4)
		-- upvalues: var5 (ref), animationKeyHoldingTime (ref), onAnimationRunning (ref), onComplete (ref)
		var5.current = math.clamp(var5.current + p4 / animationKeyHoldingTime, 0, 1)
		onAnimationRunning(var5.current)
		
		if var5.current >= 1 then
			onComplete()
		end
	end, { onAnimationRunning, animationKeyHoldingTime, onComplete })
	local var9 = reactModule.useCallback(function(p5)
		-- upvalues: var5 (ref), animationCoolDownTime (ref), onAnimationRunning (ref), onReset (ref)
		var5.current = math.clamp(var5.current - p5 / animationCoolDownTime, 0, 1)
		onAnimationRunning(var5.current)
		
		if var5.current <= 0 then
			onReset()
		end
	end, { onAnimationRunning, animationCoolDownTime, onReset })
	reactModule.useEffect(function()
		-- upvalues: isKeyHolding (ref), var5 (ref), var8 (ref), isKeyPressed (ref), var7 (ref), isAnimationRunning (ref), var9 (ref), runService (copy), var6 (ref)
		local renderSteppedConnection = nil
		local var11 = nil
		
		if isKeyHolding then
			var5.current = 0
			var11 = var8
		elseif isKeyPressed then
			var11 = var7
		elseif isAnimationRunning then
			var11 = var9
		end
		if var11 then
			renderSteppedConnection = runService.RenderStepped:Connect(var11)
		end
		return if renderSteppedConnection then function()
			-- upvalues: isKeyPressed (copy), var6 (copy), renderSteppedConnection (write)
			if isKeyPressed then
				var6.current = 0
			end
			renderSteppedConnection:Disconnect()
		end else function() end
	end, {
		isKeyPressed, isKeyHolding, isAnimationRunning, var7, var8, var9
	})
end

return function(p6)
	-- upvalues: reactModule (ref), useRenderStepped (ref), userInputService (ref), progressIconModule (ref)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useBinding(nil)
	useRenderStepped({
		isKeyPressed = var12,
		isKeyHolding = var14,
		isAnimationRunning = var16
	}, {
		onKeyHolding = reactModule.useCallback(function()
			-- upvalues: var15 (ref), var17 (ref)
			var15(true)
			var17(true)
		end, {}),
		onAnimationRunning = reactModule.useCallback(function(p7)
			-- upvalues: var21 (ref)
			var21(p7)
		end, {}),
		onComplete = reactModule.useCallback(function()
			-- upvalues: var13 (ref), var15 (ref), var17 (ref), var19 (ref), p6 (ref)
			var13(false)
			var15(false)
			var17(false)
			var19(true)
			
			if p6.onHoldComplete then
				p6.onHoldComplete()
			end
		end, { p6.onHoldComplete }),
		onReset = reactModule.useCallback(function()
			-- upvalues: var17 (ref), var21 (ref)
			var17(false)
			var21(nil)
		end, {})
	}, {
		animationTriggerTime = p6.animationTriggerTime,
		animationKeyHoldingTime = p6.animationKeyHoldingTime,
		animationCoolDownTime = p6.animationCoolDownTime
	})
	local var22 = reactModule.useCallback(function(p8)
		-- upvalues: p6 (ref), var13 (ref), var19 (ref), var16 (ref), var15 (ref), var21 (ref)
		if p8.UserInputType ~= Enum.UserInputType.Keyboard and p8.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		if p8.KeyCode == p6.keyCode then
			if p8.UserInputState == Enum.UserInputState.Begin then
				var13(true)
				var19(false)
				
				if var16 then
					var15(true)
					
					return
				end
				var21(nil)
				
				return
			elseif p8.UserInputState == Enum.UserInputState.End then
				var13(false)
				var15(false)
			end
		end
	end, { p6.keyCode, var16 })
	reactModule.useEffect(function()
		-- upvalues: p6 (ref), userInputService (copy), var22 (ref)
		if p6.progress then
			return function() end
		end
		local inputBeganConnection = userInputService.InputBegan:Connect(var22)
		local inputEndedConnection = userInputService.InputEnded:Connect(var22)
		
		return function()
			-- upvalues: inputBeganConnection (ref), inputEndedConnection (ref)
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, { var22, p6.progress })
	
	return reactModule.createElement(progressIconModule, {
		progress = p6.progress or var20,
		icon = p6.icon,
		iconHolding = p6.iconHolding,
		isHolding = if p6.progress or var14 or (var16 or var18) then true else false
	})
end
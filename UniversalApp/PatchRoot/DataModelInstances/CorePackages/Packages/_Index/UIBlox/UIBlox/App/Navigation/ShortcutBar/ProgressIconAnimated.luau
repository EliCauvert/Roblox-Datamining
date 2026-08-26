local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local reactModule = require(script.Parent.Parent.Parent.Parent.Parent.React)
local _ = require(script.Parent.Types)
local progressIconModule = require(script.Parent.ProgressIcon)

local function useRenderStepped(p1, p2, p3)
	-- upvalues: reactModule (ref), runService (ref)
	local var1 = reactModule.useRef(0)
	local var2 = reactModule.useRef(0)
	local isAnimationRunning = p1.isAnimationRunning
	local isKeyPressed = p1.isKeyPressed
	local isKeyHolding = p1.isKeyHolding
	local onKeyHolding = p2.onKeyHolding
	local onAnimationRunning = p2.onAnimationRunning
	local onComplete = p2.onComplete
	local onReset = p2.onReset
	local animationTriggerTime = p3.animationTriggerTime
	local animationKeyHoldingTime = p3.animationKeyHoldingTime
	local animationCoolDownTime = p3.animationCoolDownTime
	local var3 = reactModule.useCallback(function(p4)
		-- upvalues: var2 (ref), animationTriggerTime (ref), onKeyHolding (ref)
		var2.current += p4
		
		if animationTriggerTime <= var2.current then
			onKeyHolding()
		end
	end, { onKeyHolding, animationTriggerTime })
	local var4 = reactModule.useCallback(function(p4)
		-- upvalues: var1 (ref), animationKeyHoldingTime (ref), onAnimationRunning (ref), onComplete (ref)
		var1.current = math.clamp(var1.current + p4 / animationKeyHoldingTime, 0, 1)
		onAnimationRunning(var1.current)
		
		if var1.current >= 1 then
			onComplete()
		end
	end, { onAnimationRunning, animationKeyHoldingTime, onComplete })
	local var5 = reactModule.useCallback(function(p4)
		-- upvalues: var1 (ref), animationCoolDownTime (ref), onAnimationRunning (ref), onReset (ref)
		var1.current = math.clamp(var1.current - p4 / animationCoolDownTime, 0, 1)
		onAnimationRunning(var1.current)
		
		if var1.current <= 0 then
			onReset()
		end
	end, { onAnimationRunning, animationCoolDownTime, onReset })
	reactModule.useEffect(function()
		-- upvalues: isKeyHolding (ref), var1 (ref), var4 (ref), isKeyPressed (ref), var3 (ref), isAnimationRunning (ref), var5 (ref), runService (copy), var2 (ref)
		local renderSteppedConnection = nil
		local var6 = nil
		
		if isKeyHolding then
			var1.current = 0
			var6 = var4
		elseif isKeyPressed then
			var6 = var3
		elseif isAnimationRunning then
			var6 = var5
		end
		if var6 then
			renderSteppedConnection = runService.RenderStepped:Connect(var6)
		end
		return if renderSteppedConnection then function()
			-- upvalues: isKeyPressed (copy), var2 (copy), renderSteppedConnection (write)
			if isKeyPressed then
				var2.current = 0
			end
			renderSteppedConnection:Disconnect()
		end else function() end
	end, {
		isKeyPressed, isKeyHolding, isAnimationRunning, var3, var4, var5
	})
end

return function(p1)
	-- upvalues: reactModule (ref), useRenderStepped (ref), userInputService (ref), progressIconModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useBinding(nil)
	useRenderStepped({
		isKeyPressed = var1,
		isKeyHolding = var3,
		isAnimationRunning = var5
	}, {
		onKeyHolding = reactModule.useCallback(function()
			-- upvalues: var4 (ref), var6 (ref)
			var4(true)
			var6(true)
		end, {}),
		onAnimationRunning = reactModule.useCallback(function(p2)
			-- upvalues: var10 (ref)
			var10(p2)
		end, {}),
		onComplete = reactModule.useCallback(function()
			-- upvalues: var2 (ref), var4 (ref), var6 (ref), var8 (ref), p1 (ref)
			var2(false)
			var4(false)
			var6(false)
			var8(true)
			
			if p1.onHoldComplete then
				p1.onHoldComplete()
			end
		end, { p1.onHoldComplete }),
		onReset = reactModule.useCallback(function()
			-- upvalues: var6 (ref), var10 (ref)
			var6(false)
			var10(nil)
		end, {})
	}, {
		animationTriggerTime = p1.animationTriggerTime,
		animationKeyHoldingTime = p1.animationKeyHoldingTime,
		animationCoolDownTime = p1.animationCoolDownTime
	})
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), var2 (ref), var8 (ref), var5 (ref), var4 (ref), var10 (ref)
		if p2.UserInputType ~= Enum.UserInputType.Keyboard and p2.UserInputType ~= Enum.UserInputType.Gamepad1 then return end
		if p2.KeyCode == p1.keyCode then
			if p2.UserInputState == Enum.UserInputState.Begin then
				var2(true)
				var8(false)
				
				if var5 then
					var4(true)
					
					return
				end
				var10(nil)
				
				return
			elseif p2.UserInputState == Enum.UserInputState.End then
				var2(false)
				var4(false)
			end
		end
	end, { p1.keyCode, var5 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), userInputService (copy), var11 (ref)
		if p1.progress then
			return function() end
		end
		local inputBeganConnection = userInputService.InputBegan:Connect(var11)
		local inputEndedConnection = userInputService.InputEnded:Connect(var11)
		
		return function()
			-- upvalues: inputBeganConnection (ref), inputEndedConnection (ref)
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
		end
	end, { var11, p1.progress })
	
	return reactModule.createElement(progressIconModule, {
		progress = p1.progress or var9,
		icon = p1.icon,
		iconHolding = p1.iconHolding,
		isHolding = if p1.progress or var3 or (var5 or var7) then true else false
	})
end
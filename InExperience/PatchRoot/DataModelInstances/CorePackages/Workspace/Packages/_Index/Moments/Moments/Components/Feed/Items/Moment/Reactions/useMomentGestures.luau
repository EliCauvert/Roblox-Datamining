local parent = script:FindFirstAncestor("Moments").Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

local function _(p1)
	return if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then p1.UserInputType == Enum.UserInputType.Touch else true
end

local _ = function(p1, p2, p3)
	return (p1 - p2).Magnitude <= p3
end

local _ = function(p1, p2)
	local absolutePosition = p1.AbsolutePosition
	local var1 = absolutePosition + p1.AbsoluteSize
	
	return absolutePosition.X <= p2.X and (p2.X <= var1.X and (absolutePosition.Y <= p2.Y and p2.Y <= var1.Y))
end

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), userInputService (ref), useEventConnection (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(p2)
	var2.current = p2
	p3 = p3 or os.clock
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(Vector2.zero)
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useRef(false)
	local var14 = if p4 == nil or p4.movementThreshold == nil then 50 else p4.movementThreshold
	local var15 = if p4 == nil or p4.longPressThreshold == nil then 0.5 else p4.longPressThreshold
	local var16 = if p4 ~= nil then nil else p4.scrollingFrameRef
	local var17 = if p4 ~= nil then nil else p4.cancellationSignal
	local var18 = p4 ~= nil and p4.cancelWhenInactive == true
	local var19 = p4 ~= nil and p4.cancelOnUserScroll == true
	local var20 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var2 (ref)
		if not var10.current then return end
		var10.current = false
		local onLongPressCancel = var2.current.onLongPressCancel
		
		if onLongPressCancel then
			onLongPressCancel()
		end
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), var8 (ref), var11 (ref), var12 (ref), var13 (ref), var9 (ref), var5 (ref), var6 (ref), var7 (ref)
		var20()
		var8.current = nil
		var11.current = nil
		var12.current = false
		var13.current = false
		var9.current = false
		var5.current = 0
		
		if var6.current then
			task.cancel(var6.current)
			var6.current = nil
		end
		if var7.current then
			task.cancel(var7.current)
			var7.current = nil
		end
	end, {})
	local var22 = reactModule.useCallback(function(p5)
		-- upvalues: p1 (ref), var8 (ref), var9 (ref), var12 (ref), var13 (ref), p3 (ref), var11 (ref), var3 (ref), var4 (ref), var5 (ref), var7 (ref), var6 (ref), var20 (ref), var10 (ref), var2 (ref), var15 (ref)
		if p1 then
			if not (if p5.UserInputType ~= Enum.UserInputType.MouseButton1 then p5.UserInputType == Enum.UserInputType.Touch else true) then return end
			var8.current = p5
			var9.current = false
			var12.current = false
			var13.current = false
			local var23 = p3()
			local vector2 = Vector2.new(p5.Position.X, p5.Position.Y)
			var11.current = vector2
			
			if var23 - var3.current <= 0.25 and (vector2 - var4.current).Magnitude <= 50 then
				var5.current += 1
			else
				var5.current = 1
			end
			var3.current = var23
			var4.current = vector2
			
			if var5.current >= 2 and var7.current then
				task.cancel(var7.current)
				var7.current = nil
			end
			if var6.current then
				task.cancel(var6.current)
			end
			var20()
			var10.current = true
			local onLongPressStart = var2.current.onLongPressStart
			
			if onLongPressStart then
				onLongPressStart()
			end
			var6.current = task.delay(var15, function()
				-- upvalues: p1 (copy), var8 (copy), p5 (ref), var9 (copy), var10 (copy), var2 (copy)
				if not p1 then return end
				if var8.current == p5 and not var9.current then
					var9.current = true
					var10.current = false
					local onLongPress = var2.current.onLongPress
					
					if onLongPress then
						onLongPress()
					end
				end
			end)
			
			return
		end
	end, { p1, p3, var15, var20 })
	local var23 = reactModule.useCallback(function(p5)
		-- upvalues: var8 (ref), var11 (ref), var16 (ref), var19 (ref), userInputService (copy), var6 (ref), var2 (ref), var13 (ref), var5 (ref), var7 (ref), var21 (ref), p1 (ref), var12 (ref), var14 (ref), var20 (ref)
		local current = var8.current
		local current_1 = var11.current
		local var24 = if var16 ~= nil then nil else var16.current
		
		if var19 and var24 ~= nil then
			local userInputType = p5.UserInputType
			local vector2 = Vector2.new(p5.Position.X, p5.Position.Y)
			local var25 = current ~= nil and (not (current_1 == nil or (userInputType == Enum.UserInputType.Touch and p5 == current)) and ((userInputType == Enum.UserInputType.MouseMovement and (current ~= nil and current.UserInputType == Enum.UserInputType.MouseButton1)) and not ((vector2 - current_1).Magnitude <= 2)))
			local var26 = false
			
			if userInputType == Enum.UserInputType.MouseWheel then
				local mouseLocation = userInputService:GetMouseLocation()
				local absolutePosition = var24.AbsolutePosition
				local var27 = absolutePosition + var24.AbsoluteSize
				var26 = absolutePosition.X <= mouseLocation.X and (mouseLocation.X <= var27.X and (absolutePosition.Y <= mouseLocation.Y and mouseLocation.Y <= var27.Y))
			end
			if var25 and (var6.current ~= nil and var2.current.onLongPress ~= nil) and (vector2 - current_1).Magnitude <= 10 then
				var13.current = true
				var5.current = 0
				
				if var7.current then
					task.cancel(var7.current)
					var7.current = nil
				end
			elseif var25 or var26 then
				var21()
				
				return
			elseif not p1 or current == nil then return end
			if p5.UserInputType == Enum.UserInputType.Touch and p5 ~= current then return end
			if current_1 ~= nil and not var12.current and (Vector2.new(p5.Position.X, p5.Position.Y) - current_1).Magnitude > var14 then
				var12.current = true
				
				if var6.current then
					task.cancel(var6.current)
					var6.current = nil
				end
				var20()
			end
		end
	end, {
		p1, var14, var16, var19, var21, var20
	})
	useEventConnection(userInputService.InputChanged, var23, { var23 })
	local var24 = reactModule.useCallback(function(p5)
		-- upvalues: var8 (ref), var6 (ref), var20 (ref), var9 (ref), var12 (ref), var13 (ref), var2 (ref), var4 (ref), var5 (ref), var7 (ref)
		if var8.current ~= p5 then return end
		var8.current = nil
		
		if var6.current then
			task.cancel(var6.current)
			var6.current = nil
		end
		var20()
		
		if not var9.current and not var12.current and not var13.current then
			if not (if p5.UserInputType ~= Enum.UserInputType.MouseButton1 then p5.UserInputType == Enum.UserInputType.Touch else true) then return end
			local onTap = var2.current.onTap
			
			if onTap then
				onTap(var4.current, var5.current)
			end
			if var5.current >= 2 then
				if var7.current then
					task.cancel(var7.current)
					var7.current = nil
				end
				var5.current = 0
				local onDoubleTap = var2.current.onDoubleTap
				
				if onDoubleTap then
					onDoubleTap(var4.current)
					
					return
				end
			elseif var7.current then
				task.cancel(var7.current)
			end
			local current = var4.current
			var7.current = task.delay(0.25, function()
				-- upvalues: var7 (copy), var5 (copy), var2 (copy), current (ref)
				var7.current = nil
				
				if var5.current == 1 then
					local onSingleTapConfirmed = var2.current.onSingleTapConfirmed
					
					if onSingleTapConfirmed then
						onSingleTapConfirmed(current)
					end
				end
				var5.current = 0
			end)
			return
		end
	end, { var20 })
	useEventConnection(userInputService.InputEnded, var24, { var24 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var21 (ref)
		if var17 == nil then
			return
		end
		local var25 = var17:Connect(var21)
		
		return function()
			-- upvalues: var25 (ref)
			var25:Disconnect()
		end
	end, { var17, var21 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), p1 (ref), var21 (ref)
		if var18 and not p1 then
			var21()
		end
	end, { p1, var18, var21 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var22 (ref)
		local current = var1.current
		
		if current == nil then
			return
		end
		local inputBeganConnection = current.InputBegan:Connect(var22)
		
		return function()
			-- upvalues: inputBeganConnection (ref)
			inputBeganConnection:Disconnect()
		end
	end, { var22 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var21 (ref)
		return function()
			-- upvalues: var10 (copy), var21 (copy)
			var10.current = false
			var21()
		end
	end, { var21 })
	
	return {
		ref = var1,
		onInputBegan = var22,
		onInputChanged = var23,
		onInputEnded = var24
	}
end
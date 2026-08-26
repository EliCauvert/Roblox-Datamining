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

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), useEventConnection (ref), userInputService (ref)
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
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(false)
	local var12 = reactModule.useCallback(function(p4)
		-- upvalues: p1 (ref), var8 (ref), var9 (ref), var11 (ref), p3 (ref), var10 (ref), var3 (ref), var4 (ref), var5 (ref), var7 (ref), var6 (ref), var2 (ref)
		if p1 then
			if not (if p4.UserInputType ~= Enum.UserInputType.MouseButton1 then p4.UserInputType == Enum.UserInputType.Touch else true) then return end
			var8.current = p4
			var9.current = false
			var11.current = false
			local var13 = p3()
			local vector2 = Vector2.new(p4.Position.X, p4.Position.Y)
			var10.current = vector2
			
			if var13 - var3.current <= 0.25 and (vector2 - var4.current).Magnitude <= 50 then
				var5.current += 1
			else
				var5.current = 1
			end
			var3.current = var13
			var4.current = vector2
			
			if var5.current >= 2 and var7.current then
				task.cancel(var7.current)
				var7.current = nil
			end
			if var6.current then
				task.cancel(var6.current)
			end
			var6.current = task.delay(0.5, function()
				-- upvalues: p1 (copy), var8 (copy), p4 (ref), var9 (copy), var2 (copy)
				if not p1 then return end
				if var8.current == p4 and not var9.current then
					var9.current = true
					local onLongPress = var2.current.onLongPress
					
					if onLongPress then
						onLongPress()
					end
				end
			end)
			
			return
		end
	end, { p1, p3 })
	local var13 = reactModule.useCallback(function(p4)
		-- upvalues: p1 (ref), var8 (ref), var10 (ref), var11 (ref), var6 (ref)
		if not p1 or var8.current == nil then return end
		if p4.UserInputType == Enum.UserInputType.Touch and p4 ~= var8.current then return end
		if var10.current ~= nil and not var11.current and (Vector2.new(p4.Position.X, p4.Position.Y) - var10.current).Magnitude > 50 then
			var11.current = true
			
			if var6.current then
				task.cancel(var6.current)
				var6.current = nil
			end
		end
	end, { p1 })
	useEventConnection(userInputService.InputChanged, var13, { var13 })
	local var14 = reactModule.useCallback(function(p4)
		-- upvalues: var8 (ref), var6 (ref), var9 (ref), var11 (ref), var2 (ref), var5 (ref), var7 (ref), var4 (ref)
		if var8.current ~= p4 then return end
		var8.current = nil
		
		if var6.current then
			task.cancel(var6.current)
			var6.current = nil
		end
		if not var9.current and not var11.current then
			if not (if p4.UserInputType ~= Enum.UserInputType.MouseButton1 then p4.UserInputType == Enum.UserInputType.Touch else true) then return end
			local onTap = var2.current.onTap
			
			if onTap then
				onTap()
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
			var7.current = task.delay(0.25, function()
				-- upvalues: var7 (copy), var5 (copy), var2 (copy)
				var7.current = nil
				
				if var5.current == 1 then
					local onSingleTapConfirmed = var2.current.onSingleTapConfirmed
					
					if onSingleTapConfirmed then
						onSingleTapConfirmed()
					end
				end
				var5.current = 0
			end)
			return
		end
	end, {})
	useEventConnection(userInputService.InputEnded, var14, { var14 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var12 (ref)
		local current = var1.current
		
		if current == nil then
			return
		end
		local inputBeganConnection = current.InputBegan:Connect(var12)
		
		return function()
			-- upvalues: inputBeganConnection (ref)
			inputBeganConnection:Disconnect()
		end
	end, { var12 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var7 (ref)
		return function()
			-- upvalues: var6 (copy), var7 (copy)
			if var6.current then
				task.cancel(var6.current)
			end
			if var7.current then
				task.cancel(var7.current)
			end
		end
	end, {})
	
	return {
		ref = var1,
		onInputBegan = var12,
		onInputChanged = var13,
		onInputEnded = var14
	}
end
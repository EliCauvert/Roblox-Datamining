local parent = script:FindFirstAncestor("Moments").Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection

local function _(p0)
	return if p0.UserInputType ~= Enum.UserInputType.MouseButton1 then p0.UserInputType == Enum.UserInputType.Touch else true
end

local _ = function(p1, p2, p3)
	return (p1 - p2).Magnitude <= p3
end

return function(p4, p5, p6)
	-- upvalues: reactModule (ref), useEventConnection (ref), userInputService (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(p5)
	var3.current = p5
	p6 = p6 or os.clock
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useRef(Vector2.zero)
	local var7 = reactModule.useRef(0)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(false)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(false)
	local var14 = reactModule.useCallback(function(p7)
		-- upvalues: p4 (ref), var10 (ref), var11 (ref), var13 (ref), p6 (ref), var12 (ref), var5 (ref), var6 (ref), var7 (ref), var9 (ref), var8 (ref), var3 (ref)
		if p4 then
			if not (if p7.UserInputType ~= Enum.UserInputType.MouseButton1 then p7.UserInputType == Enum.UserInputType.Touch else true) then return end
			var10.current = p7
			var11.current = false
			var13.current = false
			local var17 = p6()
			local vector2 = Vector2.new(p7.Position.X, p7.Position.Y)
			var12.current = vector2
			
			if var17 - var5.current <= 0.25 and (vector2 - var6.current).Magnitude <= 50 then
				var7.current += 1
			else
				var7.current = 1
			end
			var5.current = var17
			var6.current = vector2
			
			if var7.current >= 2 and var9.current then
				task.cancel(var9.current)
				var9.current = nil
			end
			if var8.current then
				task.cancel(var8.current)
			end
			var8.current = task.delay(0.5, function()
				-- upvalues: p4 (copy), var10 (copy), p7 (ref), var11 (copy), var3 (copy)
				if not p4 then return end
				if var10.current == p7 and not var11.current then
					var11.current = true
					local onLongPress = var3.current.onLongPress
					
					if onLongPress then
						onLongPress()
					end
				end
			end)
			
			return
		end
	end, { p4, p6 })
	local var15 = reactModule.useCallback(function(p8)
		-- upvalues: p4 (ref), var10 (ref), var12 (ref), var13 (ref), var8 (ref)
		if not p4 or var10.current == nil then return end
		if p8.UserInputType == Enum.UserInputType.Touch and p8 ~= var10.current then return end
		if var12.current ~= nil and not var13.current and (Vector2.new(p8.Position.X, p8.Position.Y) - var12.current).Magnitude > 50 then
			var13.current = true
			
			if var8.current then
				task.cancel(var8.current)
				var8.current = nil
			end
		end
	end, { p4 })
	useEventConnection(userInputService.InputChanged, var15, { var15 })
	local var16 = reactModule.useCallback(function(p9)
		-- upvalues: var10 (ref), var8 (ref), var11 (ref), var13 (ref), var3 (ref), var7 (ref), var9 (ref), var6 (ref)
		if var10.current ~= p9 then return end
		var10.current = nil
		
		if var8.current then
			task.cancel(var8.current)
			var8.current = nil
		end
		if not var11.current and not var13.current then
			if not (if p9.UserInputType ~= Enum.UserInputType.MouseButton1 then p9.UserInputType == Enum.UserInputType.Touch else true) then return end
			local onTap = var3.current.onTap
			
			if onTap then
				onTap()
			end
			if var7.current >= 2 then
				if var9.current then
					task.cancel(var9.current)
					var9.current = nil
				end
				var7.current = 0
				local onDoubleTap = var3.current.onDoubleTap
				
				if onDoubleTap then
					onDoubleTap(var6.current)
					
					return
				end
			elseif var9.current then
				task.cancel(var9.current)
			end
			var9.current = task.delay(0.25, function()
				-- upvalues: var9 (copy), var7 (copy), var3 (copy)
				var9.current = nil
				
				if var7.current == 1 then
					local onSingleTapConfirmed = var3.current.onSingleTapConfirmed
					
					if onSingleTapConfirmed then
						onSingleTapConfirmed()
					end
				end
				var7.current = 0
			end)
			return
		end
	end, {})
	useEventConnection(userInputService.InputEnded, var16, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var14 (ref)
		local current = var2.current
		
		if current == nil then
			return
		end
		local inputBeganConnection = current.InputBegan:Connect(var14)
		
		return function()
			-- upvalues: inputBeganConnection (ref)
			inputBeganConnection:Disconnect()
		end
	end, { var14 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var9 (ref)
		return function()
			-- upvalues: var8 (copy), var9 (copy)
			if var8.current then
				task.cancel(var8.current)
			end
			if var9.current then
				task.cancel(var9.current)
			end
		end
	end, {})
	
	return {
		ref = var2,
		onInputBegan = var14,
		onInputChanged = var15,
		onInputEnded = var16
	}
end
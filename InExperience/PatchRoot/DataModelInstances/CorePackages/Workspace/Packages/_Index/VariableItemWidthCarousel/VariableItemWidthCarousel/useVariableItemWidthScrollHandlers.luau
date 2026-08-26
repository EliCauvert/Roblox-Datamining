local variableItemWidthCarousel = script:FindFirstAncestor("VariableItemWidthCarousel")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local tweenService = game:GetService("TweenService")
local reactModule = require(variableItemWidthCarousel.Parent.React)

local function clampTargetCanvasPosition(value, minValue)
	return Vector2.new(math.round(math.clamp(minValue, 0, value.AbsoluteCanvasSize.X - value.AbsoluteSize.X)), 0)
end

function useVariableItemWidthScrollHandlers(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), userGameSettingsService (ref), tweenService (ref), clampTargetCanvasPosition (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(0)
	local var3 = reactModule.useRef(0)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(true)
	local var8, var9 = reactModule.useState(Vector2.zero)
	local var10 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), p3 (ref)
		local t = { [0] = 0 }
		
		for i, v in ipairs(p1) do
			t[i] = p3(i)
		end
		return t
	end, { p1, p3 })
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), var9 (ref)
		local var11 = nil
		
		if p4.current then
			local current = p4.current
			var9(current.AbsoluteSize)
			var11 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var9 (copy), current (ref)
				var9(current.AbsoluteSize)
			end)
		end
		return function()
			-- upvalues: var11 (write)
			if var11 then
				var11:Disconnect()
			end
		end
	end, { p4 })
	local var11 = reactModule.useCallback(function(p6, p7)
		-- upvalues: var1 (ref), var2 (ref), userGameSettingsService (copy), p5 (ref), tweenService (copy)
		if var1.current then
			var1.current:Cancel()
		end
		var2.current = p7.X
		
		if userGameSettingsService.ReducedMotion then
			p6.CanvasPosition = p7
			
			return
		end
		var1.current = tweenService:Create(p6, TweenInfo.new(p5 or 0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { CanvasPosition = p7 }):Play()
	end, { userGameSettingsService.ReducedMotion, p5 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: p4 (ref), var5 (ref), var2 (ref), var7 (ref), var8 (ref)
		local current = p4.current
		
		if current then
			var5(var2.current > 0)
			var7(var2.current < current.AbsoluteCanvasSize.X - var8.X)
			
			return
		end
		var5(false)
		var7(false)
	end, { var5, var7, var8 })
	local var13 = reactModule.useCallback(function(_)
		-- upvalues: p1 (ref), var10 (ref), p2 (ref), var8 (ref)
		local var14 = 0
		
		for i = #p1, 1, -1 do
			local var15 = var10[i]
			var14 += var15 + (if var15 > 0 then p2 else 0)
			
			if var8.X > var14 then
				continue
			end
			return i
		end
		return 1
	end, { p1, var10, p2, var8 })
	local var16 = reactModule.useCallback(function(p6, p7)
		-- upvalues: var8 (ref), var3 (ref), p1 (ref), var10 (ref), p2 (ref), var13 (ref)
		local x = var8.X
		local var17 = 0
		local current = var3.current
		local var18 = 0
		local var19 = 0
		
		for i = math.max(current, 1), #p1 do
			local var20 = var10[i]
			var19 += var20 + (if var20 > 0 then p2 else 0)
			
			if x <= var19 then break end
			var18 += 1
		end
		local clampedValue = math.clamp(math.max(1, var18) * p7, -#p1, #p1)
		
		for i_1 = 0, math.clamp(current + clampedValue, 0, #p1) do
			local var21 = var10[i_1]
			var17 += var21 + (if var21 > 0 then p2 else 0)
		end
		return Vector2.new(math.round(math.clamp(var17, 0, p6.AbsoluteCanvasSize.X - p6.AbsoluteSize.X)), 0), math.clamp(current + clampedValue, 0, var13(p6))
	end, {
		p1, var10, p2, clampTargetCanvasPosition, var13, var8
	})
	local var22 = reactModule.useCallback(function()
		-- upvalues: p4 (ref), var16 (ref), var3 (ref), var11 (ref), var12 (ref)
		local current = p4.current
		
		if current then
			local var23, var24 = var16(current, -1)
			var3.current = var24
			var11(current, var23)
			var12()
		end
	end, { var11, var12, var16 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: p4 (ref), var16 (ref), var3 (ref), var11 (ref), var12 (ref)
		local current = p4.current
		
		if current then
			local var24, var25 = var16(current, 1)
			var3.current = var25
			var11(current, var24)
			var12()
		end
	end, { var11, var12, var16 })
	reactModule.useEffect(var12, { var12 })
	
	return var22, var23, var4, var6, var12
end

return useVariableItemWidthScrollHandlers
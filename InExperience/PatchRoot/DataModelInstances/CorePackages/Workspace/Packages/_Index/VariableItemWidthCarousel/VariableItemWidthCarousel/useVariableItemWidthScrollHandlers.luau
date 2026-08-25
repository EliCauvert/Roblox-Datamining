local variableItemWidthCarousel = script:FindFirstAncestor("VariableItemWidthCarousel")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local tweenService = game:GetService("TweenService")
local reactModule = require(variableItemWidthCarousel.Parent.React)

local function clampTargetCanvasPosition(value, minValue)
	return Vector2.new(math.round(math.clamp(minValue, 0, value.AbsoluteCanvasSize.X - value.AbsoluteSize.X)), 0)
end

function useVariableItemWidthScrollHandlers(p0, p1, p2, p3, p4)
	-- upvalues: reactModule (ref), userGameSettingsService (ref), tweenService (ref), clampTargetCanvasPosition (ref)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(0)
	local var7 = reactModule.useRef(0)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(true)
	local var12, var13 = reactModule.useState(Vector2.zero)
	local var14 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), p2 (ref)
		local t = { [0] = 0 }
		
		for i, v in ipairs(p0) do
			t[i] = p2(i)
		end
		return t
	end, { p0, p2 })
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var13 (ref)
		local var22 = nil
		
		if p3.current then
			local current = p3.current
			var13(current.AbsoluteSize)
			var22 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var13 (copy), current (ref)
				var13(current.AbsoluteSize)
			end)
		end
		return function()
			-- upvalues: var22 (write)
			if var22 then
				var22:Disconnect()
			end
		end
	end, { p3 })
	local var15 = reactModule.useCallback(function(p5, p6)
		-- upvalues: var5 (ref), var6 (ref), userGameSettingsService (copy), p4 (ref), tweenService (copy)
		if var5.current then
			var5.current:Cancel()
		end
		var6.current = p6.X
		
		if userGameSettingsService.ReducedMotion then
			p5.CanvasPosition = p6
			
			return
		end
		var5.current = tweenService:Create(p5, TweenInfo.new(p4 or 0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { CanvasPosition = p6 }):Play()
	end, { userGameSettingsService.ReducedMotion, p4 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), var9 (ref), var6 (ref), var11 (ref), var12 (ref)
		local current = p3.current
		
		if current then
			var9(var6.current > 0)
			var11(var6.current < current.AbsoluteCanvasSize.X - var12.X)
			
			return
		end
		var9(false)
		var11(false)
	end, { var9, var11, var12 })
	local var17 = reactModule.useCallback(function(_)
		-- upvalues: p0 (ref), var14 (ref), p1 (ref), var12 (ref)
		local var23 = 0
		
		for i = #p0, 1, -1 do
			local var24 = var14[i]
			var23 += var24 + (if var24 > 0 then p1 else 0)
			
			if var12.X > var23 then
				continue
			end
			return i
		end
		return 1
	end, { p0, var14, p1, var12 })
	local var18 = reactModule.useCallback(function(p7, p8)
		-- upvalues: var12 (ref), var7 (ref), p0 (ref), var14 (ref), p1 (ref), var17 (ref)
		local x = var12.X
		local var25 = 0
		local current = var7.current
		local var26 = 0
		local var27 = 0
		
		for i = math.max(current, 1), #p0 do
			local var28 = var14[i]
			var27 += var28 + (if var28 > 0 then p1 else 0)
			
			if x <= var27 then break end
			var26 += 1
		end
		local clampedValue = math.clamp(math.max(1, var26) * p8, -#p0, #p0)
		
		for i_1 = 0, math.clamp(current + clampedValue, 0, #p0) do
			local var30 = var14[i_1]
			var25 += var30 + (if var30 > 0 then p1 else 0)
		end
		return Vector2.new(math.round(math.clamp(var25, 0, p7.AbsoluteCanvasSize.X - p7.AbsoluteSize.X)), 0), math.clamp(current + clampedValue, 0, var17(p7))
	end, {
		p0, var14, p1, clampTargetCanvasPosition, var17, var12
	})
	local var19 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), var18 (ref), var7 (ref), var15 (ref), var16 (ref)
		local current = p3.current
		
		if current then
			local var31, var32 = var18(current, -1)
			var7.current = var32
			var15(current, var31)
			var16()
		end
	end, { var15, var16, var18 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), var18 (ref), var7 (ref), var15 (ref), var16 (ref)
		local current = p3.current
		
		if current then
			local var33, var34 = var18(current, 1)
			var7.current = var34
			var15(current, var33)
			var16()
		end
	end, { var15, var16, var18 })
	reactModule.useEffect(var16, { var16 })
	
	return var19, var20, var8, var10, var16
end

return useVariableItemWidthScrollHandlers
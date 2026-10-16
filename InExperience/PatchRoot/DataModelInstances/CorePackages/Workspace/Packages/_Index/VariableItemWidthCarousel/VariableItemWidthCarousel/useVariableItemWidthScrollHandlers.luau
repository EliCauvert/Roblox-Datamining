local UserGameSettings = UserSettings():GetService("UserGameSettings")
local TweenService = game:GetService("TweenService")
local ReactModule = require(script:FindFirstAncestor("VariableItemWidthCarousel").Parent.React)

local function clampTargetCanvasPosition(Frame, Value: number): Vector2 --[[ Line: 8 ]]
	return Vector2.new(math.round((math.clamp(Value, 0, Frame.AbsoluteCanvasSize.X - Frame.AbsoluteSize.X))), 0)
end

function useVariableItemWidthScrollHandlers(p1, p2, Callback, p3, p4) --[[ Line: 15 ]]
	-- upvalues: ReactModule (copy), UserGameSettings (copy), TweenService (copy), clampTargetCanvasPosition (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.zero)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 28 ]]
		-- upvalues: p1 (copy), Callback (copy)
		local config = { [0] = 0 }
		
		for i, _ in ipairs(p1) do
			config[i] = Callback(i)
		end
		return config
	end, { p1, Callback })
	ReactModule.useEffect(function() --[[ Line: 36 ]]
		-- upvalues: p3 (copy), UseStateResult2_2 (copy)
		local Connection = nil
		
		if p3.current then
			local Current = p3.current
			UseStateResult2_2(Current.AbsoluteSize)
			Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 44 ]]
				-- upvalues: UseStateResult2_2 (upval), Current (copy)
				UseStateResult2_2(Current.AbsoluteSize)
			end)
		end
		return function() --[[ Line: 49 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { p3 })
	local UseResult = ReactModule.useCallback(function(Target, CanvasPosition) --[[ Line: 57 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UserGameSettings (upval), p4 (copy), TweenService (upval)
		if UseRefResult.current then
			UseRefResult.current:Cancel()
		end
		UseRefResult1.current = CanvasPosition.X
		
		if UserGameSettings.ReducedMotion then
			Target.CanvasPosition = CanvasPosition
			
			return
		else
			UseRefResult.current = TweenService:Create(Target, TweenInfo.new(p4 or 0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { CanvasPosition = CanvasPosition }):Play()
		end
	end, { UserGameSettings.ReducedMotion, p4 })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 73 ]]
		-- upvalues: p3 (copy), UseStateResult2 (copy), UseRefResult1 (copy), UseStateResult2_1 (copy), UseStateResult3 (copy)
		local Current = p3.current
		
		if Current then
			UseStateResult2(UseRefResult1.current > 0)
			UseStateResult2_1(UseRefResult1.current < Current.AbsoluteCanvasSize.X - UseStateResult3.X)
			
			return
		else
			UseStateResult2(false)
			UseStateResult2_1(false)
		end
	end, { UseStateResult2, UseStateResult2_1, UseStateResult3 })
	local UseResult2 = ReactModule.useCallback(function(_): number --[[ Line: 84 ]]
		-- upvalues: p1 (copy), UseMemoResult (copy), p2 (copy), UseStateResult3 (copy)
		local Total = 0
		
		for i = #p1, 1, -1 do
			local UseMemoResultEntry: number = UseMemoResult[i]
			Total += UseMemoResultEntry + (UseMemoResultEntry > 0 and p2 or 0)
			
			if UseStateResult3.X <= Total then
				return i
			end
		end
		return 1
	end, { p1, UseMemoResult, p2, UseStateResult3 })
	local UseResult3 = ReactModule.useCallback(function(Frame, p5) --[[ Line: 97 ]]
		-- upvalues: UseStateResult3 (copy), UseRefResult2 (copy), p1 (copy), UseMemoResult (copy), p2 (copy), UseResult2 (copy)
		local X = UseStateResult3.X
		local Value = 0
		local Current: number = UseRefResult2.current
		local Count = 0
		local Total = 0
		
		for i = math.max(Current, 1), #p1 do
			local UseMemoResultEntry: number = UseMemoResult[i]
			Total += UseMemoResultEntry + (UseMemoResultEntry > 0 and p2 or 0)
			
			if X <= Total then break end
			Count += 1
		end
		local ClampedValue = math.clamp(math.max(1, Count) * p5, -#p1, #p1)
		
		for i1 = 0, math.clamp(Current + ClampedValue, 0, #p1) do
			local UseMemoResultEntry: number = UseMemoResult[i1]
			Value += UseMemoResultEntry + (UseMemoResultEntry > 0 and p2 or 0)
		end
		return Vector2.new(math.round((math.clamp(Value, 0, Frame.AbsoluteCanvasSize.X - Frame.AbsoluteSize.X))), 0), (math.clamp(Current + ClampedValue, 0, UseResult2(Frame)))
	end, {
		p1, UseMemoResult, p2, clampTargetCanvasPosition, UseResult2, UseStateResult3
	})
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 132 ]]
		-- upvalues: p3 (copy), UseResult3 (copy), UseRefResult2 (copy), UseResult (copy), UseResult1 (copy)
		local Current = p3.current
		
		if Current then
			local UseResultResult, UseResultResult2 = UseResult3(Current, -1)
			UseRefResult2.current = UseResultResult2
			UseResult(Current, UseResultResult)
			UseResult1()
		end
	end, { UseResult, UseResult1, UseResult3 })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 149 ]]
		-- upvalues: p3 (copy), UseResult3 (copy), UseRefResult2 (copy), UseResult (copy), UseResult1 (copy)
		local Current = p3.current
		
		if Current then
			local UseResultResult, UseResultResult2 = UseResult3(Current, 1)
			UseRefResult2.current = UseResultResult2
			UseResult(Current, UseResultResult)
			UseResult1()
		end
	end, { UseResult, UseResult1, UseResult3 })
	ReactModule.useEffect(UseResult1, { UseResult1 })
	
	return UseResult4, UseResult5, UseStateResult, UseStateResult1, UseResult1
end

return useVariableItemWidthScrollHandlers
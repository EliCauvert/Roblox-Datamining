local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
game:DefineFastInt("FreeTrialChipRevealDurationMs", 300)

local function _(Value: number)
	-- upvalues: TweenService (copy)
	return TweenService:GetValue(math.clamp(Value, 0, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
end

return function(p1)
	-- upvalues: ReactModule (copy), RunService (copy), TweenService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	UseRefResult.current = UseStateResult1
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseRefResult1 (copy)
		if not p1 then
			UseStateResult2(nil)
			UseStateResult2_1(nil)
			UseStateResult2_2(false)
			
			return
		end
		local Current = UseRefResult1.current
		local LayerCollector = if Current == nil then nil else Current:FindFirstAncestorWhichIsA("LayerCollector")
		
		if LayerCollector == nil or game:GetFastInt("FreeTrialChipRevealDurationMs") <= 0 then
			UseStateResult2_2(true)
			
			return
		else
			UseStateResult2(LayerCollector)
		end
	end, {
		p1,
		UseStateResult2,
		UseStateResult2_1,
		UseStateResult2_2
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), UseStateResult3 (copy), UseStateResult (copy), UseRefResult (copy), UseStateResult2_1 (copy)
		local Current = UseRefResult3.current
		
		if UseStateResult3 or UseStateResult == nil or Current == nil then return end
		local function _(Current)
			-- upvalues: UseRefResult (upval), UseStateResult2_1 (upval)
			if UseRefResult.current == nil or Current.X > 0 and Current.Y > 0 then
				UseRefResult.current = Current
				UseStateResult2_1(Current)
				
				return
			end
		end
		
		local AbsoluteSize = Current.AbsoluteSize
		
		if UseRefResult.current == nil or AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
			UseRefResult.current = AbsoluteSize
			UseStateResult2_1(AbsoluteSize)
		end
		local Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: Current (copy), UseRefResult (upval), UseStateResult2_1 (upval)
			local AbsoluteSize = Current.AbsoluteSize
			
			if UseRefResult.current ~= nil then
				if AbsoluteSize.X > 0 then
					if AbsoluteSize.Y <= 0 then return end
				end
				return
			end
			UseRefResult.current = AbsoluteSize
			UseStateResult2_1(AbsoluteSize)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseStateResult3, UseStateResult, UseStateResult2_1 })
	local HasUseStateResult = UseStateResult1 ~= nil
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), UseRefResult2 (copy), UseStateResult3 (copy), HasUseStateResult (copy), UseStateResult (copy), RunService (upval), TweenService (upval), UseStateResult2_2 (copy)
		local Current = UseRefResult3.current
		local Current1 = UseRefResult2.current
		
		if UseStateResult3 or not HasUseStateResult or UseStateResult == nil or Current == nil or Current1 == nil then return end
		local function _()
			-- upvalues: Current1 (copy), UseStateResult (copy)
			return Current1.AbsolutePosition - UseStateResult.AbsolutePosition
		end
		
		local FreeTrialChipRevealDurationMsFastInt = game:GetFastInt("FreeTrialChipRevealDurationMs")
		local X = UseStateResult.AbsoluteSize.X
		Current.Position = UDim2.fromOffset(X, (Current1.AbsolutePosition - UseStateResult.AbsolutePosition).Y)
		local Total = 0
		local Connection = nil
		Connection = RunService.Heartbeat:Connect(function(DeltaTime: number)
			-- upvalues: Total (ref), Current1 (copy), UseStateResult (copy), FreeTrialChipRevealDurationMsFastInt (copy), TweenService (upval), Current (copy), X (copy), Connection (ref), UseStateResult2_2 (upval)
			Total += DeltaTime * 1000
			local AbsolutePositionDelta = Current1.AbsolutePosition - UseStateResult.AbsolutePosition
			Current.Position = UDim2.fromOffset(X + (AbsolutePositionDelta.X - X) * (if FreeTrialChipRevealDurationMsFastInt > 0 then TweenService:GetValue(math.clamp(Total / FreeTrialChipRevealDurationMsFastInt, 0, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.Out) else 1), AbsolutePositionDelta.Y)
			
			if FreeTrialChipRevealDurationMsFastInt <= Total then
				if Connection ~= nil then
					Connection:Disconnect()
				end
				UseStateResult2_2(true)
			end
		end)
		
		return function()
			-- upvalues: Connection (ref)
			if Connection ~= nil then
				Connection:Disconnect()
			end
		end
	end, {
		UseStateResult3,
		HasUseStateResult,
		UseStateResult,
		UseStateResult2_2
	})
	
	return {
		isSettled = UseStateResult3,
		revealLayer = UseStateResult,
		revealChipSize = UseStateResult1,
		slotRef = UseRefResult1,
		placeholderRef = UseRefResult2,
		revealRef = UseRefResult3
	}
end
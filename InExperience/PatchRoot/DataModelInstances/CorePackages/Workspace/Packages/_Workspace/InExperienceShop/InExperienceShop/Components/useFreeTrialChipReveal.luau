local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local ReactModule = require(InExperienceShop.Parent.React)
local FFlagFreeTrialChipBuyAnimationModule = require(InExperienceShop.Flags.FFlagFreeTrialChipBuyAnimation)
game:DefineFastInt("FreeTrialChipRevealDurationMs", 300)

local function _(Value: number)
	-- upvalues: TweenService (copy)
	return TweenService:GetValue(math.clamp(Value, 0, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
end

return function(p1, Current)
	-- upvalues: ReactModule (copy), RunService (copy), TweenService (copy), FFlagFreeTrialChipBuyAnimationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	UseRefResult.current = UseStateResult1
	local UseRefResult1 = ReactModule.useRef(true)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult1 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseRefResult4 (copy)
		if not p1 then
			UseRefResult2.current = nil
			UseRefResult3.current = false
			UseRefResult1.current = true
			UseStateResult2(nil)
			UseStateResult2_1(nil)
			UseStateResult2_2(false)
			
			return
		end
		local Current = UseRefResult4.current
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
		-- upvalues: UseRefResult6 (copy), UseStateResult3 (copy), UseStateResult (copy), UseRefResult (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult1 (copy), UseStateResult2_1 (copy)
		local Current = UseRefResult6.current
		
		if UseStateResult3 or UseStateResult == nil or Current == nil then return end
		local function publishRevealChipSize(AbsoluteSize)
			-- upvalues: UseRefResult (upval), UseRefResult2 (upval), UseRefResult3 (upval), UseRefResult1 (upval), UseStateResult2_1 (upval)
			if UseRefResult.current ~= nil and (AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0) then return end
			local Current = UseRefResult2.current
			
			if Current ~= nil and AbsoluteSize.X == Current.X and AbsoluteSize.Y == Current.Y then return end
			if Current ~= nil then
				UseRefResult2.current = nil
				UseRefResult3.current = false
				UseRefResult1.current = true
			end
			UseRefResult.current = AbsoluteSize
			UseStateResult2_1(AbsoluteSize)
		end
		
		publishRevealChipSize(Current.AbsoluteSize)
		local Connection = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: publishRevealChipSize (copy), Current (copy)
			publishRevealChipSize(Current.AbsoluteSize)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseStateResult3, UseStateResult, UseStateResult2_1 })
	local HasUseStateResult = UseStateResult1 ~= nil
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult6 (copy), UseRefResult5 (copy), UseStateResult3 (copy), HasUseStateResult (copy), UseStateResult (copy), RunService (upval), TweenService (upval), UseRefResult2 (copy), UseRefResult1 (copy), UseStateResult2_2 (copy)
		local Current = UseRefResult6.current
		local Current1 = UseRefResult5.current
		
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
			-- upvalues: Total (ref), Current1 (copy), UseStateResult (copy), FreeTrialChipRevealDurationMsFastInt (copy), TweenService (upval), Current (copy), X (copy), Connection (ref), UseRefResult2 (upval), UseRefResult1 (upval), UseStateResult2_2 (upval)
			Total += DeltaTime * 1000
			local AbsolutePositionDelta = Current1.AbsolutePosition - UseStateResult.AbsolutePosition
			Current.Position = UDim2.fromOffset(X + (AbsolutePositionDelta.X - X) * (if FreeTrialChipRevealDurationMsFastInt > 0 then TweenService:GetValue(math.clamp(Total / FreeTrialChipRevealDurationMsFastInt, 0, 1), Enum.EasingStyle.Quad, Enum.EasingDirection.Out) else 1), AbsolutePositionDelta.Y)
			
			if FreeTrialChipRevealDurationMsFastInt <= Total then
				if Connection ~= nil then
					Connection:Disconnect()
				end
				UseRefResult2.current = nil
				UseRefResult1.current = true
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
	
	if FFlagFreeTrialChipBuyAnimationModule then
		local UseRefResult7 = ReactModule.useRef(nil)
		ReactModule.useLayoutEffect(function()
			-- upvalues: Current (copy), p1 (copy), UseRefResult7 (copy), UseRefResult4 (copy), UseRefResult2 (copy), UseRefResult (copy), UseRefResult3 (copy), UseRefResult1 (copy), UseStateResult2 (copy), UseStateResult2_2 (copy)
			if Current == nil or not p1 then
				UseRefResult7.current = nil
				
				return
			end
			local Current1 = UseRefResult7.current
			UseRefResult7.current = Current
			
			if Current1 == nil or Current1 == Current then return end
			local Current2 = UseRefResult4.current
			local LayerCollector = if Current2 == nil then nil else Current2:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector ~= nil and game:GetFastInt("FreeTrialChipRevealDurationMs") > 0 then
				UseRefResult2.current = UseRefResult.current
				UseRefResult3.current = true
				UseRefResult1.current = false
				UseStateResult2(LayerCollector)
				UseStateResult2_2(false)
				
				return
			end
		end, { p1, Current, UseStateResult2, UseStateResult2_2 })
	end
	return {
		isSettled = UseStateResult3,
		revealLayer = UseStateResult,
		revealChipSize = UseStateResult1,
		revealSizeIsOwnRef = UseRefResult1,
		sampleOnSettleRef = UseRefResult3,
		slotRef = UseRefResult4,
		placeholderRef = UseRefResult5,
		revealRef = UseRefResult6
	}
end
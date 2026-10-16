local ReactModule = require(script:FindFirstAncestor("VirtualEvents").Parent.React)
local TweenService = game:GetService("TweenService")
local config = {
	linear = Enum.EasingStyle.Linear,
	quadratic = Enum.EasingStyle.Quad,
	cubic = Enum.EasingStyle.Cubic
}

local function _(p1) --[[ Line: 32 | Named "stopTween" ]]
	if p1.current then
		p1.current:Cancel()
		p1.current = nil
	end
end

local _ = function(p1, p2): boolean --[[ Line: 40 | Named "isApproximatelyEqual" ]]
	return math.abs(p1 - p2) < 0.001
end

return function(p1) --[[ Line: 44 | Named "useAnimation" ]]
	-- upvalues: ReactModule (copy), config (copy), TweenService (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 48 ]]
		-- upvalues: p1 (copy), UseRefResult1 (copy), config (upval), UseRefResult (copy), TweenService (upval)
		local StartOffset = p1.startOffset
		local EndOffset = p1.endOffset or 0
		local Duration = p1.duration or 0.2
		local EasingStyle = p1.easingStyle or "quadratic"
		
		if math.abs(StartOffset - EndOffset) < 0.001 then return end
		local NumValue = Instance.new("NumberValue")
		NumValue.Value = StartOffset
		UseRefResult1.current = StartOffset
		local _TweenInfo = TweenInfo.new(Duration, config[EasingStyle] or config.quadratic, Enum.EasingDirection.Out)
		
		if UseRefResult.current then
			UseRefResult.current:Cancel()
			UseRefResult.current = nil
		end
		UseRefResult.current = TweenService:Create(NumValue, _TweenInfo, { Value = EndOffset })
		local Connection = NumValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 75 ]]
			-- upvalues: NumValue (copy), UseRefResult1 (upval), p1 (upval)
			local Value = NumValue.Value
			
			if UseRefResult1.current == nil or math.abs(Value - UseRefResult1.current) >= 0.001 then
				UseRefResult1.current = Value
				p1.setAnimationOffset(Value)
			end
		end)
		
		if UseRefResult.current then
			UseRefResult.current.Completed:Connect(function() --[[ Line: 84 ]]
				-- upvalues: Connection (copy), NumValue (copy), UseRefResult (upval), UseRefResult1 (upval)
				Connection:Disconnect()
				NumValue:Destroy()
				UseRefResult.current = nil
				UseRefResult1.current = nil
			end)
			UseRefResult.current:Play()
		end
		return function() --[[ Line: 93 ]]
			-- upvalues: Connection (copy), UseRefResult (upval), NumValue (copy), UseRefResult1 (upval)
			Connection:Disconnect()
			
			if UseRefResult.current then
				UseRefResult.current:Cancel()
				UseRefResult.current = nil
			end
			NumValue:Destroy()
			UseRefResult1.current = nil
		end
	end, {
		p1.startOffset,
		p1.endOffset,
		p1.duration,
		p1.easingStyle,
		p1.setAnimationOffset
	})
end
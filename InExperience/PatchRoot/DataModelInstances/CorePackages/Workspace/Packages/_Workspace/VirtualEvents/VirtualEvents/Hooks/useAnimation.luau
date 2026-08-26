local reactModule = require(script:FindFirstAncestor("VirtualEvents").Parent.React)
local tweenService = game:GetService("TweenService")
local t = {
	linear = Enum.EasingStyle.Linear,
	quadratic = Enum.EasingStyle.Quad,
	cubic = Enum.EasingStyle.Cubic
}

local function _(p1)
	if p1.current then
		p1.current:Cancel()
		p1.current = nil
	end
end

local _ = function(p1, p2)
	return math.abs(p1 - p2) < 0.001
end

return function(p1)
	-- upvalues: reactModule (ref), t (ref), tweenService (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), t (copy), var1 (ref), tweenService (copy)
		local startOffset = p1.startOffset
		local endOffset = p1.endOffset or 0
		local duration = p1.duration or 0.2
		local easingStyle = p1.easingStyle or "quadratic"
		
		if math.abs(startOffset - endOffset) < 0.001 then return end
		local numberValue = Instance.new("NumberValue")
		numberValue.Value = startOffset
		var2.current = startOffset
		local tweenInfo = TweenInfo.new(duration, t[easingStyle] or t.quadratic, Enum.EasingDirection.Out)
		
		if var1.current then
			var1.current:Cancel()
			var1.current = nil
		end
		var1.current = tweenService:Create(numberValue, tweenInfo, { Value = endOffset })
		local var3 = numberValue:GetPropertyChangedSignal("Value"):Connect(function()
			-- upvalues: numberValue (ref), var2 (copy), p1 (copy)
			local value = numberValue.Value
			
			if var2.current == nil or math.abs(value - var2.current) >= 0.001 then
				var2.current = value
				p1.setAnimationOffset(value)
			end
		end)
		
		if var1.current then
			var1.current.Completed:Connect(function()
				-- upvalues: var3 (ref), numberValue (ref), var1 (copy), var2 (copy)
				var3:Disconnect()
				numberValue:Destroy()
				var1.current = nil
				var2.current = nil
			end)
			var1.current:Play()
		end
		return function()
			-- upvalues: var3 (ref), var1 (copy), numberValue (ref), var2 (copy)
			var3:Disconnect()
			
			if var1.current then
				var1.current:Cancel()
				var1.current = nil
			end
			numberValue:Destroy()
			var2.current = nil
		end
	end, {
		p1.startOffset,
		p1.endOffset,
		p1.duration,
		p1.easingStyle,
		p1.setAnimationOffset
	})
end
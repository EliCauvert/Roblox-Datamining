local reactModule = require(script:FindFirstAncestor("VirtualEvents").Parent.React)
local tweenService = game:GetService("TweenService")
local t = {
	linear = Enum.EasingStyle.Linear,
	quadratic = Enum.EasingStyle.Quad,
	cubic = Enum.EasingStyle.Cubic
}

local function _(p0)
	if p0.current then
		p0.current:Cancel()
		p0.current = nil
	end
end

local _ = function(p1, p2)
	return math.abs(p1 - p2) < 0.001
end

return function(p3)
	-- upvalues: reactModule (ref), t (ref), tweenService (ref)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var4 (ref), t (copy), var3 (ref), tweenService (copy)
		local startOffset = p3.startOffset
		local endOffset = p3.endOffset or 0
		local duration = p3.duration or 0.2
		local easingStyle = p3.easingStyle or "quadratic"
		
		if math.abs(startOffset - endOffset) < 0.001 then return end
		local numberValue = Instance.new("NumberValue")
		numberValue.Value = startOffset
		var4.current = startOffset
		local tweenInfo = TweenInfo.new(duration, t[easingStyle] or t.quadratic, Enum.EasingDirection.Out)
		
		if var3.current then
			var3.current:Cancel()
			var3.current = nil
		end
		var3.current = tweenService:Create(numberValue, tweenInfo, { Value = endOffset })
		local var10 = numberValue:GetPropertyChangedSignal("Value"):Connect(function()
			-- upvalues: numberValue (ref), var4 (copy), p3 (copy)
			local value = numberValue.Value
			
			if var4.current == nil or math.abs(value - var4.current) >= 0.001 then
				var4.current = value
				p3.setAnimationOffset(value)
			end
		end)
		
		if var3.current then
			var3.current.Completed:Connect(function()
				-- upvalues: var10 (ref), numberValue (ref), var3 (copy), var4 (copy)
				var10:Disconnect()
				numberValue:Destroy()
				var3.current = nil
				var4.current = nil
			end)
			var3.current:Play()
		end
		return function()
			-- upvalues: var10 (ref), var3 (copy), numberValue (ref), var4 (copy)
			var10:Disconnect()
			
			if var3.current then
				var3.current:Cancel()
				var3.current = nil
			end
			numberValue:Destroy()
			var4.current = nil
		end
	end, {
		p3.startOffset,
		p3.endOffset,
		p3.duration,
		p3.easingStyle,
		p3.setAnimationOffset
	})
end
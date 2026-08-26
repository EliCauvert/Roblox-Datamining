local tooltipOrientationModule = require(script.Parent.Enum.TooltipOrientation)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: tooltipOrientationModule (ref)
	local clampedValue, var1, var2, x, x_1
	local t = {}
	local var3 = p4 + p5 * 0.5
	local var4 = p4 + p5
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var5 = 0
	local var6 = 0
	
	if p3 == tooltipOrientationModule.Bottom or p3 == tooltipOrientationModule.Top then
		if not p7 and p6.Y - var4.Y < p2 + 8 + 12 then
			p3 = tooltipOrientationModule.Top
		end
		x = math.clamp(var3.X - p1 * 0.5, 12, p6.X - 12 - p1)
		x_1 = x - p4.X
		var2 = nil
		local var7 = p1 - 12 - 16
		
		if p1 < 40 then
			t.caretPosition = UDim2.fromScale(0.5, 0)
		elseif p7 then
			t.caretPosition = UDim2.fromOffset(math.clamp(p5.X * 0.5 + math.abs(p5.X * p7.X.Scale + p7.X.Offset), 12, var7), 0)
		elseif var3.X - p1 * 0.5 >= 12 and var3.X + p1 * 0.5 <= p6.X - 12 then
			t.caretPosition = UDim2.fromScale(0.5, 0)
		else
			t.caretPosition = UDim2.fromOffset(math.clamp(var3.X - x, 12, var7), 0)
		end
		t.caretFrameSize = UDim2.fromOffset(p1, 8)
		t.caretImageSize = UDim2.fromOffset(16, 8)
		t.caretAnchorPoint = Vector2.new(0.5, 0)
		t.fillDirection = Enum.FillDirection.Vertical
		
		if p3 == tooltipOrientationModule.Bottom then
			clampedValue = p4.Y + p5.Y
			var1 = p5.Y
			t.caretLayoutOrder = 1
			t.contentLayoutOrder = 2
			var6 = 4
		else
			clampedValue = p4.Y - p2 - 8
			var1 = -(p2 + 8)
			t.caretLayoutOrder = 2
			t.contentLayoutOrder = 1
			var6 = -4
		end
	else
		clampedValue = math.clamp(var3.Y - p2 * 0.5, 12, p6.Y - 12 - p2)
		var1 = clampedValue - p4.Y
		var2 = nil
		local var8 = p2 - 12 - 16
		
		if p7 then
			t.caretPosition = UDim2.fromOffset(0, math.clamp(p5.Y * 0.5 + math.abs(p5.Y * p7.Y.Scale + p7.Y.Offset), 12, var8))
		elseif var3.Y - p2 * 0.5 >= 12 and var3.Y + p2 * 0.5 <= p6.Y - 12 or p2 <= 40 then
			t.caretPosition = UDim2.fromScale(0, 0.5)
		else
			t.caretPosition = UDim2.fromOffset(0, math.clamp(var3.Y - clampedValue, 12, p2 - 12 - 16))
		end
		t.caretFrameSize = UDim2.fromOffset(8, p2)
		t.caretImageSize = UDim2.fromOffset(8, 16)
		t.caretAnchorPoint = Vector2.new(0, 0.5)
		t.fillDirection = Enum.FillDirection.Horizontal
		
		if p3 == tooltipOrientationModule.Right then
			x = var4.X
			x_1 = p5.X
			t.caretLayoutOrder = 1
			t.contentLayoutOrder = 2
			var5 = 4
		else
			x = p4.X - p1 - 8
			x_1 = -(p1 - 8)
			t.caretLayoutOrder = 2
			t.contentLayoutOrder = 1
			var5 = -4
		end
	end
	t.absolutePosition = UDim2.fromOffset(x, clampedValue)
	t.position = UDim2.fromOffset(x_1, var1)
	t.animatedDistance = UDim2.fromOffset(var5, var6)
	t.updatedOrientation = p3
	
	return t
end
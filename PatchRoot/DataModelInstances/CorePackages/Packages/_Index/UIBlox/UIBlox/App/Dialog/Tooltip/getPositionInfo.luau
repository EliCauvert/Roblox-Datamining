-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:54 2026 Pacific Standard Time.

local tooltipOrientationModule = require(script.Parent.Enum.TooltipOrientation)

return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 22 ]]
	-- upvalues: tooltipOrientationModule (ref)
	local clampedValue, var7, var8, x, x_1
	local t = {}
	local var2 = p3 + p4 * 0.5
	local var3 = p3 + p4
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var4 = 0
	local var5 = 0
	
	if p2 == tooltipOrientationModule.Bottom or p2 == tooltipOrientationModule.Top then
		if not p6 and p5.Y - var3.Y < p1 + 8 + 12 then
			p2 = tooltipOrientationModule.Top
		end
		x = math.clamp(var2.X - p0 * 0.5, 12, p5.X - 12 - p0)
		x_1 = x - p3.X
		var8 = nil
		local var10 = p0 - 12 - 16
		
		if p0 < 40 then
			t.caretPosition = UDim2.fromScale(0.5, 0)
		elseif p6 then
			t.caretPosition = UDim2.fromOffset(math.clamp(p4.X * 0.5 + math.abs(p4.X * p6.X.Scale + p6.X.Offset), 12, var10), 0)
		elseif var2.X - p0 * 0.5 >= 12 and var2.X + p0 * 0.5 <= p5.X - 12 then
			t.caretPosition = UDim2.fromScale(0.5, 0)
		else
			t.caretPosition = UDim2.fromOffset(math.clamp(var2.X - x, 12, var10), 0)
		end
		t.caretFrameSize = UDim2.fromOffset(p0, 8)
		t.caretImageSize = UDim2.fromOffset(16, 8)
		t.caretAnchorPoint = Vector2.new(0.5, 0)
		t.fillDirection = Enum.FillDirection.Vertical
		
		if p2 == tooltipOrientationModule.Bottom then
			clampedValue = p3.Y + p4.Y
			var7 = p4.Y
			t.caretLayoutOrder = 1
			t.contentLayoutOrder = 2
			var5 = 4
		else
			clampedValue = p3.Y - p1 - 8
			var7 = -(p1 + 8)
			t.caretLayoutOrder = 2
			t.contentLayoutOrder = 1
			var5 = -4
		end
	else
		clampedValue = math.clamp(var2.Y - p1 * 0.5, 12, p5.Y - 12 - p1)
		var7 = clampedValue - p3.Y
		var8 = nil
		local var9 = p1 - 12 - 16
		
		if p6 then
			t.caretPosition = UDim2.fromOffset(0, math.clamp(p4.Y * 0.5 + math.abs(p4.Y * p6.Y.Scale + p6.Y.Offset), 12, var9))
		elseif var2.Y - p1 * 0.5 >= 12 and var2.Y + p1 * 0.5 <= p5.Y - 12 or p1 <= 40 then
			t.caretPosition = UDim2.fromScale(0, 0.5)
		else
			t.caretPosition = UDim2.fromOffset(0, math.clamp(var2.Y - clampedValue, 12, p1 - 12 - 16))
		end
		t.caretFrameSize = UDim2.fromOffset(8, p1)
		t.caretImageSize = UDim2.fromOffset(8, 16)
		t.caretAnchorPoint = Vector2.new(0, 0.5)
		t.fillDirection = Enum.FillDirection.Horizontal
		
		if p2 == tooltipOrientationModule.Right then
			x = var3.X
			x_1 = p4.X
			t.caretLayoutOrder = 1
			t.contentLayoutOrder = 2
			var4 = 4
		else
			x = p3.X - p0 - 8
			x_1 = -(p0 - 8)
			t.caretLayoutOrder = 2
			t.contentLayoutOrder = 1
			var4 = -4
		end
	end
	t.absolutePosition = UDim2.fromOffset(x, clampedValue)
	t.position = UDim2.fromOffset(x_1, var7)
	t.animatedDistance = UDim2.fromOffset(var4, var5)
	t.updatedOrientation = p2
	
	return t
end
return function(p1: number, p2: number, p3: number, p4: number, p5: number, Value: number)
	if p4 <= 0 then
		return nil
	else
		local ClampedValue = math.clamp(Value, 0, (math.max(0, (p4 - p2) * 0.5)))
		local ClampedValue1 = math.clamp(if p1 - ClampedValue < p3 then p1 - ClampedValue elseif p3 + p4 < p1 + p2 + ClampedValue then p1 + p2 + ClampedValue - p4 else p3, 0, (math.max(0, p5 - p4)))
		
		return if math.abs(ClampedValue1 - p3) < 1 then nil else ClampedValue1
	end
end
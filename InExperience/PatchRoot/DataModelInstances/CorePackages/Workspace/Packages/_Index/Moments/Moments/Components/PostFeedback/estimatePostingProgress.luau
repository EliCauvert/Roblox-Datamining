return function(p1, p2, p3: number, Value: number): number
	local ClampedValue = math.clamp(Value, 0, 1)
	
	return if p3 <= 0 then ClampedValue else ClampedValue * math.clamp((p1 - p2) / p3, 0, 1)
end
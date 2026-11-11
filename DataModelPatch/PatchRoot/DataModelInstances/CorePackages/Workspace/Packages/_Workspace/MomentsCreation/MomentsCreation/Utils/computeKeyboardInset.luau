return function(p1, p2, p3, p4, MaxValue: number): number
	return if p1 and p2 then math.clamp(p4 - p3, 0, MaxValue) else 0
end
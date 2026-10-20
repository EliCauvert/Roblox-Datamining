return function(p1: number, p2, p3, p4): number
	return (math.clamp(p2 + (if p1 > 0 then 1 elseif p1 < 0 then -1 else 0) * p3, p4.Min, p4.Max))
end
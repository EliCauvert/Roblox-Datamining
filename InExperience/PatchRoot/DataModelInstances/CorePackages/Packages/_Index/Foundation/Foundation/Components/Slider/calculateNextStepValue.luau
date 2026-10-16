return function(p1, p2, p3, p4)
	return math.clamp(p2 + (if p1 > 0 then 1 elseif p1 < 0 then -1 else 0) * p3, p4.Min, p4.Max)
end
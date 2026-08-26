return function(value, p1, p2, p3, p4)
	return if value and p1 then math.clamp(p3 - p2, 0, p4) else 0
end
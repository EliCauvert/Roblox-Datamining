return function(value, p0, p1, p2, p3)
	return if value and p0 then math.clamp(p2 - p1, 0, p3) else 0
end
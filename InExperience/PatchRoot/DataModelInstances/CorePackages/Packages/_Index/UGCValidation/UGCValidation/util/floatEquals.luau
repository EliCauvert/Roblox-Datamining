return function(p0, p1, p2)
	return math.abs(p0 - p1) <= (p2 or 0.000000000001)
end
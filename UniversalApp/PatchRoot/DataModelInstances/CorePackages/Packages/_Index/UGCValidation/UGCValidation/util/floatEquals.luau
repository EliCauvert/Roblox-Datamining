return function(p0, p1, p2) --[[ line: 3 | named "floatEquals" ]]
	return math.abs(p0 - p1) <= (p2 or 0.000000000001)
end
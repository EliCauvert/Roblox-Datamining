return function(p1, p2, p3): boolean --[[ Line: 3 | Named "floatEquals" ]]
	return math.abs(p1 - p2) <= (p3 or 0.000000000001)
end
return function(p1, p2, p3)
	return math.clamp(p1 + p2 * (p3.Max - p3.Min), p3.Min, p3.Max)
end
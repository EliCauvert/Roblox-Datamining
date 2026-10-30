return function(p1, p2): number
	return (math.clamp((p1 - p2.Min) / (p2.Max - p2.Min), 0, 1))
end
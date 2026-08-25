return function(p0, p1, p2)
	return math.clamp(p0.X, p1.X, p1.X + p2.X) == p0.X and math.clamp(p0.Y, p1.Y, p1.Y + p2.Y) == p0.Y
end
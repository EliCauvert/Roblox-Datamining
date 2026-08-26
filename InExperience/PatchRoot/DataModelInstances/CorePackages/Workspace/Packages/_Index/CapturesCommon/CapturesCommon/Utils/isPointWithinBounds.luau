return function(p1, p2, p3)
	return math.clamp(p1.X, p2.X, p2.X + p3.X) == p1.X and math.clamp(p1.Y, p2.Y, p2.Y + p3.Y) == p1.Y
end
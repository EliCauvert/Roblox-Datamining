return function(p1, p2, Vector, Vector1, p3): boolean
	local Vector2 = p1 - p2
	
	return Vector.X - p3 <= Vector2.X and (Vector2.X <= Vector.X + Vector1.X + p3 and Vector.Y - p3 <= Vector2.Y) and Vector2.Y <= Vector.Y + Vector1.Y + p3
end
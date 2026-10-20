return function(Vector, Vector1, Vector2): boolean
	return math.clamp(Vector.X, Vector1.X, Vector1.X + Vector2.X) == Vector.X and math.clamp(Vector.Y, Vector1.Y, Vector1.Y + Vector2.Y) == Vector.Y
end
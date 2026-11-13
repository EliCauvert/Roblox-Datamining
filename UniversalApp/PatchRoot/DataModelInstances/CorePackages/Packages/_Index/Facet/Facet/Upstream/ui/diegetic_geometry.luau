return {
	fit = function(Vector, Vector1)
		assert(Vector.X > 0 and (Vector.Y > 0 and Vector1.X > 0) and Vector1.Y > 0)
		
		return Vector1 * (math.min(Vector.X, Vector.Y * Vector1.X / Vector1.Y) / Vector1.X)
	end,
	match = function(p1, p2, p3: number, p4)
		assert(p3 > 0 and p3 < 180)
		
		return p1 * p4.new(0, 0, -(p2.Y / (math.tan((math.rad(p3 / 2))) * 2))) * p4.Angles(0, 3.141592653589793, 0)
	end
}
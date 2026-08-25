return function(p0, p1, p2)
	local var0 = 0.5 * p2.AbsoluteSize
	local var1 = p0 - (p2.AbsolutePosition + var0)
	local var2 = math.atan2(var1.Y, var1.X) - math.rad(p2.AbsoluteRotation)
	var1 = var1.Magnitude * Vector2.new(math.cos(var2), math.sin(var2))
	
	return -var0.X <= var1.X - p1 and (var1.X + p1 <= var0.X and (-var0.Y <= var1.Y - p1 and var1.Y + p1 <= var0.Y))
end
return function(p1, p2, p3)
	local var1 = 0.5 * p3.AbsoluteSize
	local var2 = p1 - (p3.AbsolutePosition + var1)
	local var3 = math.atan2(var2.Y, var2.X) - math.rad(p3.AbsoluteRotation)
	var2 = var2.Magnitude * Vector2.new(math.cos(var3), math.sin(var3))
	
	return -var1.X <= var2.X - p2 and (var2.X + p2 <= var1.X and (-var1.Y <= var2.Y - p2 and var2.Y + p2 <= var1.Y))
end
return function(value, p1)
	local var1 = p1.AbsolutePosition + p1.AbsoluteSize / 2
	
	return Vector2.new(math.cos(math.rad(p1.AbsoluteRotation)) * (value - var1).Magnitude + var1.X, math.sin(math.rad(p1.AbsoluteRotation)) * (value - var1).Magnitude + var1.Y)
end
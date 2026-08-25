return function(value, p0)
	local var0 = p0.AbsolutePosition + p0.AbsoluteSize / 2
	
	return Vector2.new(math.cos(math.rad(p0.AbsoluteRotation)) * (value - var0).Magnitude + var0.X, math.sin(math.rad(p0.AbsoluteRotation)) * (value - var0).Magnitude + var0.Y)
end
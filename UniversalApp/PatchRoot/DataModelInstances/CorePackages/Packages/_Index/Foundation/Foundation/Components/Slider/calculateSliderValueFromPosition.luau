return function(p0, p1, p2)
	local radians = math.rad(p1.AbsoluteRotation)
	
	return math.clamp(math.clamp((p0 - (p1.AbsolutePosition + p1.AbsoluteSize * 0.5)):Dot(Vector2.new(math.cos(radians), math.sin(radians))) / p1.AbsoluteSize.Magnitude + 0.5, 0, 1) * (p2.Max - p2.Min) + p2.Min, p2.Min, p2.Max)
end
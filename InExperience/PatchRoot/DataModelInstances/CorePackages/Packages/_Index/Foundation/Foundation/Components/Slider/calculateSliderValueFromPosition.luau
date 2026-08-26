return function(p1, p2, p3)
	local radians = math.rad(p2.AbsoluteRotation)
	
	return math.clamp(math.clamp((p1 - (p2.AbsolutePosition + p2.AbsoluteSize * 0.5)):Dot(Vector2.new(math.cos(radians), math.sin(radians))) / p2.AbsoluteSize.Magnitude + 0.5, 0, 1) * (p3.Max - p3.Min) + p3.Min, p3.Min, p3.Max)
end
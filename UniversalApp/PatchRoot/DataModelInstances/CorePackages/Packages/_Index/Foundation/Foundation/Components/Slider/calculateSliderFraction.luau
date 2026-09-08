return function(p1, p2, p3)
	local absoluteSize = p2.AbsoluteSize
	local radians = math.rad(p2.AbsoluteRotation)
	
	return math.clamp((p1 - (p2.AbsolutePosition + absoluteSize * 0.5)):Dot(if p3 then Vector2.new(math.sin(radians), -math.cos(radians)) else Vector2.new(math.cos(radians), math.sin(radians))) / (if p3 then absoluteSize.Y else absoluteSize.X) + 0.5, 0, 1)
end
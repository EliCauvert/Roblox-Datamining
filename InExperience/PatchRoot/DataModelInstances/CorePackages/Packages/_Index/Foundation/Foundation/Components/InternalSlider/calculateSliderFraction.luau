return function(p1, Frame: Frame, p2): number
	local AbsoluteSize: number = Frame.AbsoluteSize
	local Radians = math.rad(Frame.AbsoluteRotation)
	
	return (math.clamp((p1 - (Frame.AbsolutePosition + AbsoluteSize * 0.5)):Dot(if p2 then Vector2.new(math.sin(Radians), -math.cos(Radians)) else Vector2.new(math.cos(Radians), (math.sin(Radians)))) / (if p2 then AbsoluteSize.Y else AbsoluteSize.X) + 0.5, 0, 1))
end
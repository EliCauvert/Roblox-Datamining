return function(p1, Frame: Frame, p2): number
	local Radians = math.rad(Frame.AbsoluteRotation)
	
	return (math.clamp(math.clamp((p1 - (Frame.AbsolutePosition + Frame.AbsoluteSize * 0.5)):Dot((Vector2.new(math.cos(Radians), (math.sin(Radians))))) / Frame.AbsoluteSize.Magnitude + 0.5, 0, 1) * (p2.Max - p2.Min) + p2.Min, p2.Min, p2.Max))
end
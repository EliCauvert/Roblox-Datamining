return function(p0, p1)
	if p0 then
		local absolutePosition = p0.AbsolutePosition
		local absoluteSize = p0.AbsoluteSize
		
		return absolutePosition.X <= p1.X and (p1.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p1.Y and p1.Y <= absolutePosition.Y + absoluteSize.Y))
	end
	return false
end
return function(p1, p2)
	if p1 then
		local absolutePosition = p1.AbsolutePosition
		local absoluteSize = p1.AbsoluteSize
		
		return absolutePosition.X <= p2.X and (p2.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p2.Y and p2.Y <= absolutePosition.Y + absoluteSize.Y))
	end
	return false
end
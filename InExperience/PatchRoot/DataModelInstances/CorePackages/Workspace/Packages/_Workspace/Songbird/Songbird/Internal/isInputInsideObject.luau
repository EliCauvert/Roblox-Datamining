return function(p1, p2)
	if p2 then
		local absolutePosition = p2.AbsolutePosition
		local rect = Rect.new(absolutePosition, absolutePosition + p2.AbsoluteSize)
		
		return rect.Min.X <= p1.X and (rect.Min.Y <= p1.Y and (p1.X <= rect.Max.X and p1.Y <= rect.Max.Y))
	end
	return false
end
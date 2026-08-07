return function(p0, p1) --[[ line: 1 | named "isInputInsideObject" ]]
	if p1 then
		local absolutePosition = p1.AbsolutePosition
		local rect = Rect.new(absolutePosition, absolutePosition + p1.AbsoluteSize)
		
		return rect.Min.X <= p0.X and (rect.Min.Y <= p0.Y and (p0.X <= rect.Max.X and p0.Y <= rect.Max.Y))
	end
	return false
end
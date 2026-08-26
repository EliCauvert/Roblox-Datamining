return {
	isCardVisibleInScrollViewport = function(p1, p2)
		local absoluteWindowSize = p1.AbsoluteWindowSize
		local absoluteSize = p2.AbsoluteSize
		
		if not p1.Visible or not p2.Visible or (absoluteWindowSize.X <= 0 or absoluteWindowSize.Y <= 0) then
			return false
		elseif absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
			return false
		end
		local absolutePosition = p1.AbsolutePosition
		local var1 = absolutePosition + absoluteWindowSize
		local absolutePosition_1 = p2.AbsolutePosition
		local var2 = absolutePosition_1 + absoluteSize
		
		return absolutePosition.X < var2.X and (absolutePosition_1.X < var1.X and (absolutePosition.Y < var2.Y and absolutePosition_1.Y < var1.Y))
	end
}
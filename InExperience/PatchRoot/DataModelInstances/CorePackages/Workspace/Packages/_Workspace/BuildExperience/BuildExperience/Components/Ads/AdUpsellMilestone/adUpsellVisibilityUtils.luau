return {
	isCardVisibleInScrollViewport = function(Frame, Frame1: Frame): boolean
		local AbsoluteWindowSize = Frame.AbsoluteWindowSize
		local AbsoluteSize = Frame1.AbsoluteSize
		
		if not Frame.Visible or not Frame1.Visible or AbsoluteWindowSize.X <= 0 or AbsoluteWindowSize.Y <= 0 then
			return false
		elseif AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
			return false
		else
			local AbsolutePosition = Frame.AbsolutePosition
			local NewAbsolutePosition = AbsolutePosition + AbsoluteWindowSize
			local AbsolutePosition1 = Frame1.AbsolutePosition
			local NewAbsolutePosition1 = AbsolutePosition1 + AbsoluteSize
			
			return AbsolutePosition.X < NewAbsolutePosition1.X and (AbsolutePosition1.X < NewAbsolutePosition.X and AbsolutePosition.Y < NewAbsolutePosition1.Y) and AbsolutePosition1.Y < NewAbsolutePosition.Y
		end
	end
}
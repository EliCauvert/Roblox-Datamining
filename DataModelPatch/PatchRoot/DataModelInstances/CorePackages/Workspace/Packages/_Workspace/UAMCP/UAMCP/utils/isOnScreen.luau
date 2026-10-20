return function(Frame: Frame, Frame1: Frame): boolean
	if Frame1 then
		local AbsolutePosition = Frame1.AbsolutePosition
		local AbsoluteSize = Frame1.AbsoluteSize
		local AbsolutePosition1 = Frame.AbsolutePosition
		local AbsoluteSize1 = Frame.AbsoluteSize
		local IsYBelow: boolean = AbsolutePosition.Y < AbsolutePosition1.Y + AbsoluteSize1.Y and AbsolutePosition1.Y < AbsolutePosition.Y + AbsoluteSize.Y
		
		return AbsolutePosition.X < AbsolutePosition1.X + AbsoluteSize1.X and AbsolutePosition1.X < AbsolutePosition.X + AbsoluteSize.X and IsYBelow
	else
		return true
	end
end
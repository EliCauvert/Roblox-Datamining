return function(Frame: Frame, Vector, Vector1): boolean
	local AbsoluteSize = Frame.AbsoluteSize
	
	if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
		return false
	else
		local AbsolutePosition = Frame.AbsolutePosition
		local NewAbsolutePosition = AbsolutePosition + AbsoluteSize
		local IsYBelow: boolean = Vector.Y < NewAbsolutePosition.Y and AbsolutePosition.Y < Vector1.Y
		
		return Vector.X < NewAbsolutePosition.X and AbsolutePosition.X < Vector1.X and IsYBelow
	end
end
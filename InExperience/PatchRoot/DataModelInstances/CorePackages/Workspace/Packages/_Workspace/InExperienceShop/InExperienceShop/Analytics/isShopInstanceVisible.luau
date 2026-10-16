return function(Frame: Frame, p1): boolean --[[ Line: 6 | Named "isShopInstanceVisible" ]]
	local MaxDelta = p1.max - p1.min
	
	if MaxDelta.X <= 0 or MaxDelta.Y <= 0 then
		return false
	else
		local NewAbsolutePosition = Frame.AbsolutePosition + Frame.AbsoluteSize / 2
		local IsYBelow: boolean = p1.min.Y < NewAbsolutePosition.Y and NewAbsolutePosition.Y < p1.max.Y
		
		return p1.min.X < NewAbsolutePosition.X and NewAbsolutePosition.X < p1.max.X and IsYBelow
	end
end
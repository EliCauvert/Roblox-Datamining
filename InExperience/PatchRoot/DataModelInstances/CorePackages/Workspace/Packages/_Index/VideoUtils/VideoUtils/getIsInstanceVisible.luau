return function(Frame: Frame, p1, p2): boolean
	if not Frame then
		return false
	end
	local AbsoluteSize = Frame.AbsoluteSize
	
	if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
		return false
	end
	local AbsolutePosition = Frame.AbsolutePosition
	local NewAbsolutePosition = AbsolutePosition + AbsoluteSize
	local SmallestDelta = math.min(NewAbsolutePosition.X, p1.max.X) - math.max(AbsolutePosition.X, p1.min.X)
	
	if SmallestDelta <= 0 then
		return false
	else
		local SmallestDelta1 = math.min(NewAbsolutePosition.Y, p1.max.Y) - math.max(AbsolutePosition.Y, p1.min.Y)
		
		return SmallestDelta1 > 0 and p2 <= SmallestDelta * SmallestDelta1 * 100 / (AbsoluteSize.X * AbsoluteSize.Y)
	end
end
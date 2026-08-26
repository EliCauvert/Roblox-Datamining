return function(p1, p2, p3)
	if not p1 then
		return false
	end
	local absoluteSize = p1.AbsoluteSize
	
	if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
		return false
	end
	local absolutePosition = p1.AbsolutePosition
	local var1 = absolutePosition + absoluteSize
	local var2 = math.min(var1.X, p2.max.X) - math.max(absolutePosition.X, p2.min.X)
	
	if var2 <= 0 then
		return false
	end
	local var3 = math.min(var1.Y, p2.max.Y) - math.max(absolutePosition.Y, p2.min.Y)
	
	return if var3 <= 0 then false else p3 <= var2 * var3 * 100 / (absoluteSize.X * absoluteSize.Y)
end
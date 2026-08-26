return function(p1, p2)
	local var1 = p2.max - p2.min
	
	if var1.X <= 0 or var1.Y <= 0 then
		return false
	end
	local var2 = p1.AbsolutePosition + p1.AbsoluteSize / 2
	
	return (p2.min.X < var2.X and var2.X < p2.max.X) and (p2.min.Y < var2.Y and var2.Y < p2.max.Y)
end
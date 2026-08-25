return function(p0, p1)
	local var0 = p1.max - p1.min
	
	if var0.X <= 0 or var0.Y <= 0 then
		return false
	end
	local var1 = p0.AbsolutePosition + p0.AbsoluteSize / 2
	
	return (p1.min.X < var1.X and var1.X < p1.max.X) and (p1.min.Y < var1.Y and var1.Y < p1.max.Y)
end
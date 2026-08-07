return function(p0, p1, p2) --[[ line: 1 | named "getIsInstanceVisible" ]]
	if not p0 then
		return false
	end
	local absoluteSize = p0.AbsoluteSize
	
	if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then
		return false
	end
	local absolutePosition = p0.AbsolutePosition
	local var0 = absolutePosition + absoluteSize
	local var1 = math.min(var0.X, p1.max.X) - math.max(absolutePosition.X, p1.min.X)
	
	if var1 <= 0 then
		return false
	end
	local var2 = math.min(var0.Y, p1.max.Y) - math.max(absolutePosition.Y, p1.min.Y)
	
	return if var2 <= 0 then false else p2 <= var1 * var2 * 100 / (absoluteSize.X * absoluteSize.Y)
end
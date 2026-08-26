return function(p1, p2, p3)
	local var1 = p2 - p3 * 2
	
	return p1 > 0 and (var1 > 0 and var1 < p1)
end
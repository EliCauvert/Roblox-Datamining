return function(p0, p1, p2, p3, p4)
	p4 = p4 or 0
	local var1 = p0 - p2 * p1 * 2
	
	if p3 then
		var1 = math.min(var1, p3 * p1)
	end
	return math.max(var1, p4)
end
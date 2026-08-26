return function(p1, p2, p3, p4, p5)
	p5 = p5 or 0
	local var1 = p1 - p3 * p2 * 2
	
	if p4 then
		var1 = math.min(var1, p4 * p2)
	end
	return math.max(var1, p5)
end
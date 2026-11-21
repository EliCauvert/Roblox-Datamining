return function(p1, p2, p3, p4, p5)
	local v1 = p1 - p3
	local v2 = p1 + p2
	
	return if v1 < p4 or p5 - p4 < v2 - v1 then p4 - v1 elseif p5 < v2 then p5 - v2 else 0
end
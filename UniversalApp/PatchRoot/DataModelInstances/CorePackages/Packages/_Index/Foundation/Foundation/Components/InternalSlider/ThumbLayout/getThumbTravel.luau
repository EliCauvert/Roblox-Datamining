return function(p1: number, p2, p3)
	local v1 = 1 - (if p3 then p1 else p1 - 1) * p2
	
	return if v1 > 0 then v1 else nil
end
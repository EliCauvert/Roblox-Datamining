return function(p1, p2, p3, p4)
	return if p3 <= 0 or p2 <= 0 then false else p3 - (p1 + p2) <= (p4 or 0)
end
return function(p1: number, p2: number): boolean
	return if p1 == p2 then p1 ~= 0 or 1 / p1 == 1 / p2 else p1 ~= p1 and p2 ~= p2
end
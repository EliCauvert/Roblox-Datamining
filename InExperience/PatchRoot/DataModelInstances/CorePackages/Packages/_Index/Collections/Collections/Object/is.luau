return function(p1, p2)
	return if p1 == p2 then if p1 == 0 then 1 / p1 == 1 / p2 else true else p1 ~= p1 and p2 ~= p2
end
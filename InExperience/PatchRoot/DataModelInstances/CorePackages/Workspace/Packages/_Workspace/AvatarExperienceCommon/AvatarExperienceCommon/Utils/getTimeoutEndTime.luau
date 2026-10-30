return function(p1, p2)
	local P0 = p1 or p2
	
	return if P0 == "" then nil else P0
end
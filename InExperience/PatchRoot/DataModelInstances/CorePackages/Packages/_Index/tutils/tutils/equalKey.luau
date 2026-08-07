return function(p0, p1, p2) --[[ line: 5 ]]
	return p0 and p1 and (p2 and p2 ~= "") and (p0[p2] and p1[p2] and p0[p2] == p1[p2])
end
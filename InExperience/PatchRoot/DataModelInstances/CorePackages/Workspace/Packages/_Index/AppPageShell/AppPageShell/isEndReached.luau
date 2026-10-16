return function(p1: number, p2: number, p3: number, p4): boolean --[[ Line: 2 | Named "isEndReached" ]]
	return p3 > 0 and p2 > 0 and p3 - (p1 + p2) <= (p4 or 0)
end
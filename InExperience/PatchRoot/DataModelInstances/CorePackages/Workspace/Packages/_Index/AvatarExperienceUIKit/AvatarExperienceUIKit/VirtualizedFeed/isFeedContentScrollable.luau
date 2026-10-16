return function(p1: number, p2, p3: number): boolean --[[ Line: 13 | Named "isFeedContentScrollable" ]]
	local v1 = p2 - p3 * 2
	
	return p1 > 0 and v1 > 0 and v1 < p1
end
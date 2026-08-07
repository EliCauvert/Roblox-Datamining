return function(p0, p1, p2) --[[ line: 13 | named "isFeedContentScrollable" ]]
	local var0 = p1 - p2 * 2
	
	return p0 > 0 and (var0 > 0 and var0 < p0)
end
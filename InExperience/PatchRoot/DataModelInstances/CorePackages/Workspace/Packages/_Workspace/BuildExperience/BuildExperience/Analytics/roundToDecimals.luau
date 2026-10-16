return function(p1, p2: number): number --[[ Line: 1 | Named "roundToDecimals" ]]
	local v1 = 10 ^ p2
	
	return math.floor(p1 * v1 + 0.5) / v1
end
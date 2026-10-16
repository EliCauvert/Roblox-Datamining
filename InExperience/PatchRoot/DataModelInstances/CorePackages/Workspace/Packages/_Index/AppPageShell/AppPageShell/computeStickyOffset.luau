return function(p1: number, p2: number, p3: number): number --[[ Line: 12 | Named "computeStickyOffset" ]]
	local Smallest = math.min(math.floor(p1 - p2), 0)
	
	return if p3 == nil or p3 <= 0 or p3 >= p2 then Smallest else math.max(Smallest, p3 - p2)
end
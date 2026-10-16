return function(p1, p2: number, p3: number, p4, p5, MaxValue: number) --[[ Line: 12 | Named "getVisibleTileRange" ]]
	if MaxValue <= 0 or p2 <= 0 then
		return 1, 0
	else
		local v1 = p2 + p3
		local Floored = math.floor(p1 / v1)
		
		return math.clamp((if p1 - Floored * v1 < p2 then Floored else Floored + 1) + 1, 1, MaxValue), (math.clamp(math.ceil(p1 / v1 + (p4 + (p5 or 0))), 1, MaxValue))
	end
end
return function(p1, p2, p3, p4, p5, p6)
	if p6 <= 0 or p2 <= 0 then
		return 1, 0
	end
	local var1 = p2 + p3
	local floored = math.floor(p1 / var1)
	
	return math.clamp((if p1 - floored * var1 < p2 then floored else floored + 1) + 1, 1, p6), math.clamp(math.ceil(p1 / var1 + (p4 + (p5 or 0))), 1, p6)
end
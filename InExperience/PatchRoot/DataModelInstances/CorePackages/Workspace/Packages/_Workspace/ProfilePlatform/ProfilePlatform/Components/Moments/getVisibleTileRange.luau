return function(p0, p1, p2, p3, p4, p5)
	if p5 <= 0 or p1 <= 0 then
		return 1, 0
	end
	local var0 = p1 + p2
	local floored = math.floor(p0 / var0)
	
	return math.clamp((if p0 - floored * var0 < p1 then floored else floored + 1) + 1, 1, p5), math.clamp(math.ceil(p0 / var0 + (p3 + (p4 or 0))), 1, p5)
end
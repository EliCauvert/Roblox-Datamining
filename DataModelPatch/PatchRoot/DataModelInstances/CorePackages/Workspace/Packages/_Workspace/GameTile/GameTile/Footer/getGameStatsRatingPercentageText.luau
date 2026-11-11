return function(p1: number, p2: number): string
	local v1 = "--"
	
	if p1 == nil or p1 < 0 then
		p1 = 0
	end
	if p2 == nil or p2 < 0 then
		p2 = 0
	end
	local v2 = p1 + p2
	
	if v2 > 0 then
		v1 = tostring((math.floor(p1 / v2 * 100)))
	end
	return v1
end
return function(p1: number, p2: number): string
	local v1 = "--"
	local v2 = if p1 and p1 >= 0 then p1 else 0
	local v3 = if p2 and p2 >= 0 then p2 else 0
	
	if v2 + v3 > 0 then
		v1 = tostring((math.floor(v2 / (v2 + v3) * 100 + 0.5))) .. "%"
	end
	return v1
end
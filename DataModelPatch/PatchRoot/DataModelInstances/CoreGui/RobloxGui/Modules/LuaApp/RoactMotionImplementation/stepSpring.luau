return function(p1, p2, p3, p4, p5, p6, p7)
	local Value = p3 + (-p5 * (p2 - p4) + -p6 * p3) * p1
	local v1 = p2 + p3 * p1
	
	if math.abs(Value) < p7 and math.abs(p4 - v1) < p7 then
		return p4, 0
	else
		return v1, Value
	end
end
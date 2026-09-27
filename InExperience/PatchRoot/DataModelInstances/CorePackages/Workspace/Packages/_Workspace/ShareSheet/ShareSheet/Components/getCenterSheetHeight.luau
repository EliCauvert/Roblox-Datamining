return function(p1, p2, p3, p4)
	if p1 <= p2 then
		return p4
	end
	local var1 = (math.min(p1, p3) - p2) * p4
	
	return if var1 > 1 then var1 else p4
end
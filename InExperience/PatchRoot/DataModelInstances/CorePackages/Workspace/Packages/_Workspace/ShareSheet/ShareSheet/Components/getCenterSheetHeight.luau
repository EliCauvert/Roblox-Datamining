return function(p1: number, p2, p3: number, p4)
	if p1 <= p2 then
		return p4
	else
		local ScaledSmallest = (math.min(p1, p3) - p2) * p4
		
		return if ScaledSmallest > 1 then ScaledSmallest else p4
	end
end
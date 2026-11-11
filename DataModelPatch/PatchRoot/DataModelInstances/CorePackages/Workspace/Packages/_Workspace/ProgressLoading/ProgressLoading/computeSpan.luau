return function(p1, p2, p3, p4, p5): number
	local P4 = p5 or 0
	local Smallest = p1 - p3 * p2 * 2
	
	if p4 then
		Smallest = math.min(Smallest, p4 * p2)
	end
	return (math.max(Smallest, P4))
end
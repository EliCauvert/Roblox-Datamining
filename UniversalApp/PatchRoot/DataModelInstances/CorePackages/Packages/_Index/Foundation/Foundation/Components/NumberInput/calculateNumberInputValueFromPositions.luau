return function(p1, p2, p3, p4, p5)
	return p1 + math.floor((p3 - p2) * (p5 or 1)) * p4
end
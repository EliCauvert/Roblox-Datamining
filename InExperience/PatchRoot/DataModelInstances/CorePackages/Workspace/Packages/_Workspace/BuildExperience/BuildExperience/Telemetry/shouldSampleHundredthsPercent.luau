return function(p1: number): boolean
	return p1 > 0 and (p1 >= 10000 or math.random(1, 10000) <= p1)
end
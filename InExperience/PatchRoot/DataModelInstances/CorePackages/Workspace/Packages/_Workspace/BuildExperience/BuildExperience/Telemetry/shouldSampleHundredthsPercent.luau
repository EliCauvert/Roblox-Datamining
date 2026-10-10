return function(p1)
	return if p1 <= 0 then false else p1 >= 10000 or math.random(1, 10000) <= p1
end
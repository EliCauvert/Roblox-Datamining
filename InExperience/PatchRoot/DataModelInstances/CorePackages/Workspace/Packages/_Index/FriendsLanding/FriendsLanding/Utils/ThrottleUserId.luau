return function(p1, p2)
	assert(type(p1) == "number", "throttle must be a number")
	assert(type(p2) == "number", "userId must be a number")
	
	return p2 % 100 + 1 <= p1
end
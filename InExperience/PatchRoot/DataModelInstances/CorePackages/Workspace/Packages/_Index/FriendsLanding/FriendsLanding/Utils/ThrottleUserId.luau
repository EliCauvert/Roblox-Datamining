return function(p0, p1)
	assert(type(p0) == "number", "throttle must be a number")
	assert(type(p1) == "number", "userId must be a number")
	
	return p1 % 100 + 1 <= p0
end
return function(p1)
	return p1.userId % 100 + 1 <= p1.throttle
end
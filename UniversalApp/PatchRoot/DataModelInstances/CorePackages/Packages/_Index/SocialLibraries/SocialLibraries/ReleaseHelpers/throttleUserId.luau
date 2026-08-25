return function(p0)
	return p0.userId % 100 + 1 <= p0.throttle
end
return function(p0) --[[ line: 1 ]]
	return p0.userId % 100 + 1 <= p0.throttle
end
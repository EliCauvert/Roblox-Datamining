return function(p0, p1, p2)
	assert(type(p1) == "number", "Expected beatInterval to be a number")
	p0:setRBXEventStream(string.format("%s%d", "heartbeat", p1), "pageHeartbeat", { url = p2 })
end
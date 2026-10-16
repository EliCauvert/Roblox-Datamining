return function(p1, p2, Url) --[[ Line: 5 ]]
	assert(type(p2) == "number", "Expected beatInterval to be a number")
	p1:setRBXEventStream(string.format("%s%d", "heartbeat", p2), "pageHeartbeat", { url = Url })
end
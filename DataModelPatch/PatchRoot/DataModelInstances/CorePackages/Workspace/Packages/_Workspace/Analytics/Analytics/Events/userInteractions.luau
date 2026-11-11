return function(p1, p2)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	p1:setRBXEventStream(p2, "userInteractions", nil)
end
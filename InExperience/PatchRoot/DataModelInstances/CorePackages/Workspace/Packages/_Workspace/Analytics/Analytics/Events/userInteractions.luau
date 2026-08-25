return function(p0, p1)
	assert(type(p1) == "string", "Expected eventContext to be a string")
	p0:setRBXEventStream(p1, "userInteractions", nil)
end
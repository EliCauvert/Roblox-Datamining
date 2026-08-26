return function(p1, p2, p3, p4, p5, p6, p7)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(p4) == "string", "Expected actionType to be a string")
	p1:setRBXEventStream(p2, "modalAction", {
		aType = p4,
		origin = p5,
		section = p6,
		errorCode = p7,
		field = p3
	})
end
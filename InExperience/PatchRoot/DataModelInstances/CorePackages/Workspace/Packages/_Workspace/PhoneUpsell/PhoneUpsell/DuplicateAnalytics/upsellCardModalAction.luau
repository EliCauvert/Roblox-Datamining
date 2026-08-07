return function(p0, p1, p2, p3, p4, p5, p6) --[[ line: 7 ]]
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(p3) == "string", "Expected actionType to be a string")
	p0:setRBXEventStream(p1, "modalAction", {
		aType = p3,
		origin = p4,
		section = p5,
		errorCode = p6,
		field = p2
	})
end
return function(p0, p1, p2, p3, p4, p5, p6)
	assert(type(p1) == "string", "Expected eventContext to be a string")
	assert(type(p2) == "string", "Expected field to be a string")
	assert(type(p3) == "string", "Expected actionType to be a string")
	
	if p4 ~= nil then
		assert(type(p4) == "string", "Expected origin to be a string")
	end
	if p5 ~= nil then
		assert(type(p5) == "string", "Expected btn to be a string")
	end
	p0:setRBXEventStream(p1, "formInteraction", {
		field = p2,
		aType = p3,
		origin = p4,
		btn = p5,
		section = p6
	})
end
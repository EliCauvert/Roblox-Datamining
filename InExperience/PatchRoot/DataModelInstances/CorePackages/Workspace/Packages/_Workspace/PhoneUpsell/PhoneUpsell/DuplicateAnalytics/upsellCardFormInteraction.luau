return function(p1, p2, p3, p4, p5, p6, p7)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(p3) == "string", "Expected field to be a string")
	assert(type(p4) == "string", "Expected actionType to be a string")
	
	if p5 ~= nil then
		assert(type(p5) == "string", "Expected origin to be a string")
	end
	if p6 ~= nil then
		assert(type(p6) == "string", "Expected btn to be a string")
	end
	p1:setRBXEventStream(p2, "formInteraction", {
		field = p3,
		aType = p4,
		origin = p5,
		btn = p6,
		section = p7
	})
end
return function(p1, p2, Field, AType, Origin, Btn, Section)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(Field) == "string", "Expected field to be a string")
	assert(type(AType) == "string", "Expected actionType to be a string")
	
	if Origin ~= nil then
		assert(type(Origin) == "string", "Expected origin to be a string")
	end
	if Btn ~= nil then
		assert(type(Btn) == "string", "Expected btn to be a string")
	end
	p1:setRBXEventStream(p2, "formInteraction", {
		field = Field,
		aType = AType,
		origin = Origin,
		btn = Btn,
		section = Section
	})
end
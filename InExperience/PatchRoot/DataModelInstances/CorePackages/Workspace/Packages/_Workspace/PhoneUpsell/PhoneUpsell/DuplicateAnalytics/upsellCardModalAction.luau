return function(p1, p2, Field, AType, Origin, Section, ErrorCode) --[[ Line: 7 ]]
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(AType) == "string", "Expected actionType to be a string")
	p1:setRBXEventStream(p2, "modalAction", {
		aType = AType,
		origin = Origin,
		section = Section,
		errorCode = ErrorCode,
		field = Field
	})
end
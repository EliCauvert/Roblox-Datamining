return function(p1, p2, Btn, UserField, Suggestion)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(Btn) == "string", "Expected buttonName to be a string")
	assert(type(UserField) == "string", "Expected userField to be a string")
	assert(type(Suggestion) == "string", "Expected suggestion to be a string")
	p1:setRBXEventStream(p2, "buttonClick", {
		btn = Btn,
		userField = UserField,
		suggestion = Suggestion
	})
end
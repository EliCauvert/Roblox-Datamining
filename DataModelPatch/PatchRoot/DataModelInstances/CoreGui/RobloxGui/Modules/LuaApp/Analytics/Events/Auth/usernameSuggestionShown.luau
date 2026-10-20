return function(p1, p2, State, List, Field)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(State) == "string", "Expected state to be a string")
	assert(type(List) == "table", "Expected suggestions to be a table")
	assert(type(Field) == "string", "Expected suggestion to be a string")
	p1:sendEventDeferred(p2, "usernameSuggestionShown", {
		state = State,
		suggestions = `[{table.concat(List, ",")}]`,
		field = Field
	})
end
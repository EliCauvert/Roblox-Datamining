return function(p1, p2, PromptType, State)
	assert(type(PromptType) == "string", "expected promptType to be a string")
	assert(type(State) == "string", "expected modalState to be a string")
	p1:setRBXEventStream(p2, "accountSecurityPromptEvent", { promptType = PromptType, state = State })
end
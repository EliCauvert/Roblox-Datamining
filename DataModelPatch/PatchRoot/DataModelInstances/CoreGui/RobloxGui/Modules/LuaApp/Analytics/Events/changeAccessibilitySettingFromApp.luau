return function(p1, p2, Name, OldValue, NewValue)
	assert(type(p2) == "string", "Expected context to be a string")
	assert(type(Name) == "string", "Expected name to be a string")
	assert(type(OldValue) == "string", "Expected oldValue to be a string")
	assert(type(NewValue) == "string", "Expected newValue to be a string")
	p1:setRBXEventStream(p2, "changeAccessibilitySetting", { name = Name, oldValue = OldValue, newValue = NewValue })
end
return function(p1, p2, Property)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(Property) == "number", "Expected countOfUnreadNotifications to be a number")
	p1:setRBXEventStream(p2, "nsOpenContent", { property = Property })
end
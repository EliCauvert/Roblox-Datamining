return function(p1, p2, Count)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(Count) == "number", "Expected countOfUnreadNotifications to be a number")
	p1:setRBXEventStream(p2, "nsOpenCTAShown", { count = Count })
end
return function(p1, p2, BadgeCount)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(BadgeCount) == "number", "Expected badgeCount to be a number")
	p1:setRBXEventStream(p2, "partyTabBadgeClick", { badgeCount = BadgeCount })
end
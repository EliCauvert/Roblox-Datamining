return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4)
	return {
		conversationId = p1,
		participants = p2,
		title = p3,
		lastUpdated = p4
	}
end)
return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3)
	return {
		conversationId = p0,
		title = p1,
		isDefaultTitle = p2,
		lastUpdated = p3
	}
end)
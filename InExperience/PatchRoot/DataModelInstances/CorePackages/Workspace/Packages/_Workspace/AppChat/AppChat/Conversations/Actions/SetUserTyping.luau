return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { conversationId = p0, userId = p1, value = p2 }
end)
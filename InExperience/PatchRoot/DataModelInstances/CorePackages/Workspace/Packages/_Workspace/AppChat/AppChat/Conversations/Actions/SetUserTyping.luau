return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { conversationId = p1, userId = p2, value = p3 }
end)
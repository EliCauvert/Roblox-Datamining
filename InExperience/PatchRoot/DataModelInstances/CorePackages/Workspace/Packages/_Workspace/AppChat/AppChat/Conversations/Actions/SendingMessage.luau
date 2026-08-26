return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { conversationId = p1, message = p2 }
end)
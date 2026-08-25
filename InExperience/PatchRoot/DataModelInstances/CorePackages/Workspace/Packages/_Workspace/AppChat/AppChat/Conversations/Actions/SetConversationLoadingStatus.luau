return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { conversationId = p0, value = p1 }
end)
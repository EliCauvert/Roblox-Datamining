return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { universeId = p1, rootPlaceId = p2, conversationId = p3 }
end)
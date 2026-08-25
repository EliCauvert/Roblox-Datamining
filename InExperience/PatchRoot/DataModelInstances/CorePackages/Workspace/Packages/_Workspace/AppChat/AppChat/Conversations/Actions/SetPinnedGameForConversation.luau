return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { universeId = p0, rootPlaceId = p1, conversationId = p2 }
end)
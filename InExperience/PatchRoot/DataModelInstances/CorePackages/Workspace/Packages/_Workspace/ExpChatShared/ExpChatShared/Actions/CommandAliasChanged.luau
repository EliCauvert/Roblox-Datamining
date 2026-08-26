return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { name = p1, primaryAlias = p2, secondaryAlias = p3 }
end)
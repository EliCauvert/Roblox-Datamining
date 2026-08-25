return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { name = p0, primaryAlias = p1, secondaryAlias = p2 }
end)
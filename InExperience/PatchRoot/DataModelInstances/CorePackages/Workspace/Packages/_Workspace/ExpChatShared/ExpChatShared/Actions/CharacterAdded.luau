return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { userId = tostring(p1), character = p2 }
end)
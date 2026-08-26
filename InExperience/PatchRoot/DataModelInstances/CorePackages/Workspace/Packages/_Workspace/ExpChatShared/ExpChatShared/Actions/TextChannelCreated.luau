return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { textChannel = p1 }
end)
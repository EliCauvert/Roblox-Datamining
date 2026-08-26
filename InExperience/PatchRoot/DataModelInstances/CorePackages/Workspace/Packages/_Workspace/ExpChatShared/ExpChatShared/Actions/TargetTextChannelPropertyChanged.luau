return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { textChannel = p1, shouldReorderTabs = p2 }
end)
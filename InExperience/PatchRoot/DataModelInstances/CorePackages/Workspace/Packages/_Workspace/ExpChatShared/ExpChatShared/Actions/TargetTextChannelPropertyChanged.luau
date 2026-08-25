return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { textChannel = p0, shouldReorderTabs = p1 }
end)
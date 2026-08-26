return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { channelName = p1, textChannel = p2 }
end)
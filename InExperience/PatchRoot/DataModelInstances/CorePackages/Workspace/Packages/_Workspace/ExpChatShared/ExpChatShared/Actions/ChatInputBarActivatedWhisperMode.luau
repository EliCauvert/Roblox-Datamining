return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { channelName = p0, textChannel = p1 }
end)
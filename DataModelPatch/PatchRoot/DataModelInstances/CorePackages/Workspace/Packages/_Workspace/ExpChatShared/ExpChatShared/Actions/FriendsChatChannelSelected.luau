return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName)
	return { channelName = ChannelName }
end)
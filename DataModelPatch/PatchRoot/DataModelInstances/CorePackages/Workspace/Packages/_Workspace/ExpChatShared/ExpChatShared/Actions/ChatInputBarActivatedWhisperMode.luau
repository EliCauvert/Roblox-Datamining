return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName, TextChannel)
	return { channelName = ChannelName, textChannel = TextChannel }
end)
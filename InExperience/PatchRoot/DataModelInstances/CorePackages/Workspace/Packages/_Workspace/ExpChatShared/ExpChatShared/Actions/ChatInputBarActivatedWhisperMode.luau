return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName, TextChannel) --[[ Line: 11 ]]
	return { channelName = ChannelName, textChannel = TextChannel }
end)
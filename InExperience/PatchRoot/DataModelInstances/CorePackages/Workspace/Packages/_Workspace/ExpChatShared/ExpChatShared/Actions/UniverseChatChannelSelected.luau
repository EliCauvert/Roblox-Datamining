return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName, IsUserInitiated)
	return {
		channelName = ChannelName,
		isUserInitiated = IsUserInitiated
	}
end)
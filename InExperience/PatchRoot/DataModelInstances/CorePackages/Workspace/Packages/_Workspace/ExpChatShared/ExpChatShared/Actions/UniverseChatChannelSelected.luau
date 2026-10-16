return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName, IsUserInitiated) --[[ Line: 13 ]]
	return {
		channelName = ChannelName,
		isUserInitiated = IsUserInitiated
	}
end)
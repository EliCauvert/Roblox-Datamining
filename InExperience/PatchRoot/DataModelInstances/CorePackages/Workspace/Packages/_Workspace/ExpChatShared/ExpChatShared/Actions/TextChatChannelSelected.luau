return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName, ShouldReorderTabs)
	return {
		channelName = ChannelName,
		shouldReorderTabs = ShouldReorderTabs
	}
end)
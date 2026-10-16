return require(script:FindFirstAncestor("ExpChatShared").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName, ShouldReorderTabs) --[[ Line: 11 ]]
	return {
		channelName = ChannelName,
		shouldReorderTabs = ShouldReorderTabs
	}
end)
return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName, HasUnreadMessages) --[[ Line: 10 ]]
	return {
		channelName = ChannelName,
		hasUnreadMessages = HasUnreadMessages
	}
end)
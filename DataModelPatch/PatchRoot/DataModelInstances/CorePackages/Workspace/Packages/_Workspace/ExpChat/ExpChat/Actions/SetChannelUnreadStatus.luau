return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName, HasUnreadMessages)
	return {
		channelName = ChannelName,
		hasUnreadMessages = HasUnreadMessages
	}
end)
return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName, TabIndex)
	return { channelName = ChannelName, tabIndex = TabIndex }
end)
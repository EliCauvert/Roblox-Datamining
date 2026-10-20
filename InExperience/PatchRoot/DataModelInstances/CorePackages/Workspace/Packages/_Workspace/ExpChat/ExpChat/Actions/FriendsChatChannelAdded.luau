return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(ChannelName)
	return { channelName = ChannelName }
end)
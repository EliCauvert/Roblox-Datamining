return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(Text, ChannelNameOverride, Metadata)
	return {
		text = Text,
		channelNameOverride = ChannelNameOverride,
		metadata = Metadata
	}
end)
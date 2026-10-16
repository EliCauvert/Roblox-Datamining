return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(Text, ChannelNameOverride, Metadata) --[[ Line: 11 ]]
	return {
		text = Text,
		channelNameOverride = ChannelNameOverride,
		metadata = Metadata
	}
end)
return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(TextChatMessage, ChannelNameOverride)
	return {
		textChatMessage = TextChatMessage,
		channelNameOverride = ChannelNameOverride
	}
end)
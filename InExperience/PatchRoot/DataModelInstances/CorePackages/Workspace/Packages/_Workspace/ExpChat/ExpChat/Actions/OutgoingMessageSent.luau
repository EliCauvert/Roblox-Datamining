return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(TextChatMessage, ChannelNameOverride, IsUniverseChat)
	return {
		textChatMessage = TextChatMessage,
		channelNameOverride = ChannelNameOverride,
		isUniverseChat = IsUniverseChat
	}
end)
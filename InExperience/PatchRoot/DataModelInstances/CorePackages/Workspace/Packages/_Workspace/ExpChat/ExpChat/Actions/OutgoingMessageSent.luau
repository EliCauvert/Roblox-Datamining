return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(TextChatMessage, ChannelNameOverride, IsUniverseChat) --[[ Line: 13 ]]
	return {
		textChatMessage = TextChatMessage,
		channelNameOverride = ChannelNameOverride,
		isUniverseChat = IsUniverseChat
	}
end)
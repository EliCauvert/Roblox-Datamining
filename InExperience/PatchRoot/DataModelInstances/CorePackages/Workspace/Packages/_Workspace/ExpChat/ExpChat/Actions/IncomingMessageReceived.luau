return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(TextChatMessage, IsSenderLocalPlayer, ChannelNameOverride, IsUniverseChat)
	return {
		textChatMessage = TextChatMessage,
		isSenderLocalPlayer = IsSenderLocalPlayer,
		channelNameOverride = ChannelNameOverride,
		isUniverseChat = IsUniverseChat
	}
end)
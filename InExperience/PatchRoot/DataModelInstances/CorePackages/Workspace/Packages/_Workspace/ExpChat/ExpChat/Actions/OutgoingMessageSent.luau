return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return {
		textChatMessage = p1,
		channelNameOverride = p2,
		isUniverseChat = p3
	}
end)
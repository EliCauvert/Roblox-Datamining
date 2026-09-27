return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4)
	return {
		textChatMessage = p1,
		isSenderLocalPlayer = p2,
		channelNameOverride = p3,
		isUniverseChat = p4
	}
end)
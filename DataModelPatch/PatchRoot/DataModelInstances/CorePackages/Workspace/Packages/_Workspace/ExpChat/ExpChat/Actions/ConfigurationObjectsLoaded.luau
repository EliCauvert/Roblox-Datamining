return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		bubbleChatSettings = p1.bubbleChatSettings or {},
		chatWindowSettings = p1.chatWindowSettings or {},
		chatInputBarSettings = p1.chatInputBarSettings or {},
		channelTabsSettings = p1.channelTabsSettings or {}
	}
end)
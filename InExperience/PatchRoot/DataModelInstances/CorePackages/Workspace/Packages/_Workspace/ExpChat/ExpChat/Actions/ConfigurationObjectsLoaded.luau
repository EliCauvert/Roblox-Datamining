return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 13 ]]
	return {
		bubbleChatSettings = p0.bubbleChatSettings or {},
		chatWindowSettings = p0.chatWindowSettings or {},
		chatInputBarSettings = p0.chatInputBarSettings or {},
		channelTabsSettings = p0.channelTabsSettings or {}
	}
end)
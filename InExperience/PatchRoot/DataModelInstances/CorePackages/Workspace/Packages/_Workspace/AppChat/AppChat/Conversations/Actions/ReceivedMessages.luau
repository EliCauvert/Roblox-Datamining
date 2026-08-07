return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3) --[[ line: 6 ]]
	return {
		conversationId = p0,
		messages = p1,
		shouldMarkConversationUnread = p2,
		exclusiveStartMessageId = p3
	}
end)
return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4)
	return {
		conversationId = p1,
		messages = p2,
		shouldMarkConversationUnread = p3,
		exclusiveStartMessageId = p4
	}
end)
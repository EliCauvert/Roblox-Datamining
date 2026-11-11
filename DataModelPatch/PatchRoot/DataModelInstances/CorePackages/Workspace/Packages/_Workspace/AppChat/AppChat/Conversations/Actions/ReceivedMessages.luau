return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, Messages, ShouldMarkConversationUnread, ExclusiveStartMessageId)
	return {
		conversationId = ConversationId,
		messages = Messages,
		shouldMarkConversationUnread = ShouldMarkConversationUnread,
		exclusiveStartMessageId = ExclusiveStartMessageId
	}
end)
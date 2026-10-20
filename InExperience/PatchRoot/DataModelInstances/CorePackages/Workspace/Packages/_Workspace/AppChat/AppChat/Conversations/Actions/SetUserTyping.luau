return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, UserId, Value)
	return {
		conversationId = ConversationId,
		userId = UserId,
		value = Value
	}
end)
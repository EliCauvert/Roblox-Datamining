return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, FetchedOldestMessage)
	return {
		conversationId = ConversationId,
		fetchedOldestMessage = FetchedOldestMessage
	}
end)
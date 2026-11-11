return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, FetchingOlderMessages)
	return {
		conversationId = ConversationId,
		fetchingOlderMessages = FetchingOlderMessages
	}
end)
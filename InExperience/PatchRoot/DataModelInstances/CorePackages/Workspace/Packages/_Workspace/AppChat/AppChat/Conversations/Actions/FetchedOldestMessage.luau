return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, FetchedOldestMessage) --[[ Line: 6 ]]
	return {
		conversationId = ConversationId,
		fetchedOldestMessage = FetchedOldestMessage
	}
end)
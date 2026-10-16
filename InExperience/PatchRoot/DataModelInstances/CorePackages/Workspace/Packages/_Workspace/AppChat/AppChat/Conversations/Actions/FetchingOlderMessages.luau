return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, FetchingOlderMessages) --[[ Line: 6 ]]
	return {
		conversationId = ConversationId,
		fetchingOlderMessages = FetchingOlderMessages
	}
end)
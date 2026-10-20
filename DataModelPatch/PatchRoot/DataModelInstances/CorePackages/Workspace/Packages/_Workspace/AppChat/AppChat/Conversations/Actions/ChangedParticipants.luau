return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, Participants, Title, LastUpdated)
	return {
		conversationId = ConversationId,
		participants = Participants,
		title = Title,
		lastUpdated = LastUpdated
	}
end)
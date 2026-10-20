return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, Title, IsDefaultTitle, LastUpdated)
	return {
		conversationId = ConversationId,
		title = Title,
		isDefaultTitle = IsDefaultTitle,
		lastUpdated = LastUpdated
	}
end)
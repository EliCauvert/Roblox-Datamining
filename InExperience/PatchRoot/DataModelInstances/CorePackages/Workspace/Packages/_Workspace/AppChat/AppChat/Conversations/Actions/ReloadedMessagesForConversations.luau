return (require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationIds)
	return { conversationIds = ConversationIds }
end))
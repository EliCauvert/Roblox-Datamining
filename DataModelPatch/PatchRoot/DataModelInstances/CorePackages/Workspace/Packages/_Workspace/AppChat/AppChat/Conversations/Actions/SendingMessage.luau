return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, Message)
	return { conversationId = ConversationId, message = Message }
end)
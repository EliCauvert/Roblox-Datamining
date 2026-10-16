return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, MessageId) --[[ Line: 6 ]]
	return { conversationId = ConversationId, messageId = MessageId }
end)
return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, Message) --[[ Line: 6 ]]
	return { conversationId = ConversationId, message = Message }
end)
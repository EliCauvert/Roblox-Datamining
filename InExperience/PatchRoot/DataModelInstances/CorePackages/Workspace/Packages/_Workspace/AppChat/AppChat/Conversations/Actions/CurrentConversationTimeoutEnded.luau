return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId) --[[ Line: 10 ]]
	return { conversationId = ConversationId }
end)
return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId) --[[ Line: 6 ]]
	return { conversationId = ConversationId }
end)
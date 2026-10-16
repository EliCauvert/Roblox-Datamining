return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, Value) --[[ Line: 6 ]]
	return { conversationId = ConversationId, value = Value }
end)
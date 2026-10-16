return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationId, UserId, Value) --[[ Line: 5 ]]
	return {
		conversationId = ConversationId,
		userId = UserId,
		value = Value
	}
end)
return (require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConversationIds) --[[ Line: 12 ]]
	return { conversationIds = ConversationIds }
end))
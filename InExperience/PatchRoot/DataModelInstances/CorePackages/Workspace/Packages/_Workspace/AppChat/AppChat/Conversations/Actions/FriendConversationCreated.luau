return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		newConversationId = p1.newConversationId,
		oldFriendConversationId = p1.oldFriendConversationId
	}
end)
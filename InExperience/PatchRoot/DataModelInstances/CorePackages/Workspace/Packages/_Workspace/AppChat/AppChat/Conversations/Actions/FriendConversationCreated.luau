return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 17 ]]
	return {
		newConversationId = p0.newConversationId,
		oldFriendConversationId = p0.oldFriendConversationId
	}
end)
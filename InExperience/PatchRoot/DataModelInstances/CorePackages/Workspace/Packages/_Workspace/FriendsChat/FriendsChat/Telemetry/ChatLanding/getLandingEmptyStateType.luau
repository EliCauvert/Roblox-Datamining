local EmptyStateTypeModule = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.EmptyStateType)

return function(p1, p2)
	-- upvalues: EmptyStateTypeModule (copy)
	return if p2 then nil elseif p1.shouldShowBlockingError then EmptyStateTypeModule.ConversationsLoadErrorView elseif p1.shouldShowEmptyState then if p1.hasNoFriends then EmptyStateTypeModule.NoFriendsView else EmptyStateTypeModule.EmptyConversationList else nil
end
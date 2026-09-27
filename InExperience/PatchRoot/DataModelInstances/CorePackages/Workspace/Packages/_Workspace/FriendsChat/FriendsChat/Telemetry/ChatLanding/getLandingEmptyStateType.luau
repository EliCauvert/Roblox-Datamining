local emptyStateTypeModule = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.EmptyStateType)

return function(p1, p2)
	-- upvalues: emptyStateTypeModule (ref)
	return if p2 then nil elseif p1.shouldShowBlockingError then emptyStateTypeModule.ConversationsLoadErrorView elseif p1.shouldShowEmptyState then if p1.hasNoFriends then emptyStateTypeModule.NoFriendsView else emptyStateTypeModule.EmptyConversationList else nil
end
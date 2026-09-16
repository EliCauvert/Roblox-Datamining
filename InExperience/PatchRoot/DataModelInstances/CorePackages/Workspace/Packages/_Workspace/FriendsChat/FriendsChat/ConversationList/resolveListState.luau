local _ = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.useConversationSearch)
local _ = require(script.Parent.ExpChatConversationListAdapter)

return function(p1, p2)
	if p2 ~= nil then
		local items = p2.items
		
		return {
			shouldOfferRetry = false,
			hasNoFriends = false,
			items = items,
			isInitialLoading = p2.isFetching and #items == 0,
			shouldShowBlockingError = p2.hasError and #items == 0,
			shouldShowEmptyState = #items == 0 and (not p2.isFetching and p2.hasSearched),
			isLoadingNextPage = p2.isFetching,
			oldestConversationIsFetched = p2.nextCursor == nil,
			listKey = `List-{p2.debouncedQuery}`,
			loadNext = p2.loadNext
		}
	end
	local var1 = p1.hasError and p1.totalCount == 0
	
	return {
		listKey = "List",
		items = p1.items,
		isInitialLoading = p1.isFetching and p1.totalCount == 0,
		shouldShowBlockingError = var1,
		shouldShowEmptyState = #p1.items == 0 and (not p1.isFetching and (if p1.totalCount <= 0 then p1.hasFetchedInitialPage or var1 else true)),
		shouldOfferRetry = var1,
		hasNoFriends = p1.totalCount == 0,
		isLoadingNextPage = p1.isFetchingNextPage,
		oldestConversationIsFetched = p1.oldestConversationIsFetched,
		loadNext = p1.loadNext
	}
end
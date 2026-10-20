local _ = require(script:FindFirstAncestor("FriendsChat").Parent.AppChat.useConversationSearch)
local _ = require(script.Parent.ExpChatConversationListAdapter)
local IsInboxInitialLoadingModule = require(script.Parent.isInboxInitialLoading)

return function(p1, p2)
	-- upvalues: IsInboxInitialLoadingModule (copy)
	if p2 == nil then
		local IsTotalCountMatch: boolean = p1.hasError and p1.totalCount == 0
		
		return {
			listKey = "List",
			items = p1.items,
			isInitialLoading = IsInboxInitialLoadingModule(p1.isFetching, p1.totalCount),
			shouldShowBlockingError = IsTotalCountMatch,
			shouldShowEmptyState = #p1.items == 0 and (not p1.isFetching and (p1.totalCount > 0 or (p1.hasFetchedInitialPage or IsTotalCountMatch))),
			shouldOfferRetry = IsTotalCountMatch,
			hasNoFriends = p1.totalCount == 0,
			isLoadingNextPage = p1.isFetchingNextPage,
			oldestConversationIsFetched = p1.oldestConversationIsFetched,
			loadNext = p1.loadNext
		}
	else
		local Items = p2.items
		
		return {
			shouldOfferRetry = false,
			hasNoFriends = false,
			items = Items,
			isInitialLoading = p2.isAwaitingResults and #Items == 0,
			shouldShowBlockingError = p2.hasError and #Items == 0,
			shouldShowEmptyState = #Items == 0 and (not p2.isAwaitingResults and p2.hasSearched),
			isLoadingNextPage = p2.isFetching,
			oldestConversationIsFetched = p2.nextCursor == nil,
			listKey = `List-{p2.debouncedQuery}`,
			loadNext = p2.loadNext
		}
	end
end